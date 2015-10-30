# Functions: the complete list of all capabilities


## Numbers Functions


#### all

All the items.

    echo "1 2 4" | num all
    1 2 4


#### first

The first item.

    echo "1 2 4" | num first
    1


#### last

The last item.

    echo "1 2 4" | num last
    4


#### n, count, length, size

The number of items.

    echo "1 2 4" | num n
    3


#### minimum, min

The minimum value.

    echo "1 2 4" | num minimum
    1


#### maximum, max

The maximum value.

    echo "1 2 4" | num maximum
    1

#### range, spread

The range, which is maximum - minimum.

    echo "1 2 4" | num range
    3


#### sum, total

The sum total of all the items.

    echo "1 2 4" | num sum
    7


#### product

The product all the items.

    echo "1 2 4" | num product
    8




## Mean


#### mean, average, avg

The arithmetic mean a.ka. average.

    echo "1 2 4" | num mean
    2.33333


#### mean-absolute-deviation, mad

The average distance between each value and the mean.

    echo "1 2 4" | num mean-absolute-deviation
    1.11111


#### meanest

The value that is closest numerically to the mean.

    echo "1 2 4" | num meanest
    2


#### trimean (TODO)

The trimean.
The advantage of using the trimean, instead of the mean, is the trimean is robust to outliers.
The trimean equals (quartile-1 + 2 * median + quartile-3) / 4.

    echo "1 2 4" | num trimean
    TODO





## Median


#### median, med

The median.

    echo "1 2 3 4" | num median
    2.5


#### median-low, med-low

The low median, i.e. lesser of two middle values.

    echo "1 2 3 4" | num median
    2


#### median-high, med-high

The high median, i.e. greater of two middle values.

    echo "1 2 3 4" | num median
    3




## Mode

#### mode

The mode, which may be multiple numbers or UNDEF. TODO.

    echo "1 2 2 3" | num mode
    2


#### mode-low

The least value of the mode values or UNDEF. TODO.

    echo "1 1 2 2 3 3" | num mode-low
    1


#### mode-high

The greatest value of the mode values or UNDEF. TODO.

    echo "1 1 2 2 3 3" | num mode-high
    3




## Sum Of


#### sum-of-squares, ss

The sum of squares, a.k.a. sum of each mean deviation to the power of 2.

    echo "1 2 4" | num sum-of-squares
    4.66667


#### sum-of-cubes

The sum of cubes, a.k.a. sum of each mean deviation to the power of 3.

    echo "1 2 4" | num sum-of-cubes
    2.22222


#### sum-of-quads

The sum of quads, a.k.a. sum of each mean deviation to the power of 4.

    echo "1 2 4" | num sum-of-quads
    10.8889




## Distributions

#### variance, var<br>sample-variance, s-variance, s-var<br>population-variance, p-variance, p-var

The variance.

    echo "1 2 4" | num variance
    2.33333


#### standard-deviation, stdev, sd<br>sample-standard-deviation, s-stdev, s-sd<br>population-standard-deviation, p-stdev, p-sd

The standard deviation (SD).

    echo "1 2 4" | num standard-deviation
    1.52753


#### coefficient-of-variance, covar, cv<br>sample-coefficient-of-variance, s-covar, s-cv<br>population-coefficient-of-variance, p-covar, p-cv

The coefficient of variance (CV).

    echo "1 2 4" | num coefficient-of-variance
    0.654654


#### skewness, skew<br>sample-skewness, s-skew<br>population-skewness, p-skew

The skewness, e.g. the lack of symmetry.

    echo "1 2 4" | num skewness
    1.11111


#### kurtosis, kurt<br>sample-kurtosis, s-kurt<br>population-kurtosis, p-kurt

The kurtosis, e.g. peakness or flatness.
Default uses sample, not population.

    echo "1 2 4" | num kurtosis
    5.44444


## Moments about the mean


#### second-moment-about-the-mean, second-moment<br>sample-second-moment-about-the-mean, s-second-moment<br>population-second-moment-about-the-mean, p-second-moment

The second moment about the mean. A.k.a. variance.

    echo "1 2 4" | num second-moment-about-the-mean
    2.33333


#### third-moment-about-the-mean, third-moment<br>sample-third-moment-about-the-mean, s-third-moment<br>population-third-moment-about-the-mean, p-third-moment

The third moment about the mean. A.k.a. skewness.

    echo "1 2 4" | num third-moment-about-the-mean
    1.11111


#### fourth-moment-about-the-mean, fourth-moment<br>sample-fourth-moment-about-the-mean, s-fourth-moment<br>population-fourth-moment-about-the-mean, p-fourth-moment

The fourth moment about the mean. A.k.a. kurtosis.

    echo "1 2 4" | num fourth-moment-about-the-mean
    5.44444


## Quartiles

Quartiles divide an ordered data set into four equal parts.

  * Q0 is the minimum.
  * Q1 is the "middle" value in the first half of the rank-ordered data set.
  * Q2 is the median value in the set.
  * Q3 is the "middle" value in the second half of the rank-ordered data set.
  * Q4 is the maximum.

Num uses a weighted average to calculate quartiles, because this is robust. For details please see https://en.wikipedia.org/wiki/Quartile and the "Method 3" description.


#### interquartile-range, iqr, midspread, middle-fifty

The interquartile range. This is calculated by using Q3 - Q1.

    echo "6 7 15 36 39 40 41 42 43 47 49" | interquartile-range
    22.5


#### quartile-0, q0

Quartile 0, a.k.a. minimum.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-0
    6


#### quartile-1, q1

Quartile 1, a.k.a. lower quartile, 25th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-1
    20.25


#### quartile-2, q2

Quartile 2, a.k.a. median, 50th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-2
    40


#### quartile-3, q3

Quartile 3, a.k.a. upper quartile, 75th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-3
    42.75


#### quartile-4, q4

Quartile 4, a.k.a. maximum.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-4
    49




## Transforms

Transforms change each item in the list. Transforms are sometimes knowns as "maps" or "iterators" in other languages.


#### normalize

Normalize each value to be within 0..1.

    echo "1 2 4" | num normalize all
    0 0.333333 1


#### sort

Sort the items in ascending order.

    echo "3 1 2" | num sort all
    1 2 3


#### unique

Keep unique values; omit the rest. TODO.

    echo "1 2 2 3 3 3" | num unique all
    1 2 3


#### difference, diff, interval

The difference between each number and the next number. TODO.

    echo "2 3 1 5" | num difference all
    1 -2 4


## Rounding


#### round, integer

Convert to nearest integer.<br>

    echo "-1.9 1.9" | num round all
    2 2


#### round-off, truncate

Convert to integer by omitting the fractional part.<br>

    echo "-1.9 1.9" | num round all
    -1 1


#### round-up, ceiling

Convert to integer by rounding up.<br>

    echo "-1.9 1.9" | num round all
    -1 2


#### round-down, floor

Convert to integer by rounding down.<br>

    echo "-1.9 1.9" | num round all
    -2 1




## Mappings


#### absolute-value, abs, magnitude

Convert to absolute value a.k.a. magnitude, positive numbers.

    echo "-1 1" | num absolute-value all
    1 1



## Queries

Queries return TRUE as 1, or FALSE as 0.


#### is-unique

Is each item unique?

    echo "1 2 3" | num is-unique
    1

    echo "2 2 2" | num is-unique
    0


#### is-ascending, is-asc

Is the data ascending, i.e. each next number is greater or equal?

    echo "1 2 3" | num is-ascending
    1

    echo "3 2 1" | num is-ascending
    0


#### is-strictly-ascending, is-strict-asc

Is the data strictly ascending, i.e. each next number is greater?

    echo "1 2 3" | num is-strictly-ascending
    1

    echo "3 2 1" | num is-strictly-ascending
    0


#### is-non-ascending, is-non-asc

Is the data non-ascending, i.e. some next number is lesser?

    echo "1 2 3" | num is-non-ascending
    0

    echo "3 2 1" | num is-non-ascending
    1


#### is-descending, is-desc

Is the data descending, i.e. each next number is lesser or equal?

    echo "3 2 1" | num is-descending
    1

    echo "1 2 3" | num is-descending
    0


#### is-strictly-descending, is-strict-desc

Is the data strictly descending, i.e. each next number is lesser?

    echo "3 2 1" | num is-strictly-descending
    1

    echo "1 2 3" | num is-strictly-descending
    0


#### is-non-descending, is-non-desc

Is the data non-descending, i.e. some next number is greater?

    echo "3 2 1" | num is-non-descending
    0

    echo "1 2 3" | num is-non-descending
    1


<p><hr>
<nav>
* <b>[Prev Page: Examples: how to use Num for shell scripting](examples.md)</b>
* <b>[Next Page: Commands: how to use related command line tools and scripts](commands.md)</b>
</nav>
