#!/bin/bash

# Exit early on errors
set -eu

# Python buffers stdout. Without this, you won't see what you "print" in the Activity Logs
export PYTHONUNBUFFERED=true

# Install Python 3 virtual env
VIRTUALENV=.data/venv

if [ ! -d $VIRTUALENV ]; then
  python3 -m venv $VIRTUALENV
fi

# Ensure pip is installed and up to date
$VIRTUALENV/bin/python3 -m pip install --upgrade pip

# Install the requirements
$VIRTUALENV/bin/pip install -r requirements.txt

# Run a glorious Python 3 server
$VIRTUALENV/bin/python3 app.py
