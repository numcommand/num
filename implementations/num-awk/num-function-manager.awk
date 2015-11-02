############################################################################
#
# num-function-manager.awk
#
###

###
#
# Initialize every file and function.
#
function function_manager_init() {
    num_all_init()
    num_n_init()
    num_first_init()
    num_last_init()
    num_min_init()
    num_max_init()
    num_range_init()
    num_sum_init()
    num_product_init()
    num_mean_init()
    num_mean_absolute_deviation_init()
    num_meanest_init()
    num_trimean_init()
    num_median_init()
    num_median_low_init()
    num_median_high_init()
    num_mode_init()
    num_mode_low_init()
    num_mode_high_init()
    num_sum_of_squares_init()
    num_sum_of_cubes_init()
    num_sum_of_quads_init()
    num_sample_variance_init()
    num_population_variance_init()
    num_sample_standard_deviation_init()
    num_population_standard_deviation_init()
    num_sample_coefficient_of_variance_init()
    num_population_coefficient_of_variance_init()
    num_sample_skewness_init()
    num_population_skewness_init()
    num_sample_kurtosis_init()
    num_population_kurtosis_init()
    num_interquartile_range_init()
    num_quartile_0_init()
    num_quartile_1_init()
    num_quartile_2_init()
    num_quartile_3_init()
    num_quartile_4_init()
    num_sort_awk_init()
    num_sort_ascending_init()
    num_sort_descending_init()
    num_map_absolute_value_init()
    num_map_normalize_init()
    num_map_round_awk_init()
    num_map_round_init()
    num_map_round_off_init()
    num_map_round_up_init()
    num_map_round_down_init()
    num_is_unique_init()
    num_is_ascending_init()
    num_is_strictly_ascending_init()
    num_is_descending_init()
    num_is_strictly_descending_init()
}

###
#
# Function manager call: given a function name, call its function.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     function_manager_call("sum", num, num_, opts)
#     => 7 (by calling the `sum` function)
#
# Note: this implementation uses if..else instead of
# any switch or case, because we want POSIX usability.
#
# TODO: Research if it is possible to simultaneously support
# gawk indirect functions, to do a function call via `@f()`.
#
function function_manager_call(f, num, num_, opts) {
    if (f == "") return ("")
    else if (f == "num_all") return num_all_(num, num_, opts)
    else if (f == "num_n") return num_n_(num, num_, opts)
    else if (f == "num_first") return num_first_(num, num_, opts)
    else if (f == "num_last") return num_last_(num, num_, opts)
    else if (f == "num_min") return num_min_(num, num_, opts)
    else if (f == "num_max") return num_max_(num, num_, opts)
    else if (f == "num_range") return num_range_(num, num_, opts)
    else if (f == "num_sum") return num_sum_(num, num_, opts)
    else if (f == "num_product") return num_product_(num, num_, opts)
    else if (f == "num_mean") return num_mean_(num, num_, opts)
    else if (f == "num_mean_absolute_deviation") return num_mean_absolute_deviation_(num, num_, opts)
    else if (f == "num_meanest") return num_meanest_(num, num_, opts)
    else if (f == "num_trimean") return num_trimean_(num, num_, opts)
    else if (f == "num_median") return num_median_(num, num_, opts)
    else if (f == "num_median_low") return num_median_low_(num, num_, opts)
    else if (f == "num_median_high") return num_median_high_(num, num_, opts)
    else if (f == "num_mode") return num_mode_(num, num_, opts)
    else if (f == "num_mode_low") return num_mode_low_(num, num_, opts)
    else if (f == "num_mode_high") return num_mode_high_(num, num_, opts)
    else if (f == "num_sum_of_squares") return num_sum_of_squares_(num, num_, opts)
    else if (f == "num_sum_of_cubes") return num_sum_of_cubes_(num, num_, opts)
    else if (f == "num_sum_of_quads") return num_sum_of_quads_(num, num_, opts)
    else if (f == "num_sample_variance") return num_sample_variance_(num, num_, opts)
    else if (f == "num_population_variance") return num_population_variance_(num, num_, opts)
    else if (f == "num_sample_standard_deviation") return num_sample_standard_deviation_(num, num_, opts)
    else if (f == "num_population_standard_deviation") return num_population_standard_deviation_(num, num_, opts)
    else if (f == "num_sample_coefficient_of_variance") return num_sample_coefficient_of_variance_(num, num_, opts)
    else if (f == "num_population_coefficient_of_variance") return num_population_coefficient_of_variance_(num, num_, opts)
    else if (f == "num_sample_skewness") return num_sample_skewness_(num, num_, opts)
    else if (f == "num_population_skewness") return num_population_skewness_(num, num_, opts)
    else if (f == "num_sample_kurtosis") return num_sample_kurtosis_(num, num_, opts)
    else if (f == "num_population_kurtosis") return num_population_kurtosis_(num, num_, opts)
    else if (f == "num_interquartile_range") return num_interquartile_range_(num, num_, opts)
    else if (f == "num_quartile_0") return num_quartile_0_(num, num_, opts)
    else if (f == "num_quartile_1") return num_quartile_1_(num, num_, opts)
    else if (f == "num_quartile_2") return num_quartile_2_(num, num_, opts)
    else if (f == "num_quartile_3") return num_quartile_3_(num, num_, opts)
    else if (f == "num_quartile_4") return num_quartile_4_(num, num_, opts)
    else if (f == "num_sort_ascending") return num_sort_ascending_(num, num_, opts)
    else if (f == "num_sort_descending") return num_sort_descending_(num, num_, opts)
    else if (f == "num_map_absolute_value") return num_map_absolute_value_(num, num_, opts)
    else if (f == "num_map_normalize") return num_map_normalize_(num, num_, opts)
    else if (f == "num_map_round") return num_map_round_(num, num_, opts)
    else if (f == "num_map_round_off") return num_map_round_off_(num, num_, opts)
    else if (f == "num_map_round_up") return num_map_round_up_(num, num_, opts)
    else if (f == "num_map_round_down") return num_map_round_down_(num, num_, opts)
    else if (f == "num_is_unique") return num_is_unique_(num, num_, opts)
    else if (f == "num_is_ascending") return num_is_ascending_(num, num_, opts)
    else if (f == "num_is_strictly_ascending") return num_is_strictly_ascending_(num, num_, opts)
    else if (f == "num_is_descending") return num_is_descending_(num, num_, opts)
    else if (f == "num_is_strictly_descending") return num_is_strictly_descending_(num, num_, opts)
    else return ""
}
