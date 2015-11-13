############################################################################
#
# num-scope.awk
#
##

##
#
# Start receiving input.
#
# Ready the global number array for new input and new metadata.
#
##

function scope_start() {
    global_num_scope_n++
    global_num_scope_output_n = 0
    global_num_n = 0
    split("", global_num)
    split("", global_num_)
}

##
#
# Stop receiving input.
#
# Set any work in progress here.
#
##

function scope_stop() {
    global_num_["n"] = global_num_n
    print_output()
}
