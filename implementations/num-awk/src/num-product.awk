############################################################################
#
# num-product.awk
#
###

###
#
# Product.
#
# Example:
#
#     num_product(1 2 4) => 8
#
###

function num_product(arr,  x) {
    x = 1
    for (i in arr) x *= arr[i]
    return x
}

function num_product_(num, num_, opts,  f) {
    f = "num_product"
    if (!(f in num_)) num_[f] = num_product(num)
    return num_[f]
}

function num_product_init() {
    num_function_init("product", "Get the product.", "https://wikipedia.org/wiki/Product_(mathematics)")
}
