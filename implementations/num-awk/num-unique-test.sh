#!/bin/sh
############################################################################
#
# num-unique-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# is-unique
#
###

x=$(echo "1 2 3" | "$num" is-unique) &&
    assert_eq $TRUE "$x" "is-unique, with row, with unique"

x=$(echo "1\n2\n3\n" | "$num" is-unique) &&
    assert_eq $TRUE "$x" "is-unique, with col, with unique"

x=$(echo "1 2 2" | "$num" is-unique) &&
    assert_eq $FALSE  "$x" "is-unique, with row, with dup"

x=$(echo "1\n2\n2\n" | "$num" is-unique) &&
    assert_eq $FALSE  "$x" "is-unique, with col, with dup"
