#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/mman.h>
#include <stdint.h>

#define FORWARD     1
#define WAITING     2
#define BACKWARD    3
#define UPDATE      4
#define IDLE        5
    
typedef struct dma_data {
    uint32_t    fpga_img_id;            // written to by fpga
    uint32_t    fpga_buff_sel;          // written to by fpga
    uint32_t    epoch;                  // written to by fpga
    uint32_t    num_correct_train;      // written to by fpga
    uint32_t    num_correct_test;       // written to by fpga
    
    uint32_t    start;                  // written to by arm
    uint32_t    n_epochs;               // written to by arm
    uint32_t    img1_id;                // written to by arm
    uint32_t    img1_label;             // written to by arm
    uint32_t    img1[196];              // written to by arm
    
    uint32_t    status_block;           // written to by fpga
    uint32_t    img_cntr;               // written to by fpga;
} dma_data_t;

void state_enc_to_str (uint32_t state, char* enc); 

int main() {
    
    uint32_t magic_number;
    uint32_t start, img_cntr, fpga_img_id, img1_id, img1_label;
    uint32_t status;
    uint32_t led_o_r, fc0_state, fc1_state, fc2_state, forward, fc0_start, fc1_start;
    uint32_t fc2_start, fc0_busy, fc1_busy, fc2_busy, new_img, all_idle, img_valid;
    char fc0_state_str[40];
    char fc1_state_str[40];
    char fc2_state_str[40];

    int handle          = open("/dev/mem", O_RDWR | O_SYNC); 
    dma_data_t* dma_ptr = mmap(NULL, 134217728, PROT_READ | PROT_WRITE, MAP_SHARED, handle, 0x40000000);
    uint32_t* ptr = (uint32_t*)dma_ptr;
    
    dma_ptr->n_epochs   = 10;
    dma_ptr->img1_id    = 0;
    
    magic_number = ptr[1024];
    printf("@@@ Checking Magic Number\n");
    if (magic_number != 0xFEEDFADE) {
        printf("Memory was read incorrectly.\n");
    }
    printf("Magic number: %08x\n", magic_number);
    printf("Magic number successfully read.\n");
    
    // Load MNIST images into memory


    // Start training!
    dma_ptr->start      = 1;
    dma_ptr->img1[0]    = 0;

    
    while (1) {
        img_cntr    = dma_ptr->img_cntr;
        fpga_img_id = dma_ptr->fpga_img_id;
        img1_id     = dma_ptr->img1_id;
        img1_label  = dma_ptr->img1_label;
        start       = dma_ptr->start;
        // parse the status data
        status      = dma_ptr->status_block;
        status      = ptr[517];
        img_cntr    = ptr[518];
        img_valid   = status & 0x1;
        all_idle    = (status >> 1) & 0x1;
        new_img     = (status >> 2) & 0x1;
        fc2_busy    = (status >> 3) & 0x1;
        fc1_busy    = (status >> 4) & 0x1;
        fc0_busy    = (status >> 5) & 0x1;
        fc2_start   = (status >> 6) & 0x1;
        fc1_start   = (status >> 7) & 0x1;
        fc0_start   = (status >> 8) & 0x1;
        forward     = (status >> 9) & 0x1;
        fc2_state   = (status >> 10) & 0x7;
        fc1_state   = (status >> 13) & 0x7;
        fc0_state   = (status >> 16) & 0x7;
        led_o_r     = (status >> 19) & 0xFF;   
        
        state_enc_to_str(fc0_state, fc0_state_str);
        state_enc_to_str(fc1_state, fc1_state_str);
        state_enc_to_str(fc2_state, fc2_state_str);
                
        printf("\n@@@ CURRENT STATE \n");
        printf("img_cntr: %d\t\tfpga_img_id: %d\t\timg1_id: %d\n", img_cntr, fpga_img_id, img1_id);
        printf("img1_label: %d\tled_o: %02x\n", img1_label, led_o_r);
        printf("start: %d\t\tforward: %d\t\tall_idle: %d\n", start, forward, all_idle);
        printf("img_valid: %d\t\tnew_img: %d\n", img_valid, new_img);
        printf("fc0_busy: %d\t\tfc1_busy: %d\t\tfc2_busy: %d\n", fc0_busy, fc1_busy, fc2_busy);
        printf("fc0_start: %d\t\tfc1_start: %d\t\tfc2_start: %d\n", fc0_start, fc1_start, fc2_start);
        printf("fc0_state: %d\t\tfc1_state: %d\t\tfc2_state: %d\n", fc0_state, fc1_state, fc2_state);
        printf("fc0_state: %s\t\tfc1_state: %s\t\tfc2_state: %s\n", fc0_state_str, fc1_state_str, fc2_state_str);
        
        
        dma_ptr->img1_id = (dma_ptr->fpga_img_id + 1) % 60000;
        usleep(2e6);
    }
}

void state_enc_to_str (uint32_t state, char* enc) {
    
    if (state == IDLE) {
        sprintf(enc, "IDLE");
    }
    else if (state == FORWARD) {
        sprintf(enc, "FORWARD");
    }
    else if (state == WAITING) {
        sprintf(enc, "WAITING");
    }
    else if (state == BACKWARD) {
        sprintf(enc, "BACKWARD");
    }
    else if (state == UPDATE) {
        sprintf(enc, "UPDATE");
    }        
}