#! /bin/bash

mvn clean

# Note: I tried to do the following, but it seems to be passing the
# extra options only to the Java process that is running the Maven
# build overall, not the Java process that runs the compile-clojure
# step.  I haven't figured out how to do that with Maven yet.  I
# switched to doing it with ant after discovering how to do that.  See
# files clojure-dbg2-*.sh

export LD_LIBRARY_PATH="${HOME}/sw-java/hsdis/linux:${LD_LIBRARY_PATH}"
export MAVEN_OPTS="-XX:+UnlockDiagnosticVMOptions -XX:+PrintAssembly"
#mvn --log-file mvn-log.txt --debug -Dmaven.test.skip=true package
mvn -Dmaven.test.skip=true package
