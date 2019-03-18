#include <stdint.h>
#include <vector>

#include "neuron.h"

class FullyConnected {

    uint32_t input_size;
    uint32_t output_size;

    std::vector<Neuron> neurons;

public:
    FullyConnected (uint32_t in, uint32_t out);
    FullyConnected (const FullyConnected& x) {
        input_size = x.input_size;
        output_size = x.output_size;
    }

    ~FullyConnected() {}
};