#!/bin/bash

branch=$1

if [ $branch = "master" ]
then
        dir="prod"
else
        dir="dev"
fi

echo `echo deployment in /var/www/ci/$dir`
ssh jenkins@localhost rm -rf /var/www/ci/$dir/*
scp -r dist/demo-app/* jenkins@localhost:/var/www/ci/$dir
