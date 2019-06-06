/**
 * Proof of concept offloaded memcopy using AXI Direct Memory Access v7.1
 */

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/mman.h>
#include <stdint.h>


int main() {
    int dh = open("/dev/mem", O_RDWR | O_SYNC); // Open /dev/mem which represents the whole physical memory
    uint32_t* virtual_address = mmap(NULL, 65535, PROT_READ | PROT_WRITE, MAP_SHARED, dh, 0x40000000); // Memory map AXI Lite register block

    virtual_address[1]= 0x2A; // Write random stuff to source block

    
    printf("%d\n", virtual_address[3]);

}