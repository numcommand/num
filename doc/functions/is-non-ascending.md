# is-non-ascending, is-non-asc

Is the data non-ascending, i.e. some next number is lesser?

    echo "1 2 3" | num is-non-ascending
    0

    echo "3 2 1" | num is-non-ascending
    1
