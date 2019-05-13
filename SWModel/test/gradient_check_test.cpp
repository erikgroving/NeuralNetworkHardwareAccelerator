#include <gtest/gtest.h>

#include <iostream>
#include <random>
#include <chrono>

#include "../src/convolutional.h"
#include "../src/fullyconnected.h"
#include "../src/pooling.h"
#include "../src/parse_data.h"
#include "../src/layer.h" 
#include "../src/net.h"

TEST(GradientTest, GradientCheck) {
    
    int input_size = 100;
    int output_size = 10;
    int batch_size = 1;
    double momentum = 0.9;
    double lr = 0.001; 
    Net net(input_size, output_size, batch_size, lr, momentum);
    

    Layer* fc1 = new FullyConnected(input_size, 98);
    Layer* fc2 = new FullyConnected(98, 64);
    Layer* fc3 = new FullyConnected(64, output_size);

    net.addLayer(fc1);
    net.addLayer(fc2);
    net.addLayer(fc3);

    // Generate random input and output labels 
    std::vector< std::vector<double> > in; 
    std::vector<int> out; 

    std::uniform_real_distribution<double> distribution(-1.0, 1.0);  
    std::uniform_int_distribution<int> distribution_out(0, output_size - 1);  
    static unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
    static std::default_random_engine generator(seed);
    int test_size = 10;
    for (int i = 0; i < test_size; i++) {
        std::vector<double> smpl;
        for (int j = 0; j < input_size; j++) {
            smpl.push_back(distribution(generator));
        }
        in.push_back(smpl);
        out.push_back(distribution_out(generator));
    }

    net(in);
    double loss = net.computeLossAndGradients(out);
    net.backpropLoss();
    int grad_tests = 100;
    int num_layers = 3;
    srand(time(0));
    for (int i = 0; i < grad_tests; i++) {
        int l_idx = (rand() % num_layers);
        FullyConnected* fc = (FullyConnected* )net.getLayers()[l_idx];
        auto neurons = fc->getNeurons();
        int n_idx = (rand() % neurons.size());
        auto neuron = neurons[n_idx];
        int w_idx = (rand() % neuron.getWeights().size());
        double grad = neuron.getGradients()[w_idx];
        std::cout << "Loss: " << loss << std::endl;
        std::cout << "Gradient: " << grad << std::endl;
    }
}