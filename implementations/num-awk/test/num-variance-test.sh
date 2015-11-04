#!/bin/sh
############################################################################
#
# num-variance-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# variance
#
###

x=$(echo "1 2 4" | "$num" variance) &&
    assert_eq 2.33333 "$x" "variance, with row"

x=$(echo "1\n2\n4\n" | "$num" variance) &&
    assert_eq 2.33333 "$x" "variance, with col"

###
#
# sample variance
#
###

x=$(echo "1 2 4" | "$num" sample-variance) &&
    assert_eq 2.33333 "$x" "sample-variance, with row"

x=$(echo "1\n2\n4\n" | "$num" sample-variance) &&
    assert_eq 2.33333 "$x" "sample-variance, with col"

###
#
# population variance
#
###

x=$(echo "1 2 4" | "$num" population-variance) &&
    assert_eq 1.55556 "$x" "population-variance, with row"

x=$(echo "1\n2\n4\n" | "$num" population-variance) &&
    assert_eq 1.55556 "$x" "population-variance, with col"
