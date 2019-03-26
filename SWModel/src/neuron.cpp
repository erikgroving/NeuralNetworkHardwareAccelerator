#include "neuron.h"

#include <random>
#include <chrono>
#include <math.h>
#include <iostream>

Neuron::Neuron(uint32_t in) {
    fan_in = in;
    gradient_per_weight = std::vector<double> (fan_in, 0);
    offset_gradient = 0;
}

Neuron::Neuron(const Neuron& n) {
    weights = n.weights;
    gradient_per_weight = n.gradient_per_weight;
    offset_gradient = n.offset_gradient;
    offset = n.offset;
    fan_in = n.fan_in;
    net = n.net;
    activation = n.activation;
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
 * Compute net for the neuron
 */
double Neuron::computeNet(std::vector<double> input) {
    if (input.size() != weights.size()) {
        std::cerr << "Input size did not match size of weights. Input size: " << 
                        input.size() << " Weight size: " << weights.size() << std::endl;
        exit(1);
    }

    // Dot product and sum offset    
    net = offset;
    for (size_t i = 0; i < fan_in; i++) {
        net += input[i] * weights[i];
    }

    return net;
}

/**
 * Compute output for neuron
 */
double Neuron::computeActivation() {
    activation = std::max(net, 0.);    // ReLU
    return activation;
}

void Neuron::calculateGradient(double grad, std::vector<double> act_in, double act_out) {
    double dact_dnet = (act_out > 0) ? 1 : 0;
    de_dnet = grad * dact_dnet;
    //std::cout << act_out << " " << dact_dnet << " " << de_dnet << " " << grad << std::endl;
    for (size_t i = 0; i < fan_in; i++) {
        gradient_per_weight[i] += (de_dnet * act_in[i]);
    }
    offset_gradient += de_dnet;
}

void Neuron::updateWeights(double lr) {
    // update weights
    for (size_t i = 0; i < fan_in; i++) {
        weights[i] += (lr * gradient_per_weight[i]);
    }
    offset += (lr * offset_gradient);
    clearBackwardData();
}

void Neuron::clearBackwardData() {
    gradient_per_weight = std::vector<double>(fan_in, 0);
    offset_gradient = 0;
}