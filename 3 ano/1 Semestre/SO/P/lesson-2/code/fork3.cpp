#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

#include "delays.h"
#include "process.h"

int main(void)
{
  printf("Before the fork: PID = %d, PPID = %d\n", getpid(), getppid());

  pid_t ret = pfork();
  if (ret == 0)
  {
    bwRandomDelay(100, 100000);
    printf("After the fork, in the child: PID = %d, PPID = %d\n", getpid(), getppid());
  }
  else
  {
    bwRandomDelay(100, 100000);
    printf("After the fork, in the parent: PID = %d, PPID = %d\n", getpid(), getppid());
    pwait(NULL); // Isto elimina o caso em que o prompt surge entre as linhas do programa.
    // Nota: as impressões ainda podem intercalar entre child e parent antes do wait, mas o wait garante que o parent não sai (e não devolve o prompt) enquanto o filho estiver vivo.
  }

  return EXIT_SUCCESS;
}

/*  fork cria dois processos que correm concorrentemente; o escalonador do SO decide quem corre quando, por isso a ordem não é determinística.
    
    bwRandomDelay usa valores aleatórios: o delay do child pode ser menor que o do parent, logo o child termina primeiro.
    
    diferenças de CPU, caches, afinidade, carga do sistema, e chamadas bloqueantes (I/O, etc.) também alteram a ordem.
    
    se o parent não espera pelo child (wait/waitpid) a shell pode ver o parent terminar antes do child — e o child pode terminar antes ou depois, dependendo do agendamento.
 */