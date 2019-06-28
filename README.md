# Application Specific Hardware for Accelerating Neural Network Training Time

## Overview
### FPGA (SystemVerilog) 
This folder contains the HDL for implementing my accelerator on an FPGA.


### Models (Python)
This folder contains PyTorch models of networks I have created. I used these while designing the architecture of my network that I am implementing for my FPGA. I will also use them for benchmarking professional library CPU and GPU training time.



### Papers 
This folder contains papers that I have read and think are useful.



### Project Plan
This folder contains the project plan for my master's thesis



### SWModel (C++)
This folder contains my own high-level software model for implementing any kind of neural network, with support for convolutional, pooling, and fullyconnected layers, using ReLU and softmax. The test files use googletest, the source of which can be found at the googletest repo. 



### Weekly Presentations
This folder contains my presentations that I have given throughout my project to my supervisor


### hardware\_verification
This folder contains text files with gradients for every neuron and weight in the neural networks. One set of the gradients has been generated from a simulation of the hardware accelerator and the other was generated from the Python verification script. The gradients in the two set files were used to verify the correctness of the hardware accelerator.

### ip_repo/axi_slave_1.0/hdl
This folder contains the Vivado generated AXI slave the communicates with the AXI master from the PS. The AXI slave memory map has been repurposed for the needs of this thesis


### verification_and_weight_gen (Python)
This folder contains scripts that I have been using to debug the FPGA simulation output as well as a script to generate coefficient files for initializing the weights in the BRAM

### ps_code (C)
This folder contain 