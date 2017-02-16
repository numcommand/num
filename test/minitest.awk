##
# This file has a some simple test functions.
#
# We include these test functions in our actual tests.
# If there's a better way to create a library of functions,
# please let us know and we'll update these test files.
#
# If you're translating num into any other language,
# feel free to use your own language's testing framework,
# testing patterns, and the like. 
##

function assert_init() {
    TRUE=1
    FALSE=0
    TODO="TODO"
    split(TODO, ARR_TODO)
}

function gsub_newline_to_rs(  s) {
    gsub(/\n/, "␞", s)
    return s
}

function assert_eq(expect, actual, msg) {
    if (expect == actual) {
        print "assert_eq", msg, "expect:" gsub_newline_to_rs(expect), "actual:" gsub_newline_to_rs(actual), "SUCCESS"
    }  else {
        print "assert_eq", msg, "expect:" gsub_newline_to_rs(expect), "actual:" gsub_newline_to_rs(actual), "FAILURE"
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
        print "expect..."
        num_arr_dump(expect)
        print "actual..."
        num_arr_dump(actual)
    }
}

function assert_arr_eq_todo(expect, actual, msg) {
    assert_eq(ARR_TODO, actual, msg)
}
