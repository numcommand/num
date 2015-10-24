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

    sudo curl -sSL https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -o /usr/local/bin/num
    sudo chmod +x /usr/local/bin/num

Install using `wget`:

    sudo wget https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -O /usr/local/bin/num
    sudo chmod +x /usr/local/bin/num

If you use Mac OSX, then you also need to install GNU awk, such as:

    brew install gawk --default-names

If you use BSD, Cygwin, or any other Unix-like system that lacks GNU awk,
then here's how to [install `gawk`](https://www.gnu.org/software/gawk/manual/html_node/Quick-Installation.html)

Caution: the project is new and is alpha quality, so give it a try, and don't use it for production until we have a 1.0 release in November.

If you have any issues with installation, please contact us directly or create a GitHub issue.

The roadmap includes a smoother safer installation process, using package managers such as `apt`, `yum`, `brew`, etc. If you would like to help with these, please contact us directly or create a GitHub issue.


## Functions

Numbers Functions:

  * all:
      All the items.

  * first:
      The first item.

  * last:
      The last item.

  * n, count, length, size:
      The number of items.

  * minimum, min:
      The minimum value.

  * maximum, max:
      The maximum value.

  * range, spread:
      The range, which is maximum - minimum.

  * sum, total:
      The sum total of all the items.

Statistics Functions:

  * mean, average, avg:
      The arithmetic mean a.ka. average.

  * median, med:
      The median.

  * median-low, med-low:
      The low median, i.e. lesser of two middle values.

  * median-high, med-high:
      The high median, i.e. greater of two middle values.

  * mode:
      The mode, which may be multiple numbers or UNDEF. TODO.

  * mode-low:
      The least value of the mode values or UNDEF. TODO.

  * mode-high:
      The greatest value of the mode values or UNDEF. TODO.

  * sum-of-squares, ss:
      The sum of squares (SS), a.k.a. sum of the squared deviation.

  * variance, var:
      The variance, which defaults to sample, not population.

  * population-variance, p-variance, p-var:
       The population variance.

  * sample-variance, s-variance, s-var:
      The sample variance.

  * standard-deviation, stdev, sd:
      The standard deviation (SD), which defaults to sample, not population.

  * population-standard-deviation, p-stdev, p-sd:
      The population standard deviation.

  * sample-standard-deviation, s-stdev, s-sd:
      The sample standard deviation.

  * coefficient-of-variance, covar, cv:
      The coefficient of variance (CV), defaults to sample, not population.

  * population-coefficient-of-variance, p-covar, p-cv:
      The population coefficient of variance.

  * sample-coefficient-of-variance, s-covar, s-cv:
      The sample coefficient of variance.

  * skewness, skew:
      The skewness, e.g. the lack of symmetry. TODO.

  * kurtosis, kurt:
      The kurtosis, e.g. peakness or flatness. TODO.

  * interquartile-range, iqr, midspread, middle-fifty:
       The interquartile range, which is quartile 3 - quartile 1.

  * quartile-0, q0:
      Quartile 0, a.k.a. minimum.

  * quartile-1, q1:
      Quartile 1, a.k.a. lower quartile, 25th percentile.

  * quartile-2, q2:
      Quartile 2, a.k.a. median, 50th percentile.

  * quartile-3, q3:
      Quartile 3, a.k.a. upper quartile, 75th percentile.

  * quartile-4, q4:
      Quartile 4, a.k.a. maximum.

Filter:

  * sort:
      Sort the items in ascending order.

Queries that return TRUE (1) or FALSE (0):

  * is-ascending, is-asc:
      Is the data ascending, i.e. each next number is greater or equal?

  * is-strictly-ascending, is-strict-asc:
      Is the data strictly ascending, i.e. each next number is greater?

  * is-non-ascending, is-non-asc:
      Is the data non-ascending, i.e. some next number is lesser?

  * is-descending, is-desc:
     Is the data descending, i.e. each next number is lesser or equal?

  * is-strictly-descending, is-strict-desc:
      Is the data strictly descending, i.e. each next number is lesser?

  * is-non-descending, is-non-desc:
      Is the data non-descending, i.e. some next number is greater?


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

Version: 0.3.0
