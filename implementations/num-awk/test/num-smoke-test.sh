#!/bin/sh
############################################################################
#
# num-smoke-test.awk
#
# The goal of this file is to test a bunch of functions in combination,
# as a smoke test for errors if/when functions intefere with each other.
#
###

. minitest.sh
num=${NUM:-num}

x=$(echo "1 2 4" | "$num" n first last min max range sum product mean meanest mad trimean med var skew kurt sd covar) &&
    assert_eq "3 1 4 1 4 3 7 8 2.33333 2 1.11111 2.1875 2 2.33333 1.11111 5.44444 1.52753 0.654654" "$x" "integration, with row"

x=$(echo "1\n2\n4" | "$num" n first last min max range sum product mean meanest mad trimean med var skew kurt sd covar) &&
    assert_eq "3 1 4 1 4 3 7 8 2.33333 2 1.11111 2.1875 2 2.33333 1.11111 5.44444 1.52753 0.654654" "$x" "integration, with col"
