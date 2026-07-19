#! /bin/bash

set -e

marp --theme-set ~/marp-themes/ --theme tryout.css Intro-to-Python.md --pdf --allow-local-files
