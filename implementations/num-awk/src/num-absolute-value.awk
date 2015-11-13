############################################################################
#
# num-absolute-value.awk
#
##

##
#
# Absolute value.
#
# Examples:
#
#    abs(1) => 1
#    abs(-1) => 1
#
##

function num_absolute_value(x) {
    return (x >= 0) ? x : -x
}

# Alias
function num_abs(x) { return num_absolute_value(x) }
