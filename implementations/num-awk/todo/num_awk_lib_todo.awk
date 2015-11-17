
###
#
# Sum of Squares, a.k.a. the sum of each deviation to the power of 2, a.k.a. SS.
#
# Example:
#
#     1 2 4 => 4.66667
#
function sum_of_squares(arr) {
    return sum_of_mean_deviation_exp(arr, 2)
}

###
#
# Sum of Cubes, a.k.a. sum of each mean deviation to the power of 3.
#
# Example:
#
#     1 2 4 => 2.22222
#
function sum_of_cubes(arr) {
    return sum_of_mean_deviation_exp(arr, 3)
}

###
#
# Sum of Quads, a.k.a. sum of each mean deviation to the power of 4.
#
# Example:
#
#     1 2 4 => TODO
#
function sum_of_quads(arr) {
    return sum_of_mean_deviation_exp(arr, 4)
}

###
#
# Population skewness
#
# Example:
#
#     1 2 4 => 0.740741
#
# A.k.a. population third moment about the mean.
#
# If skewness is greater than zero, the distribution is positively skewed.
# If it is less than zero, it is negatively skewed.
# Zero means it is symmetric.
#
function population_skewness(arr) {
    return sum_of_mean_deviation_exp_over_x(arr, 3, n(arr))
}

###
#
# Sample skewness
#
# Example:
#
#     TODO
#
# A.k.a. population third moment about the mean.
#
# Calculation:
#
#   * Sum each value deviation from the mean cubed.
#   * Divide by the number of items - 1.
#
function sample_skewness(arr,  f) {
    return sum_of_mean_deviation_exp_over_x(arr, 3, (n(arr) - 1))
}

###
#
# Population kurtosis
#
# Example:
#
#     TODO
#
# A.k.a. population fourth moment about the mean.
#
# Calculation:
#
#   * Sum each value’s deviation from the mean quaded.
#   * Divide by the number of items .
#
# The kurtosis formula measures the degree of peak.
#
# Kurtosis equals 3 for a normal distribution.
#
# Kurtosis is also a nondimensional quantity.
#
# Kurtosis measures the relative peakness or flatness of a distribution,
# relative to a normal distribution.
#
#   * Positive kurtosis (peakness) is termed leptokurtic.
#   * Negative kurtosis (flatness) is termed platykurtic.
#   * In-between is termed mesokurtic.
#
function population_kurtosis(arr) {
    return sum_of_mean_deviation_exp_over_x(arr, 4, n(arr))
}

###
#
# Sample kurtosis
#
# Example:
#
#     TODO
#
# A.k.a. population fourth moment about the mean.
#
function sample_kurtosis(arr,  f) {
    return sum_of_mean_deviation_exp_over_x(arr, 4, n(arr) - 1)
}


############################################################################
#
# MAPS
#
###

###
#
# Map: absolute value.
#
# Example:
#
#     -1 -2 -3 => 1 2 3
#
function map_abs(arr) {
    for (i in arr) arr[i] = abs(arr[i])
}

###
#
# Map: normalize each value to be 0 to 1.
#
# Example:
#
#     1 2 4 => 0 0.33333 1
#
# Example:
#
#      min_old = min(arr)
#      max_old = max(arr)
#      min_new = 0
#      max_new = 1
#      map_normalize(arr, min_old, max_old, min_new, max_new)
#
function map_normalize(arr, min_old, max_old, min_new, max_new,  multiply, add) {
    #TODO is it possible for parameters to have defaults, e.g. min_new defaults to 0?
    multiply = (max_new - min_new) / (max_old - min_old)
    add = min_new - (multiply * min_old)
    for (i in num) num[i] = num[i] * multiply + add
    split("",num_)
    num_[f] = TRUE
}

###
#
# Map: round, a.k.a. nearest integer.
#
# Example:
#
#     -1.9 1.9 => -2 2
#
function map_round(arr,  f) {
    for (i in num) num[i] = round(num[i])
}

###
#
# Map: round off, a.k.a. truncate.
#
# Example:
#
#     -1.9 1.9 => -1 1
#
function map_round_off(arr,  f) {
    for (i in num) num[i] = int(num[i])
}

?? round_off

###
#
# Map: round up, a.k.a. ceiling.
#
# Example:
#
#     -1.9 1.9 => -1 2
#
function map_round_up(arr,  f) {
    for (i in num) num[i] = ceiling(num[i])
}

###
#
# Map: round down, a.k.a. floor.
#
# Example:
#
#     -1.9 1.9 => -1 2
#
function map_round_down(arr,  f) {
    for (i in num) num[i] = floor(num[i])
}

############################################################################
#
# BOOLEAN FUNCTIONS
#
###

###
#
# Is the list all unique items?
#
# Examples:
#
#    1 2 3 => TRUE
#    1 2 2 => FALSE
#
function is_unique(arr,   seen) {
    for (i in num) {
        if (num[i] in seen) {
           return FALSE
        } else {
           seen[num[i]] = TRUE
        }
    }
    return TRUE
}

###
#
# Is the list sorted in ascending order?
#
# Examples:
#
#    1 2 3 => TRUE
#    3 2 1 => FALSE
#    2 2 2 => TRUE
#
# A.k.a. non-descending.
#
# Return TRUE iff each successive number is greater or equal.
#
function is_ascending(arr,  f, x, i, flag) {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] >= x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
                num_["strictly_descending"] = FALSE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function is_ascending_(  f) {
    function_metadata("is_ascending", "is_asc", "Is the list sorted in ascending order?")
}

###
#
# Is the list sorted in strictly ascending order?
#
# Examples:
#
#    1 2 3 => TRUE
#    3 2 1 => FALSE
#    2 2 2 => FALSE
#
# This is TRUE iff each successive number is greater.
#
function is_strictly_ascending(arr,  f, x, i, flag) {
    f="strictly_ascending"
    if (!(f in num_)) {
        if (num_["descending"] == TRUE || num_["strictly_descending"] == TRUE) {
            num_[f] = FALSE
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] > x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
                num_["ascending"] = TRUE
                num_["desending"] = num_["strictly_desending"] = FALSE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function is_strictly_ascending_(  f) {
    function_metadata("is_strictly_ascending", "is_strict_asc", "Is the list sorted in strictly ascending order?")
}

###
#
# Is the list sorted in descending order?
#
# Examples:
#
#    3 2 1 => TRUE
#    1 2 3 => FALSE
#    2 2 2 => TRUE
#
# A.k.a. non-ascending.
#
# Return TRUE when each successive number is lesser or equal.
#
function is_descending(arr,  f, x, i, flag) {
    f="descending"
    if (!(f in num_)) {
        if (num_["strictly_descending"] == TRUE) {
            num_[f] = TRUE
        } else if (num_["ascending"] == TRUE || num_["strictly_ascending"] == TRUE) {
            num_[f] = FALSE
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] <= x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
               num_["strictly_ascending"] = FALSE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function is_descending_(  f) {
    function_metadata("is_descending", "is_desc", "Is the list sorted in descending order?")
}

###
#
# Is the list sorted in strictly descending order?
#
# Examples:
#
#    3 2 1 => TRUE
#    1 2 3 => FALSE
#    2 2 2 => FALSE
#
# Return TRUE when each successive number is lesser.
#
function is_strictly_descending(num, num_,   f, x, i, flag) {
    f="strictly_descending"
    if (!(f in num_)) {
        if ("ascending" in num) {
            num_[f] = ! num_["ascending"]
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] < x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
                num_["ascending"] = num_["strictly_ascending"] = FALSE
                num_["desending"] = TRUE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function is_strictly_descending_(  f) {
    function_metadata("is_strictly_descending", "is_strict_desc", "Is the list sorted in strictly descending order?")
}

############################################################################
#
# ARRAY UTILITIES
#
###

###
#
# Dump an array, suitable for debugging.
#
# Example:
#
#     arr_dump(arr)
#     1 a
#     2 b
#     3 d
#
function arr_dump(arr) {
    for (k in arr) print k, arr[k]
}

###
#
# Is an array empty?
#
# Example:
#
#   split("", arr)
#   arr_empty(arr) => TRUE
#
# This is POSIX compatible.
#
function arr_empty(arr,  i) {
    for (i in arr) return FALSE
    return TRUE
}

###
#
# Length of an array.
#
# Example:
#
#     arr_length(1 2 4) => 3
#
# TODO: Optimize - consider using `gawk` and its `length` function.
#
function arr_length(arr,  i, k) {
    for (i in arr) k++
    return k
}

###
#
# Get the closest value to a target value in an array.
#
# Example:
#
#    arr = 1 2 4
#    target = 2.5
#    arr_closest_value(arr, target) => 2
#
# If multiple values are equidistant to the target,
# then return the earliest index.
#
# TODO optimize when the array is already sorted,
# by using quicksort or similar divide-and-conquer.
#
function arr_closest_value(arr, target,  _closest_value, _closest_delta, _delta, x, i) {
    for (i in arr) {
        _delta = abs(arr[i] - target)
        if (_closest_delta == "" || _delta < _closest_delta) {
            _closest_value = arr[i]
            _closest_delta = _delta
        }
    }
    return _closest_value
}

###
#
# Join an array to a string, with a separator string.
#
# Example:
#
#     arr_join(1 2 4, ",") => "1,2,4"
#
function arr_join(arr, sep,  s, i) {
    for (i in arr) s = s arr[i] sep
    s = substr(s, 1, length(s) - length(sep))
    return s
}

###
#
# Calculate the median of a sorted array,
# with slice start and slice stop.
#
# Example:
#
#     arr = 1 2 4
#     arr_median(arr)
#     => 2
#
function arr_sorted_median_slice(arr, start, stop,  n, i) {
    if (start == "") start = 1
    if (stop == "") stop = arr_length(arr)
    n = 1 + stop - start
    if (n % 2) {
        i = (start - 1) + ((_n + 1) / 2)
        return arr[i]
    } else {
        i = (start - 1) + (_n / 2)
        return (arr[i] + arr[i+1]) / 2
    }
}
