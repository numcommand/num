############################################################################
#
# num-frequency-test.sh
#
##

. minitest.sh
num=${NUM:-num}

##
#
# frequency minimum
#
##

f="frequency-minimum"

x=$(echo "10 10 20 20 20 40" | "$num" $f) &&
    assert_eq 1 "$x" "$f with row"

x=$(echo "10\n10\n20\n20\n20\n40" | "$num" $f) &&
    assert_eq 1 "$x" "$f with col"

x=$(echo "10 20 20 20 40\n50 50 60 60 60 60 90 90" | "$num" $f records) &&
    assert_eq "1"$'\n'"2" "$x" "$f with records"

##
#
# frequency maximum
#
##

f="frequency-maximum"

x=$(echo "10 10 20 20 20 40" | "$num" $f) &&
    assert_eq 3 "$x" "$f with row"

x=$(echo "10\n10\n20\n20\n20\n40" | "$num" $f) &&
    assert_eq 3 "$x" "$f with col"

x=$(echo "10 10 20 20 20 40\n50 50 60 60 60 60 90 90" | "$num" $f records) &&
    assert_eq "3"$'\n'"4" "$x" "$f with records"
