############################################################################
#
# num-mean.awk
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
###

function num_mean(arr) {
    return num_sum(arr) / num_n(arr)
}

function num_mean_(num, num_, opts,  f, _n, _min, _max, _sum) {
    f = "num_mean"
    if (!(f in num_)) {
        if (num_["linear"]) {
            _n = num_n_(num, num_, opts)
            _min = num_min_(num, num_, opts)
            _max = num_max_(num, num_, opts)
            num_[f] = _min + (_max - _min) / _n
        } else {
            _n =  num_n_(num, num_, opts)
            _sum = num_sum_(num, num_, opts)
            num_[f] = _sum / _n
        }
    }
    return num_[f]
}

function num_mean_init() {
    function_init("mean average avg", "Get the mean, a.k.a artihmetic mean, average.", "https://en.wikipedia.org/wiki/Mean")
}
