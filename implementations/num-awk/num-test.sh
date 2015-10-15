#!/bin/sh

assert_eq() {
  expect="$1"; actual="$2"; msg="$3"
  if [ "$expect" == "$actual" ]; then
    echo "assert_eq $msg expect:$expect actual:$actual SUCCESS"
  else
    echo "assert_eq $msg expect:$expect actual:$actual FAILURE"
  fi
}
