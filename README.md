# Num: number utilties for mathematics

<b>[Num command website](http://www.numcommand.com)</b>

<b>[Kickstarter project](https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics)</b> -- please spread the word and donate $1.

Num is a command line tool that provides number utilities for mathematics and statistics.

Examples:

    $ echo "1 2 4" | num sum
    7

    $ echo "1 2 4" | num min max median mean
    1 4 2 2.33333

    $ echo "1 2 4" | num variance skewness kurtosis
    2.33333 1.11111 5.44444

Get started:

  * [Install: how to download and set up](doc/install.md)
  * [Examples: how to use Num for shell scripting](doc/examples.md)
  * [Functions: the complete list of all capabilities](doc/functions.md)
  * [Commands: how to use related command line tools and scripts](doc/commands.md)
  * [Comparisons: when to use Num vs. other tools, such as C, R, Python, etc.](doc/comparisons.md)
  * [FAQ: Frequently Asked Questions](doc/faq.md)

Project pages:

  * [Thanks: our coders, advisors, sponsors, donors, and helpers](doc/thanks.md)
  * [To do: plans and ideas for our future versions](doc/todo.md)
  * [Known issues](doc/known-issues.md)
  * [Programmer guide](doc/programmer-guide.md)
  * [Programmer library of awk functions](doc/programmer-library-of-awk-functions.md)


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
