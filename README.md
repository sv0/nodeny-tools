NoDeny authorizator
===================

It is web authorization script for [Nodeny](https://ru.wikipedia.org/wiki/NoDeny) billing system.
The script was developed for using on my AirOS powered Ubiquiti NanoBridge M2.
Also it can be run on any linux distro.
The script is standalone; simply install it anywhere in your $PATH or use full path.

Requirements
------------
md5sum, wget, awk, sh.

Usage
-----
    $ /bin/sh noauth.sh billing.host username password


Installation
------------

## Ubiquiti NanoBridge M2  

Copy noauth.sh to your device:

    scp noauth.sh admin@192.168.1.1:/etc/persistent/

Add **noauth.sh** to *rc.poststart* on your device:

    echo "/bin/sh /etc/persistent/noauth.sh billing.hostname.lan user password &" \
        >> /etc/persistent/rc.poststart

Save changes to flash:

    cfgmtd -w -p /etc

