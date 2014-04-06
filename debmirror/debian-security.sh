#!/bin/sh

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
section=main,contrib,non-free

# Release of the system (squeeze,lenny,stable,testing,etc)
release=wheezy/updates

# Server name, minus the protocol and the path at the end
# server=ftp.debian.org
server=security.debian.org

# Path from the main server, so http://my.web.server/$dir, Server dependant
inPath=/debian-security

# Protocol to use for transfer (http, ftp, hftp, rsync)
proto=rsync

# Directory to store the mirror in
outPath=/home/mirrors/debian-security

# Start script

debmirror	-a $arch \
		--no-source \
		--md5sums \
		--verbose \
		--getcontents \
		--dif=mirror \
		--no-check-gpg \
		--ignore-release-gpg \
		-s $section \
		-h $server \
		-d $release \
		-r $inPath \
		-e $proto \
		$outPath
