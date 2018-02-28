#!/bin/sh

set -e

if [ $# -ne 1 ]; then
  printf "Usage: $(basename $0) dest-dir"
  exit 1
fi

dstdir=$1

[ -d $dstdir ] || mkdir -p $dstdir

rm -f $dstdir/*
cp  COPYING tl/expected.hpp $dstdir

{
  git remote -v | gawk '/^origin.*\(fetch\)$/{ print $2; exit(0); }';
  printf '\n'
  git log -1
} > $dstdir/version.txt
