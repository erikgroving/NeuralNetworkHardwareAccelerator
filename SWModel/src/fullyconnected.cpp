#include "fullyconnected.h"

#include <iostream>

void FullyConnected::forward(std::vector<double> input) {
    for (size_t i = 0; i < output_size; i++) {
        neurons[i].computeNet(input);
        output[i] = neurons[i].computeActivation();
    }
}

void FullyConnected::forward(std::vector<double> input, bool last_layer) {
    if (last_layer) {
        for (size_t i = 0; i < output_size; i++) {
            output[i] = neurons[i].computeNet(input);
        }
    } 
    else {
        forward(input);
    }
}
    
std::vector< std::vector<double> > FullyConnected::backward(
                    std::vector< std::vector<double> > gradients, 
                    std::vector< std::vector<double> > in_activations,
                    std::vector< std::vector<double> > out_activations) {
    std::vector< std::vector<double> > sensitivity;
    for (size_t i = 0; i < gradients.size(); i++) {
        std::vector<double> sngl_sens;
        for (size_t j = 0; j < neurons.size(); j++) {
            neurons[j].calculateGradient(gradients[i][j], in_activations[i], out_activations[i][j], last_layer);
            sngl_sens.push_back(neurons[j].getSensitivity());
        }
        sensitivity.push_back(sngl_sens);
    }
    return sensitivity;
}

void FullyConnected::updateWeights(double lr, double momentum) {
    for (Neuron& n : neurons) {
        n.updateWeights(lr, momentum);
    }
}

void FullyConnected::clearData() {
    for (Neuron& n : neurons) {
        n.clearBackwardData();
    }
}

FullyConnected::FullyConnected(uint32_t in, uint32_t out) : input_size(in), output_size(out) {
    last_layer = false;
    neurons.reserve(out);
    output.resize(out);
    for (size_t i = 0; i < out; i++) {
        Neuron n(in);
        n.initWeights();
        neurons.push_back(n);
    }
}