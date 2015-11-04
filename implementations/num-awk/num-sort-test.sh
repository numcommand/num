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

x=$(echo "3 1 2" | "$num" sort all) &&
    assert_eq "1 2 3" "$x" "sort, with row"

x=$(echo "3\n1\n2\n" | "$num" sort all) &&
    assert_eq "1 2 3" "$x" "sort, with col"

###
#
# sort-ascending
#
###

x=$(echo "3 1 2" | "$num" sort-ascending all) &&
    assert_eq "1 2 3" "$x" "sort-ascending, with row"

x=$(echo "3\n1\n2\n" | "$num" sort-ascending all) &&
    assert_eq "1 2 3" "$x" "sort-ascending, with col"

###
#
# sort-descending
#
###

x=$(echo "3 1 2" | "$num" sort-descending all) &&
    assert_eq "3 2 1" "$x" "sort-descending, with row"

x=$(echo "3\n1\n2\n" | "$num" sort-descending all) &&
    assert_eq "3 2 1" "$x" "sort-descending, with col"


###
#
# is-ascending
#
###

x=$(echo "1 2 3" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with row, with ascending unique"

x=$(echo "1\n2\n3\n" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with col, with ascending unique"

x=$(echo "2 2 2" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with row, with dup"

x=$(echo "2\n2\n2\n" | "$num" is-ascending) &&
    assert_eq $TRUE "$x" "is-ascending, with col, with dup"

x=$(echo "3 2 1" | "$num" is-ascending) &&
    assert_eq $FALSE "$x" "is-ascending, with row, with descending"

x=$(echo "3\n2\n1\n" | "$num" is-ascending) &&
    assert_eq $FALSE "$x" "is-ascending, with col, with descending"

###
#
# is-strictly-ascending)
#
###

x=$(echo "1 2 3" | "$num" is-strictly-ascending) &&
    assert_eq $TRUE  "$x" "is-strictly-ascending, with row, with unique"

x=$(echo "1\n2\n3\n" | "$num" is-strictly-ascending) &&
    assert_eq $TRUE  "$x" "is-strictly-ascending, with col, with unique"

x=$(echo "2 2 2" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with row, with dup"

x=$(echo "2\n2\n2\n" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with col, with dup"

x=$(echo "3 2 1" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with row, with descending"

x=$(echo "3\n2\n1" | "$num" is-strictly-ascending) &&
    assert_eq $FALSE "$x" "is-strictly-ascending, with col, with descending"

###
#
# is-descending
#
###

x=$(echo "3 2 1" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with row, with unique"

x=$(echo "3\n2\n1\n" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with col, with unique"

x=$(echo "2 2 2" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with row, with dup"

x=$(echo "2\n2\n2\n" | "$num" is-descending) &&
    assert_eq $TRUE "$x" "is-descending, with col, with dup"

x=$(echo "1 2 3" | "$num" is-descending) &&
    assert_eq $FALSE "$x" "is-descending, with row, with ascending"

x=$(echo "1\n2\n3\n" | "$num" is-descending) &&
    assert_eq $FALSE "$x" "is-descending, with col, with ascending"

###
#
# is-strictly-descending
#
###

x=$(echo "3 2 1" | "$num" is-strictly-descending) &&
    assert_eq $TRUE "$x" "is-strictly-descending, with row, with unique"

x=$(echo "3\n2\n1\n" | "$num" is-strictly-descending) &&
    assert_eq $TRUE "$x" "is-strictly-descending, with col, with unique"

x=$(echo "2 2 2" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with row, with dup"

x=$(echo "2\n2\n2\n" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with col, with dup"

x=$(echo "1 2 3" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with row, with ascending"

x=$(echo "1\n2\n3\n" | "$num" is-strictly-descending) &&
    assert_eq $FALSE "$x" "is-strictly-descending, with col, with ascending"
