import glob

integer_bits = 3

# Set activations in
fc0_fan_in = 28*28
gradients = [0.21875, 0.20215, 0.1622, -0.1875, 0.09375,
             -.21289, -.27905, -0.39208, 0.16308, 0.11194]
gradients = [0.11194, 0.16308, -0.39208, -0.27905, -0.21289,
             0.09375, -0.1875, 0.1622, 0.20215, 0.21875]
activations_i = []
f = open('../FPGA/FPGA.srcs/sources_1/ip/fc0_random_input2.coe')
next(f)
next(f)
for line in f:
    act = 0
    bit_val = 2 ** (integer_bits - 1)

    if (line[0] == '1'):
        act -= bit_val
    bit_val /= 2.

    for bit in line[1:]:
        if (bit == '1'):
            act += bit_val
        bit_val /= 2.
    activations_i.append(act)

# FC0 layer
fc0_n_neurons = 98
fc0_fan_in = 28*28
fc0_bram = 1
fc0_neurons_per_bram = fc0_n_neurons / fc0_bram
fc0_neurons = [[] for i in range(fc0_n_neurons)]
n_offset = 0


# read fc0
path = '../FPGA/FPGA.srcs/sources_1/ip/fc0_weights*.coe'
for fname in glob.glob(path):
    print(fname)
    f = open(fname, 'r')
    next(f)
    next(f)
    for line in f:
        for i in range(fc0_n_neurons):
            curr_neuron = i
            st_bit = i * 16
            end_bit = (i + 1) * 16

            bit_str = line[st_bit: end_bit]
            weight_val = 0
            bit_val = 2 ** (integer_bits - 1)

            if (bit_str[0] == '1'):
                weight_val -= bit_val
            bit_val /= 2.

            for bit in bit_str[1:]:
                if (bit == '1'):
                    weight_val += bit_val
                bit_val /= 2.
            fc0_neurons[fc0_n_neurons - (curr_neuron + 1)].append(weight_val)


# FC1 layer
fc1_n_neurons = 64
fc1_fan_in = 98
fc1_bram = 8
fc1_neurons_per_bram = fc1_n_neurons / fc1_bram
fc1_neurons = [[] for i in range(fc1_n_neurons)]
n_offset = 0


# read fc1
path = '../FPGA/FPGA.srcs/sources_1/ip/fc1_weights*.coe'
for fname in glob.glob(path):
    print(fname)
    f = open(fname, 'r')
    next(f)
    next(f)
    for line in f:
        for i in range(8):
            curr_neuron = n_offset + (7 - i)
            st_bit = i * 16
            end_bit = (i + 1) * 16     

            bit_str = line[st_bit: end_bit]
            weight_val = 0
            bit_val = 2 ** (integer_bits - 1)

            if (bit_str[0] == '1'):
                weight_val -= bit_val
            bit_val /= 2.

            for bit in bit_str[1:]:
                if (bit == '1'):
                    weight_val += bit_val
                bit_val /= 2.
            fc1_neurons[curr_neuron].append(weight_val)
        if len(fc1_neurons[n_offset]) == fc1_fan_in:
            n_offset += 8

# FC2 layer
fc2_n_neurons = 10
fc2_fan_in = fc1_n_neurons
fc2_bram = 1
fc2_neurons_per_bram = fc2_n_neurons / fc2_bram
fc2_neurons = [[] for i in range(fc2_n_neurons)]
n_offset = 0


# read fc2
path = '../FPGA/FPGA.srcs/sources_1/ip/fc2_weights*.coe'
for fname in glob.glob(path):
    print(fname)
    f = open(fname, 'r')
    next(f)
    next(f)
    curr_neuron = n_offset
    for line in f:
        weight_val = 0
        bit_val = 2 ** (integer_bits - 1)

        if (line[0] == '1'):
            weight_val -= bit_val
        bit_val /= 2.

        for bit in line[1:]:
            if (bit == '1'):
                weight_val += bit_val
            bit_val /= 2.
        fc2_neurons[curr_neuron].append(weight_val)
        if len(fc2_neurons[curr_neuron]) == fc2_fan_in:
            curr_neuron += fc2_bram
    n_offset += 1

fc0_output = []
for neuron in fc0_neurons:
    n_out = 0
    for j in range(len(activations_i[0: fc0_fan_in])):
        n_out += activations_i[j + 0*fc0_fan_in] * neuron[j]
    fc0_output.append(max(n_out, 0))


fc1_output = []
for neuron in fc1_neurons:
    n_out = 0
    for j in range(len(fc0_output)):
        n_out += fc0_output[j] * neuron[j]
    fc1_output.append(max(n_out, 0))

fc2_output = []
for neuron in fc2_neurons:
    n_out = 0
    for j in range(len(fc1_output)):
        n_out += fc1_output[j] * neuron[j]
    fc2_output.append(n_out)


sum1 = 0
sum2 = 0
for w in range(int(len(fc0_neurons[84]) / 2)):
    idx1 = 2*w
    idx2 = idx1 + 1
    #print('----')
    #print("Weight: " + str(fc0_neurons[84][idx1]) + "\tActivation: " + str(activations_i[idx1]) + "\tKern_in: " + str(sum1))
    #print("Weight: " + str(fc0_neurons[84][idx2]) + "\tActivation: " + str(activations_i[idx2]) + "\tKern_in: " + str(sum2))
    sum1 += fc0_neurons[84][idx1] * activations_i[idx1]
    sum2 += fc0_neurons[84][idx2] * activations_i[idx2]
#print(sum1)
#print(sum2)
#print(str(sum1+sum2))
weight_grad = [[] for i in range(fc2_n_neurons)]
for i in range(len(fc2_neurons)):
    for j in range(len(fc2_neurons[i])):
        weight_grad[i].append(gradients[i] * fc1_output[j])


fc1_grad = [0 for i in range(fc1_n_neurons)]
for i in range(len(fc2_neurons)):
    for j in range(len(fc2_neurons[i])):
        fc1_grad[j] += gradients[i] * fc2_neurons[i][j]

fc1_w_grad = [[] for i in range(fc1_n_neurons)]
for i in range(len(fc1_neurons)):
    for j in range(len(fc1_neurons[i])):
        de_dnet = fc1_output[i] > 0
        fc1_w_grad[i].append(de_dnet * fc1_grad[i] * fc0_output[j])

fc0_grad = [0 for i in range(fc0_n_neurons)]
for i in range(len(fc1_neurons)):
    for j in range(len(fc1_neurons[i])):
        de_dnet = fc1_output[i] > 0
        fc0_grad[j] += (de_dnet * fc1_grad[i]) * fc1_neurons[i][j]

fc0_w_grad = [[] for i in range(fc0_n_neurons)]
for i in range(len(fc0_neurons)):
    for j in range(len(fc0_neurons[i])):
        de_dnet = fc0_output[i] > 0
        fc0_w_grad[i].append(de_dnet * fc0_grad[i] * activations_i[j])

print('\n--- FC0 OUT ---')
for i in range(len(fc0_output)):
    print("Neuron " + str(i) + ": " + str(fc0_output[i]))

print('\n--- FC1 OUT ---')
for i in range(len(fc1_output)):
    print("Neuron " + str(i) + ": " + str(fc1_output[i]))

print('\n--- FC2 OUT ---')
for i in range(len(fc2_output)):
    print("Neuron " + str(i) + ": " + str(fc2_output[i]))


#print('\n--- FC2 WEIGHT GRADIENTS ---')
#for i in range(len(weight_grad)):
#    print("Neuron " + str(i))
#    for j in range(len(weight_grad[i])):
#        print(str(j) + ": " + str(weight_grad[i][j]))
#
#print ('\n--- FC1 NEURON GRADIENTS ---')
#for i in range(len(fc1_grad)):
#    print(str(i) + ": " + str(fc1_grad[i]))
#
#print('\n--- FC1 WEIGHT GRADIENTS ---')
##for i in range(98):
##    print("Activation: " + str(i))
##    for j in range(64):
##        print(str(j) + ": " + str(fc1_w_grad[j][i]))
#
#
#print ('\n--- FC0 NEURON GRADIENTS ---')
#for i in range(len(fc0_grad)):
#    print(str(i) + ": " + str(fc0_grad[i]))
#
#print('\n--- FC0 WEIGHT GRADIENTS ---')
#for i in range(784):
#    print("Activation: " + str(i))
#    for j in range(98):
#        print(str(j) + ": " + str(fc0_w_grad[j][i]))
#print(len(fc1_neurons))
#print(len(fc1_neurons[0]))
#for i in range(len(fc1_neurons)):
#    print(str(i) + ":\t" + str(fc1_grad[i]/abs(fc1_grad[i])) + "\t\t" + str(fc1_neurons[i][20]/abs(fc1_neurons[i][20])))