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
    uint32_t dim_o;

    std::vector<Neuron> neurons;
    std::vector<double> output;

public:
    ConvLayer (uint32_t dim, uint32_t filt_size, uint32_t stride, uint32_t padding, uint32_t in_channels, uint32_t out_channels);
    ConvLayer(const ConvLayer& A);
    ~ConvLayer ();

    void forward(std::vector<double>);
    void forward(std::vector<double>, bool in);
    std::vector< std::vector<double> > backward (std::vector< std::vector<double> >,
                                                 std::vector< std::vector<double> >,
                                                 std::vector< std::vector<double> >) ;
    void updateWeights(double lr, double momentum);
    const std::vector<Neuron>& getNeurons() { return neurons; };
    const std::vector<double>& getOutput() { return output; };
    const uint32_t getDim() const { return dim; }
    const uint32_t getInChannels() const { return in_channels; }
    const uint32_t getOutChannels() const { return out_channels; }
    const uint32_t getFiltSize() const { return filt_size; }
    std::vector<double> getWindowPixels(const std::vector<double>& input, int row, int col);
    int getType() { return CONV; }


};

#endif