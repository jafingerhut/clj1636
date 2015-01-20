#! /bin/bash

ant clean

export LD_LIBRARY_PATH="${HOME}/sw-java/hsdis/linux:${LD_LIBRARY_PATH}"
ant jar
