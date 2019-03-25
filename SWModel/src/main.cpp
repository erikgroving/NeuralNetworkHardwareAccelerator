#include <iostream>

#include "fullyconnected.h"
#include "layer.h" 
#include "net.h"

int main () {

    std::cout << "Running software model...\n";

    Net net(4, 2, 1, 0.1);

    Layer* fc = new FullyConnected(4, 3);
    Layer* fc2 = new FullyConnected(3, 2);

    std::vector< std::vector<double> > in = {{ 1.1, 2.2, 3.3, 4.4 }, { .1, .2, .3, .4}};

    net.addLayer(fc);
    net.addLayer(fc2);

    net.resetLoss();
    auto result = net(in);
    double loss = net.computeLoss({1, 0});
    int i = 0;
    for (auto res : result) {
        std::cout << "---" << i++ << "---\n";
        for (double d : res) {
            std::cout << d << std::endl;
        }
    }
    std::cout << "Loss: " << loss << std::endl << std::endl;

    net.backpropLossAndUpdate();
    
    result = net(in);
    loss = net.computeLoss({1, 0});
    i = 0;
    for (auto res : result) {
        std::cout << "---" << i++ << "---\n";
        for (double d : res) {
            std::cout << d << std::endl;
        }
    }
    std::cout << "Loss: " << loss << std::endl;

}