#!/bin/bash

SCRIPT_HOME="$(dirname "$0")"

if [ $# -eq 0 ]
then
	echo "Please provide one argument for the name of the project"
	exit 1
fi

if [ -d "$1" ] 
then
	echo "Project name:$1 is already taken, please choose another one"
	exit 2
fi

mkdir "$1"
cd    "$1"
mkdir inc test src bin lib build
touch Readme.txt Makefile src/main.cpp

echo "
#include <iostream>

int main(int argc, char const *argv[])
{
    /* code */
    return 0;
}
" > src/main.cpp

cat "$SCRIPT_HOME/template/cpp_template_makefile.txt" > Makefile 

echo "cpp Project Successfully created"
echo "Please cd into your new project (cd $1)"
