#!/bin/bash

pushd $BINDIR

if [ ! -d $SRCDIR ]
then
	echo "[Error] spec source code not found under $SRCDIR"
	exit 1
fi

pushd $SRCDIR
patch -p1 < ../../patch/for-ubuntu16.04.patch
patch -p1 < ../../patch/for-ubuntu18.04.patch
popd

popd
