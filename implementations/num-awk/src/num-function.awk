############################################################################
#
# num-function.awk
#
##

##
#
# Initialize function metadata for a given function.
#
# Example:
#
#    function hello() {
#        print "hello world"
#    }
#
#    function hello_init() {
#        num_function_init("hello hi hola", "Print a greeting", "http://example.com/hello.html")
#    }
#
# The example creates these:
#
#    num_functions["hello", "names"] = "hello hi hola"
#    num_functions["hello", "help"] = "Print a greeting"
#    num_functions["hello", "link"] = "http://example.com/hello.html"
#    num_synonyms["hello"] = "hello"
#    num_synonyms["hi"] = "hello"
#    num_synonyms["hola"] = "hello"
#
##

function num_function_init(names, help, link,  f, i, name, name_list) {
    split(names, names_arr)
    f = names_arr[1]
    num_functions[f, "names"] = names
    num_functions[f, "help"] = help
    num_functions[f, "link"] = link
    for (i in names_arr) {
        name = names_arr[i]
        gsub(/_/,"", name)
        num_synonyms[name] = f
    }
}
