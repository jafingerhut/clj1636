#! /bin/bash

if [ $# -lt 1 ]
then
    1>&2 echo "usage: `basename $0` <num-repetitions>"
    exit 1
fi
NTRIALS="$1"

ROOT=`pwd`
if [ -d Midje/.git ]
then
    echo "Skipping getting of Midje from github, since it appears you already have it."
else
    git clone git@github.com:marick/Midje.git
fi
cd Midje
git checkout e98cf87
${ROOT}/bin/repeat.sh ${NTRIALS} ${ROOT}/bin/midje-1trial.sh
