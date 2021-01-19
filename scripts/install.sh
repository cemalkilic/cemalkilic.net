#!/bin/bash

set -x

# Needed for SSH deployment key
openssl aes-256-cbc -K $encrypted_2c79ac5bd99c_key -iv $encrypted_2c79ac5bd99c_iv -in deploy-key.enc -out deploy-key -d
rm deploy-key.enc
chmod 600 deploy-key
mv deploy-key ~/.ssh/id_rsa

# Install hugo
url=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | sed -r -n '/browser_download_url/{/Linux-64bit.deb/{s@[^:]*:[[:space:]]*"([^"]*)".*@\1@g;p;q}}')
echo $url # verbose mode :)
curl -OLkSs $url
sudo dpkg -i hugo*.deb
