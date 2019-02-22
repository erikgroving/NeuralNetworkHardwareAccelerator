import torch
import numpy as np

def unpickle(file):
    import pickle
    with open(file, 'rb') as fo:
        dict = pickle.load(fo, encoding='bytes')
    return dict

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
images /= 255

labels = db1[b'labels'] + db2[b'labels'] + db3[b'labels'] + db4[b'labels'] + db5[b'labels']
