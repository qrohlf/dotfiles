#!/bin/bash

# generate a random password - default length is 16, can be specified as an argument
gimmepassword() {
    cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-16} | head -n 1
}