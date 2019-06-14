#ifndef __PARSE_MNIST_H
#define __PARSE_MNIST_H

uint32_t** parse_mnist_images(char* filename);
uint32_t* parse_mnist_labels(char* filename);

#endif