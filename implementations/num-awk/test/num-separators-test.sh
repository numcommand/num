#!/bin/sh
############################################################################
#
# num-separators-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# Separators:
#
#  * input field separator (FS)
#  * input record separator (RS)
#  * output field separator (OFS)
#  * output record separator (ORS)
#
##

x=$(echo "1;2,3;4,5,6;7,8,9,0" | ../num n n n FS="," RS=";" OFS="-" ORS="~" records) &&
    assert_eq "1-1-1~2-2-2~3-3-3~4-4-4" "$x" "n, with row"
