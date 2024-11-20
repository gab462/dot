#!/usr/bin/env bash

# https://github.com/njlr/portable-cxx

export DIR=$(dirname "$0")
export MUSL_ROOT=$DIR/musl-1.2.5/usr

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DIR/ncurses-compat-libs-6.4-12.20240127.fc40.x86_64/usr/lib64:$DIR/musl-1.2.5/usr/lib

export PATH=$DIR/bin:$PATH

run_cc() {
    if [[ "$@" =~ "--target=wasm32" ]]; then
        export OBJ=""
        export LD=""
        export LIBC=""
    else
        export OBJ=$MUSL_ROOT/lib/crt1.o
        export LD="-fuse-ld=lld"
        export LIBC="-nostdinc -nostdlib -nodefaultlibs -static --sysroot $MUSL_ROOT -isystem "$MUSL_ROOT/include" -I "$MUSL_ROOT/include" -lc"
    fi

    $DIR/clang+llvm-18.1.8-x86_64-linux-gnu-ubuntu-18.04/bin/clang $LD $OBJ $@ $LIBC 
}

export -f run_cc

bash
