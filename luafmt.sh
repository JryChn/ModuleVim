#!/bin/bash
function getdir(){
    for file in $1/*
    do
    if test -d $file 
    then
        if test ! -f $file
        then
            for luaf in $file/*.lua
            do lua  luafmt/luafmt.lua --f $luaf [max column hint=80]
            done
            getdir $file
        fi
    fi
    done
}
if test -d luafmt
then
    cd luafmt
    echo 'luafmt exists, start to update'
    git pull
    cd ..
else
    cd luafmt
    echo 'luafmt does not exist, try to download....'
    git clone https://github.com/CurtisFenner/luafmt
    if [ $? == 0 ]
    then
    chmod 755 luafmt
    fi
fi
    getdir .
    rm luafmt -rf
