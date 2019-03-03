import torch.nn as nn
import torch
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms
from torch.autograd import Variable
import numpy as np

def unpickle(file):
    import pickle
    with open(file, 'rb') as fo:
        dict = pickle.load(fo, encoding='bytes')
    return dict

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 32, kernel_size=5, padding=2)
        self.conv2 = nn.Conv2d(32, 32, kernel_size=3, padding=1)
        self.conv3 = nn.Conv2d(32 , 32, kernel_size=3, padding=1)
        self.mp = nn.MaxPool2d(2)
        self.fc = nn.Linear(16*16*32, 10)

    def forward(self, x):
        in_size = x.size(0)
        x = F.relu(self.mp(self.conv1(x)))
        #x = F.relu(self.mp(self.conv2(x)))
        #x = F.relu(self.conv3(x))
        x = x.view(in_size, -1)  # flatten the tensor
        x = self.fc(x)
        #return x
        return F.log_softmax(x)

use_cuda = torch.cuda.is_available()
device = torch.device("cuda:0" if use_cuda else "cpu")
print(device)
db1 = unpickle('d:/CIFAR10/python/data_batch_1')
db2 = unpickle('d:/CIFAR10/python/data_batch_2')
db3 = unpickle('d:/CIFAR10/python/data_batch_3')
db4 = unpickle('d:/CIFAR10/python/data_batch_4')
db5 = unpickle('d:/CIFAR10/python/data_batch_5')
test_data = unpickle('d:/CIFAR10/python/test_batch')

images1 = db1[b'data']
images2 = db2[b'data']
images3 = db3[b'data']
images4 = db4[b'data']
images5 = db5[b'data']

images = images1
images = np.append(images1, images2, axis=0)
images = np.append(images, images3, axis=0)
images = np.append(images, images4, axis=0)
images = np.append(images, images5, axis=0)
images = images / 255

images_test = test_data[b'data'] / 255
labels_test = db1[b'labels']

labels = db1[b'labels'] + db2[b'labels'] + db3[b'labels'] + db4[b'labels'] + db5[b'labels']

x_train = torch.from_numpy(images).float().to(device).view(-1, 3, 32, 32)
y_train = torch.LongTensor(labels).to(device)

x_test = torch.from_numpy(images_test).float().to(device).view(-1, 3, 32, 32)
y_test = torch.LongTensor(labels_test).to(device)

print(x_train.shape)
print(y_train.shape)
print(x_test.shape)
print(y_test.shape)

net = Net()
net.cuda() 
optimizer = optim.Adam(net.parameters(), lr=0.01)
criterion = nn.NLLLoss()

epochs = 5
for k in range(epochs):
    print("Epoch " + str(k))
    for i in range(2000):
        if (i % 2500 == 0):
            print(str(i) + " / 50000")
        optimizer.zero_grad()        
        # forward + backward + optimize
        outputs = net(x_train[i: i + 1])
        loss = criterion(outputs, y_train[i: i + 1])
        loss.backward()
        optimizer.step()
            
            
    num_correct = 0


    for j in range(len(y_test)):    
        val_guess = net(x_test[j: j+1])
        if torch.argmax(val_guess) == y_test[j]:
            num_correct += 1

    err = 1 - (num_correct / len(y_test))
    print("Epoch: " + str(k) + ": " + str(err))
