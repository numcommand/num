#!/bin/sh
############################################################################
#
# num-sort-test.awk
#
###

. minitest.sh
num=${NUM:-num}

###
#
# sort
#
###

x=$(echo "3 1 2" | "$num" sort) &&
    assert_eq "1 2 3" "$x" "sort, with row"

x=$(echo "3\n1\n2" | "$num" sort) &&
    assert_eq "1 2 3" "$x" "sort, with col"

x=$(echo "3 1 2\n9 5 6" | "$num" sort all records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "sort, with records"

###
#
# sort-ascending
#
###

x=$(echo "3 1 2" | "$num" sort-ascending) &&
    assert_eq "1 2 3" "$x" "sort-ascending, with row"

x=$(echo "3\n1\n2" | "$num" sort-ascending) &&
    assert_eq "1 2 3" "$x" "sort-ascending, with col"

x=$(echo "3 1 2\n9 5 6" | "$num" sort-ascending all records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "sort-ascending, with row"

###
#
# sort-descending
#
###

x=$(echo "3 1 2" | "$num" sort-descending) &&
    assert_eq "3 2 1" "$x" "sort-descending, with row"

x=$(echo "3\n1\n2" | "$num" sort-descending) &&
    assert_eq "3 2 1" "$x" "sort-descending, with col"

x=$(echo "3 1 2\n9 5 6" | "$num" sort-descending all records) &&
    assert_eq "3 2 1"$'\n'"9 6 5" "$x" "sort-descending, with records"

###
#
# is-ascending
#
###

## with ascending unique

x=$(echo "1 2 3" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with row, with ascending unique"

x=$(echo "1\n2\n3" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with col, with ascending unique"

x=$(echo "1 2 3\n5 6 9" | "$num" is-ascending records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "is-ascending, with records, with ascending unique"

## with dup

x=$(echo "2 2 2" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with row, with dup"

x=$(echo "2\n2\n2" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" is-ascending records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "is-ascending, with records, with dup"

## with descending

x=$(echo "3 2 1" | "$num" is-ascending) &&
    assert_eq $FALSE "$x" "is-ascending, with row, with descending"

x=$(echo "3\n2\n1" | "$num" is-ascending) &&
    assert_eq $FALSE "$x" "is-ascending, with col, with descending"

x=$(echo "3 2 1\n9 6 5" | "$num" is-ascending records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "is-ascending, with records, with descending"

###
#
# is-strictly-ascending
#
###

## with unique

x=$(echo "1 2 3" | "$num" is-strictly-ascending) &&
    assert_eq $TRUE  "$x" "is-strictly-ascending, with row, with unique"

x=$(echo "1\n2\n3" | "$num" is-strictly-ascending) &&
    assert_eq $TRUE  "$x" "is-strictly-ascending, with col, with unique"

x=$(echo "1 2 3\n5 6 9" | "$num" is-strictly-ascending records) &&
    assert_eq "$TRUE"$'\n'"$TRUE"  "$x" "is-strictly-ascending, with records, with unique"

## with dup

x=$(echo "2 2 2" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with row, with dup"

x=$(echo "2\n2\n2" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" is-strictly-ascending records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "is-strictly-ascending, with records, with dup"

## with descending

x=$(echo "3 2 1" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with row, with descending"

x=$(echo "3\n2\n1" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with col, with descending"

x=$(echo "3 2 1\n9 6 5" | "$num" is-strictly-ascending records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "is-strictly-ascending, with records, with descending"

###
#
# is-descending
#
###

## with unique

x=$(echo "3 2 1" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with row, with unique"

x=$(echo "3\n2\n1" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with col, with unique"

x=$(echo "3 2 1\n9 6 5" | "$num" is-descending records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "is-descending, with records, with unique"

## with dup

x=$(echo "2 2 2" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with row, with dup"

x=$(echo "2\n2\n2" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" is-descending records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "is-descending, with records, with dup"

## with ascending

x=$(echo "1 2 3" | "$num" is-descending) &&
    assert_eq $FALSE "$x" "is-descending, with row, with ascending"

x=$(echo "1\n2\n3" | "$num" is-descending) &&
    assert_eq $FALSE "$x" "is-descending, with col, with ascending"

x=$(echo "1 2 3\n5 6 9" | "$num" is-descending records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "is-descending, with records, with ascending"

###
#
# is-strictly-descending
#
###

## with unique

x=$(echo "3 2 1" | "$num" is-strictly-descending) &&
    assert_eq $TRUE "$x" "is-strictly-descending, with row, with unique"

x=$(echo "3\n2\n1" | "$num" is-strictly-descending) &&
    assert_eq $TRUE "$x" "is-strictly-descending, with col, with unique"

x=$(echo "3 2 1\n9 6 5" | "$num" is-strictly-descending records) &&
    assert_eq "$TRUE"$'\n'"$TRUE" "$x" "is-strictly-descending, with records, with unique"

## with dup

x=$(echo "2 2 2" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with row, with dup"

x=$(echo "2\n2\n2" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with col, with dup"

x=$(echo "2 2 2\n6 6 6" | "$num" is-strictly-descending records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "is-strictly-descending, with records, with dup"

## with ascending

x=$(echo "1 2 3" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with row, with ascending"

x=$(echo "1\n2\n3" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with col, with ascending"

x=$(echo "1 2 3\n5 6 9" | "$num" is-strictly-descending records) &&
    assert_eq "$FALSE"$'\n'"$FALSE" "$x" "is-strictly-descending, with records, with ascending"
