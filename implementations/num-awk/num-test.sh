#!/bin/sh

assert_eq() {
  expect="$1"; actual="$2"; msg="$3"
  if [ "$expect" == "$actual" ]; then
    echo "assert_eq $msg expect:$expect actual:$actual SUCCESS"
  else
    echo "assert_eq $msg expect:$expect actual:$actual FAILURE"
  fi
}

x=$(echo "1 2 4" | ./num.sh all)    && assert_eq "1 2 4" "$x" "all"

x=$(echo "1 2 4" | ./num.sh first)  && assert_eq 1 "$x" "first"

x=$(echo "1 2 4" | ./num.sh last)   && assert_eq 4 "$x" "last"
