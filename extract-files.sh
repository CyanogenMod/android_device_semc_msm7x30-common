#!/bin/bash

VENDOR=semc
BOARD=msm7x30-common

BASE=../../../vendor/$VENDOR/$BOARD/proprietary

while getopts ":nh" options
do
  case $options in
    n ) NC=1 ;;
    h ) echo "Usage: `basename $0` [OPTIONS] "
        echo "  -n  No cleanup"
        echo "  -h  Show this help"
        exit ;;
    * ) ;;
  esac
done

if [ "x$NC" != "x1" ];
then
    rm -rf $BASE/*
fi

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    # Split the file from the destination (format is "file[:destination]")
    OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
    FILE=${PARSING_ARRAY[0]}
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
