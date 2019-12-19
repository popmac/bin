#!/bin/bash

branch=`git symbolic-ref --short HEAD`

function execute() {
  git checkout master && git fetch --all --prune && git merge origin/master && git branch -d ${branch} && git push heroku master
}

if [ $branch != master ]; then
  execute
else
  echo 'masterブランチにいるため実行できません'
  exit 1
fi
