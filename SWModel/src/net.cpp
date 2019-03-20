#include "net.h"
#include <string>
#include <math.h>
#include <iostream>

void Net::addLayer(Layer* layer) {
    layers.push_back(layer);
}

std::vector<double> Net::inference(std::vector<double> input) {
    if (input.size() != input_size) {
        std::cout << "Input size does not match, expected: " + std::to_string(input_size) + ", got: " + std::to_string(input.size());
        exit(1);
    }
    
    for (Layer*& l : layers) {
        l->forward(input);
        input = l->getOutput();
    }

    if (input.size() != output_size) {
        std::cout << "Output size does not match, expected: " + std::to_string(output_size) + ", got: " + std::to_string(input.size());
        std::cout << std::endl;
        exit(1);
    }
    input = convLogitToProb(input);
    batch_output.push_back(input);

    return input;
}

double Net::computeLoss(std::vector<double> labeled) {
    if (labeled.size() != output_size) {
        std::cout << "Labeled data size does not match the net's output size, expected: " + std::to_string(output_size) + ", got: " + std::to_string(labeled.size());
        std::cout << std::endl;
        exit(1);
    }

    // Get the predicted out for each item in batch
    std::vector<double> pred_class;
    pred_class = getPredictions();

    // Compute loss for each output and total loss
    for (size_t j = 0; j < labeled.size(); j++) {
        bool correct = labeled[j] == pred_class[j];

        for (size_t i = 0; i < output_size; i++) {
            // 0 if correct, 1 if incorrect
            int y = 0;
            if ((correct && i == labeled[j]) || 
                (!correct && i == labeled[j])) { // mispredict
                y = 1;
            }
            //local_loss[i] += y * -log(batch_output[j][i]);
        }
    }
}

std::vector<double> Net::convLogitToProb(std::vector<double> logits) {
    double sum = 0;
    for (auto l : logits) {
        sum += exp(l);
    }
    std::vector<double> prob;
    prob.reserve(logits.size());

    for (auto l : logits) {
        prob.push_back(exp(l) / sum);
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

void Net::resetLoss() {
    for (size_t i = 0; i < loss_per_output.size(); i++) {
        loss_per_output[i] = 0;
    }
}

Net::Net(uint32_t in, uint32_t out, uint32_t bs) {
    layers = std::vector<Layer*>();
    loss_per_output.resize(out);
    input_size = in;
    output_size = out;
    batch_size = bs;
}

Net::Net(const Net& net) {
    layers = net.layers;
    loss_per_output = net.loss_per_output;
    input_size = net.input_size;
    output_size = net.output_size;
}

Net::~Net() {
    for (size_t i = 0; i < layers.size(); i++) {
        delete layers[i];
    }
}