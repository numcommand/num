############################################################################
#
# num-sign.awk
#
##

##
#
# Return the sign of the value, either 1, -1, or 0.
#
# Examples:
#
#    sign(8) => 1
#    sign(-8) => -1
#    sign(0) => 0
#
##

function num_sign(x) {
    return (x > 0) - (x < 0)
}
