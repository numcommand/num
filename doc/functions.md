# Functions: the complete list of all capabilities


## Numbers Functions

<dl>

<dt>
all
</dt>
<dd>

All the items.

<pre><code>
echo "1 2 4" | num all
1 2 4
</code></pre>

</dd>

<dt>
first
</dt>
<dd>

The first item.

    echo "1 2 4" | num first
    1

</dd>

<dt>
last
</dt>
<dd>

The last item.

    echo "1 2 4" | num last
    4

</dd>

<dt>
n, count, length, size
</dt>
<dd>

The number of items.

    echo "1 2 4" | num n
    3

</dd>

<dt>
minimum, min
</dt>
<dd>

The minimum value.

    echo "1 2 4" | num minimum
    1

</dd>

<dt>
maximum, max
</dt>
<dd>

The maximum value.

    echo "1 2 4" | num maximum
    1

<dt>
range, spread
</dt>
<dd>

The range, which is maximum - minimum.

    echo "1 2 4" | num range
    3

</dd>

<dt>
sum, total
</dt>
<dd>

The sum total of all the items.

    echo "1 2 4" | num sum
    7

</dd>

<dt>
product
</dt>
<dd>

The product all the items.

    echo "1 2 4" | num product
    8

</dd>

</dl>


## Mean

<dl>

<dt>
mean, average, avg
</dt>
<dd>

The arithmetic mean a.ka. average.

    echo "1 2 4" | num mean
    2.33333

</dd>

<dt>
mean-absolute-deviation, mad
</dt>
<dd>

The average distance between each value and the mean.

    echo "1 2 4" | num mean-absolute-deviation
    1.11111

</dd>

<dt>
meanest
</dt>
<dd>

The value that is closest numerically to the mean.

    echo "1 2 4" | num meanest
    2

</dd>

<dt>
trimean (TODO)
</dt>
<dd>

The trimean.
The advantage of using the trimean, instead of the mean, is the trimean is robust to outliers.
The trimean equals (quartile-1 + 2 * median + quartile-3) / 4.

    echo "1 2 4" | num trimean
    TODO


</dd>

</dl>


## Median

<dl>

<dt>
median, med
</dt>
<dd>

The median.

    echo "1 2 3 4" | num median
    2.5

</dd>

<dt>
median-low, med-low
</dt>
<dd>

The low median, i.e. lesser of two middle values.

    echo "1 2 3 4" | num median
    2

</dd>

<dt>
median-high, med-high
</dt>
<dd>

The high median, i.e. greater of two middle values.

    echo "1 2 3 4" | num median
    3

</dd>

</dl>


## Mode

<dl>
<dt>
mode
</dt>
<dd>

The mode, which may be multiple numbers or UNDEF. TODO.

    echo "1 2 2 3" | num mode
    2

</dd>

<dt>
mode-low
</dt>
<dd>

The least value of the mode values or UNDEF. TODO.

    echo "1 1 2 2 3 3" | num mode-low
    1

</dd>

<dt>
mode-high
</dt>
<dd>

The greatest value of the mode values or UNDEF. TODO.

    echo "1 1 2 2 3 3" | num mode-high
    3

</dd>

</dl>


## Sum Of

<dl>

<dt>
sum-of-squares, ss
</dt>
<dd>

The sum of squares, a.k.a. sum of each mean deviation to the power of 2.

    echo "1 2 4" | num sum-of-squares
    4.66667

</dd>

<dt>
sum-of-cubes
</dt>
<dd>

The sum of cubes, a.k.a. sum of each mean deviation to the power of 3.

    echo "1 2 4" | num sum-of-cubes
    2.22222

</dd>

<dt>
sum-of-quads
</dt>
<dd>

The sum of quads, a.k.a. sum of each mean deviation to the power of 4.

    echo "1 2 4" | num sum-of-quads
    10.8889

</dd>

</dl>


## Distributions

<dt>
variance, var
<br>sample-variance, s-variance, s-var
<br>population-variance, p-variance, p-var
</dt>
<dd>

The variance.

    echo "1 2 4" | num variance
    2.33333

</dd>

<dt>
standard-deviation, stdev, sd
<br>sample-standard-deviation, s-stdev, s-sd
<br>population-standard-deviation, p-stdev, p-sd
</dt>
<dd>

The standard deviation (SD).

    echo "1 2 4" | num standard-deviation
    1.52753

</dd>

<dt>
coefficient-of-variance, covar, cv
<br>sample-coefficient-of-variance, s-covar, s-cv
<br>population-coefficient-of-variance, p-covar, p-cv
</dt>
<dd>

The coefficient of variance (CV).

    echo "1 2 4" | num coefficient-of-variance
    0.654654

</dd>

<dt>
skewness, skew
<br>sample-skewness, s-skew
<br>population-skewness, p-skew
</dt>
<dd>

The skewness, e.g. the lack of symmetry.

    echo "1 2 4" | num skewness
    1.11111

</dd>

<dt>
kurtosis, kurt
<br>sample-kurtosis, s-kurt
<br>population-kurtosis, p-kurt
</dt>
<dd>

The kurtosis, e.g. peakness or flatness.
Default uses sample, not population.

    echo "1 2 4" | num kurtosis
    5.44444

</dd>

</dl>


## Moments about the mean

<dl>

<dt>
second-moment-about-the-mean, second-moment
<br>sample-second-moment-about-the-mean, s-second-moment
<br>population-second-moment-about-the-mean, p-second-moment
</dt>
<dd>

The second moment about the mean. A.k.a. variance.

    echo "1 2 4" | num second-moment-about-the-mean
    2.33333

</dd>

<dt>
third-moment-about-the-mean, third-moment
<br>sample-third-moment-about-the-mean, s-third-moment
<br>population-third-moment-about-the-mean, p-third-moment
</dt>
<dd>

The third moment about the mean. A.k.a. skewness.

    echo "1 2 4" | num third-moment-about-the-mean
    1.11111

</dd>

<dt>
fourth-moment-about-the-mean, fourth-moment
<br>sample-fourth-moment-about-the-mean, s-fourth-moment
<br>population-fourth-moment-about-the-mean, p-fourth-moment
</dt>
<dd>

The fourth moment about the mean. A.k.a. kurtosis.

    echo "1 2 4" | num fourth-moment-about-the-mean
    5.44444

</dd>

</dl>


## Quartiles

Quartiles divide an ordered data set into four equal parts.

  * Q0 is the minimum.
  * Q1 is the "middle" value in the first half of the rank-ordered data set.
  * Q2 is the median value in the set.
  * Q3 is the "middle" value in the second half of the rank-ordered data set.
  * Q4 is the maximum.

Num uses a weighted average to calculate quartiles, because this is robust. For details please see https://en.wikipedia.org/wiki/Quartile and the "Method 3" description.

<dl>

<dt>
interquartile-range, iqr, midspread, middle-fifty
</dt>
<dd>

The interquartile range. This is calculated by using Q3 - Q1.

    echo "6 7 15 36 39 40 41 42 43 47 49" | interquartile-range
    22.5

</dd>

<dt>
quartile-0, q0
</dt>
<dd>

Quartile 0, a.k.a. minimum.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-0
    6

</dd>

<dt>
quartile-1, q1
</dt>
<dd>

Quartile 1, a.k.a. lower quartile, 25th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-1
    20.25

</dd>

<dt>quartile-2, q2
</dt>
<dd>

Quartile 2, a.k.a. median, 50th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-2
    40

</dd>

<dt>quartile-3, q3
</dt>
<dd>

Quartile 3, a.k.a. upper quartile, 75th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-3
    42.75

<dt>quartile-4, q4
</dt>
<dd>

Quartile 4, a.k.a. maximum.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-4
    49

</dd>

</dl>


## Transforms

Transforms change each item in the list. Transforms are sometimes knowns as "maps" or "iterators" in other languages.

<dl>

<dt>
normalize
</dt>
<dd>

Normalize each value to be within 0..1.

    echo "1 2 4" | num normalize all
    0 0.333333 1

</dd>


<dt>
sort
</dt>
<dd>

Sort the items in ascending order.

    echo "3 1 2" | num sort all
    1 2 3

</dd>

<dt>
unique
</dt>
<dd>

Keep unique values; omit the rest. TODO.

    echo "1 2 2 3 3 3" | num unique all
    1 2 3

</dd>

<dt>
difference, diff, interval
</dt>
<dd>

The difference between each number and the next number. TODO.

    echo "2 3 1 5" | num difference all
    1 -2 4

</dd>

</dl>


## Rounding

<dt>
round, integer
</dt>
<dd>

Convert to nearest integer.<br>

    echo "-1.9 1.9" | num round all
    2 2

</dd>

<dt>round-off, truncate
</dt>
<dd>

Convert to integer by omitting the fractional part.<br>

    echo "-1.9 1.9" | num round all
    -1 1

</dd>

<dt>round-up, ceiling
</dt>
<dd>

Convert to integer by rounding up.<br>

    echo "-1.9 1.9" | num round all
    -1 2

</dd>

<dt>round-down, floor
</dt>
<dd>

Convert to integer by rounding down.<br>

    echo "-1.9 1.9" | num round all
    -2 1

</dd>

</dl>


## Mappings

<dl>

<dt>
absolute-value, abs, magnitude
</dt>
<dd>

Convert to absolute value a.k.a. magnitude, positive numbers.

    echo "-1 1" | num absolute-value all
    1 1

</dd>

</dl>

## Queries

Queries return TRUE as 1, or FALSE as 0.

<dl>

<dt>
is-unique
</dt>
<dd>

Is each item unique?

    echo "1 2 3" | num is-unique
    1

    echo "2 2 2" | num is-unique
    0

</dd>

<dt>
is-ascending, is-asc
</dt>
<dd>

Is the data ascending, i.e. each next number is greater or equal?

    echo "1 2 3" | num is-ascending
    1

    echo "3 2 1" | num is-ascending
    0

</dd>

<dt>
is-strictly-ascending, is-strict-asc
</dt>
<dd>

Is the data strictly ascending, i.e. each next number is greater?

    echo "1 2 3" | num is-strictly-ascending
    1

    echo "3 2 1" | num is-strictly-ascending
    0

</dd>

<dt>
is-non-ascending, is-non-asc
</dt>
<dd>

Is the data non-ascending, i.e. some next number is lesser?

    echo "1 2 3" | num is-non-ascending
    0

    echo "3 2 1" | num is-non-ascending
    1


<dt>
is-descending, is-desc
</dt>
<dd>

Is the data descending, i.e. each next number is lesser or equal?

    echo "3 2 1" | num is-descending
    1

    echo "1 2 3" | num is-descending
    0

</dd>

<dt>
is-strictly-descending, is-strict-desc
</dt>
<dd>

Is the data strictly descending, i.e. each next number is lesser?

    echo "3 2 1" | num is-strictly-descending
    1

    echo "1 2 3" | num is-strictly-descending
    0

</dd>

<dt>
is-non-descending, is-non-desc
</dt>
<dd>

Is the data non-descending, i.e. some next number is greater?

    echo "3 2 1" | num is-non-descending
    0

    echo "1 2 3" | num is-non-descending
    1

</dd>

</dt>


<p><hr>
<nav>
* <b>[Prev Page: Examples: how to use Num for shell scripting](examples.md)</b>
* <b>[Next Page: Commands: how to use related command line tools and scripts](commands.md)</b>
</nav>
