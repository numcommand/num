############################################################################
#
# num-coefficient-of-variance.awk
#
###

# Alias
function num_coefficient_of_variance(arr) { num_sample_coefficient_of_variance(arr) }
function num_coefficient_of_variance_(num, num_, opts) { num_sample_coefficient_of_variance_(num, num_, opts) }

# Alias
function num_covar(arr) { num_sample_coefficient_of_variance(arr) }
function num_covar_(num, num_, opts) { num_sample_coefficient_of_variance_(num, num_, opts) }

###
#
# Sample Coefficient of Variance.
#
# Example:
#
#     num_sample_coefficient_of_variance(1 2 4) => 0.654654
#
###

function num_sample_coefficient_of_variance(arr) {
    return num_sample_standard_deviation(arr) / num_mean(arr)
}

function num_sample_coefficient_of_variance_(num, num_, opts,  f) {
    f = "num_sample_coefficient_of_variance"
    if (!(f in num_)) num_[f] = num_sample_standard_deviation_(num, num_, opts) / num_mean_(num, num_, opts)
    return num_[f]
}

function num_sample_coefficient_of_variance_init() {
    function_init("sample_coefficient_of_variance s_co_var s_c_v coefficent_of_variance co_var c_v", "Get the sample coefficient of variance")
}

# Alias
function num_scovar(arr) { num_sample_coefficient_of_variance(arr) }
function num_scovar_(num, num_, opts) { num_sample_coefficient_of_variance_(num, num_, opts) }

###
#
# Population Coefficient of Variance.
#
# Example:
#
#     1 2 4 => 0.534522
#
###

function num_population_coefficient_of_variance(arr) {
    return num_population_standard_deviation(arr) / num_mean(arr)
}

function num_population_coefficient_of_variance_(num, num_, opts,  f) {
    f = "num_population_coefficient_of_variance"
    if (!(f in num_)) num_[f] = num_population_standard_deviation_(num, num_, opts) / num_mean_(num, num_, opts)
    return num_[f]
}

function num_population_coefficient_of_variance_init() {
    function_init("population_coefficient_of_variance p_co_var p_c_v", "Get the population coefficient of variance.")
}

# Alias
function num_pcovar(arr) { num_population_coefficient_of_variance(arr) }
function num_pcovar_(num, num_, opts) { num_population_coefficient_of_variance_(num, num_, opts) }
