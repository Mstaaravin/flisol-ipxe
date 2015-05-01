#!/bin/sh

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
# section=main,main/debian-installer,main/installer-amd64,main/installer-i386,multiverse,multiverse/debian-installer,universe,universe/debian-installer,restricted,restricted/debian-installer
# section=main,multiverse,universe,restricted
section=main,main/debian-installer,multiverse,multiverse/debian-installer,universe,universe/debian-installer,restricted,restricted/debian-installer

# Release of the system (squeeze,lenny,stable,testing,etc)
release=vivid,vivid-backports,vivid-proposed,vivid-security,vivid-updates

# Server name, minus the protocol and the path at the end
server=mirrors.kernel.org
#server=ar.archive.ubuntu.com

# Path from the main server, so http://my.web.server/$dir, Server dependant
inPath=/ubuntu

# Protocol to use for transfer (http, ftp, hftp, rsync)
proto=http

# Directory to store the mirror in
outPath=/home/mirrors/ubuntu

# Start script
debmirror	-a $arch \
		--no-source \
		--md5sums \
		--verbose \
		--getcontents \
		--no-check-gpg \
		--ignore-release-gpg \
                --exclude='/Translation-.*\.bz2$' \
                --include='/Translation-en.*\.bz2$' \
                --include='/Translation-es.*\.bz2$' \
                --di-dist=vivid,vivid-proposed,vivid-updates,vivid-proposed \
                --di-arch=i386,amd64 \
		-s $section \
		-h $server \
		-d $release \
		-r $inPath \
		-e $proto \
		$outPath
