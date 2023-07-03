#!/bin/bash

sudo rm -rf tmp/
sudo docker-compose run app bundle
sudo docker-compose up -d 

sudo docker-compose run app rails db:create
sudo docker-compose run app rails db:migrate
sudo docker-compose run app rails db:seed
