# clj1636

Some documentation and code for investigating the cause of the very
strange behavior seen while investigating Clojure ticket
[CLJ-1636](http://dev.clojure.org/jira/browse/CLJ-1636).

## Usage

Methods known so far that can sometimes reproduce the problem, but
none are known to reproduce it 100% of the time.

### Reproducing the problem via running Midje

One-time setup:

    $ git clone git@github.com:marick/Midje.git 
    $ cd Midje 
    $ git checkout e98cf87 

Each time you want to run another trial that may reproduce the
problem:

    $ lein clean
    $ lein with-profile 1.7 midje 

If the problem occurs, there will be an exception whose output looks
similar to this:

The problem does not occur every time, so you may see no exception.

### Reproducing the problem via building Clojure

One-time setup:

    $ git clone git@github.com:clojure/clojure.git
    $ cd clojure
    $ git checkout clojure-1.7.0-alpha5

For each trial:

    $ mvn clean
    $ mvn -Dmaven.test.skip=true package

The last command compiles Clojure, but skips running the tests.  An
exception during compilation indicates you have hit the problem, which
should look similar to the one below.  No exception indicates the
problem did not occur.

## License

Copyright © 2015 Andy Fingerhut and other Clojure contributors

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.
