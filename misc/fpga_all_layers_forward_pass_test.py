import glob

integer_bits = 3

# Set activations in
fc1_fan_in = 8*7*7
activations_i = []
f = open('../FPGA/FPGA.srcs/sources_1/ip/fc0_fc1_rand_activations.coe')
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



# FC1 layer
fc1_n_neurons = 32
fc1_fan_in = 8*7*7
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
        fc1_neurons[curr_neuron].append(weight_val)
        if len(fc1_neurons[curr_neuron]) == fc1_fan_in:
            curr_neuron += fc1_bram
    n_offset += 1

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



fc1_output = []
for neuron in fc1_neurons:
    n_out = 0
    for j in range(len(activations_i[0: fc1_fan_in])):
        n_out += activations_i[j + 0*fc1_fan_in] * neuron[j]
    fc1_output.append(max(n_out, 0))

fc2_output = []
for neuron in fc2_neurons:
    n_out = 0
    for j in range(len(fc1_output)):
        n_out += fc1_output[j] * neuron[j]
    fc2_output.append(max(n_out, 0))

print('--- FC1 OUT ---')
for i in range(len(fc1_output)):
    print("Neuron " + str(i) + ": " + str(fc1_output[i]))

print('--- FC2 OUT ---')
for i in range(len(fc2_output)):
    print("Neuron " + str(i) + ": " + str(fc2_output[i]))