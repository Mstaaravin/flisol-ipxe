#!/bin/sh

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
section=main,main/debian-installer,multiverse,multiverse/debian-installer,universe,universe/debian-installer,restricted,restricted/debian-installer

# Release of the system (squeeze,lenny,stable,testing,etc)
release=precise,precise-security,precise-updates,precise-backports,saucy,saucy-security,saucy-updates,saucy-backports

# Server name, minus the protocol and the path at the end
server=us.archive.ubuntu.com

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
		--di-dist=precise \
		--di-arch=i386,amd64 \
		-s $section \
		-h $server \
		-d $release \
		-r $inPath \
		-e $proto \
		$outPath
