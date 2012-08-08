#! /bin/bash

# fail fast
set -e

WORK_DIR=/tmp/buildpack-lumbar
NODE_PACKAGE=$1

LUMBAR_VERSION=`npm info lumbar | grep version: | sed "s/.*version: '\(.*\)'.*/\1/"`
LUMBAR_PACKAGE=lumbar-$LUMBAR_VERSION.tgz

rm -rf $WORK_DIR
mkdir -p $WORK_DIR
pushd $WORK_DIR

tar zxf $NODE_PACKAGE
cd lib/node_modules
npm install lumbar

popd

if [ -e $LUMBAR_PACKAGE ]; then
  rm $LUMBAR_PACKAGE
fi
echo $WORK_DIR
COPYFILE_DISABLE=1 tar \
    --exclude "*/lumbar/docs/**" \
    --exclude "*/lumbar/test/**" \
    --exclude "*/htmlparser/tests/**" \
    --exclude "*/htmlparser/testdata/**" \
    --exclude "*/jsdom-nocontextifiy/test/**" \
    --exclude "*/nib/iconic/**" \
    --exclude "*/nib/test/**" \
    --exclude "*/npm/doc/**" \
    --exclude "*/npm/html/**" \
    --exclude "*/npm/man/**" \
    --exclude "*/npm/test/**" \
    --exclude "*/request/tests/**" \
    --exclude "*/stylus-images/test/**" \
    --exclude "*/uglify-js/test/**" \
    --exclude "*/uglify-js/tmp/**" \
    -cvz -f $LUMBAR_PACKAGE -C $WORK_DIR .
