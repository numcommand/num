############################################################################
#
# num-help.awk
#
###

function num_help() {
    print "Num version 0.6.0."
    print "Copyright (C) 2015 Joel Parker Henderson."
    print "Please see http://github.com/numcommand"
    print ""
    print "The system Awk command is:"
    system("command -v awk")
    print ""
    system("awk -Wversion 2>/dev/null || awk --version")
    exit
}
