#!/bin/sh
############################################################################
#
# num-kurtosis-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# kurtosis
#
###

x=$(echo "1 2 4" | "$num" kurtosis) &&
    assert_eq 5.44444 "$x" "kurtosis, with row"

x=$(echo "1\n2\n4\n" | "$num" kurtosis) &&
    assert_eq 5.44444 "$x" "kurtosis, with col"

###
#
# sample kurtosis
#
###

x=$(echo "1 2 4" | "$num" sample-kurtosis) &&
    assert_eq 5.44444 "$x" "sample-kurtosis, with row"

x=$(echo "1\n2\n4\n" | "$num" sample-kurtosis) &&
    assert_eq 5.44444 "$x" "sample-kurtosis, with col"

###
#
# population kurtosis
#
###

x=$(echo "1 2 4" | "$num" population-kurtosis) &&
    assert_eq 3.62963 "$x" "population-kurtosis, with row"

x=$(echo "1\n2\n4\n" | "$num" population-kurtosis) &&
    assert_eq 3.62963 "$x" "population-kurtosis, with col"
