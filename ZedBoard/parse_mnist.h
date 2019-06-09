#ifndef __PARSE_MNIST_H
#define __PARSE_MNIST_H

void parse_mnist_images(char* filename, uint8_t** images);
void parse_mnist_labels(char* filename, uint8_t* labels);

#endif