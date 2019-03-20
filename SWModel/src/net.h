#ifndef __NET_H
#define __NET_H

#include <vector>
#include <stdint.h>
#include "layer.h"

class Net {
    std::vector<Layer*> layers;
    std::vector< std::vector<double> > batch_output;
    std::vector<double> loss_per_output;
    uint32_t batch_size;
    uint32_t input_size;
    uint32_t output_size;

public:
    void addLayer(Layer*);

    std::vector<double> inference(std::vector<double> input);
    double computeLoss(std::vector<double> labeled);
    void backpropLossAndUpdate();
    void resetLoss();

    std::vector<double> convLogitToProb(std::vector<double> logits);
    std::vector<double> getPredictions();

    Net(uint32_t in, uint32_t out, uint32_t bs);
    Net(const Net& net);
    ~Net();
};

#endif