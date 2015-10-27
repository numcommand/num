############################################################################
#
# QUARTILES
#
# This implemention uses the smoothing method for discrete distrubtions:
#
#   * If there are an even number of data points, then the median is no
#     single datum point. Do not include the median in either half.
#
#   * If there are (4x+1) data points, then the lower quartile is 25% of the
#     xth data value plus 75% of the (x+1)th data value; the upper quartile
#     is 75% of the (3x+1)th data point plus 25% of the (3x+2)th data point.
#
#   * If there are (4x+3) data points, then the lower quartile is 75% of the
#     (x+1)th data value plus 25% of the (x+2)th data value; the upper
#     quartile is 25% of the (3x+2)th data point plus 75% of the (3x+3)th
#     data point.
#
#   * This ensures that the median value is given its correct weight,
#     and thus quartile values change as smoothly as possible as additional
#     data points are added.
#
#   * For more see https://en.wikipedia.org/wiki/Quartile
#
###

###
#
# Interquartile Range, a.k.a. IQR.
#
# Example:
#
#     TODO
#
function interquartile_range(arr) {
    return quartile_3(arr) - quartile_1(arr)
}

###
#
# Quartile 0, a.k.a. Q0, 0th percentile, minimum.
#
# Example:
#
#     TODO
#
function quartile_0(arr) {
    return min(arr)
}

###
#
# Quartile 1, a.k.a. Q1, 25th percentile, lower quartile.
#
# Example:
#
#     TODO
#
# Requires sorted array.
#
function quartile_1(arr,  _n, q1, i, x) {
    _n = n(arr)
    if ((_n % 2) == 0) {
        i = (_n / 2) - 1
        q1 = arr_sorted_median_slice(num, 1, i)
    }
    else if ((_n % 4) == 1) {
        x = ((_n - 1) / 4)
        q1 = (0.25 * num[x]) + (0.75 * num[x+1])
    }
    else if ((_n % 4) == 3) {
        x = ((_n - 3) / 4)
        q1 = (0.75 * num[x+1]) + (0.25 * num[x+2])
    else {
        q1 = ""
    }
    return q1
}

###
#
# Quartile 2, a.k.a. Q2, 50th percentile, median.
#
# Example:
#
#     TODO
#
function quartile_2(arr,  f) {
    return median(arr)
}

###
#
# Quartile 3, a.k.a. Q3, 75th percentile, upper quartile.
#
# Example:
#
#     TODO
#
# Requires sorted array.
#
function quartile_3(arr,  _n, q3, i, x) {
    _n = n(arr)
    if ((_n % 2) == 0) {
        i = (_n % 2) + 1
        q3 = arr_sorted_median_slice(num, i, _n)
    }
    else if ((_n % 4) == 1) {
        x = (_n - 1) / 4
        q3 = (0.75 * num[3 * x + 1]) + (0.25 * num[3 * x + 2])
    }
    else if ((_n % 4) == 3) {
        x = (_n - 3) / 4
        q3 = (0.25 * num[3 * x + 2]) + (0.75 * num[3 * x + 3])
    }
    else {
        q3 = ""
    }
    return q3
}

###
#
# Quartile 4, a.k.a. Q4, 100th percentile, maximum.
#
# Example:
#
#     TODO
#
function quartile_4(arr) {
    return max(arr)
}
