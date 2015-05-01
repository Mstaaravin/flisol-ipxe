#!/bin/sh

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
section=main,multiverse,universe,upstream,upstream/debian-installer,backport,import,romeo,romeo/debian-installer

# Release of the system (wheezy,jessie,stable,testing,etc)
release=rebecca

# Server name, minus the protocol and the path at the end
server=mirrors.kernel.org

# Path from the main server, so http://my.web.server/$dir, Server dependant
inPath=/linuxmint-packages

# Protocol to use for transfer (http, ftp, hftp, rsync)
proto=http

# Directory to store the mirror in
outPath=/home/mirrors/linuxmint

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
