#include "convolutional.h"

#include <iostream>

void ConvLayer::forward(std::vector<double> input) {
    unsigned d_step = neurons.size() / out_channels;   // amount of neurons per output channel
    uint32_t h_steps = 1 + ((dim + (padding * 2) - filt_size) / stride);

    if (input.size() != h_steps * h_steps * in_channels) {
        std::cout << "Wrong input size for convolutional layer\n";
        exit(1);
    }
    
    
    unsigned start = (filt_size / 2) - padding;
    unsigned end = (dim + padding) - (filt_size / 2);
    


    std::cout << "Neurons: " << neurons.size() << std::endl;
    std::cout << "Start: " << start << std::endl;
    for (unsigned int i = 0; i < out_channels; i++) { // channel of output
        for (unsigned int j = 0; j < in_channels; j++) { // channel of input
            for (unsigned int k = start; k < end; k += stride) { // row
                for (unsigned int l = start; l < end; l += stride) { // column
                    std::vector<double> pixels = getWindowPixels(input, k, l);
                    int out_idx = i * d_step + ((k - start) / stride) * h_steps + ((l - start) / stride);
                    neurons[out_idx].computeNet(pixels);
                    output[out_idx] = neurons[out_idx].computeActivation();
                    std::cout << output[out_idx] << std::endl;
                }
            }
        }
    }

}
    
std::vector<double> ConvLayer::getWindowPixels(const std::vector<double>& input, int row, int col) {
    std::vector<double> pixels;

    int start_row = row - (filt_size / 2);
    int end_row = row + (filt_size / 2);
    int start_col = col - (filt_size / 2);
    int end_col = col + (filt_size / 2);
    int dim_sq = dim * dim;

    for (unsigned int ch = 0; ch < in_channels; ch++) {
        for (int i = start_row; i <= end_row; i++) {
            for (int j = start_col; j <= end_col; j++) {
                int idx = ch * dim_sq + i * dim + j;
                if (i < 0 || i >= (int)dim || (j < 0 || j >= (int)dim)) {
                    // in padding region, just push 0
                    pixels.push_back(0);
                }
                else {
                    pixels.push_back(input[idx]);                    
                }
            }
        }
    }

    return pixels;
}

std::vector< std::vector<double> > ConvLayer::backward (std::vector< std::vector<double> > gradients,
                                                std::vector< std::vector<double> > in_activations,
                                                std::vector< std::vector<double> > out_activations) {
    
    for (size_t i = 0; i < gradients.size(); i++) {
        
        for (size_t j = 0; j < neurons.size(); j++) {


            
        }

    }

    return std::vector< std::vector<double> > ();
}


void ConvLayer::updateWeights(double lr, double momentum) {
    for (Neuron& n : neurons) {
        n.updateWeights(lr, momentum);
    }
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
        //n.setWeights(std::vector<double>(weights_per_fmap, 1));
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