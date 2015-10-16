#!/bin/sh
set -euf

##
# Num: number utilties for mathematics and statistics.
#
# Syntax:
#
#     num [ options ] [ file ... ]
#
# This is a work in progress.
#
# Documentation is available:
#
#   * GitHub repository: https://github.com/numcommand/num
#
#   * Kickstarter project: https://kickstarter.com
#
# ## Tracking
#
# Author: Joel Parker Henderson (joel@joelparkerhenderson.com)
# License: GPL, BSD, MIT
# Created: 2015-03-28
# Updated: 2015-10-16
# Version: 0.0.2
##

awk '

############################################################################
#
# API
#
##

# All items.
#
function all(num, num_, options) {
    return arr_join(num, OFS)
}

############################################################################
#
# ARRAY UTILITIES
#
##

# Dump an array, suitable for debugging.
#
# Example:
#
#     arr_dump(arr)
#     1 a
#     2 b
#     3 d
#
function arr_dump(arr) {
    for (k in arr) print k, arr[k]
}

# Join an array to a string, with a separator string.
#
# Example:
#
#     arr_join(1 2 4, ",") => "1,2,4"
#
function arr_join(arr, sep,  s, i) {
    s = ""
    for (i in arr) s = s arr[i] sep
    s = substr(s, 1, length(s) - length(sep))
    return s
}

# Push one item on an array stack, by using the `length` function.
#
# Example:
#
#     arr = 1 2
#     arr_push(arr, 4)
#     => arr == 1 2 4
#
function arr_push(arr, item) {
    arr[length(arr)+1] = item
}

############################################################################
#
# INITIALIZE
#
##

# Initialize everything.
#
# This calls various `init_*` functions.
#
function init() {
    init_word_argv()
    init_word_list()
}

# Initialize the word argv list.
#
# The word argv list holds the argv items that this script cares about.
# We keep them in order, so we can output results in order.
#
function init_word_argv() {
    split("", global_word_argv)
}

# Initialize the global word list lookup array.
#
# This is to recognize words that a user types on the command line.
#
function init_word_list() {
    global_word_list["all"] = "all"
}


############################################################################
#
# WORDS
#
##

# Given a word, call its function.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     word_to_function(num, num_, "sum")
#     => 7 (by calling the `sum` function)
#
# Note: this implementation uses if..else instead of
# any switch or case, because we want POSIX usability.
#
# TODO: Is there a way to shorten this function,
# perhaps by reflection on the word and function name?
#
function word_to_function(num, num_, word) {
    if (word == "all")
        return all(num, num_)
    else
        return ""
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
function word_to_s(num, options, word,  s) {
    s = word_to_function(num, options, word)
    return s
}

# Given words, return the result as a string.
#
# Example:
#
#     num = 1 2 4
#     num_ = []
#     word_to_s(num, options, ("sum", "max"))
#     => "1 4"
#
function words_to_s(num, options, words, sep,  word, i, s, s2) {
    s = ""
    for (i in words) {
        word = words[i]
        s2 = word_to_s(num, options, word)
        s = s s2 sep
    }
    s = substr(s, 1, length(s) - length(sep))
    return s
}

############################################################################
#
# INPUT/OUTPUT
#
##

# Start receiving input.
#
# Ready the global number array for new input and new metadata.
#
function start_input() {
    split("", global_num)   # The input values.
    split("", global_num_)  # The metadata, such as cached results.
}

# Stop receiving input.
#
# Set any work in progress here.
#
function stop_input() {
    global_num_["n"] = global_num_n
}

# Parse word inputs by iterating: whenever a word is recognized,
# then move it from the word inputs array to the word matches array.
#
# Example to parse ARGV:
#
#     parse_words(ARGV, global_word_argv, global_word_list)
#
function parse_words(word_inputs, word_outputs, word_list,  i, word) {
    for (i in word_inputs) {
        if (word_inputs[i] in word_list) {
            word = word_inputs[i]
            delete word_inputs[i]
            arr_push(word_outputs, word)
        }
    }
}

# Parse the command line ARGV inputs to recognized word outputs.
#
function parse_argv() {
    parse_words(ARGV, global_word_argv, global_word_list)
}

# Print output to the screen.
#
# This is the core output function, and the only one that
# should print anything to the screen during normal operation.
#
function print_output() {
    print words_to_s(global_num, global_options, global_word_argv)
}

############################################################################
#
# MAIN
#
##

BEGIN{
    init()
    parse_argv()
    start_input()
}

{
    split($0, arr)
    for(i in arr) global_num[++global_num_n] = arr[i]
}

END{
    stop_input()
    print_output()
}' "$@"
