# Num: number utilties for mathematics

<b>[Kickstarter project link](https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics) -- please spread the word -- donate $1 if you can</b>

Num is a command line tool that provides number utilities for mathematics.

Num focuses on ease of use and common functions such as min, max, sum, var, stdev, etc.

Syntax:

    num [ options ] [ file ... ]

Examples:

    $ echo "1 2 4" | num sum
    7

    $ echo "1 2 4" | num min max
    1 4

    $ echo "1 2 4" | num median mean
    2 2.33333

    $ echo "1 2 4" | num sum-of-squares standard-deviation
    4.66667 1.24722

Help page:

  * [Examples](doc/examples.md)
  * [Thanks](doc/thanks.md)
  * [When to use Num vs. other tools](doc/when-to-use-num-vs-other-tools.md)
  * [Command guide](doc/command-guide.md)
  * [Programmers guide](doc/programmers-guide.md)
  * [Known issues](doc/known-issues.md)
  * [To do list, including ideas for future versions](doc/todo.md)

## Install

Download the `num` script to your own system, and put it somewhere you can run it.

Install using `curl`:

    curl -sSL https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -o /usr/local/bin/num

Install using `wget`:

    wget https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -O /usr/local/bin/num

If you use Mac OSX, then you also need GNU awk, such as:

    brew install gawk --default-names


Caution: the project is new and is alpha quality, so give it a try, and don't use it for production until we have a 1.0 release in November.

If you have any issues with installation, please contact us directly or create a GitHub issue.

The roadmap includes a smoother safer installation process, using package managers such as `apt`, `yum`, `brew`, etc. If you would like to help with these, please contact us directly or create a GitHub issue.


## Functions

Numbers Functions:

    all                         All the items.
    first                       The first item.
    last                        The last item.

    n                           The number of items.
    count                       "
    length                      "
    size                        "

    minimum                     The minimum value.
    min                         "

    maximum                     The maximum value.
    max                         "

    range                       The range, which is maximum - minimum.
    spread                      "

    sum                         The sum.
    total                       "

Statistics Functions:

    mean                        The arithmetic mean a.ka. average.
    average                     "

    median                      The median.
    med                         "

    median-low                  The low median, i.e. lesser of two middle values.
    med-low                     "

    median-high                 The high median, i.e. greater of two middle values.
    med-high                    "

    mode                        The mode, which may be multiple numbers or UNDEF. TODO.

    mode-low                    The least value of the mode values or UNDEF. TODO.

    mode-high                   The greatest value of the mode values or UNDEF. TODO.

    variance                    The variance.
    var                         "

    sum-of-squares              The sum of squares (SS).
    sum2                        "
    ss                          "

    standard-deviation          The standard deviation (SD).
    stdev                       "
    sd                          "

    coefficient-of-variance     The coefficient of variance (CV).
    covar                       "
    cv                          "


## Input/Output

Input can use stdin or an input file:

    $ echo "1 2 4" | num sum
    7

    $ echo "1 2 4" > data.txt
    $ num sum data.txt
    7

Input can use an input field separator (FS) and/or input record separator (RS):

    $ echo "1,2,3;4,5,6" | num sum FS=',' RS=';'
    21

Output can use an output field separator (OFS):

    $ echo "1 2 4" | num sum min max mean OFS=','
    7,1,4,2.33333


## Notation

Command line option dashes are optional, such as:

    $ echo "1 2 4" | num sum-of-squares
    $ echo "1 2 4" | num sumofsquares

If a value is unknown, or not a number, then it will print as "?". (#TODO)

    $ echo "1 2 4" | num mode
    ?


## Project Tracking

Author: Joel Parker Henderson (joel@joelparkerhenderson.com)

License: GPL, BSD, MIT

Created: 2015-03-28

Updated: 2015-10-20

Version: 0.2.0
