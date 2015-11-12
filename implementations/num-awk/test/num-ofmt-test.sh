#!/bin/sh
############################################################################
#
# num-ofmt-test.awk
#
###

. minitest.sh
num=${NUM:-num}

###
#
# output format
#
###

x=$(echo "11.11 22.22 99.99" | OFMT="%.0f" "$num" all) &&
    assert_eq "11 22 100" "$x" "ofmt, with row"

x=$(echo "11.11\n22.22\n99.99" | OFMT="%.0f" "$num" all) &&
    assert_eq "11 22 100" "$x" "oftm, with col"

x=$(echo "11.11 22.22 33.33\n44.44 55.55 66.66\n77.77 88.88 99.99" | OFMT="%.0f" "$num" all records) &&
    assert_eq "11 22 33"$'\n'"44 56 67"$'\n'"78 89 100" "$x" "ofmt, with records"
