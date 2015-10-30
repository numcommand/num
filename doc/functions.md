# Functions: the complete list of all capabilities

## Numbers Functions

### all

All the items.

    echo "1 2 4" | num all
    1 2 4

### first

The first item.

    echo "1 2 4" | num first
    1

### last

The last item.

    echo "1 2 4" | num last
    4

### n, count, length, size

The number of items.

    echo "1 2 4" | num n
    3

### minimum, min

The minimum value.

    echo "1 2 4" | num minimum
    1

### maximum, max

The maximum value.

    echo "1 2 4" | num maximum
    1

### range, spread

The range, which is maximum - minimum.

    echo "1 2 4" | num range
    3

### sum, total

The sum total of all the items.

    echo "1 2 4" | num sum
    7


### product

The product all the items.

    echo "1 2 4" | num product
    8


## Mean

### mean, average, avg
      The arithmetic mean a.ka. average.

    echo "1 2 4" | num mean
    2.33333

### mean-absolute-deviation, mad
      The average distance between each value and the mean.

    echo "1 2 4" | num mean-absolute-deviation
    1.11111

### meanest
      The value that is closest numerically to the mean.

    echo "1 2 4" | num meanest
    2


## Median

### median, med
      The median.

    echo "1 2 3 4" | num median
    2.5

### median-low, med-low
      The low median, i.e. lesser of two middle values.

    echo "1 2 3 4" | num median
    2

### median-high, med-high
      The high median, i.e. greater of two middle values.

    echo "1 2 3 4" | num median
    3


## Mode

### mode
      The mode, which may be multiple numbers or UNDEF. TODO.

    echo "1 2 2 3" | num mode
    2

### mode-low
      The least value of the mode values or UNDEF. TODO.

    echo "1 1 2 2 3 3" | num mode-low
    1

### mode-high
      The greatest value of the mode values or UNDEF. TODO.

    echo "1 1 2 2 3 3" | num mode-high
    3


## Sum Of

### sum-of-squares, ss

The sum of squares, a.k.a. sum of each mean deviation to the power of 2.

    echo "1 2 4" | num sum-of-squares
    4.66667

### sum-of-cubes

The sum of cubes, a.k.a. sum of each mean deviation to the power of 3.

    echo "1 2 4" | num sum-of-cubes
    2.22222

### sum-of-quads

The sum of quads, a.k.a. sum of each mean deviation to the power of 4.

    echo "1 2 4" | num sum-of-quads
    10.8889


## Variance

### variance, var

The variance. Use sample, not population.

    echo "1 2 4" | num variance
    2.33333

### population-variance, p-variance, p-var

The population variance.

    echo "1 2 4" | num population-variance
    1.55556

### sample-variance, s-variance, s-var

The sample variance.

    echo "1 2 4" | num sample-variance
    2.33333

Standard Deviation:

### standard-deviation, stdev, sd

The standard deviation (SD). Use sample, not population.

    echo "1 2 4" | num standard-deviation
    1.52753

### population-standard-deviation, p-stdev, p-sd

The population standard deviation.

    echo "1 2 4" | num population-standard-deviation
    1.24722

### sample-standard-deviation, s-stdev, s-sd

The sample standard deviation.

    echo "1 2 4" | num sample-standard-deviation
    1.52753


## Coefficient Of Variance

### coefficient-of-variance, covar, cv

The coefficient of variance (CV). Use sample, not population.


### population-coefficient-of-variance, p-covar, p-cv

The population coefficient of variance.


### sample-coefficient-of-variance, s-covar, s-cv

The sample coefficient of variance.


## Skewness

### skewness, skew

The skewness, e.g. the lack of symmetry. Use sample, not population.


### population-skewness, p-skew

The population skewness, e.g. the lack of symmetry.

### sample-skewness, s-skew

The sample skewness, e.g. the lack of symmetry.


## Kurtosis

### kurtosis, kurt

The kurtosis, e.g. peakness or flatness. Use sample, not population.

### population-kurtosis, p-kurt

The population kurtosis, e.g. peakness or flatness.

### sample-kurtosis, s-kurt

The sample kurtosis, e.g. peakness or flatness.


## Second Moment About The Mean

### second-moment-about-the-mean, second-moment

The second moment about the mean, a.k.a. variance. Use sample, not population.

### population-second-moment-about-the-mean, p-second-moment

The population second moment about the mean, a.k.a. population variance.

### sample-second-moment-about-the-mean, s-second-moment

The sample second moment about the mean, a.k.a. sample variance.


## Third Moment About The Mean

### third-moment-about-the-mean, third-moment

The third moment about the mean, a.k.a. skewness. Use sample, not population.

### population-third-moment-about-the-mean, p-third-moment

The population third moment about the mean, a.k.a. population skewness.

### sample-third-moment-about-the-mean, s-third-moment

The sample third moment about the mean, a.k.a. sample skewness.


## Fourth Moment About The Mean

### fourth-moment-about-the-mean, fourth-moment

The fourth moment about the mean, a.k.a. kurtosis. Use sample, not population.

### population-fourth-moment-about-the-mean, p-fourth-moment

The population fourth moment about the mean, a.k.a. population kurtosis.

### sample-fourth-moment-about-the-mean, s-fourth-moment

The sample fourth moment about the mean, a.k.a. sample kurtosis.


## Quartiles

### interquartile-range, iqr, midspread, middle-fifty

The interquartile range, which is q3 - q1.

### quartile-0, q0

Quartile 0, a.k.a. minimum.

### quartile-1, q1

Quartile 1, a.k.a. lower quartile, 25th percentile.

### quartile-2, q2

Quartile 2, a.k.a. median, 50th percentile.

### quartile-3, q3

Quartile 3, a.k.a. upper quartile, 75th percentile.

### quartile-4, q4

Quartile 4, a.k.a. maximum.


## Transforms

### normalize

Normalize each value to be within 0-1.

### sort

Sort the items in ascending order.

### unique

Keep unique values; omit the rest. TODO.

### difference, diff

The difference between each number and the next number. TODO.


## Rounding

### round, integer

Convert to nearest integer.<br>

Examples: 1.9 => 2. -1.9 => -2.


### round-off, truncate

Convert to integer by omitting the fractional part.<br>

Examples: 1.9 => 1. -1.9 => -1.

### round-up, ceiling

Convert to integer by rounding up.<br>

Examples: 1.9 => 2. -1.9 => -1.

### round-down, floor

Convert to integer by rounding down.<br>

Examples: 1.9 => 1. -1.9 => -2.


## Mappings

### absolute-value, abs, magnitude

Convert to absolute value a.k.a. magnitude, positive numbers.

Examples: -1 => 1. 1 => 1.


## Queries

Queries return TRUE as 1, or FALSE as 0.

### is-unique

Is each item unique?


### is-ascending, is-asc

Is the data ascending, i.e. each next number is greater or equal?


### is-strictly-ascending, is-strict-asc

Is the data strictly ascending, i.e. each next number is greater?

### is-non-ascending, is-non-asc

Is the data non-ascending, i.e. some next number is lesser?

### is-descending, is-desc

Is the data descending, i.e. each next number is lesser or equal?

### is-strictly-descending, is-strict-desc

Is the data strictly descending, i.e. each next number is lesser?

### is-non-descending, is-non-desc

Is the data non-descending, i.e. some next number is greater?


<p><hr>
<nav>
* <b>[Prev Page: Examples: how to use Num for shell scripting](examples.md)</b>
* <b>[Next Page: Commands: how to use related command line tools and scripts](commands.md)</b>
</nav>
