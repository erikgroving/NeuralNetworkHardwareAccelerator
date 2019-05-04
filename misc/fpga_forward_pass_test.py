import glob


integer_bits = 3

# FC1 layer
fc1_n_neurons = 32
fc1_fan_in = 8*7*7
fc1_bram = 8
fc1_neurons_per_bram = fc1_n_neurons / fc1_bram
fc1_neurons = [[] for i in range(fc1_n_neurons)]
n_offset = 0

# Set activations in
activations_i = [2 ** -13 for i in range(fc1_fan_in)]

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
            curr_neuron += 8
    n_offset += 1

fc1_output = []
for neuron in fc1_neurons:
    n_out = 0
    for j in range(len(activations_i)):
        n_out += activations_i[j] * neuron[j]
    fc1_output.append(max(n_out, 0))

for i in range(len(fc1_output)):
    print("Neuron " + str(i) + ": " + str(fc1_output[i]))