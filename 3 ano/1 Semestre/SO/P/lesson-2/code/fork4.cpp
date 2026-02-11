#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "delays.h"
#include "process.h"

int main(void)
{
  printf("Before the fork: PID = %d, PPID = %d\n", getpid(), getppid());

  pid_t ret = pfork();
  if (ret == 0)
  {
    // Se execl falhar, nao há esse tratamento de erro. É praticamente obrigatorio ter esse tratamento para uma programaçao defensiva!
    pexecl("./child", "./child", (char *)NULL);
    /* Usar pexecl salva o codigo em caso de erro, no entanto pexecl é apenas disponivel para esta cadeira.
    
    Usar um if ((execl("./child", "./child", NULL)) == -1) é a soluçao geral para o tratamento de erro.
    
    if ((execl("./child", "./child", (char *)NULL)) == -1) {
      perror("execl failed");
      _exit(EXIT_FAILURE);
    }

    You should use _exit  to abort the child program when the exec fails, 
    because in this situation, the child process may interfere with the parent process' external data (files) by calling its atexit handlers, 
    calling its signal handlers, and/or flushing buffers.
    */
    printf("why doesn't this message show up?\n");
    return EXIT_FAILURE;
  }
  else
  {
    //pwait(NULL);
    printf("I'm the parent: PID = %d, PPID = %d\n", getpid(), getppid());
    usleep(1000);
  }

  return EXIT_SUCCESS;
}