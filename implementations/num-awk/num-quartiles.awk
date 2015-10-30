############################################################################
#
# num-quartiles.awk
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
#     num_interquartile_range(1 2 3 4 5) => 2.5
#
function num_interquartile_range(arr) {
    return quartile_3(arr) - quartile_1(arr)
}

# Alias
function num_iqr(arr) {
    return num_interquartile_range(arr)
}

###
#
# Quartile 0, a.k.a. Q0, 0th percentile, minimum.
#
# Example:
#
#     num_quartile_0(1 2 3 4 5) => 1
#
function num_quartile_0(arr) {
    return min(arr)
}

# Alias
function num_q0(arr) {
    return num_quartile_0(arr)
}

###
#
# Quartile 1, a.k.a. Q1, 25th percentile, lower quartile.
#
# Example:
#
#     num_quartile_1(1 2 3 4 5) => 1.75
#
# Requires sorted array.
#
function num_quartile_1(arr,  _n, q1, i, x) {
    _n = n(arr)
    if ((_n % 2) == 0) {
        i = (_n / 2) - 1
        q1 = num_arr_sorted_median_slice(arr, 1, i)
    } else if ((_n % 4) == 1) {
        x = ((_n - 1) / 4)
        q1 = (0.25 * arr[x]) + (0.75 * arr[x+1])
    } else if ((_n % 4) == 3) {
        x = ((_n - 3) / 4)
        q1 = (0.75 * arr[x+1]) + (0.25 * arr[x+2])
    } else {
        q1 = ""
    }
    return q1
}

# Alias
function num_q1(arr) {
    return num_quartile_1(arr)
}

###
#
# Quartile 2, a.k.a. Q2, 50th percentile, median.
#
# Example:
#
#     num_quartile_1(1 2 3 4 5) => 3
#
function num_quartile_2(arr,  f) {
    return median(arr)
}

# Alias
function num_q2(arr) {
    return num_quartile_2(arr)
}

###
#
# Quartile 3, a.k.a. Q3, 75th percentile, upper quartile.
#
# Example:
#
#     num_quartile_1(1 2 3 4 5) => 4.25
#
# Requires sorted array.
#
function num_quartile_3(arr,  _n, q3, i, x) {
    _n = n(arr)
    if ((_n % 2) == 0) {
        i = (_n % 2) + 1
        q3 = num_arr_sorted_median_slice(arr, i, _n)
    }
    else if ((_n % 4) == 1) {
        x = (_n - 1) / 4
        q3 = (0.75 * arr[3 * x + 1]) + (0.25 * arr[3 * x + 2])
    }
    else if ((_n % 4) == 3) {
        x = (_n - 3) / 4
        q3 = (0.25 * arr[3 * x + 2]) + (0.75 * arr[3 * x + 3])
    }
    else {
        q3 = ""
    }
    return q3
}

# Alias
function num_q3(arr) {
    return num_quartile_3(arr)
}

###
#
# Quartile 4, a.k.a. Q4, 100th percentile, maximum.
#
# Example:
#
#     num_quartile_1(1 2 3 4 5) => 5
#
function num_quartile_4(arr) {
    return max(arr)
}

# Alias
function num_q4(arr) {
    return num_quartile_4(arr)
}
