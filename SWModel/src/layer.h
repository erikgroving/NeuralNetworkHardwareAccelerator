#ifndef __LAYER_H
#define __LAYER_H

#include "neuron.h"
#include <vector>

#define FULLY   0
#define CONV    1
#define POOL    2

class Layer {
public:
    virtual void forward(std::vector<double>) = 0;
    virtual void forward(std::vector<double>, bool) = 0;
    virtual std::vector< std::vector<double> > backward(std::vector< std::vector<double> >,
                                                        std::vector< std::vector<double> >,
                                                        std::vector< std::vector<double> >) = 0;
    virtual void updateWeights(double lr, double momentum) = 0;
    virtual const std::vector<double>& getOutput() = 0;
    virtual const std::vector<Neuron>& getNeurons() = 0;
    virtual int getType() = 0;
    virtual ~Layer() {};
};

#endif