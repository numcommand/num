############################################################################
#
# num-variance.awk
#
###

# Alias
function num_variance(arr) { num_sample_variance(arr) }
function num_variance_(num, num_, opts) { num_sample_variance_(num, num_, opts) }

# Alias
function num_var(arr) { num_sample_variance(arr) }
function num_var_(num, num_, opts) { num_sample_variance_(num, num_, opts) }

###
#
# Sample Variance.
#
# Example:
#
#     num_population_variance(1 2 4) => 2.33333
#
###

function num_sample_variance(arr) {
    return TODO
}

function num_sample_variance_(num, num_, opts,  f) {
    f = "num_sample_variance"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, _opts, num_mean_(num, num_, opts), 2) / (num_n_(num, num_, opts) - 1)
    return num_[f]
}

function num_sample_variance_init() {
    num_function_init("sample_variance s_var variance var sample_second_moment_about_the_mean, s_second_moment_about_the_mean, s_2_m_a_t_m second_moment_about_the_mean 2_m_a_t_m", "Get the sample variance, a.k.a. sample second moment about the mean.", "https://wikipedia.org/wiki/Variance")
}

# Alias
function num_svar(arr) { return num_sample_variance(arr) }
function num_svar_(num, num_, opt) { return num_sample_variance_(num, num_, opt) }

###
#
# Population Variance.
#
# Example:
#
#     num_population_variance(1 2 4) => 1.55556
#
###

function num_population_variance(arr) {
    return TODO
}

function num_population_variance_(num, num_, opts) {
    f = "num_population_variance"
    if (!(f in num_)) num_[f] = num_sum_of_mean_deviation_exp_(num, num_, opts, num_mean_(num, num_, opts), 2) / num_n_(num, num_, opts)
    return num_[f]
}

function num_population_variance_init() {
    num_function_init("population_variance p_var population_second_moment_about_the_mean p_second_moment_about_the_mean p_2_m_a_t_m", "Get the population variance, a.k.a. sample second moment about the mean.", "https://wikipedia.org/wiki/Variance")
}

# Alias
function num_pvar(arr) { return num_population_variance(arr) }
function num_pvar_(num, num_, opt) { return num_population_variance_(num, num_, opt) }
