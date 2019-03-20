#include "fullyconnected.h"

#include <iostream>

void FullyConnected::forward(std::vector<double> input) {
    for (size_t i = 0; i < output_size; i++) {
        neurons[i].computeActivation(input);
        output[i] = neurons[i].computeOutput();
    }
}
    
void FullyConnected::backward(std::vector<double> gradients) {

}

void FullyConnected::updateWeights() {

}

FullyConnected::FullyConnected(uint32_t in, uint32_t out) : input_size(in), output_size(out) {
    neurons.reserve(out);
    output.resize(out);
    for (size_t i = 0; i < out; i++) {
        Neuron n(in);
        n.initWeights();
        neurons.push_back(n);
    }
}