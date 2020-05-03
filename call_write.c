#define _GNU_SOURCE

#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
    const char* msg = "Calling syscall\n";
    syscall(SYS_write, STDOUT_FILENO, msg, strlen(msg));

    msg = "Calling write\n";
    write(STDOUT_FILENO, msg, strlen(msg));

    msg = "Calling fwrite\n";
    fwrite(msg, 1, strlen(msg), stdout);

    printf("Calling printf\n");
    fprintf(stdout, "Calling fprintf\n");

    putc('!', stdout);
    putc('\n', stdout);
}
