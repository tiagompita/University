#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(void)
{
  printf("Before the fork\n");

  int ret = fork();

  if (ret == 0)
  {
    execlp("ls", "ls", "-l", NULL);
    return EXIT_FAILURE;
  }
  else
  {
    printf("I'm the parent\n");
    printf("And I will finish, "
        "after waiting for the child to finish\n");
    wait(NULL);
  }

  return EXIT_SUCCESS;
}

