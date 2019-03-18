#include <gtest/gtest.h>

#include "../src/fullyconnected.h"

TEST(FCTest, TestForward) {
    FullyConnected fc(3, 4); 

    std::vector<Neuron> neurons;
    for (double i = 0; i < 4; i++) {
        Neuron n(3);
        std::vector<double> weights = {i, i, i};
        n.setWeights(weights);
        n.setOffset(i + 1.5);
        neurons.push_back(n);
    }
    std::vector<double> input = {1, 2, 3};
    fc.setNeurons(neurons);
    fc.forward(input);

    std::vector<double> outputs = fc.getOutput();

    ASSERT_EQ(outputs[0], 0 + 1.5);
    ASSERT_EQ(outputs[1], 1 + 2 + 3 + 1 + 1.5);
    ASSERT_EQ(outputs[2], 2 * 1 + 2 * 2 + 2 * 3 + 2 + 1.5);
    ASSERT_EQ(outputs[3], 3 * 1 + 3 * 2 + 3 * 3 + 3 + 1.5);
}