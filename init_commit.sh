#!/bin/bash
sudo git init 
sudo git remote add origin $1
sudo git add .
sudo git commit -m "Initial commit"
sudo git push origin master