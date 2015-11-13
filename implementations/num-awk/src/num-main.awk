############################################################################
#
# num-main.awk
#
##

BEGIN{
    num_init()
    num_argv()
    num_conf()
    if (NUM_CONF_SCOPE_ALL_FLAG) scope_start()
}

{
    if (NUM_CONF_SCOPE_ALL_FLAG) {
        for(i=1;i<=NF;i++) global_num[++global_num_n] = $i # Inline
    } else if (NUM_CONF_SCOPE_RECORD_FLAG) {
        scope_start()
        for(i=1;i<=NF;i++) global_num[++global_num_n] = $i # Inline
        scope_stop()
    } else {
        num_err("Num configuration scope is not recognized")
    }
}

END{
    if (NUM_CONF_SCOPE_ALL_FLAG) scope_stop()
}
