#!/bin/bash

# generate a random password - default length is 16, can be specified as an argument
gimmepassword() {
    LC_CTYPE=C < /dev/urandom tr -dc [:alnum:] | head -c ${1:-16} #password
    if [ -t 1 ]; then echo; fi #newline if terminal
}