# !/bin/bash
# This script compiles and runs a C/C++ file
# Usage: ./c_compile.bash <filename>

filename=$1
g++ -std=c++14 $filename.cpp -o $filename && ./$filename 