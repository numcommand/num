############################################################################
#
# num-print.awk
#
###

###
#
# Print a message to stdout.
#
# Example:
#
#     out("hello")
#
function out(msg) {
    print msg
}

###
#
# Print a message to stderr.
#
# Example:
#
#     err("hello")
#
# This is purposefully POSIX compatible.
#
function err(msg) {
    print msg | "cat 1>&2"
}
