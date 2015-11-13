############################################################################
#
# num-conf.awk
#
##

##
#
# Configure
#
##

function num_conf() {
    num_conf_words(global_word_argv)
    num_conf_ofmt()
    num_conf_scope()
}

##
#
# num_configure the output format string, a.k.a. AWK OFMT.
# This controls number formatting as float, decimal, int, etc.
#
##

function num_conf_ofmt() {
    OFMT = (ENVIRON["OFMT"]) ? ENVIRON["OFMT"] : "%.6g"
}

##
# num_configure scope flags to optimize for tight inner loops.
#
# This enables us to speed up code by doing this:
#
#     - if (global_conf["scope"] == NUM_CONF_SCOPE_ALL)
#     + if (NUM_CONF_SCOPE_ALL_FLAG)
##

function num_conf_scope() {
    NUM_CONF_SCOPE_ALL_FLAG    = (global_conf["scope"] == NUM_CONF_SCOPE_ALL)
    NUM_CONF_SCOPE_RECORD_FLAG = (global_conf["scope"] == NUM_CONF_SCOPE_RECORD)
    NUM_CONF_SCOPE_FIELD_FLAG  = (global_conf["scope"] == NUM_CONF_SCOPE_FIELD)
}

##
#
# Given a word, set a num_configuration setting.
#
# Call this function for each option word a.k.a. flag,
# before any calculation happens and any work happens.
#
# This function must only set `conf` keys and values.
# This function must NOT do any calculations, work, etc.
#
# TODO: consider changing these to functions.
#
##

function num_conf_word(word) {
    if (word == "")
        return
    else if (word == "help")
         num_help()
    else if (word == "num_conf_scope_all")
        global_conf["scope"] = NUM_CONF_SCOPE_ALL
    else if (word == "num_conf_scope_record")
        global_conf["scope"] = NUM_CONF_SCOPE_RECORD
    else if (word == "num_conf_scope_field")
        global_conf["scope"] = NUM_CONF_SCOPE_FIELD
    else if (word == "output_comma_separated_values")
        OFS = ","
    else if (word == "output_tab_separated_values")
        OFS = "\t"
    else
        return ""
}

##
#
# Given a list of words, set all num_configuration settings.
#
##

function num_conf_words(words,  imax) {
    for (i=1; i <= num_arr_length(words); i++) num_conf_word(words[i])
}
