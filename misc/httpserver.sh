#!/bin/bash

httpserver() {
    python -m SimpleHTTPServer ${1:-8000}  # Static HTTP server on localhost:8000 (or pass it a port)
}