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

See the `docs` directory for more:

  * [Examples](docs/examples.md)
  * [Kickstarter project](docs/kickstarter-project.md)
  * [Programmers guide](docs/programmers-guide.md)
  * [When to use Num vs. other tools](docs/when-to-use-num-vs-other-tools.md]

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

    middle                      The middle value i.e. closest to the mean.
    mid                         "

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


## Ideas for future upgrades

Numbers functions: `transpose`, `reverse`, etc.

Count functions: `count-positive`, `count-negative`, `count-zero`,
`count-non-zero`, `count-even`, `count-odd`, etc.

Mathematics functions: `absmin`, `absmax`, etc.

List functions: `rand`, `collapse`, `countunique`, etc.

Quantile functions:s `q0`, `q1`, `q2`, `q3, `q4`, `iqr`.

Statistics functions such as `antimode`, `pstdev`, `sstdev`, `pvar`, `svar`,
`mad`, `madraw`, `sskew`, `pskew`, `skurt`, `pkurt`, `jarque`, `dpo`.

IO functions: `input-header`, `output-header`, `format`, `printf`,
`zero-termination`, etc.

Table functions: `group`, `filler`, etc.

Typical Unix functions: `help`, `version`, etc.

Other functions such as those in other math stats tools.


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
