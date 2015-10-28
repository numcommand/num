############################################################################
#
# num-math.awk
#
###

###
#
# Absolute value.
#
# Examples:
#
#    abs(1) => 1
#    abs(-1) => 1
#
function abs(x) {
    if (x >= 0) { return x } else { return -x }
}
