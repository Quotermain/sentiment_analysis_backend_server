import json

from flask import Flask, request
from transformers import pipeline

classifier = pipeline('sentiment-analysis')

app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
	args = request.json
	predictions = {
		value: classifier(value)
		for value in args.values()
	}
	return json.dumps(predictions)

if __name__ == "__main__":
    app.run(host='0.0.0.0')
