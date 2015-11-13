############################################################################
#
# num-median.awk
#
##

##
#
# Median of an array slice.
#
# Example:
#
#     num_median_slice((1 2 4), 1, 3) => 2
#     num_median_slice((1 2 4 9 9), 1, 3) => 3
#
##

function num_median_of_slice(arr, start, stop,  _n, i) {
    _n = 1 + stop - start
    if (_n % 2) {
        i = (start - 1) + ((_n + 1) / 2)
        return arr[i]
    } else {
        i = (start - 1) + (_n / 2)
        return (arr[i] + arr[i+1]) / 2
    }
}

##
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
##

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

function num_median_(num, num_, opts,  f, i, _n) {
    f = "num_median"
    if (!(f in num_)) {
        _n = num_n_(num, num_, opts)
        num_sort_ascending_(num, num_, opts)
        if (_n % 2) {
            i = (_n + 1) / 2
            num_[f] = num_["num_median_low"] = num_["num_median_high"] = num[i]
        } else {
            i = _n / 2
            num_["num_median_low"] = num[i]
            num_["num_median_high"] = num[i+1]
            num_[f] = (num[i] + num[i+1]) / 2.0
        }
    }
    return num_[f]
}

function num_median_init() {
    num_function_init("median med", "Get the median.", "https://en.wikipedia.org/wiki/Normalization_(statistics)")
}

##
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

function num_median_low_(num, num_, opts,  f, _n) {
    f = "num_median_low"
    if (!(f in num_)) {
        num_median_(num, num_, opts)  # n.b. median sets median_low
    }
    return num_[f]
}

function num_median_low_init() {
    num_function_init("median_low med_low", "Get the median that is lower a.k.a. lesser.", "https://en.wikipedia.org/wiki/Normalization_(statistics)")
}

##
#
# Median high: get the greater median.
#
# Example:
#
#     num_median_high(1 2 4) => 2
#     num_median_high(1 2 4 99) => 4
#
##

function num_median_high(arr,  _n, i) {
    _n = num_n(arr)
    if (_n % 2) {
        i = (_n + 1) / 2
    } else {
        i = (_n / 2) + 1
    }
    return arr[i]
}

function num_median_high_(num, num_, opts,  f, _n) {
    f = "num_median_high"
    if (!(f in num_)) {
        num_median_(num, num_, opts)  # n.b. median sets median_high
    }
    return num_[f]
}

function num_median_high_init() {
    num_function_init("median_high med_high", "Get the median that is higher a.k.a. greater.", "https://en.wikipedia.org/wiki/Normalization_(statistics)")
}
