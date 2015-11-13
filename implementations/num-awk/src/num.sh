#!/bin/sh
set -euf

##
#
# Num: number utilties for mathematics and statistics.
#
# Syntax:
#
#     num [ options ] [ file ... ]
#
# Full documentation and code is available:
#
#   * http://www.numcommand.com
#   * https://github.com/numcommand/num
#
# ## Tracking
#
# Author: Joel Parker Henderson (joel@joelparkerhenderson.com)
# License: GPL, BSD, MIT
# Created: 2015-03-28
# Updated: 2015-11-12
# Version: 0.10.0
#
##

AWK=${AWK:-$(command -v gawk || command -v awk || echo "awk")}
"$AWK" '' "$@"
