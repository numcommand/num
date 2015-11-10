# quartile-3, q3

Quartile 3, a.k.a. upper quartile, 75th percentile.

    echo "6 7 15 36 39 40 41 42 43 47 49" | quartile-3
    42.75

Note that Num quartile calculations for Q1 and Q3 use the proportional smoothing algorithm, rather than a median value algorithm or removal of values algorithm. The proportional smoothing algorithm is more stable, and more useful especially for ongoing streams of statitiscs.
