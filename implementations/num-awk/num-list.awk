############################################################################
#
# num-list.awk
#
###

###
#
# Number of items, a.k.a. count, length.
#
# Example:
#
#     num_n(1 2 4) => 3
#
###

function num_n(arr) {
    return num_arr_length(arr)
}

function num_n_(num, num_, opts,  f) {
    f = "num_n"
    if (!(f in num_)) num_[f] = num_n(num)
    return num_[f]
}

function num_n_init() {
    function_init("n count length size", "Get the number of items, a.k.a. count, length, size.", "https://en.wikipedia.org/wiki/Enumeration")
}

###
#
# First item.
#
# Example:
#
#     num_first(1 2 4) => 1
#
###

function num_first(arr) {
    return arr[1]
}

function num_first_(num, num_, opts,  f) {
    f = "num_first"
    if (!(f in num_)) num_[f] = num_first(num)
    return num_[f]
}

function num_first_init() {
    function_init("first head", "Get the first item.", "https://en.wikipedia.org/wiki/Enumeration")
}

###
#
# Last item.
#
# Example:
#
#   num_last(1 2 4) => 4
#
###

function num_last(arr) {
    return arr[length(arr)]  # TODO: POSIX
}

function num_last_(num, num_, opts,  f) {
    f = "num_last"
    if (!(f in num_)) num_[f] = num_last(num)
    return num_[f]
}

function num_last_init() {
    function_init("last tail", "Get the last item.", "https://en.wikipedia.org/wiki/Enumeration")
}

###
#
# Minimum value.
#
# Example:
#
#     num_min(1 2 4) => 1
#
# This implementation does a scan of the entire array.
#
###

function num_min(arr,  _min, i) {
    _min = ""
    for (i in arr) {
        if (_min == "" || arr[i] < _min) {
            _min = arr[i]
        }
    }
    return _min
}

function num_min_(num, num_, opts,  f) {
    f = "num_min"
    if (!(f in num_)) num_[f] = num_min(num)  # TODO optimize ascending & descending
    return num_[f]
}

function num_min_init() {
    function_init("min minimum least lowest", "Get the minimum value, a.k.a. least, lowest.", "https://en.wikipedia.org/wiki/Maxima_and_minima")
}

###
#
# Maximum value.
#
# Example:
#
#     num_max(1 2 4) => 4
#
# This implementation does a scan of the entire array.
#
function num_max(arr,  _max, i) {
    _max = ""
    for (i in arr) {
        if (_max == "" || arr[i] > _max) {
            _max = arr[i]
        }
    }
    return _max
}

function num_max_(num, num_, opts,  f) {
    f = "num_max"
    if (!(f in num_)) num_[f] = num_max(num)  # TODO optimize ascending & descending
    return num_[f]
}

function num_max_init() {
    function_init("max maximum greatest highest", "Get the maximum value, a.k.a. greatest, highest.", "https://en.wikipedia.org/wiki/Maxima_and_minima")
}

###
#
# Range, a.k.a. spread.
#
# Example:
#
#     num_range(1 2 4) => 3
#
###

function num_range(arr) {
    return num_max(arr) - num_min(arr)
}

function num_range_(num, num_, opts,  f) {
    f = "num_range"
    if (!(f in num_)) num_[f] = num_max_(num, num_, opts) - num_min_(num, num_, opts)
    return num_[f]
}

function num_range_init() {
    function_init("range interval breadth spread", "Get the range, a.k.a. interval, breadth, spread.", "https://en.wikipedia.org/wiki/Range_(statistics)")
}
