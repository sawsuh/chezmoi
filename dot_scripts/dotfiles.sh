#!/bin/bash
cd $1
case $2 in
    "s")
        find -P . -path "./*" \
            \( -type d -exec bash -c 'mkdir -pv "$HOME${0#.}"' {} \; \) -o \
            \( -type l -exec bash -c 'cp "$(readlink -ef $0)" "$HOME${0#.}"' {} \; \) -o \
            \( -type f -exec bash -c 'cp "$0" "$HOME${0#.}"' {} \; \);;
    "r")
        find -P $HOME \( -path "$(pwd)" -prune \) -o \
            \( -type l -exec bash -c '[[ $(readlink -ef $0) == "$(pwd)"* ]] && rm -v $0' {} \; \);;
esac
