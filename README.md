# Application Specific Hardware for Accelerating Neural Network Training Time

## Overview
### FPGA    
This folder contains the HDL for implementing my accelerator on an FPGA.



### Models
This folder contains PyTorch models of networks I have created. I used these while designing the architecture of my network that I am implementing for my FPGA. I will also use them for benchmarking professional library CPU and GPU training time.



### Papers 
This folder contains papers that I have read and think are useful.



### Project Plan
This folder contains the project plan for my master's thesis



### SWModel
This folder contains my own high-level software model for implementing any kind of neural network, with support for convolutional, pooling, and fullyconnected layers, using ReLU and softmax. The test files use googletest, the source of which can be found at the googletest repo. 



### Weekly Presentations
This folder contains my presentations that I have given throughout my project to my supervisor



### misc
This folder contains scripts that I have been using to debug the FPGA simulation output and generate coefficient files for initializing the weights in the BRAM