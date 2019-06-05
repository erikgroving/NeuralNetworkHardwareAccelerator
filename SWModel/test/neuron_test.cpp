#include <gtest/gtest.h>

#include "../src/neuron.h"

TEST(NeuronTest, InitWeights) {
    int fan_in = 11;
    Neuron n(fan_in);
    n.initWeights();
    ASSERT_EQ(n.getWeights().size(), fan_in);
}

TEST(NeuronTest, SetWeightsAndGetOutput) {
    int fan_in = 5;
    Neuron n(fan_in);

    std::vector<double> weights;
    std::vector<double> input;
    double offset = 13;
    for (int i = 0; i < fan_in; i++) {
        weights.push_back(i + 1);
        input.push_back(2 * i + 1);
    }

    n.setOffset(offset);
    n.setWeights(weights);

    double result = 1 * 1 + 2 * 3 + 3 * 5 + 4 * 7 + 5 * 9 + 13;

    n.computeNet(input);
    
    ASSERT_EQ(n.computeActivation(), result);
}