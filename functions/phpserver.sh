#!/bin/bash

phpserver() {
    php -S 0.0.0.0:${1:-8000}  # Static HTTP server on localhost:8000 (or pass it a port)
}
