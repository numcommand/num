#!/bin/sh
############################################################################
#
# num-coefficient-of-variance-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# coefficient of variance
#
###

x=$(echo "1 2 4" | "$num" coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "coefficient-of-variance, with row"

x=$(echo "1\n2\n4" | "$num" coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "coefficient-of-variance, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" coefficient-of-variance records) &&
    assert_eq "0.654654"$'\n'"0.31225" "$x" "coefficient-of-variance, with records"

###
#
# sample coefficient of variance
#
###

x=$(echo "1 2 4" | "$num" sample-coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "sample-coefficient-of-variance, with row"

x=$(echo "1\n2\n4" | "$num" sample-coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "sample-coefficient-of-variance, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" sample-coefficient-of-variance records) &&
    assert_eq "0.654654"$'\n'"0.31225" "$x" "sample-coefficient-of-variance, with records"

###
#
# population coefficient of variance
#
###

x=$(echo "1 2 4" | "$num" population-coefficient-of-variance) &&
    assert_eq 0.534522 "$x" "population-coefficient-of-variance, with row"

x=$(echo "1\n2\n4" | "$num" population-coefficient-of-variance) &&
    assert_eq 0.534522 "$x" "population-coefficient-of-variance, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" population-coefficient-of-variance records) &&
    assert_eq "0.534522"$'\n'"0.254951" "$x" "population-coefficient-of-variance, with records"
