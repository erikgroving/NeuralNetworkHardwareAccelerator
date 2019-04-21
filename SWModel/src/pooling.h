#ifndef __POOLING_H
#define __POOLING_H

#include <stdint.h>
#include <vector>
#include "layer.h"
#include "neuron.h"

class PoolingLayer : public Layer {
    uint32_t dim_i;
    uint32_t dim_o;
    uint32_t channels;
    std::vector<Neuron> placeholder;
    std::vector<double> output;

public:
    PoolingLayer(uint32_t d_i, uint32_t d_o, uint32_t c) : 
                    dim_i(d_i), dim_o(d_o), channels(c), 
                    output(std::vector<double>(d_o * d_o * c, 0)) {}
    PoolingLayer(const PoolingLayer& p) {
        dim_i = p.dim_i;
        dim_o = p.dim_o;
        channels = p.channels;
        output = p.output;
    }
    ~PoolingLayer() {};
    
    
    void forward(std::vector<double>);
    void forward(std::vector<double>, bool);
    std::vector< std::vector<double> > backward(std::vector< std::vector<double> >,
                                                std::vector< std::vector<double> >,
                                                std::vector< std::vector<double> >);
    
    std::vector<double> getWindowPixels (const std::vector<double>& input, uint32_t ch, uint32_t row, uint32_t col);

    void updateWeights(double lr, double momentum) {};
    const std::vector<double>& getOutput() { return output; }
    const std::vector<Neuron>& getNeurons() { return placeholder; }
    int getType() { return POOL; };
};


#endif