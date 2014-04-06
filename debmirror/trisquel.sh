#!/bin/sh

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
section=main,main/debian-installer,extras,extras/debian-installer

# Release of the system (wheezy,jessie,stable,testing,etc)
release=toutatis,toutatis-backports,toutatis-security,toutatis-updates

# Server name, minus the protocol and the path at the end
server=us.archive.trisquel.info

# Path from the main server, so http://my.web.server/$dir, Server dependant
inPath=/trisquel

# Protocol to use for transfer (http, ftp, hftp, rsync)
proto=http

# Directory to store the mirror in
outPath=/home/mirrors/trisquel

# Start script
debmirror       -a $arch \
                --no-source \
		--md5sums \
		--verbose \
		--getcontents \
		--diff=mirror \
                --no-check-gpg \
                --ignore-release-gpg \
                -s $section \
                -h $server \
                -d $release \
                -r $inPath \
                -e $proto \
                $outPath
