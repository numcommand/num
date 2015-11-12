############################################################################
#
# num-map-round.awk
#
###

###
#
# Initialize.
#
###

function num_map_round_awk_init() {
    split("n sorted ascending descending", NUM_MAP_ROUND_MEMO)
}

###
#
# Map round, a.k.a. round towards nearest integer, nint.
#
# Example:
#
#     num_map_round(-1.9 1.9) => -2 2
#
###

function num_map_round(arr) {
    for (i in arr) arr[i] = num_round(arr[i])
}

function num_map_round_(num, num_, opts,  f, memo, i) {
    if (num_["integer"] == TRUE) return
    f = "num_map_round"
    if (num_[f] != TRUE) {
        num_map_round_before_(num, num_, opts, f, memo)
        num_map_round(num)
        num_map_round_after_(num, num_, opts, f, memo)
    }
    return ""
}

function num_map_round_init() {
    num_function_init("map_round round round_towards_nearest nearest_integer n_int", "Map using round, a.k.a. round towards nearest, nint.", "https://en.wikipedia.org/wiki/Rounding")
}

# Alias
function num_map_nint(arr) {
    return num_map_round(arr)
}

# Alias
function num_map_nint_(num, num_, opts) {
    return num_map_round_(num, num_, opts)
}

###
#
# Map: round off, a.k.a. round towards zero, truncate.
#
# Example:
#
#     num_map_round_off(-1.9 1.9) => -1 1
#
###

function num_map_round_off(arr) {
    for (i in arr) arr[i] = num_round_off(arr[i])
}

function num_map_round_off_(num, num_, opts,  f, memo) {
    if (num_["integer"] == TRUE) return ""
    f = "num_map_round_off"
    if (num_[f] != TRUE) {
        num_map_round_before_(num, num_, opts, f, memo)
        num_map_round_off(num)
        num_map_round_after_(num, num_, opts, f, memo)
    }
    return ""
}

function num_map_round_off_init() {
    num_function_init("map_round_off round_off round_towards_zero, truncate", "Map using round off, a.k.a. round towards zero, truncate.", "https://en.wikipedia.org/wiki/Rounding")
}

# Alias
function num_map_truncate(arr) {
    return num_map_round_off(arr)
}

# Alias
function num_map_truncate_(num, num_, opts) {
    return num_map_round_off_(num, num_, opts)
}

###
#
# Map: round up, a.k.a. round towards positive infinity, ceiling.
#
# Example:
#
#     num_map_round_up(-1.9 1.9) => -1 2
#
###

function num_map_round_up(arr) {
    for (i in arr) arr[i] = num_round_up(arr[i])
}

function num_map_round_up_(num, num_, opts,  f, memo) {
    if (num_["integer"] == TRUE) return ""
    f = "num_map_round_up"
    if (num_[f] != TRUE) {
        num_map_round_before_(num, num_, opts, f, memo)
        num_map_round_up(num)
        num_map_round_after_(num, num_, opts, f, memo)
    }
    return ""
}

function num_map_round_up_init() {
    num_function_init("map_round_up round_up ceiling", "Map using round up, a.k.a. round towards positive infinity, ceiling.", "https://en.wikipedia.org/wiki/Rounding")
}

# Alias
function num_map_ceiling(arr) {
    return num_map_round_up(arr)
}

# Alias
function num_map_ceiling_(num, num_, opts) {
    return num_map_round_up_(num, num_, opts)
}

###
#
# Map: round down, a.k.a. round towards negative infinity, floor.
#
# Example:
#
#     num_map_round_down(-1.9 1.9) => -2 1
#
###

function num_map_round_down(arr) {
    for (i in arr) arr[i] = num_round_down(arr[i])
}

function num_map_round_down_(num, num_, opts,  f, memo) {
    if (num_["integer"] == TRUE) return ""
    f = "num_map_round_down"
    if (num_[f] != TRUE) {
        num_map_round_before_(num, num_, opts, f, memo)
        num_map_round_down(num)
        num_map_round_after_(num, num_, opts, f, memo)
    }
    return ""
}

function num_map_round_down_init() {
    num_function_init("map_round_down round_down floor", "Map using round down, a.k.a. round towards negative infinity, floor.")
}

# Alias
function num_map_floor(arr) {
    return num_map_round_down(arr)
}

# Alias
function num_map_floor_(num, num_, opts) {
    return num_map_round_down_(num, num_, opts)
}

###
#
# Map round after helper: call this function only from within
# each of the rounding functions, before the work begins.
# This function saves as much metadata as possible.
#
###

function num_map_round_before_(num, num_, opts, f, memo) {
    for (k in NUM_MAP_ROUND_MEMO) memo[k] = num_[k]
}

###
#
# Map round after helper: call this function only from within
# each of the rounding functions, after the work ends.
# This function restores as much metadata as possible.
#
###

function num_map_round_after_(num, num_, opts, f, memo) {
    split("",num_)
    for (k in NUM_MAP_ROUND_MEMO) num_[k] = memo[k]
    num_[f] = TRUE
    num_["integer"] = TRUE
}
