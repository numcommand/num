############################################################################
#
# num-argv.awk
#
##

##
#
# Parse words by iterating: when a word is recognized,
# move it from the inputs array to the outputs array.
#
# Example to parse ARGV:
#
#     parse_words(ARGV, global_word_argv, synonyms)
#
##

function num_argv_parse(inputs, outputs, synonyms,  i, imax, item, outputs_n) {
    split("", outputs)
    outputs_n = 0
    imax = length(inputs)
    for (i=1; i<=imax; i++) {
        item = tolower(inputs[i])
        gsub(/[-_]/, "", item)
        if (item in synonyms) {
            item = synonyms[item]
            delete inputs[i]
            outputs[++outputs_n] = item
        }
    }
}

##
#
# Parse the command line ARGV inputs to recognized word outputs.
#
##

function num_argv() {
    num_argv_parse(ARGV, global_word_argv, num_synonyms)
}
