from random import seed
from random import gauss
import math

n_neurons = 1
params_per_neuron = 784
r_width = 1
fan_in = 256
int_bits = 3
dec_bits = 13

def intToBinaryString(x, l):
    str = ""
    neg = False
    if x < 0:
        x += 2 ** (l - 1)
        neg = True


    while x:
        if int(x) & 1:
            str = "1" + str
        else:
            str = "0" + str
        x = int(x / 2)
    
    if neg:
        str = "1" + str
    while (len(str) != l):
        str = "0" + str
    return str

params = []
binary_params = []

for i in range(n_neurons):
    for j in range(params_per_neuron):
        param = gauss(0, math.sqrt(2/(fan_in - 1)))
        params.append(param)

for p in params:
    b = int(p * (2**13))
    binary_params.append(intToBinaryString(b, 16))
print(params[0])
print(binary_params[0])

contents = "memory_initialization_radix=2;\nmemory_initialization_vector=\n"
cnt = 0
for b in binary_params:
    contents += str(b)
    cnt += 1
    if cnt == r_width:
        contents += ",\n"
        cnt = 0
contents = contents[:-2] + ";"


f = open('output.coe', 'w')
f.write(contents)
f.close()