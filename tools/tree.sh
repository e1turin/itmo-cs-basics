#!/usr/bin/bash
path=$1
if [ -z "$path"]
then
    path=.
fi

find $path | sed -e 's;[^/]*/;∟____;g;s;____∟; |;g'
