#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

__attribute__((constructor)) void harness()
{
    setenv("CYRUS_SERVICE", "imapd", 1);
    setenv("CYRUS_ID", "0", 1);

    if (dup2(0, 4) == -1) // LISTEN_FD
    {
        perror("Unable to dup2(0, LISTEN_FD = 4): ");
        exit(1);
    }

    if (dup2(0, 3) == -1) // STATUS_FD
    {
        perror("Unable to dup2(0, STATUS_FD = 3): ");
        exit(1);
    }
}