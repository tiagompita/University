/* pipe1.cpp
 *
 * Use of the system call 'pipe'.
 *
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>

#define BUF_LEN 70

int main(void)
{
    int fd[2], n;
    char buf[BUF_LEN];

    /* fill buf */
    memset(buf, '-', BUF_LEN - 1);
    buf[BUF_LEN - 1] = '\0';

    /* create pipe */
    if (pipe(fd) == -1)
    {
        perror("Fail creating pipe: ");
        abort();
    }

    /* write to pipe */
    const char *msg = "bla bla ...";
    int sz = strlen(msg) + 1;
    if (write(fd[1], msg, sz) != sz)
    {
        perror("Fail writing to pipe: ");
        abort();
    }

    /* reading from pipe */
    if ((n = read(fd[0], buf, sizeof (buf))) <= 0)
    {
        perror("Fail reading from pipe: ");
        abort();
    }

    printf("Read from pipe: %s\n", buf);
    return 0;
}
