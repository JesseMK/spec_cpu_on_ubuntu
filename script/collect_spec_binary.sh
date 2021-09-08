#!/bin/bash

pushd $BINDIR

pushd $SRCDIR/tools/src

for i in $(find -executable -type f) ; do
    if [ -n "$(file $i | grep ELF)" ]; then
        cp $i $BINDIR/$(basename $i)
        echo "$i --> $BINDIR/$(basename $i)"
        objdump -s --section .comment $BINDIR/$(basename $i)
    fi
done

popd
popd