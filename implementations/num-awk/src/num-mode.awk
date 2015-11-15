############################################################################
#
# num-mode.awk
#
##

##
#
# Mode: get the mode, which may be a number, or list, or UNDEF.
#
# The mode is:
#
#   * The values that appear most often in a set of data.
#   * If values appear the same number of times, there are multiple modes.
#   * If each value occurs only once, then there are no modes.
#
# Examples:
#
#     1 2 2 3 => 2
#     1 1 2 3 3 => 1 3
#     1 2 3 => UNDEF
#
##

function num_mode(arr,  seen, max) {
    for (i in arr) seen[arr[i]]++
    max = arr_max_via_scan(_seen)
    if (max <= 1) return ""
    for (i in seen) {
        if (seen[i] == max) {
            mode_list[++mode_list_i] = i
        }
    }
    return num_join(mode_arr, OFS)
}

function num_mode_(num, num_, opts,  f, i, seen, max, mode_arr, mode_arr_i) {
    f = "num_mode"
    if (!(f in num_)) {
        if (num_["unique"]) {
            num_[f] = num_["mode_arr"] = num_["mode_arr_i"] = UNDEF
        } else {
            for (i in num) seen[num[i]]++
            max = arr_max_via_scan(_seen)
            if (max <= 1) {
                num_["unique"] = TRUE
                num_[f] = num_["mode_arr"] = num_["mode_arr_i"] = UNDEF
            } else {
                for (i in seen) {
                    if (seen[i] == max) {
                        mode_arr[++mode_arr_i] = i
                    }
                }
                num_["mode_arr"] = mode_arr
                num_["mode_arr_i"] = mode_arr_i
                num_["mode"] = num_join(mode_arr, OFS)
            }
        }
    }
    return num_[f]
}

function num_mode_init() {
    num_function_init("num_mode mode", "Get the mode, which may be a value, or list, or UNDEF.", "https://en.wikipedia.org/wiki/Mode_(statistics)")
}

##
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
##

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
    num_function_init("num_mode_low mode_low", "Get the first mode, if any, or UNDEF.", "https://en.wikipedia.org/wiki/Mode_(statistics)")
}

##
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
##

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
    num_function_init("num_mode_high mode_high", "Get the last mode, if any, or UNDEF.", "https://en.wikipedia.org/wiki/Mode_(statistics)")
}
