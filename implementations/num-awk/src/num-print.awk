############################################################################
#
# num-print.awk
#
##

##
#
# Print a record.
#
# This is the core output function, and the only one that should ever
# print any normal result to the screen, during any normal operation.
#
##

function num_print_record(num, num_, opts,   s, i) {
    s = num_function_names_to_s(global_num, global_num_, global_opts, global_word_argv)
    if (global_num_scope_n > 1) printf ORS
    if (s != "") {
        printf s
    } else {
        num_print_record_fields(global_num, global_num_, global_opts)
    }
}

##
#
# Print all record fields.
#
# This is the fallback if the record has no output so far.
# A typical example would be for a sort, or filter, or map.
#
##

function num_print_record_fields(num, num_, opts) {
    for (i = 1; i <= num_["n"]; i++) {
        if (i > 1) printf OFS
        printf(OFMT, num[i])
    }
}
