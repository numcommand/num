############################################################################
#
# num-map.awk
#
# Map helpers.
#
# Call `map_before` to remember the number of items.
#
# Call `map_after` to invalidate all metadata then
# restore the number of items.
#
###

function map_before_(num, num_, opts, memo) {
    memo["n"] = num_["n"]
}

function map_after_(num, num_, opts, memo) {
    split("",num_)
    num_["n"] = memo["n"]
}
