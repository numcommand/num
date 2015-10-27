############################################################################
#
# STATISTICS
#
###

###
#
# Sum, a.k.a. total.
#
# Example:
#
#     1 2 4 => 7
#
function sum(arr,  x) {
    for (i in num) x += num[i]
    return x
}

###
#
# Mean, a.k.a. arithmetic mean, average.
#
# Example:
#
#     1 2 4 => 2.33333
#
function mean(arr) {
    return sum(arr) / n(array)
}

###
#
# Mean absolute deviation.
#
# The average distance between each value and the mean.
#
# Example:
#
#     1 2 4 => 1.11111
#
function mean_absolute_deviation(arr,  _mean, _n, x) {
    _mean = mean(arr)
    _n = n(arr)
    for (i in num) x += abs(num[i] - _mean)
    return x / _n
}

###
#
# Median.
#
# Example:
#
#     1 2 4 => 2
#     1 2 4 99 => 3
#
# This function requires the array to already be sorted.
#
function median(arr,  _n, i) {
    _n = n(arr)
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
#     1 2 4 => 2
#     1 2 4 99 => 2
#
function median_low(arr,  _n, i) {
    _n = n(arr)
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
#     1 2 4 => 2
#     1 2 4 99 => 4
#
function median_high(arr,  _n, i) {
    _n = n(arr)
    if (_n % 2) {
        i = (_n + 1) / 2
    } else {
        i = (_n / 2) + 1
    }
    return arr[i]
}
