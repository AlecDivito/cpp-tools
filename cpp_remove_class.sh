#!/bin/bash

if [ $# -eq 0 ] 
then
	echo "Please supply a class name"
	exit 1
fi

SCRIPT_HOME="$(dirname "$0")"

RAW_FILE="$1"
FOLDER=`pwd`
NAME="$(tr '[:lower:]' '[:upper:]' <<< ${RAW_FILE:0:1})${RAW_FILE:1}"
SRC="$FOLDER/src/$NAME.cpp"
INC="$FOLDER/inc/$NAME.h"
HOME=$(echo ~)
TRASH="$SCRIPT_HOME/trash/"

# create trash folder if it doesn't exist
if [ ! -d "$TRASH" ]
then
	mkdir "$TRASH"
fi

# try and find the class
if [ -e $SRC ] && [ -e $INC ] 
then
	mv $(echo $SRC $INC $TRASH)
	echo "Successfully deleted $NAME from your project"
	exit 0;
elif [ -e "$FOLDER/src/$RAW_FILE.cpp" ] && [ -e "$FOLDER/inc/$RAW_FILE.h" ]
then
	echo "$FOLDER/src/$RAW_FILE.cpp" "$FOLDER/inc/$RAW_FILE.h" $TRASH
	mv $(echo "$FOLDER/src/$RAW_FILE.cpp" "$FOLDER/inc/$RAW_FILE.h" $TRASH) 
	echo "Successfully deleted $RAW_FILE from your project"
	exit 0;
fi

echo "Can't remove c++ class $NAME because it doesn't exists"
