#!/bin/bash

pushd $BINDIR

pushd $SRCDIR/tools/src

rm /bin/sh
ln -s /bin/bash /bin/sh
if PERLFLAGS="-A libs=-lm -A libs=-ldl" ./buildtools
then
	echo "Build SUCCESS"
else
	echo "Build FAIL"
fi
rm /bin/sh
ln -s /bin/dash /bin/sh
popd

popd
