#include "pooling.h"
#include <iostream>
#include <algorithm>

void PoolingLayer::forward(std::vector<double> in) {
    for (size_t c = 0; c < channels; c++) {
        for (size_t i = 0; i < dim_i - 1; i += 2) {
            for (size_t j = 0; j < dim_i - 1; j += 2) {
                int row_o = i / 2;
                int col_o = j / 2;
                int out_idx = c * dim_o * dim_o + row_o * dim_o + col_o;

                std::vector<double> pixels = getWindowPixels(in, c, i, j);
                double max = *std::max_element(pixels.begin(), pixels.end());
                output[out_idx] = max;
            }
        }
    }
}

void PoolingLayer::forward(std::vector<double> in, bool first) {
    forward(in);
}

std::vector<double> PoolingLayer::getWindowPixels(const std::vector<double>& input, 
                                                    uint32_t ch, uint32_t row, uint32_t col) {
    int offset = dim_i * dim_i * ch + dim_i * row + col;
    std::vector<double> pixels;
    pixels.push_back(input[offset]);
    pixels.push_back(input[offset + 1]);
    pixels.push_back(input[offset + dim_i]);
    pixels.push_back(input[offset + dim_i + 1]);

    return pixels;
}

std::vector< std::vector<double> > PoolingLayer::backward(
                    std::vector< std::vector<double> > gradients, 
                    std::vector< std::vector<double> > in_activations,
                    std::vector< std::vector<double> > out_activations) {
    std::vector< std::vector<double> > sensitivity;
    for (size_t i = 0; i < gradients.size(); i++) {
        std::vector<double> sngl_sens(channels * dim_i * dim_i, 0);
        for (size_t c = 0; c < channels; c++) {
            for (size_t j = 0; j < dim_o; j++) {
                for (size_t k = 0; k < dim_o; k++) {
                    int offset_o = c * dim_o * dim_o + j * dim_o + k;
                    int row_i = j * 2;
                    int col_i = k * 2;
                    int offset_i = c * dim_i * dim_i + row_i * dim_i + col_i;
                    std::vector<double> pixels = getWindowPixels(in_activations[i], c, row_i, col_i);

                    double max = *std::max_element(pixels.begin(), pixels.end());

                    // write the gradients for each pixel
                    std::vector<double> window_gradients(4, 0);
                    for (size_t l = 0; l < pixels.size(); l++) {
                        if (pixels[l] == max) {
                            window_gradients[l] = gradients[i][offset_o];
                        }
                    }
                    sngl_sens[offset_i] = window_gradients[0];
                    sngl_sens[offset_i + 1] = window_gradients[1];
                    sngl_sens[offset_i + dim_i] = window_gradients[2];
                    sngl_sens[offset_i + dim_i + 1] = window_gradients[3];
                }
            }
        }
        sensitivity.push_back(sngl_sens);
    }
    return sensitivity;
}