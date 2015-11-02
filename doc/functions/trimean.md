#### trimean.

The trimean.

    echo "1 2 4" | num trimean
    8.875

The advantage of using the trimean vs. the mean: the trimean is robust to outliers.
The trimean equals (quartile-1 + 2 * median + quartile-3) / 4.
