#include "neuron.h"

#include <random>
#include <chrono>
#include <math.h>
#include <iostream>

Neuron::Neuron(uint32_t in) {
    this->fan_in = in;
}

Neuron::Neuron(const Neuron& n) {
    weights = n.weights;
    offset = n.offset;
    fan_in = n.fan_in;
    activation = n.activation;
    output = n.output;
}

Neuron::~Neuron() {

}

/**
 * Uses He initialization
 */ 
void Neuron::initWeights() {
    weights.reserve(fan_in);
    std::normal_distribution<double> distribution(0, sqrt(2. / fan_in));
    
    static unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
    static std::default_random_engine generator(seed);

    for (size_t i = 0; i < fan_in; i++) {
        weights.push_back(distribution(generator));
    }
    offset = distribution(generator);
}

/**
 * Compute activation for the neuron
 */
double Neuron::computeActivation(std::vector<double> input) {
    if (input.size() != weights.size()) {
        std::cerr << "Input size did not match size of weights. Input size: " << 
                        input.size() << " Weight size: " << weights.size() << std::endl;
        exit(1);
    }

    // Dot product and sum offset    
    activation = offset;
    for (size_t i = 0; i < fan_in; i++) {
        activation += input[i] * weights[i];
    }

    return activation;
}

/**
 * Compute output for neuron
 */
double Neuron::computeOutput() {
    output = (activation > 0) ? activation : 0;
    return output;
}