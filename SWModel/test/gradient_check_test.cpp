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

TEST(GradientTest, FCGradientCheck) {
    
    int input_size = 100;
    int output_size = 2;
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

    int grad_tests = 100;
    int num_layers = 3;
    srand(time(0));
    for (int i = 0; i < grad_tests; i++) {
        double sigma = pow(10, -4);
        auto out_ = net(in);
        net.computeLossAndGradients(out);

        /*for (size_t j = 0; j < out_[0].size(); j++) {
            std::cout << out[0] << "\t\t" << out_[0][j] << "\t\t" << net.getOlGradient()[0][j] << "\n";
        }*/

        net.backpropLoss();

        int l_idx = (rand() % num_layers);
        FullyConnected* fc = (FullyConnected* )net.getLayers()[l_idx];
        std::vector<Neuron>& neurons = fc->getNeurons();
        int n_idx = (rand() % neurons.size());
        auto neuron = neurons[n_idx];
        auto weights = neuron.getWeights();
        int w_idx = (rand() % neuron.getWeights().size());
        double grad = neuron.getGradients()[w_idx];
        net.clearSavedData();
        

        // + sigma loss
        weights[w_idx] += sigma;
        neurons[n_idx].setWeights(weights);
        fc->setNeurons(neurons);
        net(in);
        double loss_plus = net.computeLossAndGradients(out);
        net.clearSavedData();

        // - sigma loss
        weights[w_idx] -= (sigma + sigma);
        neurons[n_idx].setWeights(weights);
        fc->setNeurons(neurons);
        net(in);
        double loss_minus = net.computeLossAndGradients(out);
        net.clearSavedData(); 
        
        weights[w_idx] += sigma;
        neurons[n_idx].setWeights(weights);
        fc->setNeurons(neurons);

        double num_grad = (loss_plus - loss_minus) / (2 * sigma);
        /*std::cout << "Original Loss: " << orig_loss;
        std::cout << "\tCalculated Gradient: " << grad;
        std::cout << "\tNumerical Gradient: " << num_grad << std::endl;*/


        double rel = std::max(num_grad > 0 ? num_grad : -num_grad, grad > 0 ? grad : -grad);
        rel = rel == 0. ? 1 : rel;
        double diff = (num_grad - grad) / rel;
        diff = (diff > 0) ? diff : -diff;
        ASSERT_LE(diff, 1e-7);
    }
}

TEST(GradientTest, ConvGradientCheck) {
    
    int input_size = 8*8;
    int output_size = 2;
    int batch_size = 1;
    double momentum = 0.9;
    double lr = 0.001; 
    Net net(input_size, output_size, batch_size, lr, momentum);
    
    Layer* conv1 = new ConvLayer(8, 3, 1, 1, 1, 3);
    Layer* pool1 = new PoolingLayer(8, 4, 3);
    Layer* conv2 = new ConvLayer(4, 3, 1, 1, 3, 6);
    Layer* fc1 = new FullyConnected(4*4*6, output_size);

    net.addLayer(conv1);
    net.addLayer(pool1);
    net.addLayer(conv2);
    net.addLayer(fc1);

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

    int grad_tests = 100;
    int num_layers = 3;
    srand(time(0));
    for (int i = 0; i < grad_tests; i++) {
        double sigma = pow(10, -4);
        auto out_ = net(in);
        net.computeLossAndGradients(out);
        net.backpropLoss();
        int l_idx = (rand() % num_layers);
        while (l_idx == 1) {    // don't select the pooling layer
            l_idx = (rand() % num_layers);
        }
        Layer* l = (FullyConnected* )net.getLayers()[l_idx];
        std::vector<Neuron>& neurons = l->getNeurons();
        int n_idx = (rand() % neurons.size());
        auto neuron = neurons[n_idx];
        auto weights = neuron.getWeights();
        int w_idx = (rand() % neuron.getWeights().size());
        double grad = neuron.getGradients()[w_idx];
        net.clearSavedData();
        
        //std::cout << "Testing weight " << w_idx << " of neuron " << n_idx <<  " in layer " << l_idx << std::endl;

        // + sigma loss
        weights[w_idx] += sigma;
        neurons[n_idx].setWeights(weights);
        l->setNeurons(neurons);
        net(in);
        double loss_plus = net.computeLossAndGradients(out);
        net.clearSavedData();

        // - sigma loss
        weights[w_idx] -= (sigma + sigma);
        neurons[n_idx].setWeights(weights);
        l->setNeurons(neurons);
        net(in);
        double loss_minus = net.computeLossAndGradients(out);
        net.clearSavedData(); 
        
        weights[w_idx] += sigma;
        neurons[n_idx].setWeights(weights);
        l->setNeurons(neurons);

        double num_grad = (loss_plus - loss_minus) / (2 * sigma);
        /*std::cout << "Original Loss: " << orig_loss;
        std::cout << "Calculated Gradient: " << grad;
        std::cout << "\tNumerical Gradient: " << num_grad << std::endl;*/

        double rel = std::max(num_grad > 0 ? num_grad : -num_grad, grad > 0 ? grad : -grad);
        rel = rel == 0. ? 1 : rel;
        double diff = (num_grad - grad) / rel;
        diff = (diff > 0) ? diff : -diff;
        ASSERT_LE(diff, 1e-7);
    }
}