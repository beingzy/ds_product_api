""" serve KNN model via API

Author: Yi Zhang <beingzy@gmail.com>
Date: 2016/04/11
"""
from flask import Flask 
from flask_restful import Resource, Api 
from flask_restful import reqparse
from utils import knn_predict
import numpy as np

app = Flask(__name__)
api = Api(app)


class HelloPage(Resource):
     
    def get(self):
        return "Hello, World!"


class Prediction(Resource):

    def get(self):

        parser = reqparse.RequestParser()
        parser.add_argument('slength', type=float, help="slength cannnot be converted")
        parser.add_argument('swidth', type=float, help="swidth cannnot be converted")
        parser.add_argument('plength', type=float, help="plength cannnot be converted")
        parser.add_argument('pwidth', type=float, help="pwidth cannnot be converted")
        args = parser.parse_args()
        
        # organize input data as an array with a single sample
        x = np.array([
        	    args["slength"],
        	    args["swidth"],
        	    args["plength"],
        	    args["pwidth"]
        	]).reshape(1, -1)
        
        prediction = knn_predict.predict(x)

        print( "THE PREDICTION IS: {}".format(prediction) )

        res = {"slength": args["slength"],
               "swidth": args["swidth"], 
               "plength": args["plength"],
               "pwidth": args["pwidth"],
               "species": prediction}
        return res


api.add_resource(HelloPage, '/')
api.add_resource(Prediction, '/prediction')

if __name__ == "__main__":
	app.run(debug=False)
