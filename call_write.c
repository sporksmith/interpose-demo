#include <unistd.h>
#include <stdio.h>

int main(int argc, char **argv) {
    write(STDOUT_FILENO, "hello\n", 6);
    printf("hello\n");
}
