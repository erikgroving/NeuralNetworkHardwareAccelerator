#include "convolutional.h"

#include <iostream>

void ConvLayer::forward(std::vector<double> input) {

    if (input.size() != (dim * dim * in_channels)) {
        std::cout << "Wrong input size for convolutional layer\n";
        exit(1);
    }
    
    int dim_sq = dim * dim;

    for (int i = 0; i < out_channels; i++) { // channel of output
        for (int j = 0; j < in_channels; j++) { // channel of input
            for (int k = 0; k < dim; k += stride) { // row
                for (int l = 0; l < dim; l += stride) { // column
                    std::vector<double> pixels = getWindowPixels(input, filt_size, k, l);
                    int out_idx = 1; // todo
                    neurons[out_idx].computeNet(pixels);
                    output[out_idx] = neurons[out_idx].computeActivation();
                }
            }
        }
    }

}
    
std::vector<double> getWindowPixels(const std::vector<double>& input, int ch, int row, int col) {

}

std::vector< std::vector<double> > ConvLayer::backward (std::vector< std::vector<double> >,
                                                std::vector< std::vector<double> >,
                                                std::vector< std::vector<double> >) {

}


void ConvLayer::updateWeights(double lr, double momentum) {

}



ConvLayer::ConvLayer(uint32_t d, uint32_t fsize, uint32_t str, uint32_t pad, uint32_t in_ch, uint32_t out_ch) {
    dim = d;
    in_channels = in_ch;
    out_channels = out_ch;
    filt_size = fsize;
    stride = str;
    padding = pad;

    uint32_t weights_per_fmap = filt_size * filt_size * in_channels;
    
    uint32_t steps = 1 + ((dim + (padding * 2) - filt_size) / stride);
//    std::cout << steps << std::endl;
    uint32_t num_neurons = steps * steps * out_channels;

//    std::cout << num_neurons << std::endl;    

    output.resize(num_neurons);
    neurons.reserve(num_neurons);

    for (uint32_t i = 0; i < num_neurons; i++) {
        Neuron n(weights_per_fmap);
        n.initWeights();
        neurons.push_back(n);
    }
}

ConvLayer::ConvLayer(const ConvLayer& a) {
    dim = a.dim;
    in_channels = a.in_channels;
    out_channels = a.out_channels;
    filt_size = a.filt_size;
    neurons = a.neurons;
    output = a.output;
}

ConvLayer::~ConvLayer() {

}