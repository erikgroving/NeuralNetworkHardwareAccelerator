#include "../src/neuron.h"
#include <gtest/gtest.h>

TEST(NeuronTest, NeuronOutput) {
    Neuron a(3);
    a.computeOutput(std::vector<double>());
    ASSERT_EQ(a.getOutput(), 2);
}