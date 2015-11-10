# interquartile-range, iqr, midspread, middle-fifty

The interquartile range. This is calculated by using Q3 - Q1.

    echo "6 7 15 36 39 40 41 42 43 47 49" | interquartile-range
    22.5

Note that Num quartile calculations for Q1 and Q3 use the proportional smoothing algorithm, rather than a median value algorithm or removal of values algorithm. The proportional smoothing algorithm is more stable, and more useful especially for ongoing streams of statitiscs.
