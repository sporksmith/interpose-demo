#define _GNU_SOURCE

#include <unistd.h>
#include <sys/syscall.h>

ssize_t write(int fd, const void *buf, size_t count) {
    syscall(SYS_write, fd, buf, count);
    syscall(SYS_write, fd, buf, count);
}
