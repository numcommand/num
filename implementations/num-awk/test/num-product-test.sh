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

f="product"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 8 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 8 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "8"$'\n'"270" "$x" "$f with records"
