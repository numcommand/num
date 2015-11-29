############################################################################
#
# num-help.awk
#
##

function num_help() {
    print "Num version 1.2.1."
    print "Update 2015-11-17."
    print ""
    print "Copyright (C) 2015 Joel Parker Henderson."
    print "Please see http://github.com/numcommand"
    print ""
    print "Num uses this Awk:"
    print awk
    print ""
    cmd = awk "-Wversion 2>/dev/null || awk --version"
    print cmd
    system(cmd)
    exit
}

function num_help_init() {
    num_function_init(\
        "help version usage", 0,
        "Print help, version, usage.",
        "")
}
