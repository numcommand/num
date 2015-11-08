# Benchmarks

Num calculates at a speed of approximately one million numbers per second using a typical Mac laptop.


## How we benchmark

Generate a million random numbers and write them to a file:

    hexdump -n 4000000 -v -e '1/4 "%u\n"' /dev/urandom > data

Time the Num command:

    time ( num sum data )
    ... 0.788 total

Time the Num command with more statistics:

    time ( num sum mean variance standarddeviation data )
    ... 0.964 total

Your actual speed may vary. Num speed depends on many factors, such as which `awk` implemenation is in use, which computer you choose to use, which statitics you choose to calculate, which other software you're running simultaneously, etc.


## Comparisons

Comparisons of similar solutions using `awk`, `gawk`, `mawk`, and `perl`.

    time ( awk '{ x += $1 }' data )
    ... 1.050 total

    time ( gawk '{ x += $1 }' data )
    ... 0.396 total

    time ( mawk '{ x += $1 }' data )
    ... 0.195 total

    time ( perl -ne '$x += $_' data)
    ... 0.200 total

Summary:

  * mawk is .2

  * gawk is .4

  * awk is 1.0

Details:

  * This is using Apple OS X 10.10.5 on a typical MacBook Pro laptop.

  * The `awk` command is the OS X default one: OS X 10.10 `awk` version 20070501.

  * The `gawk` and `mawk` commands are installed by using `brew`.

Caveats:

* For statistics that use ranking, such as median and trimean, Num is approximately the same speed as the awk implementation.

* For statistics that do not use ranking, such as sum or mean, then Num is approximately 2x-time as the awk implementation. This is primarliy because Num stores all the numbers in an array, whereas awk code doesn't store the numbers. We plan to optimize this for Num 2.0.
