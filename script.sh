#!/bin/bash

GIT_URL="ssh://git@stash.b-i.com:7999/ass/devops.git"
GIT_BRANCH="production" 
GIT_FOLDER="devops"
GIT_HOST="stash.b-i.com"
GIT_PORT="7999"

##########REQUIREMENTS########

sudo apt-get update; sudo apt-get install -y -q git build-essential libssl-dev libffi-dev liblzma-dev python-dev python-pip python-setuptools sshpass virtualbox tree locate

#######GIT##############

echo $PWD
echo $USER

chmod 400 /home/ubuntu/.ssh/repo_key
ssh-add /home/ubuntu/.ssh/repo_key

ssh-keyscan -p $GIT_PORT $GIT_HOST > ~/.ssh/known_hosts
ssh-keyscan -p $GIT_PORT $GIT_HOST > /home/ubuntu/.ssh/known_hosts


cd /home/ubuntu
git clone --verbose --recursive $GIT_URL -b $GIT_BRANCH

chown -R ubuntu:ubuntu devops/

cd /home/ubuntu/devops
 
sudo $(which pip) install -U 'ansible==2.3' awscli boto boto3 scripts-bi/  # mind the /

#######RUN LOCAL DEPLOY#########
#./run local deploy
