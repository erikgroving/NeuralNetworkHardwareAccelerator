#include <iostream>

#include "fullyconnected.h"
#include "layer.h" 
#include "net.h"

int main () {

    std::cout << "Running software model...\n";

    Net net(4, 2, 1);

    Layer* fc = new FullyConnected(4, 3);
    Layer* fc2 = new FullyConnected(3, 2);

    std::vector<double> in = { 1.1, 2.2, 3.3, 4.4 };

    net.addLayer(fc);
    net.addLayer(fc2);

    net.resetLoss();
    auto result = net.inference(in);
    net.computeLoss({1, 0});
    for (double d : result) {
        std::cout << d << std::endl;
    }
}