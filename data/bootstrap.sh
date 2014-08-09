#!/bin/bash

SYNC_FOLDER=/vagrant_data
GIT_REPO_NAME=sayoh
GIT_REPO_PATH=${SYNC_FOLDER}/${GIT_REPO_NAME}

# install heroku-toolbelt
heroku version
if [ $? -ne 0 ]; then
  wget -qO- https://toolbelt.heroku.com/install.sh | sh
  if [ $? -ne 0 ]; then
    echo "ERROR: Faild to install heroku-toolbelt."
  fi

  LOGIN_USER=vagrant
  BASH_PROFILE_PATH=/home/${LOGIN_USER}/.bash_profile

  grep heroku ${BASH_PROFILE_PATH}
  if [ $? -ne 0 ]; then
   echo 'PATH="/usr/local/heroku/bin:$PATH"' >> ${BASH_PROFILE_PATH}
   source ${BASH_PROFILE_PATH}
  fi
fi

# update src
if [ -d ${GIT_REPO_PATH} ]; then
  cd ${GIT_REPO_PATH}
  git pull origin master
else
  cd ${SYNC_FOLDER}
  git clone git@github.com:betahikaru/${GIT_REPO_NAME}.git
fi

# generate dotenv file
if [ ! -f ${GIT_REPO_PATH}/.env ]; then
  cd ${GIT_REPO_PATH}
  cp .env.sample .env
fi

# setup repository
cd ${GIT_REPO_PATH}
bundle update
bundle install --path vendor/bundle

# setup heroku app
## heroku login
## heroku create ${GIT_REPO_NAME}
## heroku domains:add *.heroku.betahikaru.com

# setting git repo for heroku
## heroku git:remote -a ${GIT_REPO_NAME}

# debug heroku
## heroku login
## heroku logs -t
