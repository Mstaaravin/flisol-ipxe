#!/bin/sh

# Don't touch the user's keyring, have our own instead
# export GNUPGHOME=/home/cmiranda/.keyrings
#		--no-check-gpg \
#		--ignore-release-gpg \
#		--ignore-release-gpg \
#		--getcontents \
#		--diff=use \
#		--i18n \
#		--exclude='/Translation-.*\.bz2$' \
#		--include='/Translation-en.*\.bz2$' \
#		--include='/Translation-es.*\.bz2$' \

# Architecture (i386, powerpc, amd64, etc.)
arch=i386,amd64

# Section (main,contrib,non-free)
section=main,main/debian-installer,contrib,contrib/debian-installer,non-free,non-free/debian-installer

# Release of the system (wheezy,jessie,stable,testing,etc)
release=torbellino,mate-torbellino

# Server name, minus the protocol and the path at the end
server=repo.huayra.conectarigualdad.gob.ar

# Path from the main server, so http://my.web.server/$dir, Server dependant
inPath=/huayra-repo

# Protocol to use for transfer (http, ftp, hftp, rsync)
proto=rsync

# Directory to store the mirror in
outPath=/home/mirrors/huayra

# Start script
debmirror       -a $arch \
                --no-source \
		--md5sums \
		--verbose \
                --no-check-gpg \
                --ignore-release-gpg \
                -s $section \
                -h $server \
                -d $release \
                -r $inPath \
                -e $proto \
                $outPath
