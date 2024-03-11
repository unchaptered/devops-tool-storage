#! /usr/bin/env bash

# Generate SSH Key
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@node01
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@node02