############################################################################
#
# num-map-absolute-value.awk
#
##

##
#
# Map absolute value.
#
# Example:
#
#     num_map_absolute_value_(1 -2 3) => 1 2 3
#
##

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
    num_function_init(\
        "num_map_absolute_value absolute_value abs magnitude", 0,
        "Map using absolute value.",
        "https://en.wikipedia.org/wiki/Absolute_value_(algebra)")
}

# Alias
function num_map_abs(arr) { return num_map_absolute_value(arr) }
function num_map_abs_(num, num_, opts) { return num_map_absolute_value_(num, num_, opts) }
