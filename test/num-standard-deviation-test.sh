#!/bin/sh
############################################################################
#
# num-standard-deviation-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# standard deviation
#
##

f="standard-deviation"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.52753 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.52753 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1.52753"$'\n'"2.08167" "$x" "$f with records"

##
#
# sample standard deviation
#
##

f="sample-standard-deviation"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.52753 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.52753 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" standard-deviation records) &&
    assert_eq "1.52753"$'\n'"2.08167" "$x" "$f with records"

##
#
# population standard deviation
#
##

f="population-standard-deviation"

x=$(echo "1 2 4" | "$num" $f) &&
    assert_eq 1.24722 "$x" "$f with row"

x=$(echo "1\n2\n4" | "$num" $f) &&
    assert_eq 1.24722 "$x" "$f with col"

x=$(echo "1 2 4\n5 6 9" | "$num" $f records) &&
    assert_eq "1.24722"$'\n'"1.69967" "$x" "$f with records"
