############################################################################
#
# num-statistics.awk
#
###

###
#
# Mean, a.k.a. arithmetic mean, average.
#
# Example:
#
#     num_mean(1 2 4) => 2.33333
#
function num_mean(arr) {
    return sum(arr) / n(arr)
}

###
#
# Mean, with a linear list, minimum, and maximum.
#
# Example:
#
#     num_mean_with_linear_n_min_max(1 2 4) => 2.33333
#
# Requirement: the array is linear.
#
function num_mean_with_linear_n_min_max(arr, _n, _min, _max) {
    return _min + (_max - _min) / n
}

###
#
# Mean absolute deviation.
#
# The average distance between each value and the mean.
#
# Example:
#
#     num_mean_absolute_deviation(1 2 4) => 1.11111
#
function num_mean_absolute_deviation(arr,  _mean, _n, x) {
    _mean = num_mean(arr)
    _n = num_n(arr)
    for (i in arr) x += abs(arr[i] - _mean)
    return x / _n
}

# Alias
function num_mad(arr) {
    return num_mean_absolute_deviation(arr)
}

###
#
# Trimean.
#
# Example:
#
#    num_trimean(1 1.75 3 27.75 99) => 8.875
#
# Requirement: the array is sorted.
#
function num_trimean(arr,  _q1, _q2, _q3) {
    _q1 = num_quartile_1(arr)
    _q2 = num_quartile_2(arr)
    _q3 = num_quartile_3(arr)
    return (_q1 + _q2 + _q2 + _q3) / 4
}

###
#
# Median.
#
# Example:
#
#     num_median(1 2 4) => 2
#     num_median(1 2 4 99) => 3
#
# Requirement: the array is sorted.
#
function num_median(arr,  _n, i) {
    _n = num_n(arr)
    if (_n % 2) {
        i = (_n + 1) / 2
        return arr[i]
    } else {
        i = _n / 2
        return (arr[i] + arr[i+1]) / 2.0
    }
}

###
#
# Median low: get the lesser median.
#
# Example:
#
#     num_median_low(1 2 4) => 2
#     num_median_low(1 2 4 99) => 2
#
function num_median_low(arr,  _n, i) {
    _n = num_n(arr)
    if (_n % 2) {
        i = (_n + 1) / 2
    } else {
        i = _n / 2
    }
    return arr[i]
}

###
#
# Median high: get the greater median.
#
# Example:
#
#     num_median_high(1 2 4) => 2
#     num_median_high(1 2 4 99) => 4
#
function num_median_high(arr,  _n, i) {
    _n = num_n(arr)
    if (_n % 2) {
        i = (_n + 1) / 2
    } else {
        i = (_n / 2) + 1
    }
    return arr[i]
}

###
#
# Sum of mean deviation exp.
#
# Example:
#
#     arr = 1 2 4
#     exponent = 3
#     sum_of_mean_deviation_exp(arr, exponent) => sum of cubes
#
# Typically useful to calculate variance, skewness, kurtosis.
#
function num_sum_of_mean_deviation_exp(arr, exponent,  i, _sum, _mean) {
    _mean = num_mean(arr)
    for (i in arr) _sum += (arr[i] - _mean) ^ exponent
    return _sum
}
