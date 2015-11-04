#!/bin/sh

TRUE=1
FALSE=0
TODO="TODO"

assert_eq() {
    expect="$1"; actual="$2"; msg="$3"
    if [ "$expect" == "$actual" ]; then
        echo "assert_eq $msg expect:$expect actual:$actual SUCCESS"
    else
        echo "assert_eq $msg expect:$expect actual:$actual FAILURE"
    fi
}

assert_eq_todo() {
    assert_eq $TODO "$2" "$3"
}
