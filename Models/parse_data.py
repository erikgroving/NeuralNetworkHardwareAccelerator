import torch.utils.data as data_utils
import torch
import numpy as np
import pandas as pd

def loadData(train_filename, test_filename, device):
    train = pd.read_csv(train_filename, skiprows=0).values
    trainX = train[:, 1:].reshape(train.shape[0],1,28, 28).astype( 'float32' )
    X_train = trainX / 255.0

    y_train = train[:,0]

    print(X_train.shape)
    print(y_train.shape)


    test = pd.read_csv(test_filename, skiprows=0).values
    testX = test[:, 1:].reshape(test.shape[0],1,28, 28).astype( 'float32' )
    X_test = testX / 255.0

    y_test = test[:,0]
    #testX = test.reshape(test.shape[0],1, 28, 28).astype( 'float32' )
    #X_test = testX / 255.0
    print(X_test.shape)
    print(y_test.shape)

    X_train_tsr = torch.from_numpy(X_train)
    Y_train_tsr = torch.from_numpy(y_train)
    X_test_tsr = torch.from_numpy(X_test)
    Y_test_tsr = torch.from_numpy(y_test)

    if device == torch.device("cuda:0"):
        X_train_tsr = X_train_tsr.cuda()
        Y_train_tsr = Y_train_tsr.cuda()
        X_test_tsr = X_test_tsr.cuda()
        Y_test_tsr = Y_test_tsr.cuda()

    return X_train_tsr, Y_train_tsr, X_test_tsr, Y_test_tsr
