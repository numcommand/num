#!/bin/sh
############################################################################
#
# num-absolute-value.awk
#
##

. minitest.sh
num=${NUM:-num}

##
#
# absolute value
#
##

f="absolute-value"

##
#
# ...with all positive...
#
# row:
#
#     $ echo "1 2 3" | num absolute-value
#     1 2 3
#
# column:
#
#     $ echo "1\n2\n3" | num absolute-value
#     1 2 3  
#
# records of positives:
#
#     $ echo "1 2 3\n5 6 9" | num absolute-value records
#     1 2 3
#     5 6 9
##

x=$(echo "1 2 3" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with row with all positive"

x=$(echo "1\n2\n3" | "$num" absolute-value) &&
    assert_eq "1 2 3" "$x" "$f with col with all positive"

x=$(echo "1 2 3\n5 6 9" | "$num" absolute-value records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "$f with records with all positive"

##
#
# ...with all negative...
#
# row:
#
#     $ echo "-1 -2 -3" | num absolute-value
#     1 2 3
#
# column:
#
#     $ echo "-1\n-2\n-3" | num absolute-value
#     1 2 3
#
# records:
#
#     $ echo "-1 -2 -3\n-5 -6 -9" | num absolute-value records
#     1 2 3
#     5 6 9
##

x=$(echo "-1 -2 -3" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with row with all negative"

x=$(echo "-1\n-2\n-3" | "$num" $f) &&
    assert_eq "1 2 3" "$x" "$f with col with all negative"

x=$(echo "-1 -2 -3\n-5 -6 -9" | "$num" $f records) &&
    assert_eq "1 2 3"$'\n'"5 6 9" "$x" "$f with records with all negative"
