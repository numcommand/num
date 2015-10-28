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
#     1 2 4 => 3
#
function n(arr) {
    return length(arr)  # TODO: POSIX
}

###
#
# First item.
#
# Example:
#
#   1 2 4 => 1
#
function first(arr) {
    return arr[1]
}

###
#
# Last item.
#
# Example:
#
#   1 2 4 => 4
#
function last(arr) {
    return arr[length(arr)]  # TODO: POSIX
}

###
#
# All items.
#
# Note that this function does nothing;
# it is enable indirect function calling.
#
function all(arr) {
    return arr
}

###
#
# Minimum value.
#
# Example:
#
#     1 2 4 => 1
#
# This implementation does a scan of the entire array.
#
function min(arr,  _min, i) {
    _min = ""
    for (i in arr) {
        if (_min == "" || arr[i] < _min) {
            _min = arr[i]
        }
    }
    return _min
}

###
#
# Maximum value.
#
# Example:
#
#     1 2 4 => 4
#
# This implementation does a scan of the entire array.
#
function max(arr,  _max, i) {
    _max = ""
    for (i in arr) {
        if (_max == "" || arr[i] > _max) {
            _max = arr[i]
        }
    }
    return _max
}

###
#
# Range, a.k.a. spread.
#
# Example:
#
#     1 2 4 => 3
#
function range(arr) {
    return max(arr) - min(arr)
}
