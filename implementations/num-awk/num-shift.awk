############################################################################
#
# num-shift.awk
#
###

###
#
# Shift one item from the head of a list.
#
# Example:
#
#     arr = 1 2 4
#     shift(arr, 4)
#     => 4
#     => arr == 1 2
#
# Return the item.
#
function shift(arr,  item, i) {
    len = length(arr)
    item = arr[1]
    for (i = 1; i < len; i++) arr[i] = arr[i+1]
    delete arr[len]
    return item
}

###
#
# Unshift one item onto the head of a list.
#
# Example:
#
#     arr = 1 2
#     unshift(arr, 4)
#     => 4
#     => arr == 4 1 2
#
# Return the item for chainability.
#
function unshift(arr,item,  i) {
    len = length(arr)
    for (i = 1; i < len; i++) arr[i+1] = arr[i]
    arr[1] = item
    return item
}
