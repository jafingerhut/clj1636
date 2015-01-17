#! /bin/bash

if [ $# -lt 1 ]
then
    1>&2 echo "usage: `basename $0` <num-repetitions>"
    exit 1
fi
NTRIALS="$1"

ROOT=`pwd`
if [ -d clojure ]
then
    echo "Skipping getting of Clojure from github, since it appears you already have it."
else
    git clone git@github.com:clojure/clojure.git
fi
cd clojure
git checkout f437b853adeaffc5cad9bb1e01e2355357a492c9
${ROOT}/bin/repeat.sh ${NTRIALS} ${ROOT}/bin/clojure-1trial.sh
