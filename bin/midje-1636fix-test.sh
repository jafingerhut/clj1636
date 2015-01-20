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
# Get the first version with the fix for CLJ-1636
git checkout f437b853adeaffc5cad9bb1e01e2355357a492c9
git diff .
# Built it and install it locally.  It will be called
# clojure-1.7.0-master-SNAPSHOT in your local Maven repo
mvn install

cd ${ROOT}
if [ -d Midje/.git ]
then
    echo "Skipping getting of Midje from github, since it appears you already have it."
else
    git clone git@github.com:marick/Midje.git
fi
cd Midje
git checkout e98cf87
git diff .
# Copy over a project.clj that is nearly the same, except it uses
# Clojure 1.7.0-master-SNAPSHOT for the profile named 1.7 instead of
# 1.7.0-alpha5
/bin/cp ${ROOT}/bin/midje-17snapshot-project.clj project.clj

${ROOT}/bin/repeat.sh ${NTRIALS} ${ROOT}/bin/midje-1trial.sh
