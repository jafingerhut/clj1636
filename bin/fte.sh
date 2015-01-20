#! /bin/bash

# Find occurrences of 'Trial:' or 'Exception'

egrep '(Trial:|Exception|bug1636: impls)' $*
