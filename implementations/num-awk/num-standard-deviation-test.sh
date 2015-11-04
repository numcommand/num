#!/bin/sh
############################################################################
#
# num-standard-deviation-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# standard deviation
#
###

x=$(echo "1 2 4" | "$num" standard-deviation) &&
    assert_eq 1.52753 "$x" "standard-deviation, with row"

x=$(echo "1\n2\n4\n" | "$num" standard-deviation) &&
    assert_eq 1.52753 "$x" "standard-deviation, with col"

###
#
# sample standard deviation
#
###

## Sample

x=$(echo "1 2 4" | "$num" sample-standard-deviation) &&
    assert_eq 1.52753 "$x" "sample-standard-deviation, with row"

x=$(echo "1\n2\n4\n" | "$num" sample-standard-deviation) &&
    assert_eq 1.52753 "$x" "sample-standard-deviation, with col"

###
#
# population standard deviation
#
###

x=$(echo "1 2 4" | "$num" population-standard-deviation) &&
    assert_eq 1.24722 "$x" "population-standard-deviation, with row"

x=$(echo "1\n2\n4\n" | "$num" population-standard-deviation) &&
    assert_eq 1.24722 "$x" "population-standard-deviation, with col"
