#include <stdint.h>
#include <vector>

class Neuron {
    std::vector<double> weights;
    uint32_t            size;
    double              output;

public:

    Neuron(uint32_t size);
    Neuron(const Neuron& n);
    ~Neuron();

    void initWeights();
    double computeOutput(std::vector<double> input) {output = 2;}


    double getOutput() { return output; }

    void setWeights(std::vector<double> weights) { this->weights = weights; }
    const std::vector<double>& getWeights() { return weights; }
};