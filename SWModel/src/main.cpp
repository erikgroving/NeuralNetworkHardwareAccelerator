#include <iostream>

#include "fullyconnected.h"

int main () {

    std::cout << "Running software model...\n";    
    FullyConnected fc(5, 3);

    std::vector<double> in = { 1.1, 2.2, 3.3, 4.4, 5.5 };
    fc.forward(in);

    auto out = fc.getOutput();

    for (double d : out) {
        std::cout << d << std::endl;
    }
}