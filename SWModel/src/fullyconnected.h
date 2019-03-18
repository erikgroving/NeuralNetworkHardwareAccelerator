#include <stdint.h>
#include <vector>

class FullyConnected {

    uint32_t input_size;
    uint32_t output_size;
    std::vector<double> weights;
    std::vector<double> 


public:
    FullyConnected (uint32_t in, uint32_t out) : input_size(in), output_size(out) {}
    FullyConnected (const FullyConnected& x) {
        input_size = x.input_size;
        output_size = x.output_size;
    }
    ~FullyConnected() {}
};