# Helpers: commands that work well with Num

There are many commands that work with with Num; here are our favorites.


## awk

The `awk` command typically processes text, fields, records, and data.

Example to select column 2 then sum:

    $ awk '{print $2}' data.txt
    2
    5
    8

Run `man awk` to see options for scanning, processing, input, output, etc.


## cat

The `cat` command typically prints the contents of a file.

Example to print a file of data then sum:

    $ cat data.txt
    1 2 3
    4 5 6
    7 8 9

Run `man cat` to see options for line numbering, blank line squeezing, etc.


## seq (sequence)

Sequence: generate a sequence of numbers.

Example:

    $ seq 3
    1
    2
    3

Run `man seq` to see options for number separators, zero padding, etc.


## shuf (shuffle)

Shuffle a list, a.k.a. randomize the order of list items.

Example:

    $ seq 3 | shuf
    3
    1
    2

Run `man shuf` to see options for input range, sample number, head count, etc.


## sort

Sort the items.

Example:

    $ echo "3\n2\n1" | sort --numeric-sort
    1
    2
    3

Run `man sort` to see options for reverse, unique, field separator, etc.


## uniq (unique)

Unique: make the items unique by removing duplicates.

Example:

    $ echo "1\n1\n2\n2\n3\n3" | uniq
    1
    2
    3

Run `man unique` to see options for showing duplicates, skipping duplicates, ignoring fields, etc.


## wc (word count)

Word count: this typically counts lines, words, and characters.

Example:

    $ wc data.txt
    3 9 15

Run `man wc` to see options, and how to use languages other than English or character encodings other than ASCII.


## parallel

GNU parallel provides multi-core processing that spreads work among your CPU cores.

Example:

    $ cat data.txt | parallel --pipe num sum | num sum
    45


<p><hr>
<nav>
<ul>
<li><b>[Prev Page: Functions: the complete list of all capabilities](functions.md)</b></li>
<li><b>[Next Page: FAQ: Frequently Asked Questions](faq.md)</b></li>
</ul>
</nav>
