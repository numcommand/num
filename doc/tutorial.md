# Tutorial

This tutorial will use this example file:

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


## Output

To output all numbers:

    $ cat data.txt | num all
    1 2 3 4 5 6 7 8 9

To change all numbers:

    $ cat data.txt | num increment all
    2 3 4 5 6 7 8 9 10


## Records

You can use records a.k.a. rows:

    $ num sum records data.txt
    6
    15
    24


## Separators

You can use a custom input field separator (FS) and input record separator (RS):

    $ echo "1,2,3;4,5,6;7,8,9" | num min max FS=',' RS=';'
    1 3
    4 5
    7 9

You can use a custom output field separator (OFS) and output record separator (ORS):

    $ echo "1 2 3\n4 5 6\n7 8 9" | num min max records OFS=',' ORS=';'
    1,3;4,6;7,9


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



## Real World Examples


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
