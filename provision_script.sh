#!/usr/bin/bash
if [ -d "/home/jenkins/sentiment_analysis_backend_server/" ]
then
  cd sentiment_analysis_backend_server
  git pull -f
  echo "Pulled"
else
  git clone https://github.com/Quotermain/sentiment_analysis_backend_server
  cd sentiment_analysis_backend_server
  echo "Cloned"
fi

git checkout "$1"
sudo pkill gunicorn
gunicorn --bind 0.0.0.0:5000 wsgi:app --daemon

echo test
echo "$1"
