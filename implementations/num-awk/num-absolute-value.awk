############################################################################
#
# num-absolute-value.awk
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
###

function num_absolute_value(x) {
    return (x >= 0) ? x : -x
}

# Alias
function num_abs(x) { return num_absolute_value(x) }

###
#
# Map absolute value.
#
# Example:
#
#     num_map_absolute_value_(1 -2 3) => 1 2 3
#
###

function num_map_absolute_value(arr) {
    for (i in arr) arr[i] = num_absolute_value(arr[i])
}

function num_map_absolute_value_(num, num_, opts,  f, i, memo) {
    f = "num_map_absolute_value"
    if (num_[f] != TRUE) {
        map_before_(num, num_, opts, memo)
        num_map_absolute_value(num)
        map_after_(num, num_, opts, memo)
        num_[f] = TRUE
    }
    return ""
}

function num_map_absolute_value_init() {
    function_init("map_absolute_value absolute_value abs magnitude", "Map using absolute value.")
}

# Alias
function num_map_abs(arr) { return num_map_absolute_value(arr) }
function num_map_abs_(num, num_, opts) { return num_map_absolute_value_(num, num_, opts) }
