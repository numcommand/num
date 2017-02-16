#!/bin/sh
############################################################################
#
# num-help-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# help, version, usage
#
##

x=$("$num" help | head -1 | grep -o 'Num version') &&
    assert_eq "Num version" "$x" "help"

x=$("$num" --help | head -1 | grep -o 'Num version') &&
    assert_eq "Num version" "$x" "--help"

x=$("$num" version | head -1 | grep -o 'Num version') &&
    assert_eq "Num version" "$x" "version"

x=$("$num" --version | head -1 | grep -o 'Num version') &&
    assert_eq "Num version" "$x" "--version"

x=$("$num" usage | head -1 | grep -o 'Num version') &&
    assert_eq "Num version" "$x" "usage"

x=$("$num" --usage | head -1 | grep -o 'Num version') &&
    assert_eq "Num version" "$x" "--usage"
