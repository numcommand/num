############################################################################
#
# num-mean-absolute-deviation.awk
#
##

##
#
# Mean absolute deviation.
#
# The average distance between each value and the mean.
#
# Example:
#
#     num_mean_absolute_deviation(1 2 4) => 1.11111
##

function num_mean_absolute_deviation(arr,  _mean, _n, x) {
    _mean = num_mean(arr)
    _n = num_n(arr)
    for (i in arr) x += num_absolute_value(arr[i] - _mean)
    return x / _n
}

function num_mean_absolute_deviation_(num, num_, opts,  f, _n, _mean, i, x) {
    f = "num_mean_absolute_deviation"
    if (!(f in num_)) {
        _n = num_n_(num, num_, opts)
        _mean = num_mean_(num, num_, opts)
        for (i in num) x += num_absolute_value(num[i] - _mean)
        num_[f] = x / _n
    }
    return num_[f]
}

function num_mean_absolute_deviation_init() {
    num_function_init("mean_absolute_deviation mad", "Get the average distance between each value and the mean.", "https://en.wikipedia.org/wiki/Average_absolute_deviation")
}

# Alias
function num_mad(arr) { return num_mean_absolute_deviation(arr) }
function num_mad_(num, num_, opts) { return num_mean_absolute_deviation_(num, num_, opts) }
