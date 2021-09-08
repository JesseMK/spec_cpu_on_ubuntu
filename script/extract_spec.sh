#!/bin/bash

pushd $BINDIR

TMPMNT=tmnt
TARGET=$SRCDIR

if [ ! -f $SPECIMG ]
then
	echo "SPEC CPU image $SPECIMG not found under $BINDIR/"
	exit 1
fi

mkdir $TMPMNT
mount -o loop $SPECIMG ./$TMPMNT/
mkdir $TARGET
cp -R ./$TMPMNT/* $TARGET/
umount ./$TMPMNT
rm -fr ./$TMPMNT/

popd
