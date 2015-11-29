############################################################################
#
# num-meanest.awk
#
##

##
#
# Meanest, i.e. the value closest to the mean.
#
# Example:
#
#     num_meanest(1 2 4) => 2
#
##

function num_meanest(arr) {
    return num_arr_closest_value(arr, num_mean(arr))
}

function num_meanest_(num, num_, opts,  f, _n, _mean, i, x) {
    f = "num_meanest"
    if (!(f in num_)) num_[f] = num_arr_closest_value(num, num_mean_(num, num_, opts))
    return num_[f]
}

function num_meanest_init() {
    num_function_init(\
        "num_meanest meanest", 0,
        "Get the value that is closest to the mean.",
        "https://en.wikipedia.org/wiki/Mean")
}
