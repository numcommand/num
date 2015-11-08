############################################################################
#
# num-arr.awk
#
###

###
#
# Dump an array, suitable for debugging.
#
# Example:
#
#     num_arr_dump(arr)
#     1 a
#     2 b
#     3 d
#
function num_arr_dump(arr) {
    for (k in arr) print k, arr[k]
}

###
#
# Is an array empty?
#
# Example:
#
#   split("", arr)
#   num_arr_empty(arr) => TRUE
#
# This is POSIX compatible.
#
function num_arr_empty(arr,  i) {
    for (i in arr) return FALSE
    return TRUE
}

###
#
# Length of an array.
#
# Example:
#
#     num_arr_length(1 2 4) => 3
#
# TODO: benchmark this POSIX implementation with
# any Gawk implementation, and if Gawk is much faster,
# then research a way to use the Gawk implementation.
#
function num_arr_length(arr,  i, len) {
    for (i in arr) len++
    return len
}

###
#
# Swap array items.
#
# Example:
#
#     arr = 4 5 6
#     num_arr_swap(arr, 1, 3) => 6 5 4
#
###

function num_arr_swap(A, i, j,   t) {
    t = A[i]; A[i] = A[j]; A[j] = t
}

###
#
# Get the closest value to a target value in an array.
#
# Example:
#
#    arr = 1 2 4
#    target = 2.5
#    num_arr_closest_value(arr, target) => 2
#
# If multiple values are equidistant to the target,
# then return the earliest index.
#
# TODO optimize when the array is already sorted,
# by using quicksort or similar divide-and-conquer.
#
function num_arr_closest_value(arr, target,  _closest_value, _closest_delta, _delta, x, i) {
    for (i in arr) {
        _delta = num_abs(arr[i] - target)
        if (_closest_delta == "" || _delta < _closest_delta) {
            _closest_value = arr[i]
            _closest_delta = _delta
        }
    }
    return _closest_value
}

###
#
# Join an array to a string, with a separator string.
#
# Example:
#
#     num_arr_join(1 2 4, ",") => "1,2,4"
#
function num_arr_join(arr, sep,  s, i) {
    s = ""
    for (i in arr) s = s arr[i] sep
    s = substr(s, 1, length(s) - length(sep))
    return s
}
