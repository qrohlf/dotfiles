#!/bin/bash
# avoid cd ../../../
# instead, go "up up up"

up() {
  cd ../ && $@;
}