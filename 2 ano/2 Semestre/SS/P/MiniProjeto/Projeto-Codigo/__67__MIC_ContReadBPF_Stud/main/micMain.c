/* ********************************************************************************************************************************* 
 * Microphone test - ADC in continuous mode and time-domain BP filtering 
 * Paulo Pedreiras, Pedro Fonecsa, Luis Moutinho 2026/Apr.
 * 
 * Tested:
 *  ESP32-C6 DevKitC-1
 * 
 * - Basic use of the ADC to get and process sound samples.
 * - Uses continuous mode ADC operation, to allow higher frequencies
 * - Signal is processed by a Band-Pass filter, in the time-domain, to identify defined frequencies 
 *  
 * Microphone is a MEMS Adafruit Silicon MEMS Microphone Breakout - SPW2430.
 *     Supplied with 3.3-5V, output at DC pin has a 0.7 V and a 100 mVpp "when talking near". 
 *      In my case I had around 1 V. So the attenuation cannot be 0 dB. 
 *      I have used 2.5 dB (vref/0.7), to get 1.3 to 1.5 volts for Vref+ and avoid saturation
 *      Check other mics to see if this is normal.  
 * 
 *  
 * Bibliography: 
 *      https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/adc/index.html
 *      https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/adc/adc_continuous.html 
 *      https://docs.espressif.com/projects/esp-dsp/en/latest/esp32/esp-dsp-library.html      
 * 
 * Based on the sample code  provided by EspressIF:
 *      https://github.com/espressif/esp-idf/tree/47faecc3/examples/peripherals/adc/continuous_read 
 * 
 * NOTE: must run idf.py add-dependency "espressif/esp-dsp" when creating a new project using dsp functionality
 ***********************************************************************************************************************************/ 

/* ********************************* 
 * Includes
 ***********************************/
#include <string.h>
#include <stdio.h>
#include <math.h>

#include "sdkconfig.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"      // FreeRTOS includes
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "freertos/queue.h"
#include "esp_adc/adc_continuous.h" // For ESP ADC
#include "esp_dsp.h"                // For ESP DSP functions, conv in the case
#include "esp_private/esp_clk.h"    // For ESP clock functions
#include "driver/gpio.h"            // For GPIO functions

/* ********************************
 * Global defines 
 **********************************/
#define MICEX_ADC_UNIT                  ADC_UNIT_1
#define MICEX_ADC_CONV_MODE             ADC_CONV_SINGLE_UNIT_1
#define MICEX_ADC_ATTEN                 ADC_ATTEN_DB_2_5            // Use Vref/0.75, 1.3 ... 1.5 V
#define MICEX_ADC_BIT_WIDTH             SOC_ADC_DIGI_MAX_BITWIDTH   // 12 bits resolution (maximum)

#define MICEX_ADC_FRAME_SIZE            512                           /* ADC frame size, in bytes */
#define MICEX_ADC_BUF_SIZE              (4 * MICEX_ADC_FRAME_SIZE)    /* Internal buffer, should an integer multiple of the frame size to avoid incomplete frames */
#define MICEX_ADC_SAMPLE_FREQ           (20 * 1000)                   /* Sample frequency, in Hz. Notice that there are lower and higher bounds*/

#define MICEX_SOUND_SAMPLES_BUF_SIZE    2048 /* IMPORTANT: If FFT is to be used, must be must be a power of two */
                                              /* For time-domain conv. filters there is no such restriction */
                                              
#define MAX_FILT_IR_LEN                 200     /* Maximum IR filter length */

/* Global variable declarations */
static adc_channel_t channel[1] = {ADC_CHANNEL_3};  // Mic on ADC channel 3
static TaskHandle_t s_task_handle;

static const char *TAG = "MIC_EXAMPLE";

/* ADC - Variables to hold data acquisition and parsing */
__attribute__((aligned(16))) uint8_t result[MICEX_ADC_FRAME_SIZE] = {0}; // Buffer where the results of a continuous read are placed   
__attribute__((aligned(16))) adc_continuous_data_t parsed_data[MICEX_ADC_FRAME_SIZE / SOC_ADC_DIGI_RESULT_BYTES]; // Buffer where frame parsed data is placed 

/* FreeRTOS tasks and IPC */
#define PROCESSOR_TASK_STACK_SIZE       8192            // Accomodate calls to dsp functions, log, user vars, ...
#define PROCESSOR_TASK_PRIORITY	( tskIDLE_PRIORITY + 4 )
QueueHandle_t XQ;    /* Queue handle */

/* Impulse reponse filter and related variables */
__attribute__((aligned(16))) float hbpf2k[]={0.000000139618742, 0.000000255721385, 0.000000140050607, -0.000000328918009, -0.000001079871671, -0.000001790994587, -0.000001943975411, -0.000001031882007, 0.000001111877099, 0.000004001347557, 0.000006413035946, 0.000006707873993, 0.000003574260112, -0.000003048702149, -0.000011330185703, -0.000017688431396, -0.000017969871244, -0.000009435702605, 0.000007215862062, 0.000026871405806, 0.000040972415077, 0.000040614490911, 0.000020897907315, -0.000015285006327, -0.000056126887733, -0.000083842525959, -0.000081437626075, -0.000041101266796, 0.000029421836936, 0.000106148839227, 0.000155757573851, 0.000148773462501, 0.000074351529935, -0.000050052623102, -0.000180121406766, -0.000259437345082, -0.000243952642519, -0.000126937980784, 0.000047492844400, 0.000191919289194, 0.000580032052973, 0.000667352843244, 0.000306111499321, -0.000446298721323, -0.001342483904490, -0.001978250973038, -0.001912439692934,-0.000868574004532, 0.001047898364964, 0.003236203885917, 0.004708723047573, 0.004458080398213, 0.001979374693417, -0.002286980559547, -0.006863696045905, -0.009659616406773, -0.008836721670391, -0.003790852332498, 0.004230959606325, 0.012280364027838, 0.016725773018749, 0.014820278024314, 0.006161630397857, -0.006683261470121, -0.018835296877081, -0.024940029322091, -0.021501888240714, -0.008700432996997, 0.009216737308611, 0.025316468417048, 0.032708573103906, 0.027529205755171, 0.010869128872094, -0.011297781514959, -0.030304625508737, -0.038281206662112, -0.031498011959705, -0.012107397246638, 0.012536609979868, 0.032771101414432, 0.040552804004055, 0.032771101414432, 0.012536609979868, -0.012107397246638, -0.031498011959704, -0.038281206662113, -0.030304625508737, -0.011297781514959, 0.010869128872094, 0.027529205755171, 0.032708573103906, 0.025316468417048, 0.009216737308611, -0.008700432996997, -0.021501888240714, -0.024940029322091, -0.018835296877081, -0.006683261470121, 0.006161630397857, 0.014820278024314, 0.016725773018749, 0.012280364027838,0.004230959606325, -0.003790852332499, -0.008836721670391, -0.009659616406773, -0.006863696045905, -0.002286980559547, 0.001979374693417, 0.004458080398213, 0.004708723047573, 0.003236203885917, 0.001047898364964, -0.000868574004532, -0.001912439692934, -0.001978250973038, -0.001342483904490, -0.000446298721323, 0.000306111499321, 0.000667352843244, 0.000580032052973, 0.000191919289194, 0.000047492844400, -0.000126937980784, -0.000243952642519, -0.000259437345082, -0.000180121406766, -0.000050052623102, 0.000074351529935, 0.000148773462501, 0.000155757573851, 0.000106148839227, 0.000029421836936, -0.000041101266796, -0.000081437626075, -0.000083842525959, -0.000056126887733, -0.000015285006327, 0.000020897907315, 0.000040614490911, 0.000040972415077, 0.000026871405806, 0.000007215862062, -0.000009435702605, -0.000017969871244, -0.000017688431396, -0.000011330185703, -0.000003048702149, 0.000003574260112,0.000006707873993, 0.000006413035946, 0.000004001347557, 0.000001111877099, -0.000001031882007, -0.000001943975411, -0.000001790994587, -0.000001079871671, -0.000000328918009, 0.000000140050607, 0.000000255721385, 0.000000139618742};
__attribute__((aligned(16))) float fir_symb0[] = {0.00000000000000000000, 0.00032476974608978862, 0.00067591910630404974, 0.00106633256573068899, 0.00150624771915555331, 0.00200142481075767358, 0.00255151306935904503, 0.00314874723713891042, 0.00377709291130067046, 0.00441193638925146698, 0.00502038473673531958, 0.00556220634941126564, 0.00599140329142221120, 0.00625836638044302909, 0.00631252470681040612, 0.00610536539819400183, 0.00559366922073291795, 0.00474278503481553523, 0.00352975281109981463, 0.00194608198951492888, -0.00000000000000000477, -0.00228199527989185989, -0.00485441613846159838, -0.00765299750450419442, -0.01059589465811630257, -0.01358586920010384884, -0.01651341361303605704, -0.01926071252541928028, -0.02170628989433202524, -0.02373014850487625491, -0.02521917394259203318, -0.02607255162240663254, -0.02620693412568222969, -0.02556109795609668930, -0.02409984414176302714, -0.02181692543971784984, -0.01873682309346600197, -0.01491524635702696708, -0.01043828596637208506, -0.00542021559926234107, 0.00000000000000000000, 0.00566336840461569707, 0.01139652414163244004, 0.01701814364854756234, 0.02234584937104389449, 0.02720330417190459926, 0.03142718370950831064, 0.03487371590347290023, 0.03742449310622029263, 0.03899129344440441236, 0.03951969154785007349, 0.03899129344440441236, 0.03742449310622029263, 0.03487371590347290023, 0.03142718370950831064, 0.02720330417190459926, 0.02234584937104389449, 0.01701814364854756234, 0.01139652414163244004, 0.00566336840461569707, 0.00000000000000000000, -0.00542021559926234107, -0.01043828596637208506, -0.01491524635702696708, -0.01873682309346600197, -0.02181692543971784984, -0.02409984414176302714, -0.02556109795609668930, -0.02620693412568222969, -0.02607255162240663254, -0.02521917394259203318, -0.02373014850487625491, -0.02170628989433202524, -0.01926071252541928028, -0.01651341361303605704, -0.01358586920010384884, -0.01059589465811630257, -0.00765299750450419442, -0.00485441613846159838, -0.00228199527989185989, -0.00000000000000000477, 0.00194608198951492888, 0.00352975281109981463, 0.00474278503481553523, 0.00559366922073291795, 0.00610536539819400183, 0.00631252470681040612, 0.00625836638044302909, 0.00599140329142221120, 0.00556220634941126564, 0.00502038473673531958, 0.00441193638925146698, 0.00377709291130067046, 0.00314874723713891042, 0.00255151306935904503, 0.00200142481075767358, 0.00150624771915555331, 0.00106633256573068899, 0.00067591910630404974, 0.00032476974608978862, 0.00000000000000000000};
__attribute__((aligned(16))) float fir_symb1[] = {-0.00162969133293478234, -0.00102379697387546377, -0.00019231984261843459, 0.00078238188227177893, 0.00177903393556076987, 0.00263388549614341789, 0.00315250169123303982, 0.00314123670989905181, 0.00245586904830334424, 0.00105731081245997115, -0.00094151520286875172, -0.00325535146693331501, -0.00544705209946287974, -0.00699432575762492549, -0.00739613042139705256, -0.00629940530651045341, -0.00361720570062587076, 0.00039407508089969203, 0.00512596139951332092, 0.00969237777404454749, 0.01308346503041507396, 0.01437442413413324467, 0.01294790452342317426, 0.00867926998081745317, 0.00203614703480352408, -0.00594222163237714297, -0.01379625198025336355, -0.01990915278849868242, -0.02283527004643464905, -0.02162718539367809722, -0.01608878753404217529, -0.00689135088779685955, 0.00448532319848421804, 0.01598898436471512044, 0.02537157268967738660, 0.03063617103666938998, 0.03046373114605497104, 0.02452744352294598459, 0.01362119110436232211, -0.00043575924446852200, -0.01510983949478914706, -0.02762571520268571057, -0.03550926393611676668, -0.03709136469465242059, -0.03186703025282626445, -0.02063123082253508558, -0.00535710910000241746, 0.01116491981140203468, 0.02585860624143074271, 0.03595867939969990545, 0.03955283352176738876, 0.03595867939969990545, 0.02585860624143074271, 0.01116491981140203468, -0.00535710910000241746, -0.02063123082253508558, -0.03186703025282626445, -0.03709136469465242059, -0.03550926393611676668, -0.02762571520268571057, -0.01510983949478914706, -0.00043575924446852200, 0.01362119110436232211, 0.02452744352294598459, 0.03046373114605497104, 0.03063617103666938998, 0.02537157268967738660, 0.01598898436471512044, 0.00448532319848421804, -0.00689135088779685955, -0.01608878753404217529, -0.02162718539367809722, -0.02283527004643464905, -0.01990915278849868242, -0.01379625198025336355, -0.00594222163237714297, 0.00203614703480352408, 0.00867926998081745317, 0.01294790452342317426, 0.01437442413413324467, 0.01308346503041507396, 0.00969237777404454749, 0.00512596139951332092, 0.00039407508089969203, -0.00361720570062587076, -0.00629940530651045341, -0.00739613042139705256, -0.00699432575762492549, -0.00544705209946287974, -0.00325535146693331501, -0.00094151520286875172, 0.00105731081245997115, 0.00245586904830334424, 0.00314123670989905181, 0.00315250169123303982, 0.00263388549614341789, 0.00177903393556076987, 0.00078238188227177893, -0.00019231984261843459, -0.00102379697387546377, -0.00162969133293478234};
__attribute__((aligned(16))) float fir_symb2[] = {-0.00190964456036898217, -0.00192085206478439835, -0.00102712368384701332, 0.00048237627362652483, 0.00201012081946055216, 0.00282229550725717274, 0.00234696857216419672, 0.00050770855808428630, -0.00208073915112877515, -0.00422943235102920569, -0.00465669847088458298, -0.00267555546965436404, 0.00125511799367015618, 0.00548234547350159255, 0.00778163449748498371, 0.00646122391313261584, 0.00142621358813644207, -0.00541751346079947550, -0.01079243760201294838, -0.01156752105157506094, -0.00648648476192320144, 0.00281667565959922228, 0.01219985820689147883, 0.01681396762978090709, 0.01356430726067652665, 0.00299845424837411490, -0.01047553250030656795, -0.02038049925558575379, -0.02127363157738570293, -0.01167871464744648854, 0.00471432693139711874, 0.02039620204173777512, 0.02748768456516524281, 0.02170389569771772817, 0.00483324648223396047, -0.01566838454178879833, -0.02998797661266140724, -0.03069567162489824155, -0.01660412701430386689, 0.00626352313618798624, 0.02725548575809318835, 0.03611572669942343661, 0.02805173400058418032, 0.00631373660525133985, -0.01910057624201363241, -0.03611052525920773609, -0.03637917617458844705, -0.01945228565359701997, 0.00687080193934959220, 0.03018689681740140129, 0.03942539966758048381, 0.03018689681740140129, 0.00687080193934959220, -0.01945228565359701997, -0.03637917617458844705, -0.03611052525920773609, -0.01910057624201363241, 0.00631373660525133985, 0.02805173400058418032, 0.03611572669942343661, 0.02725548575809318835, 0.00626352313618798624, -0.01660412701430386689, -0.03069567162489824155, -0.02998797661266140724, -0.01566838454178879833, 0.00483324648223396047, 0.02170389569771772817, 0.02748768456516524281, 0.02039620204173777512, 0.00471432693139711874, -0.01167871464744648854, -0.02127363157738570293, -0.02038049925558575379, -0.01047553250030656795, 0.00299845424837411490, 0.01356430726067652665, 0.01681396762978090709, 0.01219985820689147883, 0.00281667565959922228, -0.00648648476192320144, -0.01156752105157506094, -0.01079243760201294838, -0.00541751346079947550, 0.00142621358813644207, 0.00646122391313261584, 0.00778163449748498371, 0.00548234547350159255, 0.00125511799367015618, -0.00267555546965436404, -0.00465669847088458298, -0.00422943235102920569, -0.00208073915112877515, 0.00050770855808428630, 0.00234696857216419672, 0.00282229550725717274, 0.00201012081946055216, 0.00048237627362652483, -0.00102712368384701332, -0.00192085206478439835, -0.00190964456036898217};

/* *************************************************************** 
 * Function prototypes 
 *****************************************************************/
/* Inits the ADC for continuous mode (channels, attenuation, frequency, handles, ...)*/
 static void continuous_adc_init(adc_channel_t *channel, uint8_t channel_num, adc_continuous_handle_t *out_handle);
 /* Callback of ADC driver. Executed whenever a new frame is available */
static bool s_conv_done_cb(adc_continuous_handle_t handle, const adc_continuous_evt_data_t *edata, void *user_data);
/* Task called to process one full buffer of data. A queue + blocking read is used for synchronization and data passing */
static void pv_processor_task(void *pvParam);

// Função para configurar o pin GPIO 11 como saida, para funcionamento do LED.
void cfgLed(void)
{

    ESP_LOGI(TAG, "[LED] Starting configuration...");

    // Configurar o pin GPIO 11 para o funcionamento do LED.
    gpio_reset_pin(GPIO_NUM_11);
    gpio_set_direction(GPIO_NUM_11, GPIO_MODE_OUTPUT); // Configurar porto GPIO11 como saída
    gpio_set_level(GPIO_NUM_11, 0);                    // Garantir que o LED fica desligado no estado inicial

    ESP_LOGI(TAG, "[LED] Configuration complete!"); // Feedback
}

/******************************************************************* 
 * The main task 
 *******************************************************************/
void app_main(void)
{
    /* Variable declarations */
    esp_err_t ret;          // Generic return code variable
    esp_err_t parse_ret;    // return code of ADC frame parse function 
    uint32_t ret_num = 0;   // Length of bytes return by a read operation
    uint32_t sb_count = 0;   // For counting the number of acquired samples    
    uint32_t num_parsed_samples = 0;    // To count the number of parsed samples
    
    adc_continuous_evt_cbs_t cbs;   // Variable for setting callback type (internal poll full, or frame conversion completed)    
    adc_continuous_handle_t handle = NULL;  //Handle for ADC          

    float * sound_samp_buf_ADC;   // Buffer to hold sound samples. Sound buffers are float because conv() function requires float parameters - avoid conversions 
    
    /* Variable inits */
    memset(result, 0x00, MICEX_ADC_FRAME_SIZE); // Init frame buffer     
    sound_samp_buf_ADC = heap_caps_malloc(sizeof(float) * MICEX_SOUND_SAMPLES_BUF_SIZE, MALLOC_CAP_DMA);     

    s_task_handle = xTaskGetCurrentTaskHandle();    // Get handle of the current task

    cbs.on_conv_done = s_conv_done_cb;  // Callback called when one conversion frame is done     
    cbs.on_pool_ovf = NULL;          // Don't set callback for internbal buffer overflow         

    /* Set log level */
    /* Debug allow to see variable values */
    /* Info only shows the decision */
    /* Verbose shows a trace of calls an some additional vars*/
    esp_log_level_set(TAG,ESP_LOG_DEBUG);

    /* Processor task and Queue inits */
    XQ=xQueueCreate(1, sizeof(float)*MICEX_SOUND_SAMPLES_BUF_SIZE); // Create queue to store one full sample period of sound
    xTaskCreate(pv_processor_task, "Processor", PROCESSOR_TASK_STACK_SIZE, NULL, PROCESSOR_TASK_PRIORITY, NULL );

    /* Init ADC */
    continuous_adc_init(channel, sizeof(channel) / sizeof(adc_channel_t), &handle); // Call init function
    ESP_ERROR_CHECK(adc_continuous_register_event_callbacks(handle, &cbs, NULL));   // Regiter callbacks
    ESP_ERROR_CHECK(adc_continuous_start(handle));                                  // Start the ADC

    // Call the function cfgLED to configure GPIO as an output
    cfgLed();

    /* Infinite loop - wait for data and process it */
    /* Synchronization with ADC is obtained via the ulTaskNotifyTake(pdTRUE, portMAX_DELAY); call */
    /* that assures that processing does not proceed until a notification that a frame was acquired*/
    while(1) {        
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY); // Wait for a new frame

        while (1) {
            ret = adc_continuous_read(handle, result, MICEX_ADC_FRAME_SIZE, &ret_num, 0);
            if (ret == ESP_OK) {
                ESP_LOGV(TAG, "ret is %x, ret_num is %"PRIu32" bytes", ret, ret_num);                
                /* One frame received. Extract samples from frame and put them on sound sample buffer*/
                parse_ret = adc_continuous_parse_data(handle, result, ret_num, parsed_data, &num_parsed_samples);
                if (parse_ret == ESP_OK) {
                    
                    for (int i = 0; i < num_parsed_samples; i++) {
                        sound_samp_buf_ADC[sb_count] = (float) parsed_data[i].raw_data;                           
                        sb_count+=1;
                        if(sb_count == MICEX_SOUND_SAMPLES_BUF_SIZE) { // The sound buffer is full. Process it ... */
                            ESP_LOGD(TAG, "sound buffer acquired. Time to process ...\n");                
                            xQueueSend(XQ,(void *)sound_samp_buf_ADC,0);     // Places the sound buffer in the queue. If the queue is full skip it (ticksTo Wait set to 0)
                                                                        // The consumer/processing task is automatically waked if blocked in the Queue
                            sb_count = 0;
                        }
                    }

                } else {
                    ESP_LOGE(TAG, "Data parsing failed: %s", esp_err_to_name(parse_ret));
                }
                /*                  
                 * To avoid a task watchdog timeout, add a delay here. 
                 */
                vTaskDelay(1);
            } else if (ret == ESP_ERR_TIMEOUT) {
                //We try to read `EXAMPLE_READ_LEN` until API returns timeout, which means there's no available data
                break;
            }
        }
    }

    ESP_ERROR_CHECK(adc_continuous_stop(handle));
    ESP_ERROR_CHECK(adc_continuous_deinit(handle));
}


/* **********************************************************************************************
 * Task activated when there is a full buffer of sound samples data available
 * The task reads a queue in blocking mode. This wait it awakes whenever the ADC processing code
 *      (the app_main taks in the case) delivers a new full buffer of data. 
 * Note that the use of a Queue and two separate buffers (ADC and processing) decouples the 
 *      acquisition from processing. I.e., processing can take as much time as needed without race conditions
 *      or any other sort of interference. The cost is overhead ...
 ************************************************************************************************/
void pv_processor_task(void *pvParam)
{
    /* Local vars, for auxiliary computations */    
    int n;        
    float * sound_samp_buf_proc;       // Buffer to hold sound samples. Buffers are float because conv() function requires float parameters - avoid conversions

    /* **********************************************************************************************
     * Objetivo:
     * Aplicar 3 filtros digitais FIR Passa-Banda ao sinal de áudio captado pelo microfone
     * para isolar as frequências correspondentes aos símbolos "0", "1" e "2".
     *
     * A Arquitetura:
     * O cálculo da convoluçao exige a memoria do sinal passado. Para um filtro de ordem
     * N=100, calcular a primeira amostra de um novo buffer exige as 100 amostras anteriores.
     * - Para um filtro de ordem N=100, é necessário guardar as últimas 100 amostras do
     * buffer anterior para evitar descontinuidades nas fronteiras do sinal.
     * - As variáveis de buffer temporário e de output estão declaradas como 'static'
     * para alocação na memória global, evitando o esgotamento da memória limitada (8KB) da tarefa do FreeRTOS.
     ************************************************************************************************/

    // buffer temporario para reconstruir o sinal: 100 amostras passadas + 2048 amostras novas
    static float temp_sound_samp_buf[2048 + 100];
    static float prev_buff[100] = {0};
    static float output_symb0[2248] = {0}; // tamanho da convoluçao: 2148 + 101 - 1
    static float output_symb1[2248] = {0};
    static float output_symb2[2248] = {0};

    enum FSM_state {WAIT_SOUND, WAIT_SILENCE, WAIT_PENALTY};
    enum FSM_state FSM_current = WAIT_SOUND;

    // Valor temporario até testar na placa
    float THRESHOLD = 7000.0f;

    TickType_t penalty_start_time = 0;
    const TickType_t PENALTY_DURATION = pdMS_TO_TICKS(5000); // 5 segundos
    const TickType_t BLINK_INTERVAL = pdMS_TO_TICKS(500);    // Inverte a cada 500ms

    // Como 0 é um tom valido, inicializar o array c         
    // Iniciar a lógica para piscar o LED durante 5 segundos com um valor impossivel para representar posiçoes vazias
    int sequence[4] = {-1, -1, -1, -1};

    /* Variable inits */
    sound_samp_buf_proc = heap_caps_malloc(sizeof(float) * MICEX_SOUND_SAMPLES_BUF_SIZE, MALLOC_CAP_DMA);

    int print_counter = 0;
    bool open_command_inserted = false;
    /* Infinite processing loop */
    while(1) {

        float power_symb0 = 0, power_symb1 = 0, power_symb2 = 0;

        /* Waits for new data */
        xQueueReceive(XQ,(void *)sound_samp_buf_proc,portMAX_DELAY); // Reads a sound sample. Blocks if queue is empty.
        ESP_LOGV(TAG, "Process Task got a buffer!");

        // ************************************************
        float dc_offset = 0;
        /* 
         * O sinal captado tem uma componente DC significativa (o "silêncio" não é 0 (anda à volta do 3300))
         * Aqui somamos o valor de todas as 2048 amostras do buffer e dividimos
         * pelo total para encontrar a tensão média
         */
        for (int i = 0; i < 2048; i++)
        {
            dc_offset += sound_samp_buf_proc[i];
        }
        dc_offset /= 2048.0f;

        /* 
         * Agora subtraimos a média a cada amostra. Isto desloca a onda para a "origem",
         * fazendo-a oscilar simetricamente entre valores positivos e negativos.
         * De seguida, amplificamos a onda resultante em 10x para aumentar
         * a resolução de cálculo na etapa onde são aplicados os Filtros FIR
         */
        float SOFTWARE_AMP = 10.0f;
        for (int i = 0; i < 2048; i++)
        {
            sound_samp_buf_proc[i] = (sound_samp_buf_proc[i] - dc_offset) * SOFTWARE_AMP;
        }
        // *********************************************************

        // Coloca as 100 amostras finais do ciclo anterior no inicio do buffer
        // Depois concatena as 2048 novas amostras de audio logo a seguir
        memcpy(temp_sound_samp_buf, prev_buff, sizeof(prev_buff));
        memcpy(&temp_sound_samp_buf[100], sound_samp_buf_proc, 2048 * sizeof(float));

        if (FSM_current != WAIT_PENALTY) {
            dsps_conv_f32(temp_sound_samp_buf, sizeof(temp_sound_samp_buf) / sizeof(temp_sound_samp_buf[0]),
                        fir_symb0, sizeof(fir_symb0) / sizeof(fir_symb0[0]),
                        output_symb0
                        );

            dsps_conv_f32(temp_sound_samp_buf, sizeof(temp_sound_samp_buf) / sizeof(temp_sound_samp_buf[0]),
                        fir_symb1, sizeof(fir_symb1) / sizeof(fir_symb1[0]), 
                        output_symb1
                        );
            
            dsps_conv_f32(temp_sound_samp_buf, sizeof(temp_sound_samp_buf) / sizeof(temp_sound_samp_buf[0]),
                        fir_symb2, sizeof(fir_symb2) / sizeof(fir_symb2[0]), 
                        output_symb2
                        );

            // começar com n = 100 e para em 2148 para evitar calcular a média com impulsos de transiçao
            for (n = 100; n < 2148; n++) {
                power_symb0 += output_symb0[n] * output_symb0[n];
                power_symb1 += output_symb1[n] * output_symb1[n];
                power_symb2 += output_symb2[n] * output_symb2[n];
            }

            // o .0f para garante que o compilador de C trata a divisão como float e não como int
            power_symb0 /= 2048.0f;
            power_symb1 /= 2048.0f;
            power_symb2 /= 2048.0f;

            // Ao realizar testes, percebemos que o altifalante do telemóvel não é, fisicamente, tao bom a reproduzir os 500Hz
            // da mesma maneira que reproduz 1360Hz e 2220Hz, logo colocamos estas multiplicações de modo a nivelar os valores
            // para nao ter de criar tresholds para cada simbolo
            power_symb0 = power_symb0 * 10.0f; // Amplifica o simbolo 0 para nivelar
            power_symb1 = power_symb1 * 5.0f;  // Amplifica o simbolo 1 para nivelar
            power_symb2 = power_symb2 * 1.0f;  // O simbolo 2 foi onde detetamos o maior pico, logo é a nossa referencia
        }

        print_counter++;
        if (print_counter >= 10) {
            printf("Potência: Simbolo 0: %.1f | Simbolo 1: %.1f | Simbolo 2: %.1f\n", power_symb0, power_symb1, power_symb2);
            printf("Sequencia: [%d, %d, %d, %d]\n", sequence[0], sequence[1], sequence[2], sequence[3]);
            print_counter = 0;
        }

        switch (FSM_current)
        {
        case WAIT_SOUND:
            // Verifica se algum tom superou o limiar de ruído
            if (power_symb0 > THRESHOLD || power_symb1 > THRESHOLD || power_symb2 > THRESHOLD)
            {

                int tom = -1;
                if (power_symb0 > power_symb1 && power_symb0 > power_symb2)
                {
                    tom = 0;
                }
                else if (power_symb1 > power_symb0 && power_symb1 > power_symb2)
                {
                    tom = 1;
                }
                else if (power_symb2 > power_symb0 && power_symb2 > power_symb1)
                {
                    tom = 2;
                }

                // avança se um tom válido e dominante foi detetado
                if (tom != -1)
                {
                    // Shift do array para a esquerda
                    memmove(sequence, sequence + 1, 3 * sizeof(int));
                    sequence[3] = tom;

                    ESP_LOGI(TAG, "Tom detetado: %d | Sequencia atual: [%d, %d, %d, %d]",
                             tom, sequence[0], sequence[1], sequence[2], sequence[3]);

                    bool trigger_penalty = false;

                    // Validaçao das Palavras-passe
                    if (sequence[0] == 1 && sequence[1] == 2 && sequence[2] == 0 && sequence[3] == 0)
                    {
                        ESP_LOGI(TAG, "COMANDO ABRIR DETETADO!");
                        // Ligar o LED
                        open_command_inserted = true;
                        gpio_set_level(GPIO_NUM_11, 1);

                        // Reset total do array
                        for (int i = 0; i < 4; i++)
                            sequence[i] = -1;
                    }
                    else if (sequence[0] == 2 && sequence[1] == 0 && sequence[2] == 1 && sequence[3] == 1)
                    {
                        ESP_LOGI(TAG, "COMANDO FECHAR DETETADO!");
                        // Desligar o LED
                        open_command_inserted = false;
                        gpio_set_level(GPIO_NUM_11, 0);
                        // Reset total do array
                        for (int i = 0; i < 4; i++)
                            sequence[i] = -1;
                    }
                    // Sequencia inválida
                    // o array está cheio (nenhum -1) mas nao bateu certo com as sequencias acima
                    else if (sequence[0] != -1 && sequence[1] != -1 && sequence[2] != -1 && sequence[3] != -1)
                    {
                        ESP_LOGW(TAG, "SEQUENCIA ERRADA!");

                        trigger_penalty = true;
                        // Reset total do array
                        for (int i = 0; i < 4; i++)
                            sequence[i] = -1;
                    }

                    if (trigger_penalty)
                    {
                        penalty_start_time = xTaskGetTickCount(); // Regista o momento exato do erro
                        FSM_current = WAIT_PENALTY;               // Coloca o LED a piscar durante os 5s
                    }
                    else
                    {
                        FSM_current = WAIT_SILENCE;
                    }
                    ESP_LOGI(TAG, "A entrar em WAIT_SILENCE. Aguarde...");
                }
            }
            break;

        case WAIT_SILENCE:
            if (power_symb0 < THRESHOLD && power_symb1 < THRESHOLD && power_symb2 < THRESHOLD)
            {
                FSM_current = WAIT_SOUND;
                ESP_LOGI(TAG, "Silencio detetado. A regressar a WAIT_SOUND.");
            }
            break;

        case WAIT_PENALTY:
        {
            // Calcula quanto tempo já passou desde o erro
            TickType_t elapsed = xTaskGetTickCount() - penalty_start_time;

            if (elapsed < PENALTY_DURATION)
            {
                // Alternar entre 0 e 1 com o intervalo configurado
                int led_state = (elapsed / BLINK_INTERVAL) % 2;
                // Ativar/Desativar o LED com base no estado calculado acima.
                gpio_set_level(GPIO_NUM_11, led_state);
            }
            else
            {
                // A penalização terminou
                if (open_command_inserted) {
                    gpio_set_level(GPIO_NUM_11, 1);
                } else {
                    gpio_set_level(GPIO_NUM_11, 0);
                }

                for (int i = 0; i < 4; i++)
                    sequence[i] = -1;     // Limpa o array para nova tentativa
                FSM_current = WAIT_SOUND; // Volta a permitir tentativas
                ESP_LOGI(TAG, "Penalizacao terminada. Tentar novamente.");
            }
            break;
        }
        }

        /*  New buffer - process it         
        printf("\nFirst 100 samples of the sound frame:----------- ");
        for(n=0; n < 100; n++) {            
            if(n%10 == 0) {
                printf("\n[%d to %d]:", n,n+9);
            }
            printf("%5d ", (int)sound_samp_buf_proc[n]);
            
        }
        printf("\n---------------------\n"); */

        // Guarda as ultimas 100 amostras do buffer atual para o proximo ciclo
        memcpy(prev_buff, &sound_samp_buf_proc[2048-100], sizeof(prev_buff));
    }
}

/* ADC Callback - called when one frame was acquired */
static bool IRAM_ATTR s_conv_done_cb(adc_continuous_handle_t handle, const adc_continuous_evt_data_t *edata, void *user_data)
{
    BaseType_t mustYield = pdFALSE;
    //Notify that ADC continuous driver has done enough number of conversions
    vTaskNotifyGiveFromISR(s_task_handle, &mustYield);

    return (mustYield == pdTRUE);
}

/* ADC init function */
static void continuous_adc_init(adc_channel_t *channel, uint8_t channel_num, adc_continuous_handle_t *out_handle)
{
    adc_continuous_handle_t handle = NULL;

    adc_continuous_handle_cfg_t adc_config = {
        .max_store_buf_size = MICEX_ADC_BUF_SIZE,
        .conv_frame_size = MICEX_ADC_FRAME_SIZE,
    };
    ESP_ERROR_CHECK(adc_continuous_new_handle(&adc_config, &handle));

    adc_continuous_config_t dig_cfg = {
        .sample_freq_hz = MICEX_ADC_SAMPLE_FREQ,
        .conv_mode = MICEX_ADC_CONV_MODE,
    };

    adc_digi_pattern_config_t adc_pattern[SOC_ADC_PATT_LEN_MAX] = {0};
    dig_cfg.pattern_num = channel_num;
    for (int i = 0; i < channel_num; i++) {
        adc_pattern[i].atten = MICEX_ADC_ATTEN;
        adc_pattern[i].channel = channel[i] & 0x7;
        adc_pattern[i].unit = MICEX_ADC_UNIT;
        adc_pattern[i].bit_width = MICEX_ADC_BIT_WIDTH;

        ESP_LOGI(TAG, "adc_pattern[%d].atten is :%"PRIx8, i, adc_pattern[i].atten);
        ESP_LOGI(TAG, "adc_pattern[%d].channel is :%"PRIx8, i, adc_pattern[i].channel);
        ESP_LOGI(TAG, "adc_pattern[%d].unit is :%"PRIx8, i, adc_pattern[i].unit);
    }
    dig_cfg.adc_pattern = adc_pattern;
    ESP_ERROR_CHECK(adc_continuous_config(handle, &dig_cfg));

    *out_handle = handle;
}