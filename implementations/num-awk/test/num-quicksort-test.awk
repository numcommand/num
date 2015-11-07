function num_quicksort_pivot_index_via_median_of_three_sort_test(  expect, actual, min, med, max) {
    min = 2
    med = 4
    max = 6
    split(min " " med " " max, expect)
    split(max " " min " " med, actual)
    num_quicksort_pivot_index_via_median_of_three_sort(actual)
    assert_arr_eq(expect, actual, "num_quicksort_pivot_index_via_median_of_three_sort")
}

function num_quicksort_pivot_index_via_median_of_three_sort_slice_test(  expect, actual, min, med, max, chaff) {
    min = 2
    med = 4
    max = 6
    chaff = " 1 1 1 "
    split(chaff min " " med " " max chaff, expect)
    split(chaff max " " min " " med chaff, actual)
    num_quicksort_pivot_index_via_median_of_three_sort_slice(actual, 4, 6)
    assert_arr_eq(expect, actual, "num_quicksort_pivot_index_via_median_of_three_sort_slice")
}

function num_partition_slice_test(  expect, actual, min, med, max, lo, hi, pivot_index) {
    lo = 1
    hi = 5
    pivot_index = 3
    split("1 1 2 3 3", expect)
    split("3 3 2 1 1", actual)
    num_partition_slice(actual, lo, hi, pivot_index)
    assert_arr_eq(expect, actual, "num_partition_slice")
}

function num_quicksort_test(  expect, actual) {
    split("1 1 2 3 4 5 6 9", expect)
    split("3 1 4 1 5 9 2 6", actual)
    num_quicksort(actual)
    assert_arr_eq(expect, actual, "num_quicksort")
}

BEGIN {
    assert_init()
    num_quicksort_pivot_index_via_median_of_three_sort_test()
    num_quicksort_pivot_index_via_median_of_three_sort_slice_test()
    num_partition_slice_test()
    num_quicksort_test()
    exit
}
