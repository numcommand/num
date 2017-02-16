############################################################################
#
# num-trimmed-mean.awk
#
##

##
#
# Trimmed mean. This implemention deletes values that are not in the IQR.
#
# Example:
#
#     num_trimmed_mean(1 2 3 4 5) => 2 3 4
#
# TODO: implement, and also upgrade to enable custom ranges.
#
##

function num_trimmed_mean_min_max(arr,  q1, q3) {
    q1 = num_quartile_1(arr)
    q3 = num_quartile_3(arr)
    return TODO
}

function num_trimmed_mean_(num, num_, opts,  f) {
    f = "num_trimmed_mean"
    if (!(f in num_)) {
        q1 = num_quartile_1_(num, num_, opts)
        q3 = num_quartile_3_(num, num_, opts)
        num_[f] = TODO
    }
    return num_[f]
}

function num_trimmed_mean_init() {
    num_function_init(\
        "num_trimmed_mean trimmed_mean truncated_mean", 0,
        "Calculate the trimmed mean",
        "https://en.wikipedia.org/wiki/Truncated_Mean")
}
