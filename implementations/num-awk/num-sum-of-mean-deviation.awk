############################################################################
#
# num-sum-of-mean-deviation.awk
#
###

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
##

function num_sum_of_mean_deviation_exp(arr, mean, exponent, i, x) {
    for (i in arr) x += (arr[i] - mean) ^ exponent
    return x
}

function num_sum_of_mean_deviation_exp_(num, num_, opts, mean, exponent) {
    f = "num_sum_of_mean_deviation_exp" ":mean:" mean ":exponent:" exponent
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp(num, mean, exponent)
    return num_[f]
}

function num_sum_of_mean_deviation_exp_init() {
    function_init("num_sum_of_mean_deviation_exp", "Get the sum of mean deviation for a given exponent.", "https://en.wikipedia.org/wiki/Deviation_(statistics)")
}

###
#
# Sum of Squares, a.k.a. the sum of each deviation to the power of 2, a.k.a. SS.
#
# Example:
#
#     num_sum_of_squares(1 2 4) => 4.66667
#
###

function num_sum_of_squares(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 2)
}

function num_sum_of_squares_(num, num_, opts) {
    f = "num_sum_of_squares"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 2)
    return num_[f]
}

function num_sum_of_squares_init() {
    function_init("sum_of_squares sum_squares ss mean_squared_error mse", "Get the sum of squares, a.k.a. sum of each mean deviation to the power of 2, a.k.a. SS", "https://en.wikipedia.org/wiki/Deviation_(statistics)")
}

###
#
# Sum of Cubes, a.k.a. sum of each mean deviation to the power of 3.
#
# Example:
#
#     1 2 4 => 2.22222
#
###

function num_sum_of_cubes(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 3)
}

function num_sum_of_cubes_(num, num_, opts) {
    f = "num_sum_of_cubes"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 3)
    return num_[f]
}

function num_sum_of_cubes_init() {
    function_init("sum_of_cubes sum_cubes", "Get the  sum of cubes, a.k.a. sum of each mean deviation to the power of 3.", "https://en.wikipedia.org/wiki/Mean_squared_error")
}

###
#
# Sum of Quads, a.k.a. sum of each mean deviation to the power of 4.
#
# Example:
#
#     1 2 4 => TODO
#
###

function num_sum_of_quads(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 4)
}

function num_sum_of_quads_(num, num_, opts) {
    f = "num_sum_of_quads"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 4)
    return num_[f]
}

function num_sum_of_quads_init() {
    function_init("sum_of_quads sum_quads", "Get the  sum of quads, a.k.a. sum of each mean deviation to the power of 4.", "https://en.wikipedia.org/wiki/Mean_squared_error")
}
