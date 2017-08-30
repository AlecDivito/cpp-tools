#!/bin/bash

# if not enough parameters given
if [ $# -eq 0 ]
then
	echo "Please supply a class name"
	exit 1
fi

RAW_FILE="$1"
FOLDER=`pwd`
NAME="$(tr '[:lower:]' '[:upper:]' <<< ${RAW_FILE:0:1})${RAW_FILE:1}"
SRC="$FOLDER/src/$NAME.cpp"
INC="$FOLDER/inc/$NAME.h"
DATE=`date`


# if file should be nested in a existing directory
if [[ $RAW_FILE =~ ^/ ]]
then
	EXTENSION="$(dirname $RAW_FILE)"
	RAW_FILE="$(basename $RAW_FILE)"
	NAME="$(tr '[:lower:]' '[:upper:]' <<< ${RAW_FILE:0:1})${RAW_FILE:1}"
	SRC="$FOLDER/src$EXTENSION/$NAME.cpp"
	INC="$FOLDER/inc$EXTENSION/$NAME.h"
	BUILD="$FOLDER/build$EXTENSION"
	if [ ! -d "$(dirname $SRC)" ] && [ ! -d "$(dirname $INC)" ]
	then
		mkdir -p "$(dirname $SRC)"
		mkdir -p "$(dirname $INC)"
		mkdir -p "$BUILD"
	fi
elif [[ $RAW_FILE =~ / ]]
then
	echo "$RAW_FILE: bad format for creating a directory and file. try starting with a /"
	exit 3
fi

if [ -e $SRC ] || [ -e $INC ]
then
    echo "Class Already exists"
    exit 2
fi

cat ~/bin/template/cpp_template_src.txt > $SRC
cat ~/bin/template/cpp_template_inc.txt > $INC

sed -i "s/\${filename}/$NAME/g" $SRC $INC
sed -i "s/\${date}/$DATE/g" $SRC $INC
