#include <iostream>
#include <random>
#include <time.h>
#include <chrono>

#include "convolutional.h"
#include "fullyconnected.h"
#include "pooling.h"
#include "parse_data.h"
#include "layer.h" 
#include "net.h"

double printAccuracy(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out);
void trainNet(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out,
            std::vector< std::vector<double> >& in_test, std::vector<int>& out_test, int n_epochs,
            int epochs_per_change, double geometric_rate);
int main () {

    std::cout << "Running software model...\n";

    std::vector< std::vector<double> > trainX;
    std::vector<int> trainY;
    std::vector< std::vector<double> > testX;
    std::vector<int> testY;
    trainX = readImages("data/train-images.idx3-ubyte");
    trainY = readLabels("data/train-labels.idx1-ubyte");
    testX = readImages("data/t10k-images.idx3-ubyte");
    testY = readLabels("data/t10k-labels.idx1-ubyte");
    int n_epochs = 50;

    int input_size = 28*28;
    int output_size = 10;
    int batch_size = 1;
    double momentum = 0.9;
    double lr = 0.001; 
    Net net(input_size, output_size, batch_size, lr, momentum);

    trainX = std::vector< std::vector<double> > (trainX.begin(), trainX.begin() + 60000);
    trainY = std::vector<int> (trainY.begin(), trainY.begin() + 60000);


    testX = std::vector< std::vector<double> > (testX.begin(), testX.begin() + 10000);
    testY = std::vector<int> (testY.begin(), testY.begin() + 10000);
/*
    Layer* conv1 = new ConvLayer(28, 3, 1, 1, 1, 8);
    Layer* pool1 = new PoolingLayer(28, 14, 8);
    Layer* conv2 = new ConvLayer(14, 3, 1, 1, 8, 16);
    Layer* pool2 = new PoolingLayer(14, 7, 16);
    Layer* fc1 = new FullyConnected(16*7*7, 64);
    Layer* fc2 = new FullyConnected(64, 10);
    
    net.addLayer(conv1);
    net.addLayer(pool1);
    net.addLayer(conv2);
    net.addLayer(pool2);
    net.addLayer(fc1);
    net.addLayer(fc2);
*/

    Layer* fc1 = new FullyConnected(28*28, 98);
    Layer* fc2 = new FullyConnected(98, 64);
    Layer* fc3 = new FullyConnected(64, 10);
    
    net.addLayer(fc1);
    net.addLayer(fc2);
    net.addLayer(fc3);

    trainNet(net, trainX, trainY, testX, testY, n_epochs, 25, .1);

    printAccuracy(net, testX, testY);   
}

void trainNet(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out,
            std::vector< std::vector<double> >& in_test, std::vector<int>& out_test, int n_epochs,
            int epochs_per_change, double geometric_rate) {
    std::cout << "Starting Accuracy" << std::endl;
    printAccuracy(net, in_test, out_test);
    std::cout <<std::endl;
    clock_t start, end, diff;
    start = clock();
    for (int i = 0; i <= n_epochs; i++) {
        double train_loss = 0.0;
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
            net(in_batch);
            train_loss += net.computeLossAndGradients(out_batch);

            net.backpropLoss();
            net.update();
            net.clearSavedData();

            lb += batch_size;
            ub += batch_size;
        }
        end = clock();
        diff = end - start;
        std::cout << "Epoch: " << i << std::endl;
        std::cout << "\n--- Training Stats ---\n";    
        train_loss = printAccuracy(net, in, out);
        std::cout << "Loss: " << train_loss / (double)in.size() << std::endl;    
        std::cout << "\n--- Test Stats ---\n";    
        double test_loss = printAccuracy(net, in_test, out_test);
        std::cout << "Elapsed time: " << (float)diff / CLOCKS_PER_SEC << std::endl;
        std::cout << "Loss: " << test_loss / (double)in_test.size() << std::endl << std::endl;
        if ( (i + 1) % epochs_per_change == 0) {
            std::cout << "Learning rate changed from " << net.getLearningRate();
            net.setLearningRate(net.getLearningRate() * geometric_rate);
            std::cout << " to " << net.getLearningRate() << std::endl << std::endl;
        }
    }
}

double printAccuracy(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out) {
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
    double loss = net.computeLossAndGradients(out);
    net.clearSavedData();
    std::cout << "Total correct: " << corr << " / " << result.size() << std::endl;
    std::cout << "Accuracy: " << (double)corr / result.size() << std::endl;
    return loss;
}