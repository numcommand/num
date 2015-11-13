#!/bin/sh
############################################################################
#
# num-product-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# product
#
##

x=$(echo "1 2 4" | "$num" product) &&
    assert_eq 8 "$x" "product, with row"

x=$(echo "1\n2\n4" | "$num" product) &&
    assert_eq 8 "$x" "product, with col"

x=$(echo "1 2 4\n5 6 9" | "$num" product records) &&
    assert_eq "8"$'\n'"270" "$x" "product, with records"
