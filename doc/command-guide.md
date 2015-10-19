# Command guide for related Unix tools

### The `awk` command

Example to select a particular column:

    $ cat example.txt
    aa bb cc
    dd ee ff
    gg hh ii
    $ cat example.txt | awk '{print $2}'
    bb
    ee
    hh

### The `seq` command

Generate sequences of numbers.

Example:

    $ seq 3
    1
    2
    3

### The `shuffle` command

Shuffle a list, a.k.a. randomizing the order of list items.

Example:

    $ seq 3 | shuf
    3
    1
    2

### The `wc` command

Word count. Typically counts lines, words, and characters.

Example:

    $ echo "aa bb cc" | wc
    1 3 9
