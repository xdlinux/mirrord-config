#!/bin/bash

export GNUPGHOME=/home/keyrings/deb-multimedia

arch=i386,amd64

section=main,non-free

release=jessie,jessie-backports,stretch

server=mirrors6.tuna.tsinghua.edu.cn
#server=mirrors6.ustc.edu.cn

inPath=/debian-multimedia

proto=http

outPath=/srv/mirrors/debian-multimedia

debmirror       -a $arch \
                --source \
                -s $section \
                -h $server \
                -d $release \
                -r $inPath \
                --progress \
                --method=$proto \
                $outPath \
                --i18n \
                --check-gpg \
                --postcleanup \
                --diff=mirror \
                --allow-dist-rename \
                --include='/Translation-.*\.bz2$' \
                --exclude='/Translation-.*$'
