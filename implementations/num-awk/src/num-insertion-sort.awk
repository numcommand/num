############################################################################
#
# num-insertion-sort.awk
#
###

###
#
# Insertion sort.
#
# This implementation is a slightly faster version that moves A[i]
# to its position in one go and only performs one assignment in the
# inner loop body.
#
# Thanks to https://en.wikipedia.org/wiki/Insertion_sort
#
###

function num_insertion_sort(A) {
    num_insertion_sort_slice(A, 1, num_arr_length(A))
}

function num_insertion_sort_slice(A, lo, hi,  i, j, x) {
    if (lo >= hi) return
    for (i = lo + 1; i <= hi; i++) {
        x = A[i]
        j = i
        while (j > lo && A[j-1] > x) {
            A[j] = A[j-1]
            j--
        }
        A[j] = x
    }
}
