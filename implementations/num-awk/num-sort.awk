############################################################################
#
# num-sort.awk
#
# Caution: This implementation requires the `asort` function,
# which we believe is available in current `gawk` implementations,
# but may not be POSIX-compliant. This calls the C qsort library.
#
# TODO: Research if `asort` is POSIX or if there are alternatives.
#
# TODO: Research if `asort` has more flexibility that we can use.
#
# TODO: Consider using Timsort, which tends to be faster for real
# world data that may already be sorted or partially sorted.
#
###

function num_sort_awk_init() {
    split("n sum mean variance standard_deviation sum_of_squares sum_of_cubes sum_of_quads", NUM_SORT_MEMO)
}

###
#
# Remember metadata, then restore it.
#
###

function num_sort_before_(num, num_, opts, memo) {
    for (k in NUM_SORT_MEMO) memo[k] = num_[k]
}

function num_sort_after_(num, num_, opts, memo) {
    split("", num_)
    for (k in NUM_SORT_MEMO) num_[k] = memo[k]
}

###
#
# Sort ascending in place.
#
# Example:
#
#     num_sort_ascending(3 1 2) => 1 2 3
#
###

function num_sort_ascending(arr) {
    if (AWK_HAS_ASORT) {
        PROCINFO["sorted_in"] = "@val_num_asc"
        asort(num)
    } else {
        num_err("Num needs a function for sort ascending. We expect to add a solution in Num version 2.")
    }
}

function num_sort_ascending_(num, num_, opts,  f, memo) {
    f = "num_sort_ascending"
    if (num_[f] != TRUE) {
        num_sort_before_(num, num_, opts, memo)
        num_sort_ascending(num)
        num_sort_after_(num, num_, opts, memo)
        num_[f] = TRUE
        num_["ascending"] = TRUE
        num_["strictly_descending"] = FALSE
    }
}

function num_sort_ascending_init() {
    function_init("sort_ascending sort_asc sort_up sort", "Sort the values in ascending order.")
}

###
#
# Sort descending in place.
#
# Example:
#
#     num_sort_descending(3 1 2) => 3 2 1
#
###

function num_sort_descending(arr) {
    if (AWK_HAS_ASORT) {
        PROCINFO["sorted_in"] = "@val_num_desc"
        asort(num)
    } else {
        num_err("Num needs a function for sort descending. We expect to add a solution in Num version 2.")
    }
}

function num_sort_descending_(num, num_, opts,  f, memo) {
    f = "num_sort_descending"
    if (num_[f] != TRUE) {
        num_sort_before_(num, num_, opts, memo)
        num_sort_descending(num)
        num_sort_after_(num, num_, opts, memo)
        num_[f] = TRUE
        num_["descending"] = TRUE
        num_["strictly_ascending"] = FALSE
    }
}

function num_sort_descending_init() {
    function_init("sort_descending sort_desc sort_down", "Sort the values in descending order.")
}


############################################################################
#
# num-sort.awk booleans
#
###

###
#
# Is the list sorted in ascending order?
#
# Examples:
#
#    1 2 3 => TRUE
#    3 2 1 => FALSE
#    2 2 2 => TRUE
#
# A.k.a. non-descending.
#
# Return TRUE iff each successive number is greater or equal.
#
function num_is_ascending_(num, num_, opts,  f, x, i, flag) {
    f = "num_ascending"
    if (!(f in num_)) {
        if (num_["strictly_ascending"] == TRUE) {
            num_[f] = TRUE
        } else if (num_["descending"] == TRUE || num_["strictly_descending"] == TRUE) {
            num_[f] = FALSE
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] >= x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
                num_["strictly_descending"] = FALSE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function num_is_ascending_init() {
    function_init("is_ascending is_asc", "Is the list sorted in ascending order?")
}

###
#
# Is the list sorted in strictly ascending order?
#
# Examples:
#
#    1 2 3 => TRUE
#    3 2 1 => FALSE
#    2 2 2 => FALSE
#
# This is TRUE iff each successive number is greater.
#
function num_is_strictly_ascending_(num, num_, opts,  f, x, i, flag) {
    f = "num_strictly_ascending"
    if (!(f in num_)) {
        if (num_["descending"] == TRUE || num_["strictly_descending"] == TRUE) {
            num_[f] = FALSE
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] > x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
                num_["ascending"] = TRUE
                num_["desending"] = num_["strictly_desending"] = FALSE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function num_is_strictly_ascending_init() {
    function_init("is_strictly_ascending is_strict_asc", "Is the list sorted in strictly ascending order?")
}

###
#
# Is the list sorted in descending order?
#
# Examples:
#
#    3 2 1 => TRUE
#    1 2 3 => FALSE
#    2 2 2 => TRUE
#
# A.k.a. non-ascending.
#
# Return TRUE when each successive number is lesser or equal.
#
function num_is_descending_(num, num_, opts,  f, x, i, flag) {
    f = "num_descending"
    if (!(f in num_)) {
        if (num_["strictly_descending"] == TRUE) {
            num_[f] = TRUE
        } else if (num_["ascending"] == TRUE || num_["strictly_ascending"] == TRUE) {
            num_[f] = FALSE
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] <= x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
               num_["strictly_ascending"] = FALSE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function num_is_descending_init() {
    function_init("is_descending is_desc", "Is the list sorted in descending order?")
}

###
#
# Is the list sorted in strictly descending order?
#
# Examples:
#
#    3 2 1 => TRUE
#    1 2 3 => FALSE
#    2 2 2 => FALSE
#
# Return TRUE when each successive number is lesser.
#
function num_is_strictly_descending_(num, num_,   f, x, i, flag) {
    f = "num_strictly_descending"
    if (!(f in num_)) {
        if ("ascending" in num) {
            num_[f] = ! num_["ascending"]
        } else {
            flag = TRUE
            for (i in num) {
                if (x == "" || num[i] < x) {
                    x = num[i]
                } else {
                    flag = FALSE
                    break
                }
            }
            if (flag == TRUE) {
                num_["ascending"] = num_["strictly_ascending"] = FALSE
                num_["desending"] = TRUE
            }
            num_[f] = flag
        }
    }
    return num_[f]
}

function num_is_strictly_descending_init() {
    function_init("is_strictly_descending is_strict_desc", "Is the list sorted in strictly descending order?")
}
