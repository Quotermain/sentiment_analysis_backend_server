import json

from flask import Flask, request
from transformers import pipeline

classifier = pipeline('sentiment-analysis')

app = Flask(__name__)
#app.config["DEBUG"] = True

@app.route('/predict', methods=['POST'])
def predict():
	print('Test')
	args = request.json
	labels = classifier(args['text'])
	return json.dumps({'predictions': labels})

if __name__ == "__main__":
    app.run(host='0.0.0.0')

'''print(classifier('We are very happy to introduce pipeline to the transformers repository.'))
print(classifier('Don"t push on me.'))
print(classifier("I don't know"))'''