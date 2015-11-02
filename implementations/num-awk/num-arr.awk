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
#     arr_dump(arr)
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
#   arr_empty(arr) => TRUE
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
#     arr_length(1 2 4) => 3
#
function num_arr_length(arr,  i, len) {
    if (AWK_HAS_LENGTH == TRUE) {
        return length(arr)
    } else {
        for (i in arr) len++
        return len
    }
}

###
#
# Get the closest value to a target value in an array.
#
# Example:
#
#    arr = 1 2 4
#    target = 2.5
#    arr_closest_value(arr, target) => 2
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
#     arr_join(1 2 4, ",") => "1,2,4"
#
function num_arr_join(arr, sep,  s, i) {
    s = ""
    for (i in arr) s = s arr[i] sep
    s = substr(s, 1, length(s) - length(sep))
    return s
}
