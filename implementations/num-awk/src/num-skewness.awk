############################################################################
#
# num-skewness.awk
#
##

# Alias
function num_skewness(arr) { num_sample_skewness(arr) }
function num_skewness_(num, num_, opts) { num_sample_skewness_(num, num_, opts) }

# Alias
function num_skew(arr) { num_sample_skewness(arr) }
function num_skew_(num, num_, opts) { num_sample_skewness_(num, num_, opts) }

##
#
# Sample skewness
#
# Example:
#
#     num_sample_skewness(1 2 4) => 1.11111
#
# A.k.a. population third moment about the mean.
#
# Calculation:
#
#   * Sum each value deviation from the mean cubed.
#   * Divide by the number of items - 1.
#
##

function num_sample_skewness(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 3) / (num_n(arr) - 1)
}

function num_sample_skewness_(num, num_, opts,  f) {
    f = "num_sample_skewness"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 3) / (num_n_(num, num_, opts) - 1)
    return num_[f]
}

function num_sample_skewness_init() {
    num_function_init("num_sample_skewness sample_skewness s_skew skewness skew sample_third_moment_about_the_mean s_third_moment_about_the_mean s_3_m_a_t_m third_moment_about_the_mean 3_m_a_t_m", "Get the sample skewness, a.k.a. sample third moment about the mean.", "https://en.wikipedia.org/wiki/Skewness")
}

# Alias
function num_sskew(arr) { num_sample_skewness(arr) }
function num_sskew_(num, num_, opts) { num_sample_skewness_(num, num_, opts) }

##
#
# Population skewness
#
# Example:
#
#     num_population_skewness(1 2 4) => 0.740741
#
# A.k.a. population third moment about the mean.
#
# If skewness is greater than zero, the distribution is positively skewed.
# If it is less than zero, it is negatively skewed.
# Zero means it is symmetric.
#
# Calculation:
#
#   * Sum each value deviation from the mean cubed.
#   * Divide by the number of items.
#
##

function num_population_skewness(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 3) / num_n(arr)
}

function num_population_skewness_(num, num_, opts,  f) {
    f = "num_population_skewness"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opt), 3) / num_n_(num, num_, opts)
    return num_[f]
}

function num_population_skewness_init() {
    num_function_init("num_population_skewness population_skewness p_skew population_third_moment_about_the_mean p_third_moment_about_the_mean p_3_m_a_t_m", "Get the population skewness, a.k.a. population third moment about the mean.", "https://en.wikipedia.org/wiki/Skewness")
}

# Alias
function num_pskew(arr) { num_population_skewness(arr) }
function num_pskew_(num, num_, opts) { num_population_skewness_(num, num_, opts) }
