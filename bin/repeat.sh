#! /bin/bash

if [ $# -lt 2 ]
then
    1>&2 echo "usage: `basename $0` <num-repetitions> <cmd> [ <args> ...]"
    exit 1
fi

N="$1"
shift

######################################################################
# OS detection
function is_osx() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
function is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}
function get_os() {
  for os in osx ubuntu; do
    is_$os; [[ $? == ${1:-0} ]] && echo $os
  done
}
######################################################################

OS=`get_os`
set -x
uname -a
case ${OS} in
osx)
    system_profiler SPHardwareDataType SPMemoryDataType SPPowerDataType SPSoftwareDataType
    ;;
ubuntu)
    lsb_release -a
    cat /proc/cpuinfo
    cat /proc/meminfo
    ;;
*)
    echo "Unknown os: ${OS}"
    exit 1
    ;;
esac
java -version
mvn -version
ant -version
lein version
set +x

j=1
while (( $j <= $N ))
do
    echo
    echo
    echo "===== Trial: $j ====="
    echo
    $@
    j=$(( $j + 1 ))
done
