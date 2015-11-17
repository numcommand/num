# modes

The modes or UNDEF. TODO.

Unimodal:

    echo "1 2 2 3" | num modes
    2

Bimodal:

    echo "1 2 2 3 3" | num modes
    2 3

Nonmodal:

    echo "1 2 3" | num modes
    UNDEF
