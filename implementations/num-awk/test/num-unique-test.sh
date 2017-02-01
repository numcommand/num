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

f="is-unique"

## with unique

x=$(echo "1 2 3" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with row, with unique"

x=$(echo "1\n2\n3" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with col, with unique"

x=$(echo "1 2 3\n5 6 9" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "$f with records, with unique"

## with dup

x=$(echo "1 2 2" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with dup"

x=$(echo "1\n2\n2" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with dup"

x=$(echo "1 2 2\n5 6 6" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE"  "$x" "$f with records, with dup"
