# Num: number utilties for mathematics

<b>[NmCommand.com website](http://www.numcommand.com)</b> -- the documentation available on the new website.

<b>[Kickstarter project](https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics)</b> -- please spread the word and donate to raise our ranking.

Num is a command line tool that provides number utilities for mathematics and statistics.

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


## Input

You can read standard input:

    $ echo "1 2 4" | num sum
    7

You can read files:

    $ echo "1 2 4" > data.txt
    $ num sum data.txt
    7

You can customize the input field separator (FS) and the input record separator (RS):

    $ echo "1,2,3;4,5,6" | num sum FS=',' RS=';'
    21


## Output

You can customize the output field separator (OFS):

    $ echo "1 2 4" | num sum min max mean OFS=','
    7,1,4,2.33333


## Notation

Command line options accept any mix of dashes, underscores, and capitalizations.

For example these are all the same:

    sum-of-squares
    sum_of_squares
    sumofsquares
    SumOfSquares
    SUMOFSQUARES

If a value is unknown, or not a number, then it will print as "?". TODO.

    $ echo "1 2 4" | num mode
    ?


## Options

  * --help, --version, --usage:<br>
      Print help text, version number, usage link, and awk details.


## Functions

Numbers Functions:

  * <b>all</b><br>
    All the items.

        echo "1 2 4" | num all
        1 2 4

  * <b>first</b><br>
    The first item.

        echo "1 2 4" | num first
        1

  * <b>last</b><br>
    The last item.

        echo "1 2 4" | num last
        4

  * <b>n, count, length, size</b><br>
    The number of items.

        echo "1 2 4" | num n
        3

  * <b>minimum, min</b><br>
    The minimum value.

        echo "1 2 4" | num minimum
        1

  * <b>maximum, max</b><br>
    The maximum value.

        echo "1 2 4" | num maximum
        1

  * <b>range, spread</b><br>
    The range, which is maximum - minimum.

        echo "1 2 4" | num range
        3

  * <b>sum, total</b><br>
    The sum total of all the items.

        echo "1 2 4" | num sum
        7


  * <b>product</b><br>
    The product all the items.

        echo "1 2 4" | num product
        8

Mean:

  * <b>mean, average, avg</b><br>
      The arithmetic mean a.ka. average.

        echo "1 2 4" | num mean
        2.33333

  * <b>mean-absolute-deviation, mad</b><br>
      The average distance between each value and the mean.

        echo "1 2 4" | num mean-absolute-deviation
        1.11111

  * <b>meanest</b><br>
      The value that is closest numerically to the mean.

        echo "1 2 4" | num meanest
        2

Median:

  * <b>median, med</b><br>
      The median.

        echo "1 2 3 4" | num median
        2.5

  * <b>median-low, med-low</b><br>
      The low median, i.e. lesser of two middle values.

        echo "1 2 3 4" | num median
        2

  * <b>median-high, med-high</b><br>
      The high median, i.e. greater of two middle values.

        echo "1 2 3 4" | num median
        3

Mode:

  * <b>mode</b><br>
      The mode, which may be multiple numbers or UNDEF. TODO.

        echo "1 2 2 3" | num mode
        2

  * <b>mode-low</b><br>
      The least value of the mode values or UNDEF. TODO.

        echo "1 1 2 2 3 3" | num mode-low
        1

  * <b>mode-high</b><br>
      The greatest value of the mode values or UNDEF. TODO.

        echo "1 1 2 2 3 3" | num mode-high
        3

Sum Of:

  * <b>sum-of-squares, ss</b><br>
      The sum of squares, a.k.a. sum of each mean deviation to the power of 2.

        echo "1 2 4" | num sum-of-squares
        4.66667

  * <b>sum-of-cubes</b><br>
      The sum of cubes, a.k.a. sum of each mean deviation to the power of 3.

        echo "1 2 4" | num sum-of-cubes
        2.22222

  * <b>sum-of-quads</b><br>
      The sum of quads, a.k.a. sum of each mean deviation to the power of 4.

        echo "1 2 4" | num sum-of-quads
        10.8889

Variance:

  * <b>variance, var</b><br>
      The variance. Use sample, not population.

        echo "1 2 4" | num variance
        2.33333

  * <b>population-variance, p-variance, p-var</b><br>
      The population variance.

        echo "1 2 4" | num population-variance
        1.55556

  * <b>sample-variance, s-variance, s-var</b><br>
      The sample variance.

        echo "1 2 4" | num sample-variance
        2.33333

Standard Deviation:

  * <b>standard-deviation, stdev, sd</b><br>
      The standard deviation (SD). Use sample, not population.

        echo "1 2 4" | num standard-deviation
        1.52753

  * <b>population-standard-deviation, p-stdev, p-sd</b><br>
      The population standard deviation.

        echo "1 2 4" | num population-standard-deviation
        1.24722

  * <b>sample-standard-deviation, s-stdev, s-sd</b><br>
      The sample standard deviation.

        echo "1 2 4" | num sample-standard-deviation
        1.52753

Coefficient Of Variance:

  * <b>coefficient-of-variance, covar, cv</b><br>
      The coefficient of variance (CV). Use sample, not population.

  * <b>population-coefficient-of-variance, p-covar, p-cv</b><br>
      The population coefficient of variance.

  * <b>sample-coefficient-of-variance, s-covar, s-cv</b><br>
      The sample coefficient of variance.

Skewness:

  * <b>skewness, skew</b><br>
      The skewness, e.g. the lack of symmetry. Use sample, not population.

  * <b>population-skewness, p-skew</b><br>
      The population skewness, e.g. the lack of symmetry.

  * <b>sample-skewness, s-skew</b><br>
      The sample skewness, e.g. the lack of symmetry.

Kurtosis:

  * <b>kurtosis, kurt</b><br>
      The kurtosis, e.g. peakness or flatness. Use sample, not population.

  * <b>population-kurtosis, p-kurt</b><br>
      The population kurtosis, e.g. peakness or flatness.

  * <b>sample-kurtosis, s-kurt</b><br>
      The sample kurtosis, e.g. peakness or flatness.

Second Moment About The Mean:

  * <b>second-moment-about-the-mean, second-moment</b><br>
      The second moment about the mean, a.k.a. variance. Use sample, not population.

  * <b>population-second-moment-about-the-mean, p-second-moment</b><br>
      The population second moment about the mean, a.k.a. population variance.

  * <b>sample-second-moment-about-the-mean, s-second-moment</b><br>
      The sample second moment about the mean, a.k.a. sample variance.

Third Moment About The Mean:

  * <b>third-moment-about-the-mean, third-moment</b><br>
      The third moment about the mean, a.k.a. skewness. Use sample, not population.

  * <b>population-third-moment-about-the-mean, p-third-moment</b><br>
      The population third moment about the mean, a.k.a. population skewness.

  * <b>sample-third-moment-about-the-mean, s-third-moment</b><br>
      The sample third moment about the mean, a.k.a. sample skewness.

Fourth Moment About The Mean:

  * <b>fourth-moment-about-the-mean, fourth-moment</b><br>
      The fourth moment about the mean, a.k.a. kurtosis. Use sample, not population.

  * <b>population-fourth-moment-about-the-mean, p-fourth-moment</b><br>
      The population fourth moment about the mean, a.k.a. population kurtosis.

  * <b>sample-fourth-moment-about-the-mean, s-fourth-moment</b><br>
      The sample fourth moment about the mean, a.k.a. sample kurtosis.

Quartiles:

  * <b>interquartile-range, iqr, midspread, middle-fifty</b><br>
      The interquartile range, which is q3 - q1.

  * <b>quartile-0, q0</b><br>
      Quartile 0, a.k.a. minimum.

  * <b>quartile-1, q1</b><br>
      Quartile 1, a.k.a. lower quartile, 25th percentile.

  * <b>quartile-2, q2</b><br>
      Quartile 2, a.k.a. median, 50th percentile.

  * <b>quartile-3, q3</b><br>
      Quartile 3, a.k.a. upper quartile, 75th percentile.

  * <b>quartile-4, q4</b><br>
      Quartile 4, a.k.a. maximum.

Transforms:

  * <b>normalize</b><br>
      Normalize each value to be within 0-1.

  * <b>sort</b><br>
      Sort the items in ascending order.

  * <b>unique</b><br>
      Keep unique values; omit the rest. TODO.

  * <b>difference, diff</b><br>
      The difference between each number and the next number. TODO.

Rounding:

  * <b>round, integer</b><br>
      Convert to nearest integer.<br>
      Examples: 1.9 => 2. -1.9 => -2.

  * <b>round-off, truncate</b><br>
      Convert to integer by omitting the fractional part.<br>
      Examples: 1.9 => 1. -1.9 => -1.

  * <b>round-up, ceiling</b><br>
      Convert to integer by rounding up.<br>
      Examples: 1.9 => 2. -1.9 => -1.

  * <b>round-down, floor</b><br>
      Convert to integer by rounding down.<br>
      Examples: 1.9 => 1. -1.9 => -2.

Mappings:

  * <b>absolute-value, abs, magnitude</b><br>
      Convert to absolute value a.k.a. magnitude, positive numbers.
      Examples: -1 => 1. 1 => 1.

Queries that return TRUE (1) or FALSE (0):

  * <b>is-unique</b><br>
      Is each item unique?

  * <b>is-ascending, is-asc</b><br>
      Is the data ascending, i.e. each next number is greater or equal?

  * <b>is-strictly-ascending, is-strict-asc</b><br>
      Is the data strictly ascending, i.e. each next number is greater?

  * <b>is-non-ascending, is-non-asc</b><br>
      Is the data non-ascending, i.e. some next number is lesser?

  * <b>is-descending, is-desc</b><br>
     Is the data descending, i.e. each next number is lesser or equal?

  * <b>is-strictly-descending, is-strict-desc</b><br>
      Is the data strictly descending, i.e. each next number is lesser?

  * <b>is-non-descending, is-non-desc</b><br>
      Is the data non-descending, i.e. some next number is greater?


## Project Tracking

Author: Joel Parker Henderson (joel@joelparkerhenderson.com)

License: GPL, BSD, MIT

Created: 2015-03-28

Updated: 2015-10-26

Version: 0.6.0
