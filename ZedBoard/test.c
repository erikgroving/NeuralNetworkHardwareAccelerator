#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/mman.h>
#include <stdint.h>

typedef struct dma_data {
    uint32_t    fpga_img_id;            // written to by fpga
    uint32_t    fpga_buff_sel;          // written to by fpga
    uint32_t    epoch;                  // written to by fpga
    uint32_t    num_correct_train;      // written to by fpga
    uint32_t    num_correct_test;       // written to by fpga
    
    uint32_t    start;                  // written to by arm
    uint32_t    n_epochs;               // written to by arm
    uint32_t    img1_id;                // written to by arm
    uint32_t    img2_id;                // written to by arm
    uint32_t    img1_label;             // written to by arm
    uint32_t    img2_label;             // written to by arm 
    uint8_t     img1[784];              // written to by arm
    uint8_t     img2[784];              // written to by arm
} dma_data_t;


int main() {
    int handle          = open("/dev/mem", O_RDWR | O_SYNC); 
    dma_data_t* dma_ptr = mmap(NULL, 134217728, PROT_READ | PROT_WRITE, MAP_SHARED, handle, 0x40000000);

    dma_ptr->n_epochs   = 10;
    dma_ptr->img1_id    = 0;
    dma_ptr->img2_id    = 1;
    
    // Load MNIST images into memory

    printf("%08x\n", dma_ptr->epoch);
    printf("%08x\n", dma_ptr->num_correct_train);
    printf("%08x\n", dma_ptr->num_correct_test);
    printf("img: %d\t\tbuff sel: %d\n", dma_ptr->fpga_img_id, dma_ptr->fpga_buff_sel);

    // Start training!
    dma_ptr->start      = 1;
    while (1) {
        printf("img: %d\t\tbuff sel: %d\n", dma_ptr->fpga_img_id, dma_ptr->fpga_buff_sel);
        usleep(500000);     
    }



}