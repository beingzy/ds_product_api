""" create a predict function (KNN) 

Author: Yi Zhang <beingzy@gmail.com>
Date: 2016/04/11
"""
import numpy as np
from sklearn import datasets
from sklearn.neighbors import KNeighborsClassifier


def predict(input_features):

    iris = datasets.load_iris()

    knn = KNeighborsClassifier()
    knn.fit(iris.data, iris.target)

    predict_int = knn.predict(input_features)

    map_int_str = {0: "setosa", 1: "versicolor", 2: "virginica"}

    if predict_int in [0, 1, 2]:
        predict_label = map_int_str[predict_int[0]]
    else:
        predict_label = 'null'

    return predict_label


#if __name__ == "__main__":
#    input_obs = np.array([ 5.1,  3.5,  1.4,  0.2]).reshape(1, -1)
#    print(predict(input_obs))