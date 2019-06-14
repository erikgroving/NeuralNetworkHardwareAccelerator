#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

uint32_t** parse_mnist_images(char* filename) {
    FILE* f;
    uint8_t* u8;
    uint8_t** images;
    uint32_t** images32;
    uint32_t magic_number;
    uint32_t n_items;
    uint32_t rows;
    uint32_t cols;
    
    f = fopen(filename, "rb");
    
    fread(&magic_number, 4, 1, f);      
    fread(&n_items, 1, 4, f);
    fread(&rows, 1, 4, f);
    fread(&cols, 1, 4, f);
  
    u8 = (uint8_t*)&magic_number;
    magic_number = u8[3] + (u8[2] << 8) + (u8[1] << 16) + (u8[0] << 24);
    u8 = (uint8_t*)&n_items;
    n_items = u8[3] + (u8[2] << 8) + (u8[0] << 16) + (u8[0] << 24);
    u8 = (uint8_t*)&rows;
    rows = u8[3] + (u8[2] << 8) + (u8[0] << 16) + (u8[0] << 24);
    u8 = (uint8_t*)&cols;
    cols = u8[3] + (u8[2] << 8) + (u8[0] << 16) + (u8[0] << 24);
    
    images = malloc(sizeof(uint8_t*) * n_items);
    
    for (int i = 0; i < n_items; i++) {
        images[i] = malloc(sizeof(uint8_t) * 784);
        fread(images[i], 784, 1, f);
    }
    
    images32 = malloc(sizeof(uint32_t*) * n_items);
    for (int i = 0; i < n_items; i++) {
        images32[i] = malloc(sizeof(uint32_t) * 196);
        for (int j = 0; j < 196; j++) {
            images32[i][j] = images[i][4*j] + (images[i][4*j+1] << 8) + 
                        (images[i][4*j+2] << 16) + (images[i][4*j+3] << 24);
        }
    }


    fclose(f);
    return images32;
}

uint32_t* parse_mnist_labels(char* filename) {
    uint8_t* ptr;
    uint8_t* labels;
    uint32_t* labels32;
    uint32_t magic_number;
    uint32_t n_items;
    uint8_t label;
    FILE* f;
    f = fopen(filename, "rb");
    
    fread(&magic_number, 4, 1, f);    
    ptr = (uint8_t*)&magic_number;
    magic_number = ptr[3] + (ptr[2] << 8) + (ptr[1] << 16) + (ptr[0] << 24);
    fread(&n_items, 1, 4, f);
    ptr = (uint8_t*)&n_items;
    n_items = ptr[3] + (ptr[2] << 8) + (ptr[0] << 16) + (ptr[0] << 24);
    labels = malloc(sizeof(uint8_t) * n_items);
    labels32 = malloc(sizeof(uint32_t) * n_items);
    for (int i = 0; i < n_items; i++) {
        fread(&labels[i], 1, 1, f);
    }
    
    for (int i = 0; i < n_items; i++) {
        labels32[i] = labels[i];
    }

    
    
    
    fclose(f);
    return labels32;
}

