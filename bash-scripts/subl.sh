#!/bin/bash

################################################################################
#          FILE:  subl.sh
#   DESCRIPTION:  Sublime Text 2 helper command
################################################################################

FILE=$1
SUBL_DIR="Sublime Text 2"
SUBLIME_CMD=/usr/lib/$SUBL_DIR/sublime_text

if [ -z "$FILE" ]
 then
    "$SUBLIME_CMD" &
 else
    "${SUBLIME_CMD}" $FILE &

fi
