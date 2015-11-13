#!/bin/sh
############################################################################
#
# num-unique-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# is-unique
#
##

## with unique

x=$(echo "1 2 3" | "$num" is-unique) &&
    assert_eq $TRUE "$x" "is-unique, with row, with unique"

x=$(echo "1\n2\n3" | "$num" is-unique) &&
    assert_eq $TRUE "$x" "is-unique, with col, with unique"

x=$(echo "1 2 3\n5 6 9" | "$num" is-unique records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "is-unique, with records, with unique"

## with dup

x=$(echo "1 2 2" | "$num" is-unique) &&
    assert_eq $FALSE "$x" "is-unique, with row, with dup"

x=$(echo "1\n2\n2" | "$num" is-unique) &&
    assert_eq $FALSE "$x" "is-unique, with col, with dup"

x=$(echo "1 2 2\n5 6 6" | "$num" is-unique records) &&
    assert_eq "$FALSE"$'\n'"$FALSE"  "$x" "is-unique, with records, with dup"
