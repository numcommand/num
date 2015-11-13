############################################################################
#
# num-print.awk
#
##

##
#
# Print a message to stdout.
#
# Example:
#
#     num_out("hello")
#     => Print "hello" to STDOUT
#
function num_out(msg) {
    print msg
}

##
#
# Print a message to stderr.
#
# Example:
#
#     num_err("hello")
#     => Print "hello" to STDERR
#
# This is purposefully POSIX compatible.
#
function num_err(msg) {
    print msg | "cat 1>&2"
}
