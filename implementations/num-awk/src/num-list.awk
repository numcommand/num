############################################################################
#
# num-list.awk
#
##

##
#
# Number of items, a.k.a. count, length.
#
# Example:
#
#     num_n(1 2 4) => 3
#
##

function num_n(arr) {
    return num_arr_length(arr)
}

function num_n_(num, num_, opts,  f) {
    f = "n"
    if (!(f in num_)) num_[f] = num_n(num)
    return num_[f]
}

function num_n_init() {
    num_function_init(\
        "num_n n count length size", 0,
        "Get the number of items, a.k.a. count, length, size.",
        "https://en.wikipedia.org/wiki/Enumeration")
}

##
#
# First item.
#
# Example:
#
#     num_first(1 2 4) => 1
#
##

function num_first(arr) {
    return arr[1]
}

function num_first_(num, num_, opts,  f) {
    f = "num_first"
    if (!(f in num_)) num_[f] = num_first(num)
    return num_[f]
}

function num_first_init() {
    num_function_init(\
        "num_first first head", 0,
        "Get the first item.",
        "https://en.wikipedia.org/wiki/Enumeration")
}

##
#
# Last item.
#
# Example:
#
#   num_last(1 2 4) => 4
#
##

function num_last(arr) {
    return arr[num_arr_length(arr)]
}

function num_last_(num, num_, opts,  f) {
    f = "num_last"
    if (!(f in num_)) num_[f] = num_last(num)
    return num_[f]
}

function num_last_init() {
    num_function_init(\
        "num_last last tail",
        "Get the last item.",
        "https://en.wikipedia.org/wiki/Enumeration")
}

##
#
# Minimum value.
#
# Example:
#
#     num_min(1 2 4) => 1
#
# This implementation does a scan of the entire array.
#
##

function num_min(arr,  _min, i) {
    _min = ""
    for (i in arr) {
        if (_min == "" || arr[i] < _min) {
            _min = arr[i]
        }
    }
    return _min
}

function num_min_(num, num_, opts,  f) {
    f = "num_min"
    if (!(f in num_)) num_[f] = num_min(num)  # TODO optimize ascending & descending
    return num_[f]
}

function num_min_init() {
    num_function_init(\
        "num_min min minimum least lowest", 0,
        "Get the minimum value, a.k.a. least, lowest.",
        "https://en.wikipedia.org/wiki/Maxima_and_minima")
}

##
#
# Maximum value.
#
# Example:
#
#     num_max(1 2 4) => 4
#
# This implementation does a scan of the entire array.
#
function num_max(arr,  _max, i) {
    _max = ""
    for (i in arr) {
        if (_max == "" || arr[i] > _max) {
            _max = arr[i]
        }
    }
    return _max
}

function num_max_(num, num_, opts,  f) {
    f = "num_max"
    if (!(f in num_)) num_[f] = num_max(num)  # TODO optimize ascending & descending
    return num_[f]
}

function num_max_init() {
    num_function_init(\
        "num_max max maximum greatest highest", 0,
        "Get the maximum value, a.k.a. greatest, highest.",
        "https://en.wikipedia.org/wiki/Maxima_and_minima")
}

##
#
# Range, a.k.a. spread.
#
# Example:
#
#     num_range(1 2 4) => 3
#
##

function num_range(arr) {
    return num_max(arr) - num_min(arr)
}

function num_range_(num, num_, opts,  f) {
    f = "num_range"
    if (!(f in num_)) num_[f] = num_max_(num, num_, opts) - num_min_(num, num_, opts)
    return num_[f]
}

function num_range_init() {
    num_function_init(\
        "num_range range interval breadth spread", 0,
        "Get the range, a.k.a. interval, breadth, spread.",
        "https://en.wikipedia.org/wiki/Range_(statistics)")
}

##
# Filter a list by doing a comparison.
#
#   * eq: equal to
#   * ne: not equal to
#   * lt: less than
#   * le: less than or equal to
#   * gt: greater than
#   * ge: greater than or equal to
#   * in: intra-range, i.e. include [min, max].
#   * ex: extra-range, i.e. exclude [min, max].
#
# Examples of select:
#
#     num_select_eq(1 2 3 4 5, 3) => 3
#     num_select_ne(1 2 3 4 5, 3) => 1 2 4 5
#     num_select_lt(1 2 3 4 5, 3) => 1 2
#     num_select_le(1 2 3 4 5, 3) => 1 2 3
#     num_select_gt(1 2 3 4 5, 3) => 4 5
#     num_select_ge(1 2 3 4 5, 3) => 3 4 5
#     num_select_in(1 2 3 4 5, 2, 4) => 2 3 4
#     num_select_ex(1 2 3 4 5, 2, 4) => 1 5
#
# Examples of reject i.e. delete:
#
#     num_reject_eq(1 2 3 4 5, 3) => 1 2 4 5
#     num_reject_ne(1 2 3 4 5, 3) => 3
#     num_reject_lt(1 2 3 4 5, 3) => 3 4 5
#     num_reject_le(1 2 3 4 5, 3) => 4 5
#     num_reject_gt(1 2 3 4 5, 3) => 1 2 3
#     num_reject_ge(1 2 3 4 5, 3) => 1 2
#     num_reject_in(1 2 3 4 5, 2, 4) => 1 5
#     num_reject_ex(1 2 3 4 5, 2, 4) => 2 3 4
#
##

## Select EQ

function num_select_eq(arr, x,  n) {
    for (i in arr) if (arr[i] == x) { n++ } else { delete arr[i] }
    return n
}

function num_select_eq_(num, num_, opts, x, f) {
    f = "num_select_eq " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_eq(num, x)
    return num_[f]
}

function num_select_eq_init() {
    num_function_init(\
        "num_select_eq select_eq eq", 0,
        "Select all values equal to x",
        "")
}

## Select NE

function num_select_ne(arr, x,  n) {
    for (i in arr) if (arr[i] != x) { n++ } else { delete arr[i] }
    return n
}

function num_select_ne_(num, num_, opts, x, f) {
    f = "num_select_ne " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_ne(num, x)
    return num_[f]
}

function num_select_ne_init() {
    num_function_init(\
        "num_select_ne select_ne ne", 0,
        "Select all values not equal to x",
        "")
}

## Select LT

function num_select_lt(arr, x,  n) {
    for (i in arr) if (arr[i] < x) { n++ } else { delete arr[i] }
    return n
}

function num_select_lt_(num, num_, opts, x, f) {
    f = "num_select_lt select_lt lt " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_lt(num, x)
    return num_[f]
}

function num_select_lt_init() {
    num_function_init(\
        "num_select_lt", 0,
        "Select all values less than x",
        "")
}

## Select LE

function num_select_le(arr, x,  n) {
    for (i in arr) if (arr[i] <= x) { n++ } else { delete arr[i] }
    return n
}

function num_select_le_(num, num_, opts, x, f) {
    f = "num_select_le " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_le(num, x)
    return num_[f]
}

function num_select_le_init() {
    num_function_init(\
        "num_select_le select_le le", 0,
        "Select all values less than or equal to x",
        "")
}

## Select GT

function num_select_gt(arr, x,  n) {
    for (i in arr) if (arr[i] > x) { n++ } else { delete arr[i] }
    return n
}

function num_select_gt_(num, num_, opts, x, f) {
    f = "num_select_gt select_gt gt" x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_gt(num, x)
    return num_[f]
}

function num_select_gt_init() {
    num_function_init(\
        "num_select_gt", 0,
        "Select all values greater than x",
        "")
}

## Select GE

function num_select_ge(arr, x,  n) {
    for (i in arr) if (arr[i] >= x) { n++ } else { delete arr[i] }
    return n
}

function num_select_ge_(num, num_, opts, x, f) {
    f = "num_select_ge " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_ge(num, x)
    return num_[f]
}

function num_select_ge_init() {
    num_function_init(\
        "num_select_ge select_ge ge", 0,
        "Select all values greater than or equal to x",
        "")
}

## Select IN

function num_select_in(arr, min, max,  n) {
    for (i in arr) if (arr[i] >= min && arr[i] <= max) { n++ } else { delete arr[i] }
    return n
}

function num_select_in_(num, num_, opts, x, f) {
    f = "num_select_in " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_in(num, x)
    return num_[f]
}

function num_select_in_init() {
    num_function_init(\
        "num_select_in select_in in", 0,
        "Select all values intra-range [min, max]",
        "")
}

## Select EX

function num_select_ex(arr, min, max) {
    for (i in arr) if (arr[i] < min || arr[i] > max) { n++ } else { delete arr[i] }
    return n
}

function num_select_ex_(num, num_, opts, x, f) {
    f = "num_select_ex " x
    if (!(f in num_)) num_[f] = num_["n"] = num_select_ex(num, x)
    return num_[f]
}

function num_select_ex_init() {
    num_function_init(\
        "num_select_ex select_ex ex", 0,
        "Select all values extra-range [min, max]",
        "")
}

## Reject EQ

function num_reject_eq(arr, x,  n) {
    for (i in arr) if (arr[i] == x) { delete arr[i] } else { n++ }
    return n
}

function num_reject_eq_(num, num_, opts, x, f) {
    f = "num_reject_eq " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_eq(num, x)
    return num_[f]
}

function num_reject_eq_init() {
    num_function_init(\
        "num_reject_eq reject_eq", 0,
        "Reject all values equal to x",
        "")
}

## Reject NE

function num_reject_ne(arr, x,  n) {
    for (i in arr) if (arr[i] != x) { delete arr[i] } else { n++ }
    return n
}

function num_reject_ne_(num, num_, opts, x, f) {
    f = "num_reject_ne " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_ne(num, x)
    return num_[f]
}

function num_reject_ne_init() {
    num_function_init(\
        "num_reject_ne reject_ne", 0,
        "Reject all values not equal to x",
        "")
}

## Reject LT

function num_reject_lt(arr, x,  n) {
    for (i in arr) if (arr[i] < x) { delete arr[i] } else { n++ }
    return n
}

function num_reject_lt_(num, num_, opts, x, f) {
    f = "num_reject_lt " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_lt(num, x)
    return num_[f]
}

function num_reject_lt_init() {
    num_function_init(\
        "num_reject_lt reject_lt", 0,
        "Reject all values less than x",
        "")
}

## Reject LE

function num_reject_le(arr, x,  n) {
    for (i in arr) if (arr[i] <= x) { delete arr[i] } else { n++ }
    return n
}

function num_reject_le_(num, num_, opts, x, f) {
    f = "num_reject_le " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_le(num, x)
    return num_[f]
}

function num_reject_le_init() {
    num_function_init(\
        "num_reject_le reject_le", 0,
        "Reject all values less than or equal to x",
        "")
}

## Reject GT

function num_reject_gt(arr, x,  n) {
    for (i in arr) if (arr[i] > x) { delete arr[i] } else { n++ }
    return n
}

function num_reject_gt_(num, num_, opts, x, f) {
    f = "num_reject_gt " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_gt(num, x)
    return num_[f]
}

function num_reject_gt_init() {
    num_function_init(\
        "num_reject_gt reject_gt", 0,
        "Reject all values greater than x",
        "")
}

## Reject GE

function num_reject_ge(arr, x,  n) {
    for (i in arr) if (arr[i] >= x) { delete arr[i] } else { n++ }
    return n
}

function num_reject_ge_(num, num_, opts, x, f) {
    f = "num_reject_ge reject_ge" x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_ge(num, x)
    return num_[f]
}

function num_reject_ge_init() {
    num_function_init(\
        "num_reject_ge", 0,
        "Reject all values greater than or equal to x",
        "")
}

## Reject IN

function num_reject_in(arr, min, max,  n) {
    for (i in arr) if (arr[i] >= min && arr[i] <= max) { delete arr[i] } else { n++ }
    return n
}

function num_reject_in_(num, num_, opts, x, f) {
    f = "num_reject_in " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_in(num, x)
    return num_[f]
}

function num_reject_in_init() {
    num_function_init(\
        "num_reject_in reject_in", 0,
        "Reject all values intra-range [min, max]",
        "")
}

## Reject EX

function num_reject_ex(arr, min, max) {
    for (i in arr) if (arr[i] < min || arr[i] > max) { delete arr[i] } else { n++ }
    return n
}

function num_reject_ex_(num, num_, opts, x, f) {
    f = "num_reject_ex " x
    if (!(f in num_)) num_[f] = num_["n"] = num_reject_ex(num, x)
    return num_[f]
}

function num_reject_ex_init() {
    num_function_init(\
        "num_reject_ex reject_ex", 0,
        "Reject all values extra-range [min, max]",
        "")
}
