#include "neuron.h"

Neuron::Neuron(uint32_t size) {
    this->size = size;
}

Neuron::Neuron(const Neuron& n) {
    weights = n.weights;
    size = n.size;
    output = n.output;
}

Neuron::~Neuron() {

}

void Neuron::initWeights() {

}