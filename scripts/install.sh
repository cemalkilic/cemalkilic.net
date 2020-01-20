#!/bin/bash

set -x

# Needed for SSH deployment key
openssl aes-256-cbc -K $encrypted_2c79ac5bd99c_key -iv $encrypted_2c79ac5bd99c_iv -in deploy-key.enc -out deploy-key -d
rm deploy-key.enc
chmod 600 deploy-key
mv deploy-key ~/.ssh/id_rsa
