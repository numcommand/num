#!/bin/sh
############################################################################
#
# num-sum-of-mean-deviation-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# sum-of-squares
#
###

x=$(echo "1 2 4" | "$num" sum-of-squares) &&
    assert_eq 4.66667 "$x" "sum-of-squares, with row"

x=$(echo "1\n2\n4" | "$num" sum-of-squares) &&
    assert_eq 4.66667 "$x" "sum-of-squares, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sum-of-squares records) &&
    assert_eq "4.66667"$'\n'"8.66667" "$x" "sum-of-squares, with records"

###
#
# sum-of-cubes
#
###

x=$(echo "1 2 4" | "$num" sum-of-cubes) &&
    assert_eq 2.22222 "$x" "sum-of-cubes, with row"

x=$(echo "1\n2\n4" | "$num" sum-of-cubes) &&
    assert_eq 2.22222 "$x" "sum-of-cubes, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sum-of-cubes records) &&
    assert_eq "2.22222"$'\n'"7.77778" "$x" "sum-of-cubes, with records"

###
#
# sum-of-quads
#
###

x=$(echo "1 2 4" | "$num" sum-of-quads) &&
    assert_eq 10.8889 "$x" "sum-of-quads, with row"

x=$(echo "1\n2\n4" | "$num" sum-of-quads) &&
    assert_eq 10.8889 "$x" "sum-of-quads, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sum-of-quads records) &&
    assert_eq "10.8889"$'\n'"37.5556" "$x" "sum-of-quads, with records"
