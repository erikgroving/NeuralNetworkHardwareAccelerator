#include "convolutional.h"

#include <iostream>

void ConvLayer::forward(std::vector<double> input) {
    uint32_t h_steps = 1 + ((dim + (padding * 2) - filt_size) / stride);

    if (input.size() != h_steps * h_steps * in_channels) {
        std::cout << "Wrong input size for convolutional layer\n";
        exit(1);
    }
    
    unsigned start = (filt_size / 2) - padding;

    for (unsigned int i = 0; i < out_channels; i++) { // channel of output
        for (unsigned int k = 0; k < dim_o; k++) { // row
            for (unsigned int l = 0; l < dim_o; l++) { // column
                int x = l * stride + start;
                int y = k * stride + start;
                std::vector<double> pixels = getWindowPixels(input, y, x);
                int out_idx = i * dim_o * dim_o + k * dim_o + l;
                neurons[out_idx].computeNet(pixels);
                output[out_idx] = neurons[out_idx].computeActivation();
            }
        }
    }

}
    
void ConvLayer::forward(std::vector<double> input, bool in) {
    forward(input);
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

    std::vector< std::vector<double> > sensitivity;
    int dim_sq = dim_o * dim_o;
    
    unsigned start = (filt_size / 2) - padding;
    for (size_t i = 0; i < gradients.size(); i++) {
        std::vector<double> single_sens;
        for (size_t j = 0; j < out_channels; j++) {
            for (size_t k = 0; k < dim_o; k++) {
                for (size_t l = 0; l < dim_o; l++) {
                    // Neuron at row k, column l, in output channel j
                    int idx = l + k * dim_o + j * dim_sq;
                    int x = l * stride + start;
                    int y = k * stride + start;

                    std::vector<double> in_act = getWindowPixels(in_activations[i], y, x);
                    neurons[idx].calculateGradient(gradients[i][idx], in_act, out_activations[i][idx]);
                    single_sens.push_back(neurons[idx].getSensitivity());
                }
            }            
        }
        sensitivity.push_back(single_sens);
    }
    return sensitivity;
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
    uint32_t num_neurons = steps * steps * out_channels;

    dim_o = steps;


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