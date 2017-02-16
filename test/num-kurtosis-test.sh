#!/bin/sh
############################################################################
#
# num-kurtosis-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# kurtosis
#
##

f="kurtosis"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 5.44444 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 5.44444 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "5.44444"$'\n'"18.7778" "$x" "$f with records"

##
#
# sample kurtosis
#
##

f="sample-kurtosis"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 5.44444 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 5.44444 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "5.44444"$'\n'"18.7778" "$x" "$f with records"

##
#
# population kurtosis
#
##

f="population-kurtosis"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 3.62963 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 3.62963 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "3.62963"$'\n'"12.5185" "$x" "$f with records"
