#ifndef __LAYER_H
#define __LAYER_H

#include <vector>

class Layer {
public:
    virtual void forward(std::vector<double>) = 0;
    virtual void backward(std::vector<double>) = 0;
    virtual const std::vector<double>& getOutput() = 0;
    virtual ~Layer() {};
};

#endif