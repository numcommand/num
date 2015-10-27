############################################################################
#
# STACK
#
###

###
#
# Push one item on an array list.
#
# Example:
#
#     arr = 1 2
#     push(arr, 4)
#     => 4
#     => arr == 1 2 4
#
# Return the item for chainability.
#
function push(arr, item,  index) {
    index = length(arr) + 1
    arr[index] = item
    return item
}

###
#
# Pop one item from an array list.
#
# Example:
#
#     arr = 1 2 4
#     pop(arr)
#     => 4
#     => arr == 1 2
#
# Return the item.
#
function pop(arr,  item, index) {
    index = length(arr)
    item = arr[index]
    delete arr[index]
    return item
}
