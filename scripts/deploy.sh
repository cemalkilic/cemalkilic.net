#!/bin/bash

set -x

if [ $TRAVIS_BRANCH == "master" ] ; then
    
    # initialize the git repo in public folder and push it to server
    cd public
    git init
    
    git remote add deploy "deploy@deploy.cemalkilic.net:/var/www/cemalkilic.net"
    git config user.name "Travis CI"
    git config user.email "cemalkilic96+travis@gmail.com"

    git add .
    git commit -m "Deploy"
    git push --force deploy master
else
    echo "Not deploying, branch is '$TRAVIS_BRANCH'"
fi
