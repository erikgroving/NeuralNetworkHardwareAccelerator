#include "convolutional.h"

void ConvLayer::forward(std::vector<double> input) {

}

std::vector< std::vector<double> > ConvLayer::backward (std::vector< std::vector<double> >,
                                                std::vector< std::vector<double> >,
                                                std::vector< std::vector<double> >) {

}


void ConvLayer::updateWeights(double lr, double momentum) {

}



ConvLayer::ConvLayer(uint32_t d, uint32_t fsize, uint32_t in_ch, uint32_t out_ch) {
    dim = d;
    in_channels = in_ch;
    out_channels = out_ch;
    filt_size = fsize;


}

ConvLayer::ConvLayer(const ConvLayer& a) {
    dim = a.dim;
    in_channels = a.in_channels;
    out_channels = a.out_channels;
    filt_size = a.filt_size;
    neurons = a.neurons;
    output = a.output;
}

ConvLayer::~ConvLayer() {

}