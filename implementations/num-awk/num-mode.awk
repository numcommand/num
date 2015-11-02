############################################################################
#
# num-mode.awk
#
###

###
#
# Mode: get the mode, which may be a number, or list, or UNDEF.
#
# TODO: IMPLEMENT
#
# Examples:
#
#     1 2 2 4 => 2
#     1 1 2 4 4 => 1 4
#     1 2 3 => UNDEF
#
###

function num_mode(arr) {
    return TODO
}

function num_mode_(num, num_, opts,  f) {
    f = "num_mode"
    if (!(f in num_)) {
        num_[f] = TODO
    }
    return num_[f]
}

function num_mode_init() {
    function_init("mode", "Get the mode, which may be a value, or list, or UNDEF.", "https://en.wikipedia.org/wiki/Mode_(statistics)")
}

###
#
# Mode-low: get the first mode, if any, or UNDEF.
#
# TODO: IMPLEMENT
#
# Examples:
#
#     1 2 2 3 => 2
#     1 1 2 4 4 => 1
#     1 2 3 => UNDEF
#
###

function num_mode_low(arr) {
    return TODO
}

function num_mode_low_(num, num_, opts,  f) {
    f = "num_mode_low"
    if (!(f in num_)) {
        num_[f] = TODO
    }
    return num_[f]
}

function num_mode_low_init() {
    function_init("mode_low", "Get the first mode, if any, or UNDEF.", "https://en.wikipedia.org/wiki/Mode_(statistics)")
}

###
#
# Mode-high: get the last mode, if any, or UNDEF.
#
# TODO: IMPLEMENT
#
# Examples:
#
#     1 2 2 3 => 2
#     1 1 2 4 4 => 4
#     1 2 3 => UNDEF
#
###

function num_mode_high(arr) {
    return TODO
}

function num_mode_high_(num, num_, opts,  f) {
    f = "num_mode_high"
    if (!(f in num_)) {
        num_[f] = TODO
    }
    return num_[f]
}

function num_mode_high_init() {
    function_init("mode_high", "Get the last mode, if any, or UNDEF.", "https://en.wikipedia.org/wiki/Mode_(statistics)")
}
