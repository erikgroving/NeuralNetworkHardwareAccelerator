#include <gtest/gtest.h>

#include "../src/convolutional.h"

TEST(ConvTest, TestForward) {
    ConvLayer conv1(2, 3, 1, 1, 2, 2);

    std::vector<double> input = {   2, 3, 
                                    1, 4, 

                                    3, 1, 
                                    5, 0 };

    std::vector<Neuron> neurons;

    for (double i = 0; i < 8; i++) {
        Neuron n(18);
        std::vector<double> weights = { 5, 1, 2, 
                                        3, 3, 2, 
                                        4, 1, 1, 

                                        2, 3, 5, 
                                        0, 1, 2, 
                                        4, 2, 1};
        n.setWeights(weights);
        n.setOffset(4);
        neurons.push_back(n);
    }
    conv1.setNeurons(neurons);
    conv1.forward(input);

    std::vector<double> outputs = conv1.getOutput();

    ASSERT_EQ(outputs[0], 36.);
    ASSERT_EQ(outputs[1], 48);
    ASSERT_EQ(outputs[2], 42);
    ASSERT_EQ(outputs[3], 41);
    ASSERT_EQ(outputs[4], 36.);
    ASSERT_EQ(outputs[5], 48);
    ASSERT_EQ(outputs[6], 42);
    ASSERT_EQ(outputs[7], 41);
}