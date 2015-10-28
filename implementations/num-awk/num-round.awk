############################################################################
#
# num-round.awk
#
###

###
#
# Round to the nearest integer, a.k.a. nint().
#
# Examples:
#
#    round(1.9) => 2
#    round(-1.9) => -2
#
#    nint(1.9) => 2
#    nint(-1.9) => -2
#
function round(x) {
    return (x >= 0) ? int(x + 0.5) : int(x - 0.5)
}

# Alias
function nint(x) {
    return round(x)
}

###
#
# Round off the fractional part, a.k.a. truncate().
#
# Examples:
#
#    round_off(1.9) => 1
#    round_off(-1.9) => -1
#
#    truncate(1.9) => 1
#    truncate(-1.9) => -1
#
function round_off(x) {
    return int(x)
}

# Alias
function truncate(x) {
    return round_off(x)
}

###
#
# Round up, a.k.a. ceiling().
#
# Examples:
#
#    round_up(1.9) => 2
#    round_up(-1.9) => -1
#
#    ceiling(1.9) => 2
#    ceiling(-1.9) => -1
#
function round_up(x,  y) {
    y = int(x)
    return (x == y) ? x : (x >= 0) ? y + 1 : y
}

# Alias
function ceiling(x) {
    return round_up(x)
}

###
#
# Round down, a.k.a. floor().
#
# Examples:
#
#    round_down(1.9) => 1
#    round_down(-1.9) => -2
#
#    floor(1.9) => 1
#    floor(-1.9) => -2
#
function round_down(x,  y) {
    y = int(x)
    return (x == y) ? x : (x >= 0) ? y : y - 1
}

# Alias
function floor(x) {
    round_down(x)
}
