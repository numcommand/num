############################################################################
#
# num-init.awk
#
##

##
#
# Initialize everything.
#
# This calls various `init_*` functions.
#
##

function num_init() {
    #init_lint()
    num_init_constants()
    num_init_conf()
    num_init_word_argv()
    num_init_word_list()
    num_function_manager_init()
}

##
#
# Initialize constants that we use; these are essentially like defines.
#
##

function num_init_constants() {

    # Boolean
    FALSE = 0
    TRUE = 1

    # Math
    PI = 3.141592653589797  # also atan2(0,-1)

    # Content
    TODO = "TODO"
    UNDEF = "UNDEF"
    ERROR = "ERROR"
    NAN = "NAN"

    # Function kinds: a way to track what a function will do. #TODO
    FUN_KIND_CALC = "CALC"
    FUN_KIND_SORT = "SORT"
    FUN_KIND_MAP  = "MAP"
    FUN_KIND_FLAG = "FLAG"
    FUN_KIND_CONF = "CONF"

    # Feature detection. Currently this script requires Gawk.
    AWK_HAS_ASORT = TRUE
    AWK_HAS_LENGTH = TRUE

    # The scope controls whether the user wants input and output
    # to be all items (the default), or per record, or per field.
    # The scope per field is a special case, because it lets the
    # the awk loop read one record, calculate, then flush data.
    NUM_CONF_SCOPE_ALL    = "NUM_CONF_SCOPE_ALL"     # Default
    NUM_CONF_SCOPE_RECORD = "NUM_CONF_SCOPE_RECORD"  # Triggers optimized loop
    NUM_CONF_SCOPE_FIELD  = "NUM_CONF_SCOPE_FIELD"   # TODO implement
}

##
#
# Initialize the configuration dictionary.
#
##

function num_init_conf() {
    split("", global_conf)
    global_conf["scope"] = NUM_CONF_SCOPE_ALL
}

##
#
# Initialize the word argv list.
#
# The word argv list holds the argv items that this script cares about.
# We keep them in order, so we can output results in order.
#
##

function num_init_word_argv() {
    split("", global_word_argv)
}

##
#
# Initialize the global word list lookup array.
#
# This is to recognize words that a user types on the command line.
#
# TODO: research if there is a better way to initialize a dictionary.
#
##

function num_init_word_list() {

    num_synonyms["overall"] = \
    "num_conf_scope_all"

    num_synonyms["records"] = \
    num_synonyms["rows"] = \
    "num_conf_scope_record"

    num_synonyms["fields"] = \
    num_synonyms["colums"] = \
    "num_conf_scope_field"

    # Convention: default is sample, not population.
    num_synonyms["secondmomentaboutthemean"] = \
    num_synonyms["secondmoment"] = \
    "num_sample_variance"

    # Convention: default is sample, not population.
    num_synonyms["thirdmomentaboutthemean"] = \
    num_synonyms["thirdmoment"] = \
    "num_sample_skewness"

    # Convention: default is sample, not population.
    num_synonyms["fourthmomentaboutthemean"] = \
    num_synonyms["fourthmoment"] = \
    "num_sample_kurtosis"

    ## Booleans

    num_synonyms["isunique"] = \
    "num_is_unique"

    num_synonyms["isascending"] = \
    num_synonyms["isasc"] = \
    num_synonyms["isnondescending"] = \
    num_synonyms["isnondesc"] = \
    "num_is_ascending"

    num_synonyms["isstrictlyascending"] = \
    num_synonyms["isstrictasc"] = \
    "num_is_strictly_ascending"

    num_synonyms["isdescending"] = \
    num_synonyms["isdesc"] = \
    num_synonyms["isnonascending"] = \
    num_synonyms["isnonasc"] = \
    "num_is_descending"

    num_synonyms["isstrictlydescending"] = \
    num_synonyms["isstrictdesc"] = \
    "num_is_strictly_descending"

    ### Configurations

    num_synonyms["outputcommaseparatedvalues"] = \
    num_synonyms["outcsv"] = \
    "num_output_comma_separated_values"

    num_synonyms["outputtabseparatedvalues"] = \
    num_synonyms["outtab"] = \
    "num_output_tab_separated_values"

}
