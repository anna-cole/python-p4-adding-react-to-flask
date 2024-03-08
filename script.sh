#!/bin/bash

# change permission by running chmod +x script.sh
# run the script ./script.sh

pipenv install
pipenv shell 
cd server 
exec bash

export FLASK_APP=app.py
export FLASK_RUN_PORT=5555

flask db upgrade
python seed.py
python app.py
cd ..
exec bash

npm install --prefix client
npm start --prefix client
exec bash