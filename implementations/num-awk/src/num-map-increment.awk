############################################################################
#
# num-map-increment.awk
#
##

##
#
# Map increment.
#
# Example:
#
#     num_map_increment_(1 2 3) => -2 3 4
#
##

function num_map_increment(arr) {
    for (i in arr) arr[i] = num_increment(arr[i])
}

function num_map_increment_(num, num_, opts,  f, i, memo) {
    f = "num_map_increment"
    if (num_[f] != TRUE) {
        map_before_(num, num_, opts, memo)
        num_map_increment(num)
        map_after_(num, num_, opts, memo)
        num_[f] = TRUE
    }
    return ""
}

function num_map_increment_init() {
    num_function_init(\
        "num_map_increment increment", 0,
        "Map using increment.",
        "https://en.wikipedia.org/wiki/Increment_and_decrement_operators")
}
