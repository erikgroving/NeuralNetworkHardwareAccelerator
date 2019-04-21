#include <iostream>
#include <random>
#include <chrono>

#include "convolutional.h"
#include "fullyconnected.h"
#include "pooling.h"
#include "parse_data.h"
#include "layer.h" 
#include "net.h"

void printAccuracy(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out);
void trainNet(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out, int n_epochs);
int main () {

    std::cout << "Running software model...\n";

    int input_size = 28*28;
    int output_size = 10;
    int batch_size = 100;
    double momentum = 0.9;
    double lr = 0.001; 
    int n_epochs = 1000;

    std::vector< std::vector<double> > trainX;
    std::vector<int> trainY;
    trainX = readImages("data/train-images.idx3-ubyte");
    trainY = readLabels("data/train-labels.idx1-ubyte");
    Net net(input_size, output_size, batch_size, lr, momentum);

    /* use a smaller dataset for testing, 1000 samples */
    trainX = std::vector< std::vector<double> > (trainX.begin(), trainX.begin() + 500);
    trainY = std::vector<int> (trainY.begin(), trainY.begin() + 500);

    Layer* conv1 = new ConvLayer(28, 3, 1, 1, 1, 3);
    Layer* pool1 = new PoolingLayer(8, 4, 5);
    Layer* conv2 = new ConvLayer(14, 3, 1, 1, 3, 6);
    Layer* pool2 = new PoolingLayer(28, 14, 1);
    Layer* fc1 = new FullyConnected(14*14, 320);
    Layer* fc2 = new FullyConnected(80, 10);

    //net.addLayer(conv1);
    net.addLayer(pool2);
    net.addLayer(fc1);
    net.addLayer(pool1);
    /*net.addLayer(conv2);*/
    //net.addLayer(pool2);
    net.addLayer(fc2);
    
    trainNet(net, trainX, trainY, n_epochs);

    printAccuracy(net, trainX, trainY);   
}

void trainNet(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out, int n_epochs) {
    std::cout << "Starting Accuracy" << std::endl;
    printAccuracy(net, in, out);
    std::cout <<std::endl;
    for (int i = 0; i <= n_epochs; i++) {
        double loss = 0.0;
        int batch_size = net.getBatchSize();
        int lb = 0;
        int ub = batch_size;
        int size = in.size();
        while (ub <= size) {
            
            /* Get the batch */
            std::vector< std::vector<double> >::iterator startX = in.begin() + lb;
            std::vector< std::vector<double> >::iterator endX = in.begin() + ub;
            std::vector<int>::iterator startY = out.begin() + lb;
            std::vector<int>::iterator endY = out.begin() + ub;

            std::vector< std::vector<double> > in_batch(startX, endX);
            std::vector<int> out_batch(startY, endY);
            /* Train by batch size! */
            auto result = net(in_batch);
            loss += net.computeLossAndGradients(out_batch);

            net.backpropLossAndUpdate();
            net.clearSavedData();

            lb += batch_size;
            ub += batch_size;
        }
        std::cout << "Epoch: " << i << std::endl;
        printAccuracy(net, in, out);
        std::cout << "Loss: " << loss / (double)in.size() << std::endl << std::endl;
        
    }
}

/*
    Layer* fc = new FullyConnected(input_size, 128);
    Layer* fc2 = new FullyConnected(128, 64);
    Layer* fc3 = new FullyConnected(64, output_size);


    net.addLayer(fc);
    net.addLayer(fc2);
    net.addLayer(fc3);*/
    
    /*
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
}*/


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