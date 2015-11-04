############################################################################
#
# num-kurtosis.awk
#
# A.k.a. fourth moment about the mean.
#
# Calculation:
#
#   * Sum each value’s deviation from the mean quaded.
#   * Divide by the number of items.
#
# The kurtosis formula measures the degree of peak.
#
# Kurtosis measures the relative peakness or flatness of a distribution,
# relative to a normal distribution.
#
#   * Positive kurtosis (peakness) is termed leptokurtic.
#   * Negative kurtosis (flatness) is termed platykurtic.
#   * In-between is termed mesokurtic.
#
# Kurtosis equals 3 for a normal distribution.
#
# Kurtosis is a nondimensional quantity.
#
###

# Alias
function num_kurtosis(arr) { num_sample_kurtosis(arr) }
function num_kurtosis_(num, num_, opts) { num_sample_kurtosis_(num, num_, opts) }

# Alias
function num_kurt(arr) { num_sample_kurtosis(arr) }
function num_kurt_(num, num_, opts) { num_sample_kurtosis_(num, num_, opts) }

###
#
# Sample kurtosis
#
# Example:
#
#     num_sample_kurtosis(1 2 4) => 5.44444
#
###

function num_sample_kurtosis(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 4) / (num_n(arr) - 1)
}

function num_sample_kurtosis_(num, num_, opts,  f) {
    f = "num_sample_kurtosis"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 4) / (num_n_(num, num_, opts) - 1)
    return num_[f]
}

function num_sample_kurtosis_init() {
    function_init("sample_kurtosis s_kurt kurtosis kurt sample_fourth_moment_about_the_mean s_fourth_moment_about_the_mean s_4_m_a_t_m fourth_moment_about_the_mean 4_m_a_t_m", "Get the kurtosis, a.k.a. sample fourth moment about the mean.", "https://en.wikipedia.org/wiki/Kurtosis")
}

# Alias
function num_skurt(arr) { num_sample_kurtosis(arr) }
function num_skurt_(num, num_, opts) { num_sample_kurtosis_(num, num_, opts) }

###
#
# Population kurtosis
#
# Example:
#
#     num_population_kurtosis(1 2 4) => 3.62963
#
###

function num_population_kurtosis(arr) {
    return num_sum_of_mean_deviation_exp(arr, num_mean(arr), 4) / num_n(arr)
}

function num_population_kurtosis_(num, num_, opts,  f) {
    f = "num_population_kurtosis"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 4) / num_n_(num, num_, opts)
    return num_[f]
}

function num_population_kurtosis_init() {
    function_init("population_kurtosis p_kurt population_fourth_moment_about_the_mean p_fourth_moment_about_the_mean p_4_m_a_t_m", "Get the kurtosis, a.k.a. population fourth moment about the mean.", "https://en.wikipedia.org/wiki/Kurtosis")
}

# Alias
function num_pkurt(arr) { num_population_kurtosis(arr) }
function num_pkurt_(num, num_, opts) { num_population_kurtosis_(num, num_, opts) }
