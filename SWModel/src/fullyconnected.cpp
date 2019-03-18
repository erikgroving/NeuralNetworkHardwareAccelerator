#include "fullyconnected.h"

#include <iostream>


FullyConnected::FullyConnected(uint32_t in, uint32_t out) : input_size(in), output_size(out) {
    neurons.reserve(out);

    for (size_t i = 0; i < out; i++) {
        Neuron n(in);
        n.initWeights();
        neurons.push_back(n);
    }
}