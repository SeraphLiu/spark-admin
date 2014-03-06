#!/bin/bash

function usage {
	echo "Usage: $0 <keyfile>"
	exit 1
}

keyfile=$1 ; [ -z "$keyfile" ] && usage

keyfile="`basename $keyfile .pem`.pem"

openssl genrsa -out $keyfile 2048 && chmod 600 $keyfile && echo "Created unencrypted key in $keyfile"

"`dirname $0`"/make-pub.sh $keyfile
