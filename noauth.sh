#!/bin/sh
HOST=$1
USERNAME=$2
PASSWORD=$3

SCHEMA="http"
URI="/cgi-bin/stat.pl"
URL="$SCHEMA://$HOST$URI"

get_ses()
{
    echo `wget -q -O- $URL | grep -oE -e "([[:digit:]]{5,7})"`
}

md5hash()
{
    # $1 - ses (session key)
    # $2 - PASSWORD
    echo -n "$1 $2" | md5sum - | awk '{print $1}'
}

if [[ $1 == '-h' || $1 == '--help' ]];
then
    echo "Nodeny web authentication."
    echo "Usage:" `basename $0` "HOST USERNAME PASSWORD"
    echo ""
    exit 0
fi

SES=`get_ses`;
PP=`md5hash $SES $PASSWORD`

while true;
do
    auth_result=`wget -q -O- "$URL?uu=$USERNAME&a=98&pp=$PP"`;
    echo $auth_result | grep -q 'meta http-equiv="refresh"' 
    if [ 0 -ne $? ];
    then
        # it seems that ses key was expired
        # get new ses and pp
        SES=`get_ses`;
        PP=`md5hash $SES $PASSWORD`
    fi;
    sleep 40;
done;
