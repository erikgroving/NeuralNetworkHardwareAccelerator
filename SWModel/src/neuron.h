#ifndef __NEURON_H
#define __NEURON_H

#include <stdint.h>
#include <vector>

class Neuron {
    std::vector<double> weights;
    std::vector<double> gradient_per_weight;
    std::vector<double> momentum_per_weight;
    double              offset_gradient;
    double              offset_momentum;
    double              offset;
    double              de_dnet;
    uint32_t            fan_in;
    double              net;
    double              activation;

public:

    Neuron(uint32_t in);
    Neuron(const Neuron& n);
    ~Neuron();

    void initWeights(); // He initialization
    double computeNet(std::vector<double> input);   
    double computeActivation();
    void calculateGradient(double grad, std::vector<double> act_in, double act_out);
    void updateWeights(double lr, double momentum);
    void clearBackwardData();

    const double& getActivation() { return activation; }
    const double& getSensitivity() { return de_dnet; }
    void setOffset(double offset) { this->offset = offset; }
    const double& getOffset() { return offset; }
    void setWeights(std::vector<double> weights) { this->weights = weights; }
    const std::vector<double>& getWeights() { return weights; }
};

#endif