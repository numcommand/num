############################################################################
#
# num-sum.awk
#
###

###
#
# Sum, a.k.a. total.
#
# Example:
#
#     num_sum(1 2 4) => 7
###

function num_sum(arr,  i, x) {
    for (i in arr) x += arr[i]
    return x
}

function num_sum_(num, num_, opts,  f) {
    f = "num_sum"
    if (!(f in num_)) num_[f] = num_sum(num)  # TODO optimize linear
    return num_[f]
}

function num_sum_init() {
    function_init("sum total", "Get the sum, a.k.a. total.", "https://en.wikipedia.org/wiki/Summation")
}
