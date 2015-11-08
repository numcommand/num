#!/bin/sh

TRUE=1
FALSE=0
TODO="TODO"

assert_eq() {
    expect="$1"; actual="$2"; msg="$3"
    if [ "$expect" == "$actual" ]; then
        echo "assert_eq $msg expect:${expect//$'\n'/␞} actual:${actual//$'\n'/␞} SUCCESS"
    else
        echo "assert_eq $msg expect:${expect//$'\n'/␞} actual:${actual//$'\n'/␞} FAILURE"
    fi
}

assert_eq_todo() {
    assert_eq $TODO "$2" "$3"
}
