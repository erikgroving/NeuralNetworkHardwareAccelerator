import tensorflow as tf
from tensorflow import keras
import numpy as np

#(x_train, y_train),(x_test, y_test) = null
#x_train, x_test = x_train / 255.0, x_test / 255.0
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

labels = db1[b'labels'] + db2[b'labels'] + db3[b'labels'] + db4[b'labels'] + db5[b'labels']
onehot_labels = tf.one_hot(labels, depth=10)
image_tensor = tf.convert_to_tensor(images, dtype='float32') / 255
image_tensor = tf.reshape(image_tensor, [-1, 3, 32, 32])

test_images = test_data[b'data']
test_labels = test_data[b'labels']
test_onehot_labels = tf.one_hot(test_labels, depth=10)
test_image_tensor = tf.convert_to_tensor(test_images, dtype='float32') / 255
test_image_tensor = tf.reshape(test_image_tensor, [-1, 3, 32, 32])

dataset = tf.data.Dataset.from_tensor_slices((image_tensor, onehot_labels))
dataset.batch(1)

print(image_tensor.shape)
print(onehot_labels.shape)

model = tf.keras.models.Sequential()
model.add(tf.keras.layers.Conv2D(filters = 16, 
                                    kernel_size = 3, 
                                    strides = 1,
                                    activation="relu",
                                    padding="same",
                                    data_format="channels_first"))
model.add(tf.keras.layers.MaxPool2D())
model.add(tf.keras.layers.Conv2D(filters = 32, 
                                    kernel_size = 3, 
                                    strides = 1,
                                    activation="relu",
                                    padding="same",
                                    data_format="channels_first"))
model.add(keras.layers.Flatten())
model.add(keras.layers.Dense(256, activation="relu"))
model.add(keras.layers.Dense(10, activation="softmax"))

model.compile(optimizer='adam',
              loss=tf.losses.softmax_cross_entropy,
              metrics=['accuracy'])

model.fit(image_tensor, onehot_labels, epochs=10, steps_per_epoch=50000, verbose=1)
model.evaluate(test_image_tensor, test_onehot_labels, verbose=1)