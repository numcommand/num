############################################################################
#
# num-map-sign.awk
#
##

##
#
# Map sign.
#
# Example:
#
#     num_map_sign_(-8 0 8) => -1 0 1
#
##

function num_map_sign(arr) {
    for (i in arr) arr[i] = num_sign(arr[i])
}

function num_map_sign_(num, num_, opts,  f, i, memo) {
    f = "num_map_sign"
    if (num_[f] != TRUE) {
        map_before_(num, num_, opts, memo)
        num_map_sign(num)
        map_after_(num, num_, opts, memo)
        num_[f] = TRUE
    }
    return ""
}

function num_map_sign_init() {
    num_function_init("num_map_sign sign", "Map using sign.")
}
