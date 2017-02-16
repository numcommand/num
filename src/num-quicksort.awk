############################################################################
#
# num-quicksort.awk
#
##

function num_quicksort_awk_init() {
    NUM_QUICKSORT_INSERTION_SORT_THRESHOLD = 12
}

##
#
# Quicksort.
#
# Quicksort selects a pivot and divides the data into values above and
# below the pivot. Sorting then recurses on these sub-lists.
#
# From http://awk.info/?doc/quicksort.html
#
# TODO: research implementing the pivot by using Tukeys ninther,
# which is a median of medians, and may be a faster heuristic.
# See http://www.johndcook.com/blog/2009/06/23/tukey-median-ninther/
#
# TODO: research implementing the small size sort using Shell sort,
# which is similar to insertion sort yet better for typical data.
# See https://en.wikipedia.org/wiki/Shellsort
#
# TODO: research upgrading from single pivot to dual pivot.
# http://stackoverflow.com/questions/20917617/whats-the-difference-of-dual-pivot-quick-sort-and-quick-sort
# http://stackoverflow.com/questions/32001841/how-to-implement-dual-pivot-quicksort-in-python
# http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/tip/src/share/classes/java/util/DualPivotQuicksort.java
#
##

function num_quicksort(A) {
    num_quicksort_slice(A, 1, num_arr_length(A))
}

function num_quicksort_slice(A, lo, hi,   pivot_index) {
    if (lo >= hi) return
    if (hi - lo < NUM_QUICKSORT_INSERTION_SORT_THRESHOLD) {
        num_insertion_sort_slice(A, lo, hi)
        return
    }
    pivot_index = num_quicksort_pivot_index_via_median_of_three_sort_slice(A, lo, hi)
    pivot_index = num_partition_slice(A, lo, hi, pivot_index)
    num_quicksort_slice(A, lo, pivot_index - 1)
    num_quicksort_slice(A, pivot_index + 1, hi)
}

##
#
# Partition an array slice using a given pivot index.
#
# Return the new pivot index.
#
##

function num_partition_slice(A, lo, hi, pivot_index,  left, right, pivot_value, t) {
    if (lo >= hi) return lo
    left = lo
    right = hi
    pivot_value = A[pivot_index]
    num_arr_swap(A, left, pivot_index)
    while (left < right) {
        while (left <= hi && A[left] <= pivot_value) left++
        while (right >= lo && A[right] > pivot_value) right--
        if (left < right) num_arr_swap(A, left, right)
    }
    pivot_index = right
    num_arr_swap(A, lo, pivot_index)
    return pivot_index
}

##
#
# Choose a quicksort pivot index by using a random number.
# This is a naive implemenation and is here for benchmarking.
# Typically you will never need this function for real-world data.
#
##

function num_quicksort_pivot_index_via_rand(A, lo, hi) {
    return lo + int((hi - lo + 1) * rand())
}

##
#
# Choose a quicksort pivot index by using the "median of three" heuristic
# with a swap sort of the three items for efficiency on the next pivot.
#
# Compared to picking the pivot randomly, the median of three heuristic:
#
#   * Ensures that a common case of fully sorted data remains optimal.
#   * Is more difficult for an attacker to manipulate into the worst case.
#   * Is often faster than a PRNG, which is often relatively slow.
#
# The median of three looks at the first, middle and last elements of
# the array, and choose the median of those as the pivot.
#
# To get the "full effect" of the median of three, it is also important
# to sort those three items, not just use the median as the pivot --
# this does not affect what is chosen as the pivot in the current
# iteration, but can/will affect what is used as the pivot in the next
# recursive call, which helps to limit the bad behavior for a few
# initial orderings (one that turns out to be particularly bad in many
# cases is an array that is sorted, except for having the smallest
# element at the high end of the array (or largest element at the low
# end)).
#
# Thanks to http://stackoverflow.com/questions/7559608/median-of-three-values-strategy
#
# To calculate the midpoint, we prefer (lo+(hi−lo)/2) instead of the naive
# simpler ((hi+lo)/2) because the former does not risk integer overflow.
#
# Return the pivot index.
#
##

function num_quicksort_pivot_index_via_median_of_three_sort(A) {
    num_quicksort_pivot_index_via_median_of_three_sort_slice(A, 1, num_arr_length(A))
}

function num_quicksort_pivot_index_via_median_of_three_sort_slice(A, lo, hi,  mid) {
    if (lo == hi) return lo
    mid = lo + int((hi - lo) / 2)
    if (A[hi]  < A[lo])  num_arr_swap(A, lo, hi)
    if (A[mid] < A[lo])  num_arr_swap(A, mid, lo)
    if (A[hi]  < A[mid]) num_arr_swap(A, hi, mid)
    return mid
}
