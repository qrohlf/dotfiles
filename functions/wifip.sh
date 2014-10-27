#!/bin/bash

wifip() {
  ifconfig en0 | grep "inet "
}