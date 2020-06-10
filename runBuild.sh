#!/bin/bash
PRE_PWD=$(pwd)

echo "Building main.go ..."

mkdir -p bin

go build -o $PRE_PWD/bin/app main.go

echo "Done."
