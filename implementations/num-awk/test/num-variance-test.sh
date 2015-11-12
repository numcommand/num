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

x=$(echo "1\n2\n4" | "$num" variance) &&
    assert_eq 2.33333 "$x" "variance, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" variance records) &&
    assert_eq "2.33333"$'\n'"4.33333" "$x" "variance, with records"

###
#
# sample variance
#
###

x=$(echo "1 2 4" | "$num" sample-variance) &&
    assert_eq 2.33333 "$x" "sample-variance, with row"

x=$(echo "1\n2\n4" | "$num" sample-variance) &&
    assert_eq 2.33333 "$x" "sample-variance, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" variance records) &&
    assert_eq "2.33333"$'\n'"4.33333" "$x" "sample-variance, with records"

###
#
# population variance
#
###

x=$(echo "1 2 4" | "$num" population-variance) &&
    assert_eq 0.518519 "$x" "population-variance, with row"

x=$(echo "1\n2\n4" | "$num" population-variance) &&
    assert_eq 0.518519 "$x" "population-variance, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" population-variance records) &&
    assert_eq "0.518519"$'\n'"0.962963" "$x" "population-variance, with records"
