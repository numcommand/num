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

x=$(echo "1\n2\n4\n" | "$num" coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "coefficient-of-variance, with col"

###
#
# sample coefficient of variance
#
###

x=$(echo "1 2 4" | "$num" sample-coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "sample-coefficient-of-variance, with row"

x=$(echo "1\n2\n4\n" | "$num" sample-coefficient-of-variance) &&
    assert_eq 0.654654 "$x" "sample-coefficient-of-variance, with col"

###
#
# population coefficient of variance
#
###

x=$(echo "1 2 4" | "$num" population-coefficient-of-variance) &&
    assert_eq 0.534522 "$x" "population-coefficient-of-variance, with row"

x=$(echo "1\n2\n4\n" | "$num" population-coefficient-of-variance) &&
    assert_eq 0.534522 "$x" "population-coefficient-of-variance, with col"
