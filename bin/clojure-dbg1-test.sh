#! /bin/bash

if [ $# -lt 1 ]
then
    1>&2 echo "usage: `basename $0` <num-repetitions>"
    exit 1
fi
NTRIALS="$1"

ROOT=`pwd`
if [ -d clojure/.git ]
then
    echo "Skipping getting of Clojure from github, since it appears you already have it."
else
    git clone git@github.com:clojure/clojure.git
fi
cd clojure
git checkout clojure-1.7.0-alpha5
git diff .
${ROOT}/bin/repeat.sh ${NTRIALS} ${ROOT}/bin/clojure-dbg1-1trial.sh
