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
###

function num_interquartile_range(arr) {
    return num_quartile_3(arr) - num_quartile_1(arr)
}

function num_interquartile_range_(num, num_, opts,  f) {
    f = "num_interquartile_range"
    if (!(f in num_)) num_[f] = num_quartile_3_(num, num_, opts) - num_quartile_1_(num, num_, opts)
    return num_[f]
}

function num_interquartile_range_init() {
    num_function_init("interquartile_range i_q_r mid_spread middle_fifty", "Get the interquartile range, a.k.a. IQR.", "https://en.wikipedia.org/wiki/Interquartile_range")
}

# Alias
function num_iqr(arr) { return num_interquartile_range(arr) }
function num_iqr_(num, num_, opts) { return num_interquartile_range_(num, num_, opts) }

###
#
# Quartile 0, a.k.a. Q0, 0th percentile, minimum.
#
# Example:
#
#     num_quartile_0(1 2 3 4 5) => 1
#
###

function num_quartile_0(arr) {
    return num_min(arr)
}

function num_quartile_0_(num, num_, opts,  f) {
    f = "num_quartile_0"
    if (!(f in num_)) num_[f] = num_min_(num, num_, opts)
    return num_[f]
}

function num_quartile_0_init() {
    num_function_init("quartile_0 q_0 0_percent", "Get the quartile 0, a.k.a. Q0, 0th percentile, minimum.", "https://en.wikipedia.org/wiki/Quartile")
}

# Alias
function num_q0(arr) { return num_quartile_0(arr) }
function num_q0_(num, num_, opts) { return num_quartile_0_(num, num_, opts) }

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
###

function num_quartile_1(arr,  _n, i, x, q1) {
    _n = num_n(arr)
    if ((_n % 2) == 0) {
        i = (_n / 2) - 1
        q1 = num_median_of_slice(arr, 1, i)
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

function num_quartile_1_(num, num_, opts,  f, _n, i, x) {
    f = "num_quartile_1"
    if (!(f in num_)) {
        _n = num_n_(num, num_, opts)
        num_median_(num, num_, opts)
        if ((_n % 2) == 0) {
            i = (_n / 2) - 1
            num_[f] = num_median_of_slice(num, 1, i)
        }
        else if ((_n % 4) == 1) {
            x = ((_n - 1) / 4)
            num_[f] = (0.25 * num[x]) + (0.75 * num[x+1])
        }
        else if ((_n % 4) == 3) {
            x = ((_n - 3) / 4)
            num_[f] = (0.75 * num[x+1]) + (0.25 * num[x+2])
        }
        else {
           num_[f] = ERROR
        }
    }
    return num_[f]
}

function num_quartile_1_init() {
    num_function_init("quartile_1 q_1 25_percent", "Get the quartile 1, a.k.a. Q1, 25th percentile, lower quartile.", "https://en.wikipedia.org/wiki/Quartile")
}

# Alias
function num_q1(arr) { return num_quartile_1(arr) }
function num_q1_(num, num_, opts) { return num_quartile_1_(num, num_, opts) }

###
#
# Quartile 2, a.k.a. Q2, 50th percentile, median.
#
# Example:
#
#     num_quartile_1(1 2 3 4 5) => 3
#
###

function num_quartile_2(arr,  f) {
    return num_median(arr)
}

function num_quartile_2_(num, num_, opts,  f) {
    f = "num_quartile_2"
    if (!(f in num_)) num_[f] = num_median_(num, num_, opts)
    return num_[f]
}

function num_quartile_2_init() {
    num_function_init("quartile_2 q_2 50_percent", "Get the quartile 2, a.k.a. Q2, 50th percentile, median.", "https://en.wikipedia.org/wiki/Quartile")
}

# Alias
function num_q2(arr) { return num_quartile_2(arr) }
function num_q2_(num, num_, opts) { return num_quartile_2_(num, num_, opts) }

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
###

function num_quartile_3(arr,  _n, i, x, q3) {
    _n = num_n(arr)
    if ((_n % 2) == 0) {
        i = (_n % 2) + 1
        q3 = num_median_of_slice(arr, i, _n)
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

function num_quartile_3_(num, num_, opts,  f, _n, i, x) {
    f = "num_quartile_3"
    if (!(f in num_)) {
        _n = num_n_(num, num_, opts)
        num_median_(num, num_, opts)
        if ((_n % 2) == 0) {
            i = (_n % 2) + 1
            num_[f] = num_median_of_slice(num, i, _n)
        }
        else if ((_n % 4) == 1) {
            x = (_n - 1) / 4
            num_[f] = (0.75 * num[3 * x + 1]) + (0.25 * num[3 * x + 2])
        }
        else if ((_n % 4) == 3) {
            x = (_n - 3) / 4
            num_[f] = (0.25 * num[3 * x + 2]) + (0.75 * num[3 * x + 3])
        }
        else {
           num_[f] = ERROR
        }
    }
    return num_[f]
}

function num_quartile_3_init() {
    num_function_init("quartile_3 q_3 75_percent", "Get the quartile 3, a.k.a. Q3, 75th percentile, upper quartile.", "https://en.wikipedia.org/wiki/Quartile")
}

# Alias
function num_q3(arr) { return num_quartile_3(arr) }
function num_q3_(num, num_, opts) { return num_quartile_3_(num, num_, opts) }

###
#
# Quartile 4, a.k.a. Q4, 100th percentile, maximum.
#
# Example:
#
#     num_quartile_1(1 2 3 4 5) => 5
#
###

function num_quartile_4(arr) {
    return num_max(arr)
}

function num_quartile_4_(num, num_, opts,  f) {
    f = "num_quartile_4"
    if (!(f in num_)) num_[f] = num_max_(num, num_, opts)
    return num_[f]
}

function num_quartile_4_init() {
    num_function_init("quartile_4 q_4 100_percent", "Get the quartile 4, a.k.a. Q4, 100th percentile, maximum.", "https://en.wikipedia.org/wiki/Quartile")
}

# Alias
function num_q4(arr) { return num_quartile_4(arr) }
function num_q4_(num, num_, opts) { return num_quartile_4_(num, num_, opts) }
