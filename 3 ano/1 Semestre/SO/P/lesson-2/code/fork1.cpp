#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

#include "delays.h"
#include "process.h"

// Como child retorna sempre 0, podemos usar um if else para saber qual deles é o child.
// o fork duplica o processo naquele ponto; a partir daí tens duas execuções independentes do mesmo programa.

int main(void)
{
  printf("Before the fork: PID = %d, PPID = %d\n", getpid(), getppid());

  pid_t pid = pfork(); // equivalent to fork(), dealing internally with error situations
  
  if (pid == 0) {
      printf("After the fork (child): PID = %d, PPID = %d\n",getpid(), getppid());
  } else {
      printf("After the fork (parent): PID = %d, PPID = %d\n",getpid(), getppid());
  }
  bwRandomDelay(1000, 100000); // added to enhance the occurrence of different outputs
  
  if (pid == 0) {
      printf("  Was I printed by the parent or by the child process? How can I know it? (child)\n");
  } else {
      printf("  Was I printed by the parent or by the child process? How can I know it? (parent)\n");
  }
  
  return EXIT_SUCCESS;
}

// If you run the program several times, in some of them, the prompt of the bash may appear before one of the program lines.Why ? You may need to change the delays for this to happen.

// A shell lançou um único processo (o processo inicial do programa). Quando esse processo (o pai, neste caso) termina, a shell considera o job concluído e repõe o prompt — não espera por outros descendentes do processo que possam ainda existir.
// Como garantir ordem/evitar o prompt intermédio:
// Fazer o pai esperar pelo filho : use waitpid(pid, …) antes de o pai terminar.