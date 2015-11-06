############################################################################
#
# num-queue.awk
#
###

###
#
# Enqueue one item to an array queue.
#
# Example:
#
#     arr = 1 2
#     num_enqueue(arr, 4)
#     => 4
#     => arr == 1 2 4
#
# Return the item for chainability.
#
function num_enqueue(arr, item,  i) {
    i = num_arr_length(arr) + 1
    arr[i] = item
    return item
}

###
#
# Dequeue one item from an array queue.
#
# Example:
#
#     arr = 1 2 4
#     num_dequeue(arr)
#     => 1
#     => arr == 2 4
#
# Return the item.
#
function num_dequeue(arr,  item, i) {
    return num_shift(arr)
}
