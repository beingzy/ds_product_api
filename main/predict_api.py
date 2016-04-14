""" serve KNN model via API

Author: Yi Zhang <beingzy@gmail.com>
Date: 2016/04/11
"""
from flask import Flask 
from flask_restful import Resource, Api 
from flask_restful import reqparse
import knn_predict

app = Flask(__name__)
api = Api(app)


class Prediction(Resource):

    def get(self):

        parser = reqparse.RequestParser()
        parser.add_argument('slength', type=float, help="slength cannnot be converted")
        parser.add_argument('swidth', type=float, help="swidth cannnot be converted")
        parser.add_argument('plength', type=float, help="plength cannnot be converted")
        parser.add_argument('pwidth', type=float, help="pwidth cannnot be converted")
        args = parser.parse_args()

        prediction = knn_predict.predict([
        	    args["slength"],
        	    args["swidth"],
        	    args["plength"],
        	    args["pwidth"]
        	])

        print( "THE PREDICTION IS: {}".format(prediction) )

        res = {"slength": args["slength"],
               "swidth": args["swidth"], 
               "plength": args["plength"],
               "pwidth": args["pwidth"],
               "species": prediction}
        return res


api.add_resource(Prediction, '/prediction')

if __name__ == "__main__":
	app.run(debug=False)
