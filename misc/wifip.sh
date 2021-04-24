#!/bin/bash

wifip() {
  ifconfig en0 | grep "inet "
}

ethip() {
  ifconfig en3 | grep "inet "
}
