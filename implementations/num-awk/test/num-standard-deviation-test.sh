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

x=$(echo "1\n2\n4" | "$num" standard-deviation) &&
    assert_eq 1.52753 "$x" "standard-deviation, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" standard-deviation records) &&
    assert_eq "1.52753"$'\n'"2.08167" "$x" "standard-deviation, with records"

###
#
# sample standard deviation
#
###

## Sample

x=$(echo "1 2 4" | "$num" sample-standard-deviation) &&
    assert_eq 1.52753 "$x" "sample-standard-deviation, with row"

x=$(echo "1\n2\n4" | "$num" sample-standard-deviation) &&
    assert_eq 1.52753 "$x" "sample-standard-deviation, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" standard-deviation records) &&
    assert_eq "1.52753"$'\n'"2.08167" "$x" "sample-standard-deviation, with records"

###
#
# population standard deviation
#
###

x=$(echo "1 2 4" | "$num" population-standard-deviation) &&
    assert_eq 1.24722 "$x" "population-standard-deviation, with row"

x=$(echo "1\n2\n4" | "$num" population-standard-deviation) &&
    assert_eq 1.24722 "$x" "population-standard-deviation, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" population-standard-deviation records) &&
    assert_eq "1.24722"$'\n'"1.69967" "$x" "population-standard-deviation, with records"
