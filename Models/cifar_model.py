import torch.nn as nn
import torch
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms
from torch.autograd import Variable
import numpy as np
import torchvision
import torchvision.transforms as transforms
import torch.multiprocessing
from timeit import default_timer as timer

def unpickle(file):
    import pickle
    with open(file, 'rb') as fo:
        dict = pickle.load(fo, encoding='bytes')
    return dict

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 32, 5, padding = 2)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(32, 64, 5, padding = 2)
        self.conv3 = nn.Conv2d(64, 128, 3, padding = 1)
        self.fc1 = nn.Linear(128 * 8 * 8, 120)
        self.fc2 = nn.Linear(120, 80)
        self.fc3 = nn.Linear(80, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = F.relu(self.conv2(x))
        x = self.pool(F.relu(self.conv3(x)))
        x = x.view(-1, 128 * 8 * 8)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        return x

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
images = images / 128
images -= 1


images_test = test_data[b'data'] / 128
images_test = images_test - 1
labels_test = test_data[b'labels']

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



classes = ('plane', 'car', 'bird', 'cat',
        'deer', 'dog', 'frog', 'horse', 'ship', 'truck')


import matplotlib.pyplot as plt
import numpy as np


    # functions to show an image
def imshow(img):
    img = img / 2 + 0.5     # unnormalize
    npimg = img.numpy()
    plt.imshow(np.transpose(npimg, (1, 2, 0)))
    plt.show()

# show images
#imshow(torchvision.utils.make_grid(x_train[0:4]).cpu())
# print labels
#print(' '.join('%5s' % classes[labels[j]] for j in range(4)))


def shuffleTensor(in_tensor):
    in_tensor 


epochs = 30
batch_size = 4
acc_check = 10
lrate = 0.001
momen = 0.9

criterion = nn.CrossEntropyLoss()
optimizer = optim.SGD(net.parameters(), lr=lrate, momentum=0.9)


start = timer()
for i in range(epochs):
    print("Epoch " + str(i))
    running_loss = 0.0
    
    #TODO, shuffle
    idx = torch.randperm(len(x_train))
    x_train = x_train[idx]
    y_train = y_train[idx]

    lb = 0
    ub = batch_size

    while ub <= len(x_train):

        inputs = x_train[lb: ub]
        labels = y_train[lb: ub]

        # zero the parameter gradients
        optimizer.zero_grad()

        # forward + backward + optimize
        outputs = net(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

        # print statistics
        running_loss += loss.item()
        if ub % 10000 == 0:    # print every 2000 mini-batches
            print('[%d, %5d] loss: %.3f' %
                (i + 1, ub, running_loss / 2500))
            running_loss = 0.0

        lb += batch_size
        ub += batch_size
    
    #check on data
    n_correct = 0
    lb = 0
    ub = acc_check
    while ub <= len(y_test):
        output = net(x_test[lb: ub])
        n_correct += (torch.argmax(output, dim=1) == y_test[lb: ub]).sum().item()
        lb += acc_check
        ub += acc_check


    print("Epoch " + str(i) + " accuracy: " + str(n_correct/len(y_test)))
    print(str(n_correct) + " / " + str(len(y_test)))

end = timer()

print("Training time: " + str(end - start) + " seconds")

#TODO write accuracies and losses to a csv file