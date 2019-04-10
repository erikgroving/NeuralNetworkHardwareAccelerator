#include <iostream>
#include <random>
#include <chrono>

#include "convolutional.h"
#include "fullyconnected.h"
#include "layer.h" 
#include "net.h"

void printAccuracy(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out);

int main () {

    std::cout << "Running software model...\n";

    int input_size = 16*16;
    int output_size = 2;
    int batch_size = 10;
    double momentum = 0.9;
    double lr = 0.001;

   /* Layer* conv1 = new ConvLayer(32, 3, 1, 0, 1, 1);
    Layer* conv2 = new ConvLayer(32, 3, 1, 1, 1, 1);
    Layer* conv3 = new ConvLayer(32, 3, 2, 1, 1, 1);
    Layer* conv4 = new ConvLayer(32, 3, 2, 0, 1, 1);

    //conv1->forward(std::vector<double>());
    std::vector<double> in_test(32*32*1, 1);
    conv2->forward(in_test);
    auto out = conv2->getOutput();
    conv2->forward(out);*/

    Net net(input_size, output_size, batch_size, lr, momentum);

    Layer* conv1 = new ConvLayer(16, 3, 1, 1, 1, 1);
    Layer* conv2 = new ConvLayer(16, 3, 1, 1, 1, 2);
    Layer* fc1_ = new FullyConnected(16*16*2, output_size);
    Layer* fc2_ = new FullyConnected(32, output_size);

    net.addLayer(conv1);
    net.addLayer(conv2);
    net.addLayer(fc1_);
    //net.addLayer(fc2_);

/*
    Layer* fc = new FullyConnected(input_size, 128);
    Layer* fc2 = new FullyConnected(128, 64);
    Layer* fc3 = new FullyConnected(64, output_size);


    net.addLayer(fc);
    net.addLayer(fc2);
    net.addLayer(fc3);*/
    
    
    std::vector< std::vector<double> > in; 
    std::vector<int> out; 

    std::uniform_real_distribution<double> distribution(-1.0, 1.0);  
    std::uniform_int_distribution<int> distribution_out(0, output_size - 1);  
    static unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
    static std::default_random_engine generator(seed);
    int test_size = 100;
    for (int i = 0; i < test_size; i++) {
        std::vector<double> smpl;
        for (int j = 0; j < input_size; j++) {
            smpl.push_back(distribution(generator));
        }
        in.push_back(smpl);
        out.push_back(distribution_out(generator));
    }


    int epochs = 10000;
    for (int j = 0; j <= epochs; j++) {
        if ((j) % 10 == 0) {
            auto result = net(in);
            double loss = net.computeLossAndGradients(out);
            std::cout << "Epoch: " << j<< std::endl;
            printAccuracy(net, in, out);
            std::cout << "Loss: " << loss / out.size() << std::endl << std::endl;
        }
        auto result = net(in);
        net.computeLossAndGradients(out);

        net.backpropLossAndUpdate();
        net.clearSavedData();
        
    }

    printAccuracy(net, in, out);
}


void printAccuracy(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out) {
    auto result = net(in);
    int corr = 0;
    for (size_t i = 0; i < result.size(); i++) {
        int max_idx = 0;
        double max = result[i][0];
        for (size_t j = 1; j < result[i].size(); j++) {
            if (result[i][j] > max) {
                max_idx = j;
                max = result[i][j];
            }
        }
        if (max_idx == out[i]) {
            corr++;
        }
    }
    net.clearSavedData();
    std::cout << "Total correct: " << corr << " / " << result.size() << std::endl;
    std::cout << "Accuracy: " << (double)corr / result.size() << std::endl;

}