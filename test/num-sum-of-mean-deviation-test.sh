#!/bin/sh
############################################################################
#
# num-sum-of-mean-deviation-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# sum-of-squares
#
##

f="sum-of-squares"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 4.66667 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 4.66667 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "4.66667"$'\n'"8.66667" "$x" "$f with records"

##
#
# sum-of-cubes
#
##

f="sum-of-cubes"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 2.22222 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 2.22222 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "2.22222"$'\n'"7.77778" "$x" "$f with records"

##
#
# sum-of-quads
#
##

f="sum-of-quads"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 10.8889 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 10.8889 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "10.8889"$'\n'"37.5556" "$x" "$f with records"
