#!/bin/bash

ssh-keyget -t rsa -N "" -f ~/.ssh/id_rsa

for sshdst in "$@"; do
    ssh $sshdst "touch ~/.ssh/authorized_keys; $(cat ~/.ssh/id_rsa.pub) >> ~/.ssh/authorized_keys" 
done