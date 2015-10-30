# Commands: how to use related command line tools and scripts

This page describes some related tools that are available on most Unix-like systems.

### The `cat` command

The `cat` command typically prints the contents of a file.

Example to print a file of data then sum:

    $ cat data.txt
    1 2 3
    4 5 6
    7 8 9

    $ cat data.txt | num sum
    55


### The `awk` command

The `awk` command typically processes text, fields, records, and data.

Example to select column 2 then sum:

    $ awk '{print $2}' data.txt
    2
    5
    8

    $ awk '{print $2}' data.txt | num sum
    15


### The `seq` command

Generate sequences of numbers.

Example:

    $ seq 3
    1
    2
    3

Example to sum:

    $ seq 3 | num sum
    6


### The `shuffle` command

Shuffle a list, a.k.a. randomize the order of list items.

Example:

    $ seq 3 | shuf
    3
    1
    2

Sample items from the list by using the `-n` flag:

    $ seq 10 | shuf -n 3
    7
    2
    5


### The `wc` command

Word count, which typically counts lines, words, and characters.

Example:

    $ wc data.txt
    3 9 15


<p><hr>
<nav>
<ul>
<li><b>[Prev Page: Functions: the complete list of all capabilities](functions.md)</b></li>
<li><b>[Next Page: Comparisons: when to use Num vs. other tools](comparisons.md)</b></li>
</ul>
</nav>
