#ifndef __CONVOLUTIONAL_H
#define __CONVOLUTIONAL_H

#include <vector>
#include <stdint.h>
#include "layer.h"
#include "neuron.h"

class ConvLayer : public Layer {

    uint32_t dim;
    uint32_t filt_size;
    uint32_t stride;
    uint32_t padding;
    uint32_t in_channels;
    uint32_t out_channels;

    std::vector<Neuron> neurons;
    std::vector<double> output;

public:
    ConvLayer (uint32_t dim, uint32_t filt_size, uint32_t stride, uint32_t padding, uint32_t in_channels, uint32_t out_channels);
    ConvLayer(const ConvLayer& A);
    ~ConvLayer ();

    void forward(std::vector<double>);
    std::vector< std::vector<double> > backward (std::vector< std::vector<double> >,
                                                 std::vector< std::vector<double> >,
                                                 std::vector< std::vector<double> >) ;
    void updateWeights(double lr, double momentum);
    const std::vector<double>& getOutput() { return output; };
    std::vector<double> getWindowPixels(const std::vector<double>& input, int row, int col);


};

#endif