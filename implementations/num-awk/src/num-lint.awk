############################################################################
#
# num-lint.awk
#
##

##
#
# Initialize lint protection.
#
##

function init_lint() {
    split("", a)

    ## Basics
    num_all(a)

    ## Quartiles
    num_quartile_0(a)
    num_quartile_1(a)
    num_quartile_2(a)
    num_quartile_3(a)
    num_quartile_4(a)
    num_interquartile_range(a)

    ## Round
    num_nint(0)
    num_truncate(0)
    num_ceiling(0)
    num_floor(0)

    ## Print
    num_out("")
    num_err("")

    ## List
    num_unshift(a,0)
    num_shift(a)

    ## Stack
    num_push(a,0)
    num_pop(a)

    ## Queue
    num_enqueue(a0)
    num_dequeue(a)

    ## Statitics
    num_mean_absolute_deviation(a)
    num_median_low(a)
    num_median_high(a)
    num_sum_of_mean_deviation_exp(a)

    ## Math
    num_min(a)
    num_max(a)
    num_range(a)
    num_abs(a)

    ## TODO: these may need fixing
    num_arr_empty(a)
    num_arr_dump()
    #num_word_to_conf()
    #num_init_global_fun_kind
}
