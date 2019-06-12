#include "net.h"
#include <string>
#include <math.h>
#include <algorithm>
#include <iostream>
#include "convolutional.h"
#include "fullyconnected.h"

void Net::addLayer(Layer* layer) {
    if (layers.size()) {
        layers[layers.size() - 1]->last_layer = false;
    }
    layers.push_back(layer);
    layers[layers.size() - 1]->last_layer = true;
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
            /*double max = *(std::max_element(in.begin(), in.end()));
            for (double& e : in) {
                e /= max;
            }*/
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
    return activations[layers.size()];
    //return batch_output;
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
            //double f_out = (tanh(batch_output[i][j] / 2.))/2. + 0.5;
            if (j == label) {
                //gradient[j] = batch_output[i][j] * (1 - batch_output[i][j]);
                gradient[j] = batch_output[i][j] - 1;

                //gradient[j] = (f_out - 1) * (f_out*(1-f_out));
            }
            else {
                //gradient[j] = -batch_output[i][j] * batch_output[i][label];
                gradient[j] = batch_output[i][j];
                //gradient[j] = (f_out) * (f_out*(1-f_out));
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
void Net::backpropLoss() {
    std::vector< std::vector<double> > gradients = ol_gradient;
    std::vector< std::vector<double> > sens;
    // Outer layer gradients is just the loss
    for (int i = layers.size() - 1; i >= 0; i--) {
        //std::cout << "Grad len: " << gradients[0].size() << " Layer len: " << layers[i]->getNeurons().size() << " Prev: " << activations[i].size() << " Next: " << activations[i+1].size() << std::endl;
        sens = layers[i]->backward(gradients, activations[i], activations[i + 1]);
        // fully connected gradients
        // if fully connected check, on layers[i]
        gradients = std::vector< std::vector<double> >();
        Layer* l = layers[i];
        std::vector<Neuron> neurons = l->getNeurons();

        if (l->getType() == POOL) {
            gradients = sens;
        }
        else {
            for (size_t j = 0; j < sens.size(); j++) {
                if (l->getType() == FULLY) {
                    // The gradient of neuron i in prev layer is the sum of the weights[i] * de_dnet of all 
                    // neurons in layer j
                    std::vector<double> grad(neurons[0].getWeights().size(), 0);
                    for (size_t k = 0; k < neurons.size(); k++) {
                        std::vector<double> weights = neurons[k].getWeights();
                        for (size_t l = 0; l < weights.size(); l++) {
                            grad[l] += sens[j][k] * weights[l];
                        }
                    }
                    gradients.push_back(grad);
                }
                else if (l->getType() == CONV) {
                    ConvLayer* cl = dynamic_cast<ConvLayer* >(l);
                    // If the sensitivities of i + 1 layer were from a convolution, then the
                    // neurons for layer i only need to do weights[i] * de_dnet for
                    // the relevant windows that the activation was in 
                    int dim = cl->getDim();
                    int in_chan = cl->getInChannels();
                    int out_chan = cl->getOutChannels();

                    int num_neurons = dim * dim * in_chan;  // amount of gradients to give previous layer
                    std::vector<double> grad(num_neurons, 0);

                    for (int k = 0; k < num_neurons; k++) {
                        // for each window it goes to... need to know which weight to use
                        int chan = k / (dim * dim);
                        int row = (k - (chan * dim * dim)) / dim;
                        int col = (k - (chan * dim * dim + row * dim)) % dim;
                        int filt_size = cl->getFiltSize();
                        int filt_sq = filt_size * filt_size;
                        // Iterate over the neurons in the window for this gradient
                        int dim_sq = dim * dim;
                        int start_row = row - (filt_size / 2);
                        int end_row = row + (filt_size / 2);
                        int start_col = col - (filt_size / 2);
                        int end_col = col + (filt_size / 2);

                        /*std::cout << "Row: " << row << " Col: " << col << " Start row: " << start_row <<
                        " End row: " << end_row << " Start col: " 
                        << start_col << " End col: " << end_col << " j: " << j 
                        << " Sens size: " << sens.size() << std::endl;*/

                        for (int o = 0; o < out_chan; o++) {
                            int count = 0;
                            for (int m = start_row; m <= end_row; m++) {
                                for (int n = start_col; n <= end_col; n++) {
                                    if (m < 0 || m >= dim || n < 0 || n >= dim) {
                                        count++;
                                        continue;
                                    }
                                    int o_neur_idx = o * dim_sq + m * dim + n;
                                    int filt_offset = (filt_sq) - (count + 1);
                                    int weight_idx = (chan * filt_sq) + filt_offset;

                                    grad[k] += sens[j][o_neur_idx] * neurons[o_neur_idx].getWeights()[weight_idx];
                                    count++;
                                }
                            }
                        }
                    }
                    gradients.push_back(grad);
                }
            }
        }
    }
}    
void Net::update() {
    double effective_lr = learning_rate / batch_size;
    for (int i = layers.size() - 1; i >= 0; i--) {
        layers[i]->updateWeights(effective_lr, momentum);
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
    /*for (int i = layers.size() - 1; i >= 0; i--) {
        layers[i]->clearData();
    }*/
    for (Layer* l : layers) {
        l->clearData();
    }
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