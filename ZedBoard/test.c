#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include "parse_mnist.h"

#define FORWARD     1
#define WAITING     2
#define BACKWARD    3
#define UPDATE      4
#define IDLE        5
    
typedef struct ddr_data {
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
} ddr_data_t;

void state_enc_to_str(uint32_t state, char* enc); 
void parse_mnist_data(char* filename, uint32_t** mnist_images);

int main() {
    
    uint32_t magic_number;
    uint32_t epoch, corr_tr, corr_test;
    uint32_t start, img_cntr, fpga_img_id, img1_id, img1_label;
    uint32_t status;
    uint32_t led_o_r, fc0_state, fc1_state, fc2_state, forward, fc0_start, fc1_start;
    uint32_t fc2_start, fc0_busy, fc1_busy, fc2_busy, new_img, all_idle, img_valid;
    char fc0_state_str[40];
    char fc1_state_str[40];
    char fc2_state_str[40];

    int handle          = open("/dev/mem", O_RDWR | O_SYNC); 
    ddr_data_t* ddr_ptr = mmap(NULL, 134217728, PROT_READ | PROT_WRITE, MAP_SHARED, handle, 0x40000000);
    uint32_t* ptr = (uint32_t*)ddr_ptr;
    

    
    magic_number = ptr[400];
    printf("@@@ Checking Magic Number\n");
    if (magic_number != 0xFADEDBEE) {
        printf("Memory was read incorrectly.\n");
        return -1;
    }
    printf("Magic number: %08x\n", magic_number);
    printf("Magic number successfully read.\n");
    
    // Load MNIST images into memory
    printf("@@@ Loading MNIST images...\n");
    uint8_t** train_images;
    uint8_t* train_labels;
    train_images = parse_mnist_images("data/train-images.idx3-ubyte");
    train_labels = parse_mnist_labels("data/train-labels.idx1-ubyte");
    printf("@@@ Loading complete!\n");

    // Start training!
    ddr_ptr->start      = 1;
    ddr_ptr->img1_label = 4;

    ddr_ptr->n_epochs   = 10;
    ddr_ptr->img1_id    = 0;   
    
    while (1) {

        
        uint32_t id   = (ddr_ptr->fpga_img_id + 1) % 60000;
        memcpy(&(ddr_ptr->img1), train_images[id], sizeof(uint8_t) * 784);
        /*for (int i = 0; i < 196; i++) {

            ddr_ptr->img1[i] = train_images[id][i];
        }*/

        ddr_ptr->img1_label = train_labels[id];
        ddr_ptr->img1_id = (ddr_ptr->fpga_img_id + 1) % 60000;
        
        if (id == 0) {       
            epoch       = ddr_ptr->epoch;
            corr_tr     = ddr_ptr->num_correct_train;
            corr_test   = ddr_ptr->num_correct_test;
            /*img_cntr    = ddr_ptr->img_cntr;
            fpga_img_id = ddr_ptr->fpga_img_id;
            img1_id     = ddr_ptr->img1_id;
            img1_label  = ddr_ptr->img1_label;
            start       = ddr_ptr->start;
            // parse the status data
            status      = ddr_ptr->status_block;
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
            */
            printf("epoch: %d\t\tCorrect_Train: %d\tCorrect_Test: %d\n", epoch, corr_tr, corr_test);
            /*printf("img_cntr: %d\t\tfpga_img_id: %d\t\timg1_id: %d\n", img_cntr, fpga_img_id, img1_id);
            printf("img1_label: %d\t\tled_o: %02x\n", img1_label, led_o_r);
            printf("start: %d\t\tforward: %d\t\tall_idle: %d\n", start, forward, all_idle);
            printf("img_valid: %d\t\tnew_img: %d\n", img_valid, new_img);
            printf("fc0_busy: %d\t\tfc1_busy: %d\t\tfc2_busy: %d\n", fc0_busy, fc1_busy, fc2_busy);
            printf("fc0_start: %d\t\tfc1_start: %d\t\tfc2_start: %d\n", fc0_start, fc1_start, fc2_start);
            printf("fc0_state: %s\tfc1_state: %s\tfc2_state: %s\n", fc0_state_str, fc1_state_str, fc2_state_str);*/
            usleep(2e6);
        }
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