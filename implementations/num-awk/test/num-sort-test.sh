#!/bin/sh
############################################################################
#
# num-sort-test.awk
#
##

. minitest.sh
num=${NUM:-num}

##
#
# sort
#
##

f="sort"

x=$(echo "3 1 2" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with row"

x=$(echo "3\n1\n2" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with col"

x=$(echo "3 1 2\n9 5 6" | "$num" $f records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "$f with records"

##
#
# sort-ascending
#
##

f="sort-ascending"

x=$(echo "3 1 2" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with row"

x=$(echo "3\n1\n2" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with col"

x=$(echo "3 1 2\n9 5 6" | "$num" $f records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "$f with row"

##
#
# sort-descending
#
##

f="sort-descending"

x=$(echo "3 1 2" | "$num" $f) &&
    assert_eq "3 2 1" "$x" "$f with row"

x=$(echo "3\n1\n2" | "$num" $f) &&
    assert_eq "3 2 1" "$x" "$f with col"

x=$(echo "3 1 2\n9 5 6" | "$num" $f records) &&
    assert_eq "3 2 1"$'\n'"9 6 5" "$x" "$f with records"

##
#
# is-ascending
#
##

f="is-ascending"

## with ascending unique

x=$(echo "1 2 3" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with row, with ascending unique"

x=$(echo "1\n2\n3" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with col, with ascending unique"

x=$(echo "1 2 3\n5 6 9" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "$f with records, with ascending unique"

## with dup

x=$(echo "2 2 2" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with row, with dup"

x=$(echo "2\n2\n2" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "$f with records, with dup"

## with descending

x=$(echo "3 2 1" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with descending"

x=$(echo "3\n2\n1" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with descending"

x=$(echo "3 2 1\n9 6 5" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "$f with records, with descending"

##
#
# is-strictly-ascending
#
##

f="is-strictly-ascending"

## with unique

x=$(echo "1 2 3" | "$num" $f) &&
    assert_eq $TRUE  "$x" "$f with row, with unique"

x=$(echo "1\n2\n3" | "$num" $f) &&
    assert_eq $TRUE  "$x" "$f with col, with unique"

x=$(echo "1 2 3\n5 6 9" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE"  "$x" "$f with records, with unique"

## with dup

x=$(echo "2 2 2" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with dup"

x=$(echo "2\n2\n2" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "$f with records, with dup"

## with descending

x=$(echo "3 2 1" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with descending"

x=$(echo "3\n2\n1" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with descending"

x=$(echo "3 2 1\n9 6 5" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "$f with records, with descending"

##
#
# is-descending
#
##

f="is-descending"

## with unique

x=$(echo "3 2 1" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with row, with unique"

x=$(echo "3\n2\n1" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with col, with unique"

x=$(echo "3 2 1\n9 6 5" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "$f with records, with unique"

## with dup

x=$(echo "2 2 2" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with row, with dup"

x=$(echo "2\n2\n2" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "$f with records, with dup"

## with ascending

x=$(echo "1 2 3" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with ascending"

x=$(echo "1\n2\n3" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with ascending"

x=$(echo "1 2 3\n5 6 9" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "$f with records, with ascending"

##
#
# is-strictly-descending
#
##

f="is-strictly-descending"

## with unique

x=$(echo "3 2 1" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with row, with unique"

x=$(echo "3\n2\n1" | "$num" $f) &&
    assert_eq $TRUE "$x" "$f with col, with unique"

x=$(echo "3 2 1\n9 6 5" | "$num" $f records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "$f with records, with unique"

## with dup

x=$(echo "2 2 2" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with dup"

x=$(echo "2\n2\n2" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "$f with records, with dup"

## with ascending

x=$(echo "1 2 3" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with row, with ascending"

x=$(echo "1\n2\n3" | "$num" $f) &&
    assert_eq $FALSE "$x" "$f with col, with ascending"

x=$(echo "1 2 3\n5 6 9" | "$num" $f records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "$f with records, with ascending"
