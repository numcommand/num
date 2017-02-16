############################################################################
#
# num-frequency.awk
#
##

##
#
# Frequency minimum.
#
# Example:
#
#     num_frequency_min(10 10 11 11 11) => 2
#
##

function num_frequency_min(arr,  min, i, seen) {
    for (i in arr) ++seen[arr[i]]
    return num_min(seen)
}

function num_frequency_min_(num, num_, opts,  f) {
    f = "num_frequency_min"
    if (!(f in num_)) num_[f] = num_frequency_min(num)  # TODO optimize when min and min are both wanted
    return num_[f]
}

function num_frequency_min_init() {
    num_function_init(\
        "num_frequency_min frequency_minimum freq_min", 0,
        "Get the frequency minimum: count the occurances of each value, and get the minimum count.",
        "https://en.wikipedia.org/wiki/Frequency_Minimum_(statistics)")
}

##
#
# Frequency maximum.
#
# Example:
#
#     num_frequency_max(10 10 11 11 11) => 3
#
##

function num_frequency_max(arr,  max, i, seen) {
    for (i in arr) ++seen[arr[i]]
    return num_max(seen)
}

function num_frequency_max_(num, num_, opts,  f) {
    f = "num_frequency_max"
    if (!(f in num_)) num_[f] = num_frequency_max(num)  # TODO optimize when min and max are both wanted
    return num_[f]
}

function num_frequency_max_init() {
    num_function_init(\
        "num_frequency_max frequency_maximum freq_max", 0,
        "Get the frequency maximum: count the occurances of each value, and get the maximum count.",
        "https://en.wikipedia.org/wiki/Frequency_Maximum_(statistics)")
}
