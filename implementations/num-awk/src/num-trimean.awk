############################################################################
#
# num-trimean.awk
#
##

##
#
# Trimean.
#
# Example:
#
#    num_trimean(1 1.75 3 27.75 99) => 8.875
#
# Requirement: the array is sorted.
#
##

function num_trimean(arr,  _q1, _q2, _q3) {
    _q1 = num_quartile_1(arr)
    _q2 = num_quartile_2(arr)
    _q3 = num_quartile_3(arr)
    return (_q1 + _q2 + _q2 + _q3) / 4
}

function num_trimean_(num, num_, opts,  f, _q1, _q2, _q3) {
    f = "num_trimean"
    if (!(f in num_)) {
        _q1 = num_quartile_1_(num, num_, opts)
        _q2 = num_quartile_2_(num, num_, opts)
        _q3 = num_quartile_3_(num, num_, opts)
        num_[f] = (_q1 + _q2 + _q2 + _q3) / 4
    }
    return num_[f]
}

function num_trimean_init() {
    num_function_init("trimean", "Calculate the trimean.", "https://wikipedia.org/wiki/Trimean")
}
