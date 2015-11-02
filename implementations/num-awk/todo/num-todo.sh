function min
    if (!("min" in num_)) {
        if (num_["ascending"])
            num_["min"] = first(num)
        else if (num_["descending"])
            num_["min"] = last_via_num_(num)
        else
            num_["min"] = arr_min_via_scan(num)
    }
    return num_["min"]
}

function max
    if (!("max" in num_)) {
        if (num_["ascending"])
            num_["max"] = last_via_num_(num, num_)
        else if (num_["descending"])
            num_["max"] = first(num)
        else
            num_["max"] = arr_max_via_scan(num)
    }
    return num_["max"]
}

# Mode: get the first mode; if there is none, return NAN.
#
# Examples:
#
#     1 2 2 3 => 2
#     1 2 2 3 3 => 2
#     1 2 3 => "?"
#
function mode(num, num_,  _modes) {
    if (!("mode" in num_)) {
        if (_num["unique"]) {
            num_["mode"] = NAN
        } else {
            modes(num, num_, _modes)
            if (arr_empty(_modes)) {
                num_["mode"] = NAN
            } else {
               num_["mode"] = _modes[1]
            }
        }
    }
    return num_["mode"]
}

# Modes.
#
# The modes are:
#
#   * The values that appear most often in a set of data.
#   * If values appear the same number of times, there are multiple modes.
#   * If each value occurs only once, then there are no modes.
#
# Examples:
#
#     1 2 2 3 => 2
#     1 2 2 3 3 => 2 3
#     1 2 3 => NAN
#
function modes(num, num_, dest,  _dest_i, _seen, _max, i, j, s) {
    if (!("modes" in num_)) {
        if (_num["unique"]) {
            num_["modes"] = NAN
        } else {
            split("", dest)
            _dest_i = 0
            for (i in num) _seen[num[i]]++
            _max = arr_max_via_scan(_seen)
            if (_max > 1) {
                for (i in _seen) {
                    if (_seen[i] == _max) {
                       dest[++dest_i] = i
                    }
                }
                num_["modes"] = arr_join(dest, OFS)
            } else {
               num_["modes"] = NAN
            }
        }
    }
    return num_["modes"]
}


############################################################################
#
# ARRAY FUNCTIONS
#
##

# Join an array to a string, with a separator string, prefix, and suffix.
#
# Example:
#
#     arr_join(1 2 4, ",", "<", ">") => "<1>,<2>,<4>"
#
function arr_join_with_prefix_suffix(arr, sep, prefix, suffix,  s, i) {
    s = ""
    for (i in arr) s = s prefix arr[i] suffix sep
    return substr(s, 1, length(s) - length(sep))
}

# Return the first item in an array.
#
# Example:
#
#     arr_first(1 2 4) => 1
#
function arr_first(arr) {
    return arr[1]
}

# Get the last item in an array, by using the `length` function.
#
# Example:
#
#     arr_last_via_length(1 2 4) => 4
#
function arr_last_via_length(arr) {
    return arr[length(arr)]
}

# Get the last item in an array, by using the `arr_["n"]` value.
#
# Example:
#
#     arr_last_via_arr_(1 2 4, arr_) => 4
#
function arr_last_via_arr_(arr, arr_) {
    return arr[arr_["n"]]
}

# Push one item on an array stack, by using the `length` function.
#
# Example:
#
#     arr = 1 2
#     arr_push_via_length(arr, 4)
#     => arr == 1 2 4
#
function arr_push_via_length(arr, item) {
    arr[length(arr)+1] = item
}

# Push one item on an array stack, by using the `arr_["n"]` value.
#
#    arr = 1 2
#    arr_["n"] = 2
#    arr_push_via_arr_(arr, arr_, 4)
#    => arr == 1 2 4
#
function arr_push_via_arr_(arr, arr_, item) {
    arr[++arr_["n"]] = item
}

# Push multiple items on the array stack, by using the `length` function.
#
# Example:
#
#     arr1 = 1 2
#     arr2 = 4 8
#     arr_pushes_via_length(arr1, arr2)
#     => arr == 1 2 4 8
#
function arr_pushes_via_length(arr, items, _n, _i) {
    _n = length(arr)
    for (_i in items) {
        arr[++_n] = items[_i]
    }
}

# Push multiple items on the array stack, by using the `arr_["n"]` value.
#
#    arr1 = 1 2
#    arr2 = 4 8
#    arr_["n"] = 2
#    arr_pushes_via_arr_(arr, arr_, b)
#    => arr == 1 2 4 8
#
function arr_pushes_via_arr_(arr, arr_, items, _n, _i) {
    _n = arr_["n"]
    for (_i in items) {
        arr[++_n] = items[_i]
    }
    arr_["n"] += _n
}

# Push multiple numbers on the array stack, by using the `arr_["n"]` value.
#
#    arr = 1 2
#    b = 4 8
#    arr_pushes_via_arr_(arr, arr_, b)
#    => arr == 1 2 4 8
#
function arr_pushes_numbers_via_arr_(arr, arr_, items, _n, _i) {
    _n = arr_["n"]
    for (_i in items) {
        arr[++_n] = items[_i]
    }
    arr_["n"] += _n
}

# Pop one item of the array stack, by using the `length` function.
#
# Example:
#
#     arr = 1 2 4
#     arr_pop_via_length(a)
#     => 4
#     => arr == 1 2
#
# If the array is empty, return "".
#
function arr_pop_via_length(arr, _x, _n) {
    _n = length(arr)
    if (_n) {
        _x = arr[_n]
        delete arr[_n]
        return x
    } else {
        return ""
    }
}

# Pop one item of the array stack, by using the `arr_["n"]` value.
#
# Example:
#
#     arr = 1 2 4
#     arr_pop_via_arr_(arr, arr_)
#     => 4
#     => arr == 1 2
#
# If the array is empty, return "".
#
function arr_pop_via_arr_(arr, arr_, _x) {
    _n = arr_["n"]
    if (_n) {
        x = arr[_n]
        delete arr[_n]
        arr_["n"]--
        return x
    } else {
        return ""
    }
}

# Select numbers, by doing in-place destructive logic.
#
# Example:
#
#     arr = foo 1 goo 2
#     arr_select_numbers_in_place(arr, arr_)
#     => arr == 1 2
#
# Arr_:
#
#   * `arr_["unique"]` means the array is already unique,
#     which means the function will be skipped.
#
# TODO: Optimize.
#
function arr_select_numbers_in_place(arr, arr_, _length, i, j) {
    if (arr_["input_is_numbers"] != TRUE) {
        for (i in arr) {
            if (arr[i] == arr[i] + 0) {
                j++
                if (i != j) {
                   arr[j] = arr[i]
                }
            }
        }
        _length = length(arr)
        for (i = j + 1; i <= _length; i++) delete arr[i]
        arr_["n"] = j  #TODO clear cache of results
        arr_["input_is_numbers"] = TRUE
    }
}

# Effect unique items, by doing in-place destructive logic.
#
# Example:
#
#     arr = 1 2 2 3
#     arr_effect_unique_in_place(arr, arr_)
#     => arr == 1 2 3
#
# Arr_:
#
#   * `arr_["unique"]` means the array is already unique,
#     which means the function will be skipped.
#
# TODO: Optimize.
#
function arr_effect_unique_in_place(arr, arr_, _dest, _seen, i) {
    info("effect_unique_in_place")
    if (arr_["unique"] != TRUE) {
        for (i in arr) _seen[arr[i]] == TRUE
        for (i in _seen) _dest[++j] = i
        arr = _dest
        arr_["unique"] = TRUE
    }
}

# Select unique items, by doing in-place destructive logic.
#
# Example:
#
#     arr = 1 2 2 3
#     arr_select_unique_in_place(arr, arr_)
#     => arr == 1 3
#
# Arr_:
#
#   * `arr_["unique"]` means the array is already unique,
#     which means the function will be skipped.
#
# TODO: Optimize.
#
function arr_select_unique_in_place(arr, arr_, _dest, _seen, i) {
    info("select_unique_in_place")
    if (arr_["unique"] != TRUE) {
        for (i in arr) _seen[arr[i]]++
        for (i in _seen) if (_seen[i] == 1) dest[++j] = i
        arr = _dest
        arr_["unique"] = TRUE
    }
}

# Reject unique items, by doing in-place destructive logic.
#
# Example:
#
#     arr = 1 2 2 3
#     arr_reject_unique_in_place(arr, arr_)
#     => arr == 2
#
# Arr_:
#
#   * `arr_["unique"]` means the array is already unique,
#      which means this function will reject all the numbers.
#
# TODO: Memoize.
#
function arr_reject_unique_in_place(arr, arr_, _dest, _seen, i) {
    info("reject_unique_in_place")
    if (arr_["unique"] == TRUE) {
        split("", arr)
    } else {
        for (i in arr) _seen[arr[i]]++
        for (i in _seen) if (_seen[i] != 1) _dest[++j] = i
        arr = _dest
    }
}

############################################################################
#
# DEBUG FUNCTIONS
#
##

## Helper functions

# Ready the global numbers array and options array.
#
# This clears the arrays, then sets the numbers count to 0.
#
function ready() {
  init_num()
}

############################################################################
#
# WORD FUNCTIONS
#
##

# Call this function for each option word a.k.a. flag,
# before any calculation happens and any work happens.
#
# This function must only set `conf` keys and values.
# This function must NOT do any calculations, work, etc.
#
# Example:
#
#     word_to_conf("median")
#     => conf["sort"] = "?" (which means a sort is needed)
#
# TODO optimize, such as by creating a word lookup, or init functions, etc.
#
function word_to_conf(word, conf) {
    if (word == "input-fields")
        conf["input_scope"] = CONF_INPUT_SCOPE_FIELDS
    else if (word == "input-records")
        cont["input_scope"] = CONF_INPUT_SCOPE_RECORDS
    else if (word == "input-is-linear")
        conf["sorted"] = TRUE
    else if (word == "input-is-sorted")
        conf["sorted"] = TRUE
    else if (word == "input-is-unique")
        conf["unique"] = TRUE
    else if (word == "output-label")
        conf["output_label"] = TRUE
    else if (word == "output-csv")
        conf["output_field_separator"] = ","
    else if (word == "output-tsv")
        conf["output_field_separator"] = "\t"
    else if (word == "median")
        conf["sort"] = "?"
    else if (word == "unique")
        conf["unique"] = "?"
    else
        return ""
}

# Copy relevant conf items to the number list items.
#
function conf_to_num_() {
    num_["sorted"] = conf["sorted"]
    num_["unique"] = conf["unique"]
    num_["sort"] = conf["sort"]
    num_["unique"] = conf["unique"]
}

# Given a word, return the result as a string.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     word_to_s(num, options, "sum")
#     => "7"
#
# The string has various settings:
#
#   * `options["output_field_prefix"]` is at the start of the string.
#   * `options["output_field_suffix"]` is at the end of the string.
#   * `options["output_field_infix"]` is between the label and value.
#
# Example:
#
#     options["output_label"] = TRUE
#     options["output_field_prefix"] = "<"
#     options["output_field_suffix"] = ">"
#     options["output_field_infix"]  = ":"
#     num = 1 2 4
#     options = []
#     word_to_s(num, options, "sum")
#     => "<sum:7>"
#
function word_to_s(num, options, word,  x, s) {
    x = word_function(num, options, word)
    if (_output_label) {
        s = "" options["output_field_prefix"] word options["output_field_infix"] x options["output_field_suffix"]
    } else {
        s = "" x
    }
    return s
}

function word_to_s(num, options, words,  word, i, s, s2) {
    s = ""
    sep = OFS #options["output_field_separator"] #TODO
    for (i in words) {
        word = words[i]
        if (global_word_output[word]) {
            x = word_to_s(num, options, word)
            s = s x sep
        }
    }
    s = substr(s, 1, length(s) - length(sep))
    return s
}

## Filtering

function filters(num, options) {
    if ("select-numbers") arr_select_numbers_in_place(num, options)
    if ("select-unique" in options) select_unique_in_place(num, options)
    if ("reject-unique" in options) reject_unique_in_place(num, options)
    if ("sort-asc" in options) arr_sort_in_place(num, options)
    if ("sort-desc" in options) print "#TODO"
    #print "filters stop"; arr_dump(a)
}

## Argv Functions

function parse_argv(  i, word) {
        #info("parse_argv ARGV[" i "]:" ARGV[i])
        if (ARGV[i] in global_word_list) {
            word = ARGV[i]
            delete ARGV[i]
            word = normalize_word(word)
            #info("parse_argv found word:" word)
            arr_push_via_length(global_word, word)
!!!            word_to_conf(word, global_conf)
        }
    }
}

function normalize_word(word) {
    #info("normalize_word word:" word)
    if (word in global_word_list) {
        return global_word_list[word]
    } else {
        return word
    }
}

# Save the entire ARGV array to a global array.
#
# We want this copy because the script can delete ARGV items,
# before sending ARGV along to `awk`. This copy is our backup.
#
function save_argv() {
    for (i in ARGV) {
        argv[i] = ARGV[i]
    }
}

## Output Functions

function output() {
    global_num_["n"] = global_num_n
    filters(global_num, global_options)
    print word_to_s(global_num, global_options, global_word)
}

############################################################################
#
# INITIALIZE
#
##

function init() {
    init_conf()
}

# Initialize constants that we use, essentially like defines.
#
function init_constants() {
    CONF_INPUT_SCOPE_FIELDS = 1
    CONF_INPUT_SCOPE_RECORDS = 2
}

# Initialize the global configuration lookup.
#
# This is how the script stores its own settings.
#
function init_conf() {
    split("", global_conf)
    global_conf["input_scope"] = CONF_INPUT_SCOPE_RECORDS
    global_conf["output_exists"] = FALSE
    global_conf["output_record_separator"] = ORS
    global_conf["output_field_separator"] = OFS
    global_conf["output_field_prefix"] = ""
    global_conf["output_field_suffix"] = ""
    global_conf["output_field_infix"] = ":"
}

function init_num() {
...
    global_num_n = 0
}

############################################################################
#
# MAIN
#
##

BEGIN{
    init()
    save_argv()
    parse_argv()
    ready()
}

{
    if (global_conf["input_scope"] == CONF_INPUT_SCOPE_RECORDS) {
        split($0, arr)
        for(i in arr) if (arr[i] == arr[i] + 0) global_num[++global_num_n] = arr[i]
    }
    else if (global_conf["input_scope"] == CONF_INPUT_SCOPE_FIELDS) {
        ready()
        split($0, arr)
        for(i in arr) if (arr[i] == arr[i] + 0) global_num[++global_num_n] = arr[i]
        output()
    }
}

END{
    if (global_conf["input_scope"] == CONF_INPUT_SCOPE_RECORDS) {
        output()
    }
}' "$@"


######

!!!
# Ready
# This tracks the number of input values a.k.a. the global_num array length.
# This is because POSIX lacks a length() function, so this script must
# manually keep track of the length as the global_num array changes.
