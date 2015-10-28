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
#     enqueue(arr, 4)
#     => 4
#     => arr == 1 2 4
#
# Return the item for chainability.
#
function enqueue(arr, item,  i) {
    i = length(arr) + 1
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
#     dequeue(arr)
#     => 1
#     => arr == 2 4
#
# Return the item.
#
function dequeue(arr,  item, i) {
    return shift(arr)
}
