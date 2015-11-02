############################################################################
#
# num-standard-deviation.awk
#
###

# Alias
function num_standard_deviation(arr) { num_sample_standard_deviation(arr) }
function num_standard_deviation_(num, num_, opts) { num_sample_standard_deviation_(num, num_, opts) }

# Alias
function num_stddev(arr) { num_sample_standard_deviation(arr) }
function num_stddev_(num, num_, opts) { num_sample_standard_deviation_(num, num_, opts) }

###
#
# Sample Standard Deviation.
#
# Example:
#
#     num_sample_standard_deviation(1 2 4) => 1.52753
#
###

function num_sample_standard_deviation(arr) {
    return sqrt(num_sample_variance(arr))
}

function num_sample_standard_deviation_(num, num_, opts,  f) {
    f = "num_sample_standard_deviation"
    if (!(f in num_)) num_[f] = sqrt(num_sample_variance_(num, num_, opts))
    return num_[f]
}

function num_sample_standard_deviation_init() {
    function_init("sample_standard_deviation s_st_dev s_s_d standard_deviation std_dev sd", "Get the sample standard deviation")
}

# Alias
function num_sstddev(arr) { num_sample_standard_deviation(arr) }
function num_sstddev_(num, num_, opts) { num_sample_standard_deviation_(num, num_, opts) }

###
#
# Population Standard Deviation.
#
# Example:
#
#     num_population_standard_deviation(1 2 4) => 1.24722
#
###

function num_population_standard_deviation(arr) {
    return sqrt(num_population_variance(arr))
}

function num_population_standard_deviation_(num, num_, opts,  f) {
    f = "num_population_standard_deviation"
    if (!(f in num_)) num_[f] = sqrt(num_population_variance_(num, num_, opts))
    return num_[f]
}

function num_population_standard_deviation_init() {
    function_init("population_standard_deviation p_st_dev p_s_d", "Get the population standard deviation.")
}

# Alias
function num_pstddev(arr) { num_population_standard_deviation(arr) }
function num_pstddev_(num, num_, opts) { num_population_standard_deviation_(num, num_, opts) }
