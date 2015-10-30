############################################################################
#
# num-stack.awk
#
###

###
#
# Push one item on an array list.
#
# Example:
#
#     arr = 1 2
#     num_push(arr, 4)
#     => 4
#     => arr == 1 2 4
#
# Return the item for chainability.
#
function num_push(arr, item,  i) {
    i = length(arr) + 1
    arr[i] = item
    return item
}

###
#
# Pop one item from an array list.
#
# Example:
#
#     arr = 1 2 4
#     num_pop(arr)
#     => 4
#     => arr == 1 2
#
# Return the item.
#
function num_pop(arr,  item, i) {
    i = length(arr)
    item = arr[i]
    delete arr[i]
    return item
}
