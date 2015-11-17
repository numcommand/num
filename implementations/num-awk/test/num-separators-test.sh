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
    assert_eq "1-1-1~2-2-2~3-3-3~4-4-4" "$x" "separators"

##
#
# Separators for common needs:
#
#   * comma-separated values (CSV) which use a comma and newline.
#   * tab-separated values (TSV) which use a tab and newline.
#   * unit-separated values (USV) which use Unicode unit separator and record separator.
##

## CSV

x=$(echo "1\n2,3\n4,5,6\n7,8,9,0" | ../num n n n csv records) &&
    assert_eq "1,1,1"$'\n'"2,2,2"$'\n'"3,3,3"$'\n'"4,4,4" "$x" "csv"

x=$(echo "1\n2,3\n4,5,6\n7,8,9,0" | ../num n n n input-csv records) &&
    assert_eq "1 1 1"$'\n'"2 2 2"$'\n'"3 3 3"$'\n'"4 4 4" "$x" "input-csv"

x=$(echo "1\n2 3\n4 5 6\n7 8 9 0" | ../num n n n output-csv records) &&
    assert_eq "1,1,1"$'\n'"2,2,2"$'\n'"3,3,3"$'\n'"4,4,4" "$x" "output-csv"

## TSV

x=$(echo "1\n2\t3\n4\t5\t6\n7\t8\t9\t0" | ../num n n n tsv records) &&
    assert_eq "1"$'\t'"1"$'\t'"1"$'\n'"2"$'\t'"2"$'\t'"2"$'\n'"3"$'\t'"3"$'\t'"3"$'\n'"4"$'\t'"4"$'\t'"4" "$x" "tsv"

x=$(echo "1\n2\t3\n4\t5\t6\n7\t8\t9\t0" | ../num n n n input-tsv records) &&
    assert_eq "1 1 1"$'\n'"2 2 2"$'\n'"3 3 3"$'\n'"4 4 4" "$x" "input-tsv"

x=$(echo "1\n2 3\n4 5 6\n7 8 9 0" | ../num n n n output-tsv records) &&
    assert_eq "1"$'\t'"1"$'\t'"1"$'\n'"2"$'\t'"2"$'\t'"2"$'\n'"3"$'\t'"3"$'\t'"3"$'\n'"4"$'\t'"4"$'\t'"4" "$x" "output-tsv"

## USV

x=$(echo "1␞2␟3␞4␟5␟6␞7␟8␟9␟0" | ../num n n n usv records) &&
    assert_eq "1␟1␟1␞2␟2␟2␞3␟3␟3␞4␟4␟4" "$x" "usv"

x=$(echo "1␞2␟3␞4␟5␟6␞7␟8␟9␟0" | ../num n n n input-usv records) &&
    assert_eq "1 1 1"$'\n'"2 2 2"$'\n'"3 3 3"$'\n'"4 4 4" "$x" "input-usv"

x=$(echo "1\n2 3\n4 5 6\n7 8 9 0" | ../num n n n output-usv records) &&
    assert_eq "1␟1␟1␞2␟2␟2␞3␟3␟3␞4␟4␟4" "$x" "output-usv"
