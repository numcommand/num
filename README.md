# Num: number utilties for mathematics

Num is a command line tool that provides number utilities for mathematics.

Num focuses on ease of use and common functions such as min, max, sum, var, stdev, etc.

Syntax:

    num [ options ] [ file ... ]

Examples:

    $ echo "1 2 4" | num sum
    7

    $ echo "1 2 4" | num min max
    1 4 7

    $ echo "1 2 4" | num median mean
    2 2.33333

    $ echo "1 2 4" | num sum-of-squares standard-deviation
    4.66667 1.24722

Help page:

  * [Examples](doc/examples.md)
  * [Kickstarter project](doc/kickstarter-project.md)
  * [When to use Num vs. other tools](doc/when-to-use-num-vs-other-tools.md)
  * [Command guide](doc/command-guide.md)
  * [Programmers guide](doc/programmers-guide.md)
  * [To do list, including ideas for future versions](doc/todo.md)

## Functions

Numbers Functions:

    all                         All the items.
    first                       The first item.
    last                        The last item.
    middle                      The middle item, which is the median-low.

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

    meanest                     The value closest to the mean.

    median                      The median.
    med                         "

    median-low                  The low median.
    med-low                     "

    median-high                 High median of data.
    med-high                    "

    mode                        The first mode or NAN.
    modes                       All modes or NAN.

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



## Other Mathematics Statistics Tools

GNU datamash:
http://www.gnu.org/software/datamash/manual/datamash.html

R language:
https://www.r-project.org

Python Pandas:
https://pandas.pydata.org


## Project Tracking

Author: Joel Parker Henderson (joel@joelparkerhenderson.com)

License: GPL, BSD, MIT

Created: 2015-03-28

Updated: 2015-10-02

Version: 0.1.0
