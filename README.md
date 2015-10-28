# Num: number utilties for mathematics

<b>[Kickstarter project link](https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics) -- please spread the word -- [donate $1 if you can](https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics)</b>

Num is a command line tool that provides number utilities for mathematics.

Num focuses on ease of use and common functions such as min, max, sum, var, stdev, etc.

Syntax:

    num [ options ] [ file ... ]

Examples:

    $ echo "1 2 4" | num sum
    7

    $ echo "1 2 4" | num min max median mean
    1 4 2 2.33333

    $ echo "1 2 4" | num variance skewness kurtosis
    2.33333 1.11111 5.44444

For newcomers:

  * [Examples](doc/examples.md)
  * [Thanks](doc/thanks.md)
  * [Command guide for related tools](doc/command-guide.md)
  * [When to use Num vs. other tools](doc/when-to-use-num-vs-other-tools.md)

For programmers:

  * [Programmers guide](doc/programmers-guide.md)
  * [Known issues](doc/known-issues.md)
  * [To do list, including ideas for future versions](doc/todo.md)
  * [Library of awk functions](implementations/num-awk)


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

Notes:

  * The project is new and is alpha quality, so give it a try, and don't use it for production until we have a 1.0 release in mid-November.

  * If you have any issues with installation, please contact us directly, or create a GitHub issue.

  * The roadmap includes a smoother safer installation process, using package managers such as `apt`, `yum`, `brew`, etc. If you would like to help with these, please contact us directly or create a GitHub issue.


## Options

  * --help, --version, --usage:<br>
      Print help text, version number, usage link, and awk details.


## Functions

Numbers Functions:

  * all:<br>
    All the items.

        echo "1 2 4" | num all
        1 2 4

  * first:<br>
    The first item.

        echo "1 2 4" | num first
        1

  * last:<br>
    The last item.

        echo "1 2 4" | num last
        4

  * n, count, length, size:<br>
    The number of items.

        echo "1 2 4" | num n
        3

  * minimum, min:<br>
    The minimum value.

        echo "1 2 4" | num minimum
        1

  * maximum, max:<br>
    The maximum value.

        echo "1 2 4" | num maximum
        1

  * range, spread:<br>
    The range, which is maximum - minimum.

        echo "1 2 4" | num range
        3

  * sum, total:<br>
    The sum total of all the items.

        echo "1 2 4" | num sum
        7

Mean:

  * mean, average, avg:<br>
      The arithmetic mean a.ka. average.

  * mean-absolute-deviation, mad:<br>
      The average distance between each value and the mean.

  * meanest:<br>
      The value that is closest numerically to the mean.

Median:

  * median, med:<br>
      The median.

  * median-low, med-low:<br>
      The low median, i.e. lesser of two middle values.

  * median-high, med-high:<br>
      The high median, i.e. greater of two middle values.

Mode:

  * mode:<br>
      The mode, which may be multiple numbers or UNDEF. TODO.

  * mode-low:<br>
      The least value of the mode values or UNDEF. TODO.

  * mode-high:<br>
      The greatest value of the mode values or UNDEF. TODO.

Sum Of:

  * sum-of-squares, ss:<br>
      The sum of squares, a.k.a. sum of each mean deviation to the power of 2.

  * sum-of-cubes:<br>
      The sum of cubes, a.k.a. sum of each mean deviation to the power of 3.

  * sum-of-quads:<br>
      The sum of quads, a.k.a. sum of each mean deviation to the power of 4.

Variance:

  * variance, var:<br>
      The variance. Use sample, not population.

  * population-variance, p-variance, p-var:<br>
      The population variance.

  * sample-variance, s-variance, s-var:<br>
      The sample variance.

Standard Deviation:

  * standard-deviation, stdev, sd:<br>
      The standard deviation (SD). Use sample, not population.

  * population-standard-deviation, p-stdev, p-sd:<br>
      The population standard deviation.

  * sample-standard-deviation, s-stdev, s-sd:<br>
      The sample standard deviation.

  * coefficient-of-variance, covar, cv:<br>
      The coefficient of variance (CV). Use sample, not population.

  * population-coefficient-of-variance, p-covar, p-cv:<br>
      The population coefficient of variance.

Skewness:

  * skewness, skew:<br>
      The skewness, e.g. the lack of symmetry. Use sample, not population.

  * population-skewness, p-skew:<br>
      The population skewness, e.g. the lack of symmetry.

  * sample-skewness, s-skew:<br>
      The sample skewness, e.g. the lack of symmetry.

Kurtosis:

  * kurtosis, kurt:<br>
      The kurtosis, e.g. peakness or flatness. Use sample, not population.

  * population-kurtosis, p-kurt:<br>
      The population kurtosis, e.g. peakness or flatness.

  * sample-kurtosis, s-kurt:<br>
      The sample kurtosis, e.g. peakness or flatness.

Second Moment About The Mean:

  * second-moment-about-the-mean, second-moment:<br>
      The second moment about the mean, a.k.a. variance. Use sample, not population.

  * population-second-moment-about-the-mean, p-second-moment:<br>
      The population second moment about the mean, a.k.a. population variance.

  * sample-second-moment-about-the-mean, s-second-moment:<br>
      The sample second moment about the mean, a.k.a. sample variance.

Third Moment About The Mean:

  * third-moment-about-the-mean, third-moment:<br>
      The third moment about the mean, a.k.a. skewness. Use sample, not population.

  * population-third-moment-about-the-mean, p-third-moment:<br>
      The population third moment about the mean, a.k.a. population skewness.

  * sample-third-moment-about-the-mean, s-third-moment:<br>
      The sample third moment about the mean, a.k.a. sample skewness.

Fourth Moment About The Mean:

  * fourth-moment-about-the-mean, fourth-moment:<br>
      The fourth moment about the mean, a.k.a. kurtosis. Use sample, not population.

  * population-fourth-moment-about-the-mean, p-fourth-moment:<br>
      The population fourth moment about the mean, a.k.a. population kurtosis.

  * sample-fourth-moment-about-the-mean, s-fourth-moment:<br>
      The sample fourth moment about the mean, a.k.a. sample kurtosis.

Quartiles:

  * interquartile-range, iqr, midspread, middle-fifty:<br>
      The interquartile range, which is q3 - q1.

  * quartile-0, q0:<br>
      Quartile 0, a.k.a. minimum.

  * quartile-1, q1:<br>
      Quartile 1, a.k.a. lower quartile, 25th percentile.

  * quartile-2, q2:<br>
      Quartile 2, a.k.a. median, 50th percentile.

  * quartile-3, q3:<br>
      Quartile 3, a.k.a. upper quartile, 75th percentile.

  * quartile-4, q4:<br>
      Quartile 4, a.k.a. maximum.

Transforms:

  * normalize:<br>
      Normalize each value to be within 0-1.

  * sort:<br>
      Sort the items in ascending order.

  * unique:<br>
      Keep unique values; omit the rest. TODO.

  * difference, diff:<br>
      The difference between each number and the next number. TODO.

Rounding:

  * round, integer:<br>
      Convert to nearest integer.<br>
      Examples: 1.9 => 2. -1.9 => -2.

  * round-off, truncate:<br>
      Convert to integer by omitting the fractional part.<br>
      Examples: 1.9 => 1. -1.9 => -1.

  * round-up, ceiling:<br>
      Convert to integer by rounding up.<br>
      Examples: 1.9 => 2. -1.9 => -1.

  * round-down, floor:<br>
      Convert to integer by rounding down.<br>
      Examples: 1.9 => 1. -1.9 => -2.

Mappings:

  * absolute-value, abs, magnitude:<br>
      Convert to absolute value a.k.a. magnitude, positive numbers.
      Examples: -1 => 1. 1 => 1.

Queries that return TRUE (1) or FALSE (0):

  * is-unique:<br>
      Is each item unique?

  * is-ascending, is-asc:<br>
      Is the data ascending, i.e. each next number is greater or equal?

  * is-strictly-ascending, is-strict-asc:<br>
      Is the data strictly ascending, i.e. each next number is greater?

  * is-non-ascending, is-non-asc:<br>
      Is the data non-ascending, i.e. some next number is lesser?

  * is-descending, is-desc:<br>
     Is the data descending, i.e. each next number is lesser or equal?

  * is-strictly-descending, is-strict-desc:<br>
      Is the data strictly descending, i.e. each next number is lesser?

  * is-non-descending, is-non-desc:<br>
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

Command line options accept any mix of dashes, underscores, and case.

For example these are all the same:

    sum-of-squares  # dashes
    sum_of_squares  # underscores
    sumofsquares    # lower case
    SumOfSquares    # mixed case
    SUMOFSQUARES    # upper case

If a value is unknown, or not a number, then it will print as "?". TODO.

    $ echo "1 2 4" | num mode
    ?


## Project Tracking

Author: Joel Parker Henderson (joel@joelparkerhenderson.com)

License: GPL, BSD, MIT

Created: 2015-03-28

Updated: 2015-10-26

Version: 0.6.0
