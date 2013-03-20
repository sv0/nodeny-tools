noauth.sh
============
Web authentification script for Nodeny billing system.
The script can be useful for users of those internet providers which use [Nodeny](http://nodeny.info) as their billing system.
Especially it is widespread in Ukraine and some ex USSR countries.
The script was developed for use on my AirOS powered Ubiquiti NanoBridge M2.
Also it will run on any linux distro.
The script is standalone; simply install it anywhere in your $PATH or use full path.

Requirements
------------
md5sum, wget, awk, sh.

Usage
-----
    $ /bin/sh noauth.sh billing.host username password

Installation
------------
NanoBridge example.  
Copy noauth.sh to your device:
    $ scp noauth.sh admin@192.168.1.1:/etc/persistent/

Log in your device:
    $ ssh admin@192.168.1.1
    XM.v5.3.3# echo "/bin/sh /etc/persistent/noauth.sh billing.host user password &" \
        >> /etc/persistent/rc.poststart
    XM.v5.3.3# cfgmtd -w -p /etc

