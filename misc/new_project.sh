#!/bin/bash

new_project() {
  mkdir "$1"
  cd "$1"
  touch .gitignore
  git init
  git add .gitignore
  git commit -m "initial commit"
}