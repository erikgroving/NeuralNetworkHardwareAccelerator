#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdint.h>
#include "parse_mnist.h"
#include <unistd.h>
#include <math.h> 
#include <sys/time.h>
#include <time.h>

#define FORWARD     1
#define WAITING     2
#define BACKWARD    3
#define UPDATE      4
#define IDLE        5
#define SET_SIZE    60
#define TRAIN_SIZE  60

typedef struct ddr_data {
    // written to by fpga                  Offset   Desc
    uint32_t    fpga_img_id;            // 0        fpga image ptr
    uint32_t    epoch;                  // 1        
    uint32_t    num_correct_train;      // 2        
    uint32_t    num_correct_test;       // 3
    uint32_t    idle_cycles;            // 4        
    uint32_t    active_cycles;          // 5
    uint32_t    status;                 // 6        contains status info
    
    // written to by arm
    uint32_t    start;                  // 7        start looping
    uint32_t    n_epochs;               // 8        upper limit on epochs
    uint32_t    learning_rate;          // 9        # of right shifts
    uint32_t    training_mode;          // 10       train or just forward pass
    uint32_t    img_set_size;           // 11       size of dataset
    uint32_t    img_id;                 // 12       arm image ptr
    uint32_t    img_label;              // 13
    uint32_t    img[196];               // 14
    int16_t     out[10];

} ddr_data_t;

void state_enc_to_str(uint32_t state, char* enc); 
void parse_mnist_data(char* filename, uint32_t** mnist_images);
void print_debug_data(volatile ddr_data_t* ddr_ptr);

int main() {
    uint32_t magic_number;
    uint32_t id, test_idx, epoch, corr_tr, corr_test;  
    uint32_t** train_images;
    uint32_t** test_images;
    uint32_t* train_labels;
    uint32_t* test_labels;    

    int handle = open("/dev/mem", O_RDWR | O_SYNC); 
    volatile ddr_data_t* ddr_ptr = mmap(NULL, 134217728, PROT_READ | PROT_WRITE, MAP_SHARED, handle, 0x40000000);
    
    
    uint32_t* ptr = (uint32_t*)ddr_ptr;   
    magic_number = ptr[400];
    printf("@@@ Checking Magic Number\n");
    if (magic_number != 0xFADEDBEE) {
        printf("@@@ Memory was read incorrectly.\n");
        return -1;
    }
    printf("@@@ Magic number: %08x\n", magic_number);
    printf("@@@ Magic number successfully read.\n");
    
    // Load MNIST images into memory
    printf("@@@ Loading MNIST images...\n");
    train_images = parse_mnist_images("data/train-images.idx3-ubyte");
    train_labels = parse_mnist_labels("data/train-labels.idx1-ubyte");
    test_images = parse_mnist_images("data/t10k-images.idx3-ubyte");
    test_labels = parse_mnist_labels("data/t10k-labels.idx1-ubyte");
    printf("@@@ Loading complete!\n");

    struct timespec sleep;
    sleep.tv_sec = 0;
    sleep.tv_nsec = 1000;

    // Start training! 
    ddr_ptr->start = 0;
    usleep(100);
    ddr_ptr->start = 1;
    ddr_ptr->n_epochs = 35;
    ddr_ptr->learning_rate = 8;
    ddr_ptr->training_mode = 1;  
    ddr_ptr->img_set_size = SET_SIZE - 1;
    struct timeval start, end;
    gettimeofday(&start, NULL);
    do {
        id      = (ddr_ptr->fpga_img_id + 1) % SET_SIZE;
        epoch   = ddr_ptr->epoch;        
        // Print data if epoch just finished
        if ((id == 0) && epoch != 0) {        
            gettimeofday(&end, NULL);
            
            
            corr_tr     = ddr_ptr->num_correct_train;
            corr_test   = ddr_ptr->num_correct_test;
            printf("\n\n@@@ EPOCH %d\n@@@ Training Images"
                    ": %d/%d\nAccuracy: %f%%\n", epoch, corr_tr, TRAIN_SIZE, 
                    (float)(corr_tr/(float)TRAIN_SIZE) * 100.);
     
                   
            uint32_t active = ddr_ptr->active_cycles;
            uint32_t idle = ddr_ptr->idle_cycles;
            printf("Active Cycles: %d\t Idle Cycles: %d\n", active, idle);
            printf("Active Cycle Percentage: %f%%\n", (float)active / ((float)idle + (float)active));      
            print_debug_data(ddr_ptr);            
            printf("Elapsed time: %.5f seconds\n", (end.tv_sec - start.tv_sec) + ((end.tv_usec - start.tv_usec) * 1e-6));
            usleep(2e5);
            gettimeofday(&start, NULL);
        }
        

        #pragma unroll
        for (int i = 0; i < 196; i++) {
            ddr_ptr->img[i] = train_images[id][i];
        }
        ddr_ptr->img_label  = train_labels[id];
        
        nanosleep(&sleep, NULL);

        ddr_ptr->img_id     = id;            

    } while (epoch < ddr_ptr->n_epochs);
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

void print_debug_data(volatile ddr_data_t* ddr_ptr) {

    uint32_t start, fpga_img_id, img_id, img_label;
    uint32_t status;
    uint32_t led_o_r, fc0_state, fc1_state, fc2_state, forward, fc0_start, fc1_start;
    uint32_t fc2_start, fc0_busy, fc1_busy, fc2_busy, new_img, all_idle, img_valid;
    char fc0_state_str[40];
    char fc1_state_str[40];
    char fc2_state_str[40];
    uint32_t corr_tr, corr_test;
    float output[10];
    
    printf("\n@@@ CURRENT STATE \n");            
    fpga_img_id = ddr_ptr->fpga_img_id;
    img_id      = ddr_ptr->img_id;
    img_label   = ddr_ptr->img_label;
    start       = ddr_ptr->start;
    // parse the status data
    status      = ddr_ptr->status;
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
    corr_tr     = ddr_ptr->num_correct_train;
    corr_test   = ddr_ptr->num_correct_test;
    state_enc_to_str(fc0_state, fc0_state_str);
    state_enc_to_str(fc1_state, fc1_state_str);
    state_enc_to_str(fc2_state, fc2_state_str);
    
    float max_out = -100;
    int max_out_id = 0;
    for (int i = 0; i < 10; i++) {
        output[i] = (float)(ddr_ptr->out[i]) / pow(2, 10);
        if (output[i] > max_out) {
            max_out = output[i];
            max_out_id = i;
        }
    }
    
    
    
    printf("fpga_img_id: %d\t\timg1_id: %d\n", fpga_img_id, img_id);
    printf("img1_label: %d\t\tmax_out: %d\t\tled_o: %08x\n", img_label, max_out_id, led_o_r);
    /*printf("Corr Test: %d\tCorr Train: %d\n", corr_test, corr_tr);
    printf("fc0_state: %s\tfc1_state: %s\tfc2_state: %s\n", fc0_state_str, fc1_state_str, fc2_state_str);*/
    printf("Output:\n");
    for (int i = 0; i < 10; i++) {
        printf("%d: %f\n", i, output[i]);
    }
    

}