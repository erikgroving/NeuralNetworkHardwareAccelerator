#ifndef __NET_H
#define __NET_H

#include <vector>
#include <stdint.h>
#include "layer.h"

class Net {
    std::vector<Layer*> layers;
    std::vector< std::vector<double> > batch_output;
    std::vector< std::vector<double> > cost_ps;
    std::vector< std::vector<double> > ol_gradient;
    std::vector<double> loss_per_output;
    uint32_t batch_size;
    uint32_t input_size;
    uint32_t output_size;
    uint32_t learning_rate;

public:

    std::vector< std::vector<double> > operator() (std::vector < std::vector<double> > input);
    void addLayer(Layer*);
    std::vector< std::vector<double> > inference(std::vector< std::vector<double> > input);
    double computeLoss(std::vector<int> labeled);
    void backpropLossAndUpdate();
    void resetLoss();

    std::vector<double> convLogitToProb(std::vector<double> logits);
    std::vector<double> getPredictions();

    Net(uint32_t in, uint32_t out, uint32_t bs, uint32_t lr);
    Net(const Net& net);
    ~Net();
};

#endif