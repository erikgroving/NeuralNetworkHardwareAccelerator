#include <stdint.h>
#include <vector>

#include "neuron.h"

class FullyConnected {

    uint32_t input_size;
    uint32_t output_size;

    std::vector<Neuron> neurons;
    std::vector<double> outputs;

    

public:
    FullyConnected (uint32_t in, uint32_t out) : input_size(in), output_size(out) {}
    FullyConnected (const FullyConnected& x) {
        input_size = x.input_size;
        output_size = x.output_size;
    }

    void init();

    ~FullyConnected() {}
};