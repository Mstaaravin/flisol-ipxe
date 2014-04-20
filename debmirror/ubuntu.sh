#!/bin/sh

# Don't touch the user's keyring, have our own instead
# export GNUPGHOME=/home/cmiranda/.keyrings

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
section=main,main/debian-installer,main/installer-amd64,main/installer-i386,multiverse,multiverse/debian-installer,universe,universe/debian-installer,restricted,restricted/debian-installer

# Release of the system (squeeze,lenny,stable,testing,etc)
release=precise,precise-security,precise-updates,precise-backports,saucy,saucy-security,saucy-updates,saucy-backports,trusty,trusty-security,trusty-updates,trusty-backports

# Server name, minus the protocol and the path at the end
server=mirrors.kernel.org

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
                --di-dist=precise,precise-updates,saucy,saucy-updates,trusty,trusty-updates \
                --di-arch=i386,amd64 \
		-s $section \
		-h $server \
		-d $release \
		-r $inPath \
		-e $proto \
		$outPath
