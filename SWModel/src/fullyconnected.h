#include <stdint.h>
#include <vector>

#include "neuron.h"

class FullyConnected {

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


    void setNeurons (const std::vector<Neuron>& n) {neurons = n;}

    const std::vector<double>& getOutput() { return output; }
};