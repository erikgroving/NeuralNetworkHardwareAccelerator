#include <stdint.h>
#include <vector>

class Neuron {
    std::vector<double> weights;
    double              offset;
    uint32_t            fan_in;
    double              activation;
    double              output;

public:

    Neuron(uint32_t in);
    Neuron(const Neuron& n);
    ~Neuron();

    void initWeights(); // He initialization
    double computeActivation(std::vector<double> input);   
    double computeOutput();

    double getOutput() { return output; }

    void setOffset(double offset) { this->offset = offset; }
    const double& getOffset() { return offset; }
    void setWeights(std::vector<double> weights) { this->weights = weights; }
    const std::vector<double>& getWeights() { return weights; }
};