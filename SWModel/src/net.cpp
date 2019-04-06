#include "net.h"
#include <string>
#include <math.h>
#include <algorithm>
#include <iostream>

void Net::addLayer(Layer* layer) {
    layers.push_back(layer);
}

std::vector< std::vector<double> > Net::operator() (std::vector < std::vector<double> > input) {
    return inference(input); 
}

std::vector< std::vector<double> > Net::inference(std::vector< std::vector<double> > input) {
    batch_output = std::vector< std::vector<double> >();
    activations = std::vector< std::vector< std::vector<double> > > ();
    for (size_t i = 0; i < layers.size() + 1; i++) {
        activations.push_back(std::vector< std::vector<double> >());
    }

    for (std::vector<double> in : input) {
        if (in.size() != input_size) {
            std::cout << "Input size does not match, expected: " + std::to_string(input_size) + 
            ", got: " + std::to_string(in.size()) << std::endl;
            exit(1);
        }

        for (size_t i = 0; i < layers.size(); i++) {
            Layer*&l = layers[i];
            double max = *(std::max_element(in.begin(), in.end()));
            for (double& e : in) {
                e /= max;
            }
            activations[i].push_back(in);
            if (i == layers.size() - 1) {
                l->forward(in, true);
            }
            else {
                l->forward(in);
            }
            in = l->getOutput();
        }


        if (in.size() != output_size) {
            std::cout << "Output size does not match, expected: " + std::to_string(output_size) + ", got: " + std::to_string(in.size());
            std::cout << std::endl;
            exit(1);
        }
        activations[layers.size()].push_back(in);
        std::vector<double> output = convLogitToProb(in);
        //std::vector<double> output = in;
        batch_output.push_back(output);
    }

    return batch_output;
}

double Net::computeLossAndGradients(std::vector<int> labeled) {
    if (labeled.size() != batch_output.size()) {
        std::cout << "Labeled data size does not match the net's output size, expected: " + 
                    std::to_string(batch_output.size()) + ", got: " + std::to_string(labeled.size()) << std::endl;
        std::cout << std::endl;
        exit(1);
    }
    ol_gradient = std::vector< std::vector<double> > ();
    double loss = 0;
    // Compute cross entropy loss for each output
    // CrossEntropy loss -q(x) * log(p(x))
    // q(x) is true distribution, so it is 1 for our labeled data on the correct sample
    for (size_t i = 0; i < labeled.size(); i++) { 
        std::vector<double> gradient(output_size, 0);
        unsigned short label = labeled[i];

        for (size_t j = 0; j < output_size; j++) {
            if (j == label) {
                gradient[j] = batch_output[i][j] * (1 - batch_output[i][j]);
            }
            else {
                gradient[j] = -batch_output[i][j] * batch_output[i][label];
            }
        }
        loss += -log(batch_output[i][label]);
        ol_gradient.push_back(gradient);
    }


    // Compute mean square error
    /*for (size_t i = 0; i < labeled.size(); i++) {
        unsigned short label = labeled[i];
        std::vector<double> gradient(output_size, 0);
        for (size_t j = 0; j < output_size; j++) {
            double err, grad;
            if (j == label) {
                grad = 1 - batch_output[i][j];
                err = 0.5 * pow(grad, 2);
            }
            else {
                grad = 0 - batch_output[i][j];
                err = 0.5 * pow(grad, 2);
            }
            gradient[j] = grad;
            loss += err;
        }
        ol_gradient.push_back(gradient);
    }*/
    
    return loss;
}

// Backpropagate the gradients of the error
void Net::backpropLossAndUpdate() {
    std::vector< std::vector<double> > gradients = ol_gradient;
    // Outer layer gradients is just the loss
    for (int i = layers.size() - 1; i >= 0; i--) {
        gradients = layers[i]->backward(gradients, activations[i], activations[i + 1]);
    }
    
    for (int i = layers.size() - 1; i >= 0; i--) {
        layers[i]->updateWeights(learning_rate, momentum);
    }
}

std::vector<double> Net::convLogitToProb(std::vector<double> logits) {
    double sum = 0;
    double max = *std::max_element(logits.begin(), logits.end());
    for (auto l : logits) {
        sum += exp(l - max);
    }
    std::vector<double> prob;

    for (auto l : logits) {
        prob.push_back(exp(l - max) / sum);
    }

    return prob;
}

std::vector<double> Net::getPredictions() {
    std::vector<double> preds;
    for (size_t i = 0; i < batch_output.size(); i++) {
        int pred_class = 0;
        double pred_max = batch_output[i][0];
        for (size_t j = 1; j < output_size; j++) {
            if (batch_output[i][j] > pred_max) {
                pred_class = j;
            }
        }
        preds.push_back(pred_class);
    }
    return preds;
}

void Net::clearSavedData() {
    activations = std::vector< std::vector< std::vector<double> > >();
    batch_output = std::vector< std::vector<double> >();
    ol_gradient = std::vector< std::vector<double> >();
}

Net::Net(uint32_t in, uint32_t out, uint32_t bs, double lr, double moment) {
    layers = std::vector<Layer*>();
    input_size = in;
    output_size = out;
    batch_size = bs;
    learning_rate = lr;
    momentum = moment;
}

Net::Net(const Net& net) {
    layers = net.layers;
    input_size = net.input_size;
    output_size = net.output_size;
}

Net::~Net() {
    for (size_t i = 0; i < layers.size(); i++) {
        delete layers[i];
    }
}