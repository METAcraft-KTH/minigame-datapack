#!/usr/bin/env bash
source .venv/bin/activate
beet build
cling -std=c++23 generate_items.cpp
