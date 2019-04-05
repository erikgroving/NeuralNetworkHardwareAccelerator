import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms
from torch.autograd import Variable
import numpy as np
import parse_data
from sklearn.model_selection import train_test_split
import csv

class Net(nn.Module):

    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(1, 4, kernel_size=3, padding=1)
        self.conv2 = nn.Conv2d(4, 8, kernel_size=3, padding=1)
        self.conv3 = nn.Conv2d(8 , 12, kernel_size=3, padding=1)
        self.mp = nn.MaxPool2d(2)
        self.fc = nn.Linear(12*7*7, 10)

    def forward(self, x):
        in_size = x.size(0)
        x = F.relu(self.mp(self.conv1(x)))
        x = F.relu(self.mp(self.conv2(x)))
        x = F.relu(self.conv3(x))
        x = x.view(in_size, -1)  # flatten the tensor
        x = self.fc(x)
        #return x
        return F.log_softmax(x)


use_cuda = torch.cuda.is_available()
device = torch.device("cuda:0" if use_cuda else "cpu")


X_train, Y_train, X_test = parse_data.loadData('train.csv', 'test.csv', device)
print(X_train.device)


def kFoldValidation():
    n_epochs = []
    indices = np.arange(len(X_train))
    tr_lb = 0
    tr_ub = int(0.8 * len(X_train))
    val_lb = tr_ub

    cv_tr_size = int(0.8*len(X_train))
    val_size = len(X_train) - cv_tr_size





    #Test with 5 k-folds to find a somewhat optimal amount of training epochs

    for t in range(5):
        net = Net()
        net.cuda()    
        optimizer = optim.Adam(net.parameters(), lr=0.0001)
        criterion = nn.NLLLoss()

        np.random.shuffle(indices)
        X_tr = torch.zeros((cv_tr_size, 1, 28, 28), dtype=torch.float, device=device)
        Y_tr = torch.zeros((cv_tr_size), dtype=torch.long, device=device)
        X_val = torch.zeros((val_size, 1, 28, 28), dtype=torch.float, device=device)
        Y_val = torch.zeros((val_size), dtype=torch.long, device=device)
        for i in range(tr_ub):
            X_tr[i] = X_train[indices[i]]
            Y_tr[i] = Y_train[indices[i]]
        for i in range(tr_ub, len(X_train)):
            X_val[i - tr_ub] = X_train[indices[i]]
            Y_val[i - tr_ub] = Y_train[indices[i]]

        min_err = 10000
        min_it = 0
        errors = []
        it = 0
        while it < 12 or errors[int(it-1)] < errors[int(it - 10)]:
            lb = 0
            ub = 10
            batch_s = 10
            while ub <= len(X_tr):
                optimizer.zero_grad() 
                output = net(X_tr[lb: ub])
                loss = criterion(output, Y_tr[lb: ub])
                loss.backward()
                optimizer.step()
                lb += batch_s
                ub += batch_s

            num_correct = 0
            val_guess = net(X_val)

            for j in range(len(Y_val)):
                if torch.argmax(val_guess[j]) == Y_val[j]:
                    num_correct += 1

            err = 1 - (num_correct / len(Y_val))


            it += 1
        
            if err < min_err:
                min_err = err
                min_it = it
            print("Epoch: " + str(it) + ": " + str(err))
            errors.append(err)

        print("MIN_EPOCH: " + str(min_it))
        n_epochs.append(min_it)

    return n_epochs

def finalTrainAndTest():
    n_epochs = 50
    net = Net()
    net.cuda()    
    optimizer = optim.Adam(net.parameters(), lr=0.0001)
    criterion = nn.NLLLoss()
    #Test for number of epochs we found with above function
    for i in range(n_epochs):
        print("Epoch: " + str(i))
        lb = 0
        ub = 10
        batch_s = 10
        while ub <= len(X_train):
            optimizer.zero_grad() 
            output = net(X_train[lb: ub])
            loss = criterion(output, Y_train[lb: ub])
            loss.backward()
            optimizer.step()
            lb += batch_s
            ub += batch_s
        
        num_correct = 0
        val_guess = net(X_train)

        for j in range(len(Y_train)):
            if torch.argmax(val_guess[j]) == Y_train[j]:
                num_correct += 1

        err = 1 - (num_correct / len(Y_train))


        print("Epoch: " + str(i) + ": " + str(err))

    lb = 0
    ub = 10
    batch_s = 10
    Y_test_pred = []
    while ub <= len(X_test): 
        Y_test = net(X_test[lb:ub])
        lb += batch_s
        ub += batch_s
        for pred in Y_test:
            Y_test_pred.append(torch.argmax(pred))
    with open('cnn_submission.csv', mode='w', newline='') as sub:
        sub_writer = csv.writer(sub, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

        sub_writer.writerow(['ImageId', 'Label'])    


        for i in range(len(Y_test_pred)):
            sub_writer.writerow([str(i + 1), str(Y_test_pred[i].item())])
    
    print("Submission csv written.")
    

#n_epochs = kFoldValidation()
#print("Following were the best epoch vals: ")
#print(n_epochs)
finalTrainAndTest()
