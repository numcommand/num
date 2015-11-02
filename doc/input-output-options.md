# Input/Output and options for running Num


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


## Command line options

Your command line options can use any mix of dashes and underscores such as:

    sum-of-squares
    sum_of_squares
    sumofsquares

You can use any capitialization, such as:

    sumofsquares
    SumOfSquares
    SUMOFSQUARES

The word "sample" can be abbreviated as "s" such as:

    sample-variance
    s-variance
    svar

The word "population" can be abbreviated as "p" such as:

    population-variance
    p-variance
    pvar

If a value is unknown, or not a number, then it will print as "?". TODO.

    $ echo "1 2 4" | num mode
    ?
