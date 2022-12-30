import scipy # This is new!
import tensorflow as tf
from keras.preprocessing.image import ImageDataGenerator
import pickle
import requests
import numpy as np
from keras.preprocessing import image 
from keras.models import model_from_json
from flask import Flask, request,jsonify

app=Flask(__name__)


@app.route('/mri',methods=['GET'])
def returnMriResult():
    imputUrl=str(request.args['query'])
    # load json and create model
    json_file = open('BrainMriModel.json', 'r')
    loaded_model_json = json_file.read()
    json_file.close()
    loaded_model = model_from_json(loaded_model_json)
    # load weights into new model
    loaded_model.load_weights("model.h5")
   
    img_url = imputUrl
    response = requests.get(img_url)
    if response.status_code:
        fp = open('mri.jpg', 'wb')
        fp.write(response.content)
        fp.close()
    else:
        return img_url
    test_image=tf.keras.utils.load_img(
        'mri.jpg',
        target_size=(64,64),
    )
    test_image=tf.keras.utils.img_to_array(test_image)
    test_image=np.expand_dims(test_image,axis=0)
    result=loaded_model.predict(test_image)
    # training_set.class_indices
    if(result[0][0]):
        return 'yes'
    else:
        return 'no'

if __name__ == "__main__":
    app.run()