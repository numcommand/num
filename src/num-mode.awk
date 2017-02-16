############################################################################
#
# num-mode.awk
#
##

##
#
# Modes: get the modes, which may be a number, or list, or UNDEF.
#
# The modes are:
#
#   * The value that appears most often in a set of data.
#   * If mutlipe values appear as often, there are multiple modes.
#   * If each value occurs only once, then there are no modes.
#
# Examples:
#
#     1 2 2 3 => 2
#     1 1 2 3 3 => 1 3
#     1 2 3 => UNDEF
#
# Output the `modes` array.
# Return the `modes` array length.
#
# Examples:
#
#     num_modes(1 2 3, modes)     => 0, modes == []
#     num_modes(1 2 2 3, modes)   => 1, modes == [2]
#     num_modes(1 1 2 3 3, modes) => 2, modes == [1, 3]
#
##

function num_modes(arr, modes,  modes_i, i, n, seen, max) {
    for (i in arr) {
        # Optimization: use one scan
        n = ++seen[arr[i]]
        if (max == "" || max < n) max = n
    }
    split("", out); out_i = 0
    if (max > 1) {
        for (i in seen) {
            if (seen[i] == max) {
                out[++out_i] = i
            }
        }
    }
    return out_i
}

function num_modes_(num, num_, opts, modes,  f, modes_i) {
    f = "num_modes"
    if (!(f in num_)) {
        if (num_["unique"]) {
            num_[f] = num_["num_mode_min"] = num_["num_mode_max"] = UNDEF
        } else {
            # TODO: optimize if we know the array is sorted
            num_[f] = modes_i = num_modes(num, modes)
            if (modes_i == 0) {
                num_["unique"] = TRUE
                num_["num_mode_min"] = num_["num_mode_max"] = UNDEF
            } else {
                num_["unique"] = FALSE
            }
            num_[f] = modes_i
        }
    }
    return num_[f]
}

function num_modes_init() {
    num_function_init(\
        "num_modes modes", 0,
        "Get the modes, which is a list.",
        "https://en.wikipedia.org/wiki/Mode_(statistics)")
}

##
#
# Mode min: get the minimum mode, if any, or UNDEF.
#
# TODO: IMPLEMENT
#
# Examples:
#
#     num_mode_min(1 2 3) => UNDEF
#     num_mode_min(1 2 2 3) => 2
#     num_mode_min(1 1 2 4 4) => 1
#
##

function num_mode_min(arr) {
    return TODO
}

function num_mode_min_(num, num_, opts,  f) {
    f = "num_mode_min"
    if (!(f in num_)) {
        num_[f] = TODO
    }
    return num_[f]
}

function num_mode_min_init() {
    num_function_init(\
        "num_mode_min mode_min", 0,
        "Get the minimum mode, if any, or UNDEF.",
        "https://en.wikipedia.org/wiki/Mode_(statistics)")
}

##
#
# Mode max: get the maximum mode, if any, or UNDEF.
#
# TODO: IMPLEMENT
#
# Examples:
#
#     num_mode_max(1 2 3) => UNDEF
#     num_mode_max(1 2 2 3) => 2
#     num_mode_max(1 1 2 4 4) => 4
#
##

function num_mode_max(arr) {
    return TODO
}

function num_mode_max_(num, num_, opts,  f) {
    f = "num_mode_max"
    if (!(f in num_)) {
        num_[f] = TODO
    }
    return num_[f]
}

function num_mode_max_init() {
    num_function_init(\
        "num_mode_max mode_max", 0,
        "Get the maximum mode, if any, or UNDEF.",
        "https://en.wikipedia.org/wiki/Mode_(statistics)")
}
