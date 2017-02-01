#!/bin/sh
############################################################################
#
# num-list-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# n
#
##

f="n"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 3 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" n) &&
    assert_eq 3 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9 9" | "$num" n records) &&
    assert_eq "3"$'\n'"4" "$x" "$f with records"

##
#
# first
#
##

f="first"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1 "$x" "$f, with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1 "$x" "$f, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1"$'\n'"5" "$x" "$f, with records"

##
#
# last
#
##

f="last"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 4 "$x" "$f, with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 4 "$x" "$f, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "4"$'\n'"9" "$x" "$f, with records"

##
#
# all
#
##

f="all"

x=$(echo "1 2 4" | "$num") &&
    assert_eq "1 2 4" "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num") &&
    assert_eq "1 2 4" "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" records) &&
    assert_eq "1 2 4"$'\n'"5 6 9" "$x" "$f with records"

##
#
# minimum
#
##

f="minimum"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1 "$x" "$f, with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1 "$x" "$f, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1"$'\n'"5" "$x" "$f, with records"

##
#
# maximum
#
##

f="maximum"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 4 "$x" "$f, wih row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 4 "$x" "$f, wih col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "4"$'\n'"9" "$x" "$f, wih records"

##
#
# range
#
##

f="range"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 3 "$x" "$f, with row"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 3 "$x" "$f, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "3"$'\n'"4" "$x" "$f, with records"

##
#
# comparisons
#
##

#TODO

# x=$(echo "1 2 3 4 5" | "$num" select-eq 3) &&
#     assert_eq "3" "$x" "select eq"

# x=$(echo "1 2 3 4 5" | "$num" select-ne 3) &&
#     assert_eq "1 2 4 5" "$x" "select ne"

# x=$(echo "1 2 3 4 5" | "$num" select-lt 3) &&
#     assert_eq "1 2" "$x" "select lt"

# x=$(echo "1 2 3 4 5" | "$num" select-le 3) &&
#     assert_eq "1 2 3" "$x" "select le"

# x=$(echo "1 2 3 4 5" | "$num" select-gt 3) &&
#     assert_eq "4 5" "$x" "select gt"

# x=$(echo "1 2 3 4 5" | "$num" select-ge 3) &&
#     assert_eq "3 4 5" "$x" "select ge"

# x=$(echo "1 2 3 4 5" | "$num" select-in 2 4) &&
#     assert_eq "3 4 5" "$x" "select in"

# x=$(echo "1 2 3 4 5" | "$num" select-ex 2 4) &&
#     assert_eq "1 5" "$x" "select ex"

# x=$(echo "1 2 3 4 5" | "$num" reject-eq 3) &&
#     assert_eq "1 2 4 5" "$x" "reject eq"

# x=$(echo "1 2 3 4 5" | "$num" reject-ne 3) &&
#     assert_eq "3" "$x" "reject ne"

# x=$(echo "1 2 3 4 5" | "$num" reject-lt 3) &&
#     assert_eq "3 4 5" "$x" "reject lt"

# x=$(echo "1 2 3 4 5" | "$num" reject-le 3) &&
#     assert_eq "4 5" "$x" "reject le"

# x=$(echo "1 2 3 4 5" | "$num" reject-gt 3) &&
#     assert_eq "1 2 3" "$x" "reject gt"

# x=$(echo "1 2 3 4 5" | "$num" reject-ge 3) &&
#     assert_eq "1 2" "$x" "reject ge"

# x=$(echo "1 2 3 4 5" | "$num" reject-in 2 4) &&
#     assert_eq "1 5" "$x" "reject in"

# x=$(echo "1 2 3 4 5" | "$num" reject-ex 2 4) &&
#     assert_eq "2 3 4" "$x" "reject ex"
