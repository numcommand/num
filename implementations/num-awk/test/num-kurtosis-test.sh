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

x=$(echo "1 2 4" | "$num" kurtosis) &&
    assert_eq 5.44444 "$x" "kurtosis, with row"

x=$(echo "1\n2\n4" | "$num" kurtosis) &&
    assert_eq 5.44444 "$x" "kurtosis, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" kurtosis records) &&
    assert_eq "5.44444"$'\n'"18.7778" "$x" "kurtosis, with records"

##
#
# sample kurtosis
#
##

x=$(echo "1 2 4" | "$num" sample-kurtosis) &&
    assert_eq 5.44444 "$x" "sample-kurtosis, with row"

x=$(echo "1\n2\n4" | "$num" sample-kurtosis) &&
    assert_eq 5.44444 "$x" "sample-kurtosis, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sample-kurtosis records) &&
    assert_eq "5.44444"$'\n'"18.7778" "$x" "sample-kurtosis, with records"

##
#
# population kurtosis
#
##

x=$(echo "1 2 4" | "$num" population-kurtosis) &&
    assert_eq 3.62963 "$x" "population-kurtosis, with row"

x=$(echo "1\n2\n4" | "$num" population-kurtosis) &&
    assert_eq 3.62963 "$x" "population-kurtosis, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" population-kurtosis records) &&
    assert_eq "3.62963"$'\n'"12.5185" "$x" "population-kurtosis, with records"
