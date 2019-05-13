#ifndef __FULLYCONNECTED_H
#define __FULLYCONNECTED_H

#include <stdint.h>
#include <vector>

#include "neuron.h"
#include "layer.h"

class FullyConnected : public Layer {

    uint32_t input_size;
    uint32_t output_size;
    std::vector<Neuron> neurons;
    std::vector<double> output;

public:
    FullyConnected(uint32_t in, uint32_t out);
    FullyConnected(const FullyConnected& x) {
        input_size = x.input_size;
        output_size = x.output_size;
        neurons = x.neurons;
    }
    ~FullyConnected() {}

    void forward(std::vector<double> input);
    void forward(std::vector<double> input, bool last_layer);

    std::vector< std::vector<double> > backward(
        std::vector< std::vector<double> > gradients_ps, 
        std::vector< std::vector<double> > in_activations,
        std::vector< std::vector<double> > out_activations);

    void updateWeights(double lr, double momentum);
    void clearData();

    void setNeurons (const std::vector<Neuron>& n) {neurons = n;}

    const std::vector<double>& getOutput() { return output; }
    std::vector<Neuron>& getNeurons() { return neurons; }
    int getType() { return FULLY; }
};

#endif