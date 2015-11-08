#!/bin/sh
############################################################################
#
# num-quartiles-test.awk
#
###

. minitest.sh
num=${NUM:-num}

# To test quartiles, choose input that will succeed
# if-and-only-if the num implementation is Method 3,
# and will fail if the implementation Method 1 or 2.
#
# See https://en.wikipedia.org/wiki/Quartile
#
# TODO: create distinct row for testing records.
#
in_row="6 7 15 36 39 40 41 42 43 47 49"
in_col="6\n7\n15\n36\n39\n40\n41\n42\n43\n47\n49"

x=$(echo "$in_row" | sort | "$num" quartile-3) &&
    assert_eq 42.75 "$x" "quartile-3, with row"
exit

###
#
# interquartile range
#
###

x=$(echo "$in_row" | "$num" interquartile-range) &&
    assert_eq 22.5 "$x" "interquartile-range, with row"

x=$(echo "$in_row" | "$num" interquartile-range) &&
    assert_eq 22.5 "$x" "interquartile-range, with col"

#TODO
x=$(echo "$in_row\n$in_row" | "$num" interquartile-range records) &&
    assert_eq "22.5"$'\n'"22.5 "$x" "interquartile-range, with records"

###
#
# quartile 0
#
###

x=$(echo "$in_row" | "$num" quartile-0) &&
    assert_eq 6 "$x" "quartile-0, with row"

x=$(echo "$in_col" | "$num" quartile-0) &&
    assert_eq 6 "$x" "quartile-0, with col"

#TODO
x=$(echo "$in_row\n$in_row" | "$num" quartile-0 records) &&
    assert_eq "6"$'\n'"6" "$x" "quartile-0, with records"

###
#
# quartile 1
#
###

## with preset

x=$(echo "$in_row" | "$num" quartile-1) &&
    assert_eq 20.25 "$x" "quartile-1, with row, with preset"

x=$(echo "$in_col" | "$num" quartile-1) &&
    assert_eq 20.25 "$x" "quartile-1, with col"

#TODO
x=$(echo "$in_row\n$in_row" | "$num" quartile-1) &&
    assert_eq "20.25"$'\n'"20.25" "$x" "quartile-1, with row, with preset"

## with 5 items

x=$(echo "1 2 3 4 5" | "$num" quartile-1) &&
    assert_eq 1.75 "$x" "quartile-1, with row, with 5 items."

x=$(echo "1 2 3 4 5" | "$num" quartile-1) &&
    assert_eq 1.75 "$x" "quartile-1, with col, with 5 items."

#TODO
x=$(echo "1 2 3 4 5\n1 2 3 4 5" | "$num" quartile-1 records) &&
    assert_eq "1.75"$'\n'"1.75" "$x" "quartile-1, with records, with 5 items."

## with 6 items

x=$(echo "1 2 3 4 5 6" | "$num" quartile-1) &&
    assert_eq 1.5 "$x" "quartile-1, with row, with 6 items."

x=$(echo "1 2 3 4 5 6" | "$num" quartile-1) &&
    assert_eq 1.5 "$x" "quartile-1, with col, with 6 items."

#TODO
x=$(echo "1 2 3 4 5 6\n1 2 3 4 5 6" | "$num" quartile-1 records) &&
    assert_eq "1.5"$'\n'"1.5" "$x" "quartile-1, with records, with 6 items."

## with 7 items

x=$(echo "1 2 3 4 5 6 7" | "$num" quartile-1) &&
    assert_eq 2.25 "$x" "quartile-1, with row, with 7 items."

x=$(echo "1 2 3 4 5 6 7" | "$num" quartile-1) &&
    assert_eq 2.25 "$x" "quartile-1, with col, with 7 items."

#TODO
x=$(echo "1 2 3 4 5 6 7\n1 2 3 4 5 6 7" | "$num" quartile-1 records) &&
    assert_eq "2.25"$'\n'"2.25" "$x" "quartile-1, with records, with 7 items."

## with 8 items

x=$(echo "1 2 3 4 5 6 7 8" | "$num" quartile-1) &&
    assert_eq 2 "$x" "quartile-1, with row, with 8 items."

x=$(echo "1 2 3 4 5 6 7 8" | "$num" quartile-1) &&
    assert_eq 2 "$x" "quartile-1, with col, with 8 items."

#TODO
x=$(echo "1 2 3 4 5 6 7 8\n1 2 3 4 5 6 7 8" | "$num" quartile-1) &&
    assert_eq "2"$'\n'"2" "$x" "quartile-1, with row, with 8 items."

###
#
# quartile 2
#
###

x=$(echo "$in_row" | "$num" quartile-2) &&
    assert_eq 40 "$x" "quartile-2, with row"

x=$(echo "$in_col" | "$num" quartile-2) &&
    assert_eq 40 "$x" "quartile-2, with col"

#TODO
x=$(echo "$in_row\n$in_row" | "$num" quartile-2) &&
    assert_eq "40"$'\n'"40" "$x" "quartile-2, with row"

###
#
# quartile 3
#
###

## with preset

x=$(echo "$in_row" | sort | "$num" quartile-3) &&
    assert_eq 42.75 "$x" "quartile-3, with row"

x=$(echo "$in_col" | sort | "$num" quartile-3) &&
    assert_eq 42.75 "$x" "quartile-3, with col"

#TODO
x=$(echo "$in_row\n$in_row" | sort | "$num" quartile-3 records) &&
    assert_eq "42.75"$'\n'"42.75" "$x" "quartile-3, with records"

## with 5 items

x=$(echo "1 2 3 4 5" | "$num" quartile-3) &&
    assert_eq 4.25 "$x" "quartile-3, with row, with 5 items."

x=$(echo "1 2 3 4 5" | "$num" quartile-3) &&
    assert_eq 4.25 "$x" "quartile-3, with col, with 5 items."

#TODO
x=$(echo "1 2 3 4 5\n1 2 3 4 5" | "$num" quartile-3 records) &&
    assert_eq "4.25"$'\n'"4.25" "$x" "quartile-3, with records, with 5 items."

## with 6 items

x=$(echo "1 2 3 4 5 6" | "$num" quartile-3) &&
    assert_eq 3.5 "$x" "quartile-3, with row, with 6 items."

x=$(echo "1 2 3 4 5 6" | "$num" quartile-3) &&
    assert_eq 3.5 "$x" "quartile-3, with col, with 6 items."

#TODO
x=$(echo "1 2 3 4 5 6\n1 2 3 4 5 6" | "$num" quartile-3 records) &&
    assert_eq "3.5"$'\n'"3.5" "$x" "quartile-3, with records, with 6 items."

## with 7 items

x=$(echo "1 2 3 4 5 6 7" | "$num" quartile-3) &&
    assert_eq 5.75 "$x" "quartile-3, with row, with 7 items."

x=$(echo "1 2 3 4 5 6 7" | "$num" quartile-3) &&
    assert_eq 5.75 "$x" "quartile-3, with col, with 7 items."

#TODO
x=$(echo "1 2 3 4 5 6 7\n1 2 3 4 5 6 7" | "$num" quartile-3 records) &&
    assert_eq "5.75"$'\n'"5.75 "$x" "quartile-3, with records, with 7 items."

## with 8 items

x=$(echo "1 2 3 4 5 6 7 8" | "$num" quartile-3) &&
    assert_eq 4.5 "$x" "quartile-3, with row, with 8 items."

x=$(echo "1 2 3 4 5 6 7 8" | "$num" quartile-3) &&
    assert_eq 4.5 "$x" "quartile-3, with col, with 8 items."

#TODO
x=$(echo "1 2 3 4 5 6 7 8\n1 2 3 4 5 6 7 8" | "$num" quartile-3 records) &&
    assert_eq "4.5"$'\n'"4.5" "$x" "quartile-3, with row, with 8 items."

###
#
# quartile 4
#
###

x=$(echo "$in_row" | "$num" quartile-4) &&
    assert_eq 49 "$x" "quartile-4, with row"

x=$(echo "$in_col" | "$num" quartile-4) &&
    assert_eq 49 "$x" "quartile-4, with col"

#TODO
x=$(echo "$in_row\n$in_row" | "$num" quartile-4 records) &&
    assert_eq "49"$'\n'"49" "$x" "quartile-4, with records"
