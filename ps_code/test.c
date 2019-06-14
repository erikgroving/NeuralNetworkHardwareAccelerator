#include <stdio.h>
#include <stdint.h>
int main() {
    uint32_t x;
    uint8_t y1, y2, y3, y4;
    y1 = 0x32;
    y2 = 0x4a;
    y3 = 0x6d;
    y4 = 0x1F;
    x = y1 + (y2 << 8) + (y3 << 16) + (y4 << 24);
    
    printf("%08x\n", x);
                                    
}