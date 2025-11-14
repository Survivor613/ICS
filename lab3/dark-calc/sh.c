#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

int main()
{
    printf("Executing: n");
    system("/bin/sh");
    return;
}