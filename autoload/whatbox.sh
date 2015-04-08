#!/bin/bash

whatbox() {
  rsync -azvP --inplace "silesm@libra.whatbox.ca:$1" ~/Downloads
}