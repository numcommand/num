#!/bin/env awk

function assert_init() {
    TRUE=1
    FALSE=0
    TODO="TODO"
    split(TODO, ARR_TODO)
}

function assert_eq(expect, actual, msg) {
    if (expect == actual) {
        print "assert_eq", msg, "expect:" expect, "actual:" actual, "SUCCESS"
    }  else {
        print "assert_eq", msg, "expect:" expect, "actual:" actual, "FAILURE"
    }
}

function assert_eq_todo(expect, actual, msg) {
    assert_eq(TODO, actual, msg)
}

function assert_arr_eq(expect, actual, msg,  k) {
    x = TRUE
    for (k in expect) {
        if (!(k in actual)) {
            x = FALSE
            err[++err_i] = "expect has key " k
            break
        }
    }
    for (k in actual) {
        if (!(k in expect)) {
            x = FALSE
            err[++err_i] = "actual has key " k
            break
        }
    }
    for (k in expect) {
        if (expect[k] != actual[k]) {
            x = FALSE
            err[++err_i] = "key:" k " expect:" expect[k] " actual:" actual[k]
            break
        }
    }
    if (x) {
        print "assert_arr_eq", msg, "SUCCESS"
    } else {
        print "assert_arr_eq", msg, "FAILURE"
        for (i = 1; i <= err_i; i++) {
            print "    " err[i]
        }
    }
}

function assert_arr_eq_todo(expect, actual, msg) {
    assert_eq(ARR_TODO, actual, msg)
}
