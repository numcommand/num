#!/bin/sh
############################################################################
#
# num-product-test.sh
#
###

. minitest.sh
num=${NUM:-num}

###
#
# product
#
###

x=$(echo "1 2 4" | "$num" product) &&
    assert_eq 8 "$x" "product, with row"

x=$(echo "1\n2\n4\n" | "$num" product) &&
    assert_eq 8 "$x" "product, with col"
