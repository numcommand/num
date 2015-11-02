############################################################################
#
# num-round.awk
#
# We provide four kinds of rounding:
#
#   * round a.k.a. nint.
#   * round off a.k.a. truncate.
#   * round up a.k.a. ceiling.
#   * round down a.k.a. floor.
#
###

###
#
# Round to the nearest integer, a.k.a. nint().
#
# Examples:
#
#    num_round(1.9) => 2
#    num_round(-1.9) => -2
#
#    num_nint(1.9) => 2
#    num_nint(-1.9) => -2
#
###

function num_round(x) {
    return (x >= 0) ? int(x + 0.5) : int(x - 0.5)
}

# Alias
function num_nint(x) {
    return num_round(x)
}

###
#
# Round off the fractional part, a.k.a. truncate().
#
# Examples:
#
#    num_round_off(1.9) => 1
#    num_round_off(-1.9) => -1
#
#    num_truncate(1.9) => 1
#    num_truncate(-1.9) => -1
#
###

function num_round_off(x) {
    return int(x)
}

# Alias
function num_truncate(x) {
    return num_round_off(x)
}

###
#
# Round up, a.k.a. ceiling().
#
# Examples:
#
#    num_round_up(1.9) => 2
#    num_round_up(-1.9) => -1
#
#    num_ceiling(1.9) => 2
#    num_ceiling(-1.9) => -1
#
function num_round_up(x,  y) {
    y = int(x)
    return (x == y) ? x : (x >= 0) ? y + 1 : y
}

# Alias
function num_ceiling(x) {
    return num_round_up(x)
}

###
#
# Round down, a.k.a. floor().
#
# Examples:
#
#    num_round_down(1.9) => 1
#    num_round_down(-1.9) => -2
#
#    num_floor(1.9) => 1
#    num_floor(-1.9) => -2
#
###

function num_round_down(x,  y) {
    y = int(x)
    return (x == y) ? x : (x >= 0) ? y : y - 1
}

# Alias
function num_floor(x) {
    num_round_down(x)
}
