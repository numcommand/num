############################################################################
#
# num-function-manager.awk
#
##

##
#
# Initialize every file and function.
#
##

function num_function_manager_init() {
    num_n_init()
    num_first_init()
    num_last_init()
    num_min_init()
    num_max_init()
    num_range_init()
    num_select_eq_init()
    num_select_ne_init()
    num_select_lt_init()
    num_select_le_init()
    num_select_gt_init()
    num_select_ge_init()
    num_select_in_init()
    num_select_ex_init()
    num_reject_eq_init()
    num_reject_ne_init()
    num_reject_lt_init()
    num_reject_le_init()
    num_reject_gt_init()
    num_reject_ge_init()
    num_reject_in_init()
    num_reject_ex_init()
    num_sum_init()
    num_product_init()
    num_mean_init()
    num_mean_absolute_deviation_init()
    num_meanest_init()
    num_trimean_init()
    num_trimmed_mean_init()
    num_median_init()
    num_median_low_init()
    num_median_high_init()
    num_modes_init()
    num_mode_min_init()
    num_mode_max_init()
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
    num_map_increment_init()
    num_map_absolute_value_init()
    num_map_sign_init()
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
    num_help_init()
}

##
#
# Function manager call: given a function name, call its function.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     function_name = "num_sum"
#     num_function_manager_call(num, num_, opts, function_name)
#     => 7 (by calling the `sum` function)
#
# Note: this implementation uses if..else instead of
# any switch or case, because we want POSIX usability.
#
# TODO: Research if it is possible to simultaneously support
# gawk indirect functions, to do a function call via `@f()`.
#
##

function num_function_manager_call(num, num_, opts, f) {
    if (f == "") return ("")
    else if (f == "num_n") return num_n_(num, num_, opts)
    else if (f == "num_first") return num_first_(num, num_, opts)
    else if (f == "num_last") return num_last_(num, num_, opts)
    else if (f == "num_min") return num_min_(num, num_, opts)
    else if (f == "num_max") return num_max_(num, num_, opts)
    else if (f == "num_range") return num_range_(num, num_, opts)
    else if (f == "num_select_eq") return num_select_eq_(num, num_, opts) # x
    else if (f == "num_select_ne") return num_select_ne_(num, num_, opts) # x
    else if (f == "num_select_lt") return num_select_lt_(num, num_, opts) # x
    else if (f == "num_select_le") return num_select_le_(num, num_, opts) # x
    else if (f == "num_select_gt") return num_select_gt_(num, num_, opts) # x
    else if (f == "num_select_ge") return num_select_ge_(num, num_, opts) # x
    else if (f == "num_select_in") return num_select_in_(num, num_, opts) # min, max
    else if (f == "num_select_ex") return num_select_ex_(num, num_, opts) # min, max
    else if (f == "num_reject_eq") return num_reject_eq_(num, num_, opts) # x
    else if (f == "num_reject_ne") return num_reject_ne_(num, num_, opts) # x
    else if (f == "num_reject_lt") return num_reject_lt_(num, num_, opts) # x
    else if (f == "num_reject_le") return num_reject_le_(num, num_, opts) # x
    else if (f == "num_reject_gt") return num_reject_gt_(num, num_, opts) # x
    else if (f == "num_reject_ge") return num_reject_ge_(num, num_, opts) # x
    else if (f == "num_reject_in") return num_reject_in_(num, num_, opts) # min, max
    else if (f == "num_reject_ex") return num_reject_ex_(num, num_, opts) # min, max
    else if (f == "num_sum") return num_sum_(num, num_, opts)
    else if (f == "num_product") return num_product_(num, num_, opts)
    else if (f == "num_mean") return num_mean_(num, num_, opts)
    else if (f == "num_mean_absolute_deviation") return num_mean_absolute_deviation_(num, num_, opts)
    else if (f == "num_meanest") return num_meanest_(num, num_, opts)
    else if (f == "num_trimean") return num_trimean_(num, num_, opts)
    else if (f == "num_trimmed_mean") return num_trimmed_mean_(num, num_, opts)
    else if (f == "num_median") return num_median_(num, num_, opts)
    else if (f == "num_median_low") return num_median_low_(num, num_, opts)
    else if (f == "num_median_high") return num_median_high_(num, num_, opts)
    else if (f == "num_modes") return num_modes_(num, num_, opts)
    else if (f == "num_mode_min") return num_mode_min_(num, num_, opts)
    else if (f == "num_mode_max") return num_mode_max_(num, num_, opts)
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
    else if (f == "num_map_increment") return num_map_increment_(num, num_, opts)
    else if (f == "num_map_absolute_value") return num_map_absolute_value_(num, num_, opts)
    else if (f == "num_map_sign") return num_map_sign_(num, num_, opts)
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

##
#
# Function name to s: given a function name, call its function,
# and convert the return value to a string using formatting.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     num_function_manager_call_to_s(num, num_, opts, "sum")
#     => 7.00 (by calling the `sum` function and using OFMT)
#
##

function num_function_name_to_s(num, num_, opts, function_name,  s) {
    s = num_function_manager_call(num, num_, opts, function_name)
    if (s != "") {
        num_scope_output_n++
        if (s + 0 == s) s = sprintf(OFMT, s)
    }
    return s
}

##
#
# Function names to s: given a list of function names, call each function,
# and convert all the return values to a string using formatting.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     function_names = "sum", "max"
#     function_names_to_s(num, opts, ("sum", "max"))
#     => "7.00,4.00" (by calling the functions and using OFMT and OFS)
#
##

function num_function_names_to_s(num, num_, opts, function_names,  word, i, n, s, build) {
    build = ""
    for (i=1; i <= num_arr_length(function_names); i++) {
        function_name = function_names[i]
        s = num_function_name_to_s(num, num_, opts, function_name)
        if (s != "") {
            n++
            if (n > 1) build = build OFS
            build = build s
        }
    }
    return build
}
