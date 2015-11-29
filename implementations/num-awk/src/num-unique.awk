############################################################################
#
# num-unique.awk
#
##

##
#
# Is the list all unique items?
#
# Examples:
#
#    1 2 3 => TRUE
#    1 2 2 => FALSE
#
function num_is_unique_(num, num_, opts,  f, i, seen, flag) {
    f = "num_unique"
    if (!(f in num_)) {
        flag = TRUE
        split("", seen)
        for (i in num) {
            if (num[i] in seen) {
               flag = FALSE
               break
            } else {
              seen[num[i]] = TRUE
            }
        }
        num_[f] = flag
    }
    return num_[f]
}

function num_is_unique_init() {
    num_function_init(\
        "num_is_unique is_unique is_uniq", 0,
        "Is the list all unique items?",
        "https://en.wikipedia.org/wiki/Uniqueness_quantification")
}
