#include <iostream>
#include <random>
#include <chrono>

#include "fullyconnected.h"
#include "layer.h" 
#include "net.h"

void printAccuracy(Net& net, std::vector< std::vector<double> >& in, std::vector<int>& out);

int main () {

    std::cout << "Running software model...\n";

    int input_size = 2;
    int output_size = 2;
    int batch_size = 1;
    double lr = 0.0001;

    Net net(input_size, output_size, batch_size, lr);

    Layer* fc = new FullyConnected(input_size, 5);
    Layer* fc2 = new FullyConnected(5, 5);
    Layer* fc3 = new FullyConnected(5, output_size);

    std::vector< std::vector<double> > in; 
    std::vector<int> out; 

    int in_size = 100;
    std::uniform_real_distribution<double> distribution(0, 1.0);  
    std::uniform_int_distribution<int> distribution_out(0, output_size);  
    static unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
    static std::default_random_engine generator(seed);
    for (int i = 0; i < in_size; i++) {
        std::vector<double> smpl;
        for (int j = 0; j < input_size; j++) {
            smpl.push_back(distribution(generator));
        }
        in.push_back(smpl);
        out.push_back(distribution_out(generator));
    }

    net.addLayer(fc);
    net.addLayer(fc2);
    net.addLayer(fc3);

    int epochs = 5000;
    //int i = 0;
    printAccuracy(net, in, out);
    for (int j = 0; j < epochs; j++) {
        auto result = net(in);
        double loss = net.computeLoss(out);
        if (j == 0 || j == epochs - 1) {
            /*std::cout << "-------- ROUND " << i++ << " ---------\n";
            int k = 0;
            for (auto res : result) {
                std::cout << "---" << k++ << "---\n";
                for (double d : res) {
                    std::cout << d << std::endl;
                }
            }*/
            std::cout << "Loss: " << loss << std::endl << std::endl;
        }

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