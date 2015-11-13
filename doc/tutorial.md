# Tutorial

## Quick start

Tell Num what you want to calculate and an input file:

    $ num sum data.txt
    45

You can pipe data:

    $ echo "1 2 3 4 5 6 7 8 9" | num sum
    45

You can use AWK variables:

    $ AWK="/bin/mawk" FS="," OFS="," OFMT="%.0f" num records data.csv > rounded.csv


See the complete list of [functions](functions.md).

## Example data

The rest of this tutorial will use this example data file:

    $ cat data.txt
    1 2 3
    4 5 6
    7 8 9


## Input

You can use standard input:

    $ cat data.txt | num sum
    45

You can use files:

    $ num sum data.txt
    45


You can use records a.k.a. rows:

    $ num sum records data.txt
    6
    15
    24


You can use a custom input field separator (FS) and input record separator (RS):

    $ echo "1,2,3;4,5,6;7,8,9" | num min max FS=',' RS=';'
    1 3
    4 5
    7 9


## Output

You can use a custom output field separator (OFS) and output record separator (ORS).

    $ echo "1 2 3\n4 5 6\n7 8 9" | num min max records OFS=',' ORS=';'
    1,3;4,6;7,9


You can use a custom output format (OFMT):

    $ OFMT="%.4f" num sum data.txt
    45.0000


## Command line options

Num has many command line options.

You can use dashes, underscores, or not:

    sum-of-squares
    sum_of_squares
    sumofsquares

You can use any capitialization such as:

    sumofsquares
    SumOfSquares
    SUMOFSQUARES

You can use full words or abbreviations such as:

    standarddeviation
    stddev
    sd

The word "sample" can be abbreviated "s":

    samplevariance
    svar

The word "population" can be abbreviated "p":

    populationvariance
    pvar

The words "coefficient of" can be abbreviated "co":

    coefficientofvariance
    covar


## Command line awk options

Num uses the `awk` language, which comes in several flavors.

  * On modern Linux systems, the `awk` language is provided by the GNU awk command a.k.a. `gawk`.

  * On modern OS X systems, the `awk` language is provided by the BSD awk command. However, the implementation is older and doesn't work for Num. The solution is to install `gawk`. The typicall way to install is by running `brew install gawk`.

  * On other modern POSIX-compliant systems, you may need to download `gawk` from the [GNU website](http://gnu.org) and compile it for your systems.

If you want to explicity tell Num which `awk` command to use, then you can provide a custom path by setting the `AWK` environment variable like this:

    AWK=/example/awk num ...



## AWK implementations

Num chooses which awk implementation to use by using this order of importance:

  * ENV var, for example: AWK="/example/awk" num ...
    This way gives the user complete control of which awk to use.

  * GNU awk a.k.a. `gawk`. Available on all modern GNU Linux systems.
    GNU awk provides more than POSIX, such as `asort()` and `length()`.
    Note that Ubuntu Linux preinstalls `mawk` not `gawk`.

  * Default awk. This is the most common awk, especially on old systems,
    as well on curent Mac OSX systems and similar kinds of BSD systems.
    The default awk is typically inferior to newer awk implementations.
    The default awk is defined by POSIX and therefore has to exist on
    all POSIX-conformant systems.

TODO:

  * mawk. Standard on Ubuntu and people say it's up to 8x faster.
    We're currently working on mawk compatibility, and we believe
    everything works except for sorting functions, such as median.
    The short-term workaround is to pipe to `sort` before `num`.

  * nawk - while the AWK language was being developed the authors
    released a new version (hence the n - new awk) to avoid confusion.


## Real World Examples


###  How to select lines

Select the first 10 lines:

    head -10

Select the last 10 lines:

    tail -10

Select lines starting with line 10 onward:

    tail +2

Delete line 1:

    sed '1d'

Select lines that have digits:

    grep '[0-9]'

Delete lines that have a negative sign:

    grep -v '-'

Select field 3 delimited by a space:

    cut -f 3 -d ' '

Select field 3 delimited by spaces and tabs:

    awk '{print $3}'

Select lines between X inclusive and Y inclusive:

    sed -n '/x/,/y/p'


### How much data is in a directory?

We list the current directory's files,
then choose the size column, then calculate:

    $ ls -l | awk '{print $5}' | num min max mean
    265 38684 2378.23


### How busy is the computer?

We print the current system processes,
then choose the CPU column, then calculate:

    $ ps aux | awk '{print $3}' | num min max mean
    0.0 100.1 0.513028


### How wet is the weather in New York City?

We download weather data for two days then parse humidities.

    $ curl http://w1.weather.gov/data/obhistory/KNYC.html |
    tr ">" "\n" | sed -n 's/^\([0-9]\+\)%.*/\1/p' |
    num min max mean
    32 84 58.4167


### How much is an apartment in San Francisco?

We connect to the Craigslist website then parse prices.

    $ curl -s http://sfbay.craigslist.org/search/apa |
    tr ">" "\n" | sed -n 's/^\$\([0-9]\+\).*/\1/p' |
    num mean
    2974.47


<p><hr><nav>
* <b>[Prev Page: Install](install.md)</b>
* <b>[Next Page: Functions](functions.md)</b>
</nav>
