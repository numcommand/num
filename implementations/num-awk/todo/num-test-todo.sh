
x=$(echo "1 2 4"       | ./num middle)                        && assert_eq 2 "$x" "middle with median exact"
x=$(echo "1 2 3 4"     | ./num middle)                        && assert_eq 2 "$x" "middle with median low"
x=$(echo "1 2 4"       | ./num mid)                           && assert_eq 2 "$x" "mid with median exact"
x=$(echo "1 2 3 4"     | ./num mid)                           && assert_eq 2 "$x" "mid with median low"

## Booleans

#x=$(echo "1 2 3"       | ./num is-linear)                     && assert_eq 1 "$x" "is-linear true with ascending"
#x=$(echo "3 2 1"       | ./num is-linear)                     && assert_eq 1 "$x" "is-linear true with descending"
#x=$(echo "2 2 2"       | ./num is-linear)                     && assert_eq 1 "$x" "is-linear true with all equals"
#x=$(echo "1 2 4"       | ./num is-linear)                     && assert_eq 0 "$x" "is-linear false"

#x=$(echo "1 2 4"       | ./num is-sorted)                     && assert_eq 1 "$x" "is-sorted true with ascending and uniques"
#x=$(echo "1 2 2 4"     | ./num is-sorted)                     && assert_eq 0 "$x" "is-sorted true with ascending and duplicates"
#x=$(echo "4 2 1"       | ./num is-sorted)                     && assert_eq 1 "$x" "is-sorted true with descending and uniques"
#x=$(echo "4 2 2 1"     | ./num is-sorted)                     && assert_eq 1 "$x" "is-sorted true with descending and duplicates"
#x=$(echo "2 2 2"       | ./num is-sorted)                     && assert_eq 1 "$x" "is-sorted true with all equals"
#x=$(echo "1 4 2"       | ./num is-sorted)                     && assert_eq 0 "$x" "is-sorted false"

## Filters

#x=$(echo "1 2 2 3"     | ./num unique)                        && assert_eq "1 2 3" "$x" "unique"
#x=$(echo "1 2 2 3"     | ./num effect-unique)                 && assert_eq "1 2 3" "$x" "effect-unique"
#x=$(echo "1 2 2 3"     | ./num effectunique)                  && assert_eq "1 2 3" "$x" "effectunique"
#x=$(echo "1 2 2 3"     | ./num select-unique)                 && assert_eq "1 3" "$x" "select-unique"
#x=$(echo "1 2 2 3"     | ./num selectunique)                  && assert_eq "1 3" "$x" "selectunique"
#x=$(echo "1 2 2 3"     | ./num reject-unique)                 && assert_eq "2" "$x" "reject-unique"
#x=$(echo "1 2 2 3"     | ./num rejectunique)                  && assert_eq "2" "$x" "rejectunique"

#x=$(echo "3 1 2"       | ./num sort-ascending)                && assert_eq "1 2 3" "$x" "sort-ascending"
#x=$(echo "3 1 2"       | ./num sortascending)                 && assert_eq "1 2 3" "$x" "sortascending"
#x=$(echo "3 1 2"       | ./num sort-asc)                      && assert_eq "1 2 3" "$x" "sort-asc"
#x=$(echo "3 1 2"       | ./num sortasc)                       && assert_eq "1 2 3" "$x" "sortasc"
#x=$(echo "3 1 2"       | ./num sort-descending)               && assert_eq "3 2 1" "$x" "sort-descending"
#x=$(echo "3 1 2"       | ./num sortdescending)                && assert_eq "3 2 1" "$x" "sortdescending"
#x=$(echo "3 1 2"       | ./num sort-desc)                     && assert_eq "3 2 1" "$x" "sort-desc"
#x=$(echo "3 1 2"       | ./num sortdesc)                      && assert_eq "3 2 1" "$x" "sortdesc"

## Input

#x=$(echo "1 2\n3 4"    | ./num input-fields sum)              && assert_eq "3\n7" "$x" "input-fields"
#x=$(echo "1 2\n3 4"    | ./num inputfields sum)               && assert_eq "3\n7" "$x" "inputfields"

#x=$(echo "1 2\n3 4"    | ./num input-records sum)             && assert_eq "21" "$x" "input-records"
#x=$(echo "1 2\n3 4"    | ./num inputrecords sum)              && assert_eq "21" "$x" "inputrecords"

#x=$(echo "1 2 4"       | ./num input-is-linear               && assert_eq "?" "$x" "input-is-linear"
#x=$(echo "1 2 4"       | ./num inputislinear)                && assert_eq "?" "$x" "inputislinear"
#x=$(echo "1 2 4"       | ./num input-linear)                 && assert_eq "?" "$x" "input-linear"
#x=$(echo "1 2 4"       | ./num inputlinear)                  && assert_eq "?" "$x" "inputlinear"

#x=$(echo "1 2 4"       | ./num input-is-sorted               && assert_eq "?" "$x" "input-is-sorted"
#x=$(echo "1 2 4"       | ./num inputissorted)                && assert_eq "?" "$x" "inputissorted"
#x=$(echo "1 2 4"       | ./num input-sorted)                 && assert_eq "?" "$x" "input-sorted"
#x=$(echo "1 2 4"       | ./num inputsorted)                  && assert_eq "?" "$x" "inputsorted"

#x=$(echo "1 2 4"       | ./num input-is-unique)              && assert_eq "?" "$x" "input-is-unique"
#x=$(echo "1 2 4"       | ./num inputisunique)                && assert_eq "?" "$x" "inputisunique"
#x=$(echo "1 2 4"       | ./num input-unique)                 && assert_eq "?" "$x" "input-unique"
#x=$(echo "1 2 4"       | ./num inputunique)                  && assert_eq "?" "$x" "inputunique"

## Output

#x=$(echo "1 2 4"       | ./num n min max output-label)        && assert_eq "n 3 minimum 1 maximum 4" "$x" "output-label"
#x=$(echo "1 2 4"       | ./num n min max outputlabel)         && assert_eq "n 3 minimum 1 maximum 4" "$x" "outputlabel"
#x=$(echo "1 2 4"       | ./num all output-csv)                && assert_eq "3,1,4" "$x" "output-csv"
#x=$(echo "1 2 4"       | ./num all outputcsv)                 && assert_eq "3,1,4" "$x" "outputcsv"
#x=$(echo "1 2 4"       | ./num all output-tsv)                && assert_eq "3"$'\t'"1"$'\t'"4" "$x" "output-tsv"
#x=$(echo "1 2 4"       | ./num all outputtsv)                 && assert_eq "3"$'\t'"1"$'\t'"4" "$x" "outputtsv"
