############################################################################
#
# num-math.awk
#
###

###
#
# Absolute value.
#
# Examples:
#
#    abs(1) => 1
#    abs(-1) => 1
#
function num_abs(x) {
    if (x >= 0) { return x } else { return -x }
}

###
#
# Sum, a.k.a. total.
#
# Example:
#
#     num_sum(1 2 4) => 7
#
function num_sum(arr,  x) {
    for (i in arr) x += arr[i]
    return x
}

###
#
# Product.
#
# Example:
#
#     num_product(1 2 4) => 8
#
function num_product(arr,  x) {
    x = 1
    for (i in arr) x *= arr[i]
    return x
}
