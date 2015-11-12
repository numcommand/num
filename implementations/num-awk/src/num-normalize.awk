############################################################################
#
# num-normalize.awk
#
###

###
#
# Map: normalize each value to be 0 to 1.
#
# Example:
#
#     num_map_normalize(1 2 4) => 0 0.33333 1
#
###

function num_map_normalize_with_min_max(arr, min_old, max_old, min_new, max_new) {
    multiply = (max_new - min_new) / (max_old - min_old)
    add = min_new - (multiply * min_old)
    for (i in arr) arr[i] = arr[i] * multiply + add
}

function num_map_normalize(arr) {
    return num_map_normalize_with_min_max(arr, num_min(arr), num_max(arr), 0, 1)
}

function num_map_normalize_(num, num_, opts,  f, min_old, max_old, min_new, max_new, multiply, add) {
    f = "num_map_normalize"
    if (num_[f] != TRUE) {
        map_before_(num, num_, opts, memo)
        x = num_map_normalize_with_min_max(num, num_min_(num, num_, opts), num_max_(num, num_, opts), 0, 1)
        map_after_(num, num_, opts, memo)
        num_[f] = TRUE
    }
    return ""
}

function num_map_normalize_init() {
    num_function_init("map_normalize normalize norm", "Map using normalize.", "https://wikipedia.org/wiki/Normalization_(statistics)")
}
