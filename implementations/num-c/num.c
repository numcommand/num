#include "num.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char* argv[]) {
    num_input_t input;
    num_input_t input_sorted;


    read_input(&input);

    // TODO better argument parsing and implement more functions

    int do_sorted = 0;
    for(int i = 0; i < argc; i++) {
        if(strcmp("median", argv[i]) == 0 || strcmp("med", argv[i]) == 0 ||
           strcmp("median-low", argv[i]) == 0 || strcmp("med-low", argv[i]) == 0 ||
           strcmp("medianlow", argv[i]) == 0 || strcmp("medlow", argv[i]) == 0 ||
           strcmp("median-high", argv[i]) == 0 || strcmp("med-high", argv[i]) == 0 ||
           strcmp("medianhigh", argv[i]) == 0 || strcmp("medhigh", argv[i]) == 0) {
            do_sorted = 1;
        }
    }

    median_t med;
    if(do_sorted) {
        input_sorted.count = input.count;
        input_sorted.max = input.count;
        input_sorted.data = (num_t*)malloc(sizeof(num_t)*input_sorted.count);
        memcpy(input_sorted.data, input.data, sizeof(num_t)*input.count);

        qsort(input_sorted.data, input_sorted.count, sizeof(num_t), num_t_cmpfunc);

        med = median(&input_sorted);
    }

    for(int i = 0; i < argc; i++) {
        if(i > 1) {
            printf(" ");
        }
        if(strcmp("mean", argv[i]) == 0 || strcmp("average", argv[i]) == 0 || strcmp("avg", argv[i]) == 0) {
            printf("%g", mean(&input));
        } else if(strcmp("sum", argv[i]) == 0 || strcmp("total", argv[i]) == 0) {
            printf("%g", sum(&input));
        } else if(strcmp("first", argv[i]) == 0) {
            printf("%g", first(&input));
        } else if(strcmp("last", argv[i]) == 0) {
            printf("%g", last(&input));
        } else if(strcmp("n", argv[i]) == 0 || strcmp("count", argv[i]) == 0 || strcmp("length", argv[i]) == 0) {
            printf("%g", n(&input));
        } else if(strcmp("min", argv[i]) == 0 || strcmp("minimum", argv[i]) == 0) {
            printf("%g", min(&input));
        } else if(strcmp("max", argv[i]) == 0 || strcmp("maximum", argv[i]) == 0) {
            printf("%g", max(&input));
        } else if(strcmp("range", argv[i]) == 0 || strcmp("spread", argv[i]) == 0) {
            printf("%g", range(&input));
        } else if(strcmp("median", argv[i]) == 0 || strcmp("med", argv[i]) == 0) {
            printf("%g", med.median);
        } else if(strcmp("median-low", argv[i]) == 0 || strcmp("med-low", argv[i]) == 0 ||
                  strcmp("medianlow", argv[i]) == 0 || strcmp("medlow", argv[i]) == 0) {
            printf("%g", med.median_low);
        } else if(strcmp("median-high", argv[i]) == 0 || strcmp("med-high", argv[i]) == 0 ||
                  strcmp("medianhigh", argv[i]) == 0 || strcmp("medhigh", argv[i]) == 0) {
            printf("%g", med.median_high);
        }
    }
    printf("\n");

    return 0;
}

median_t median(num_input_t* input_sorted) {
    median_t med;

    if(input_sorted->count % 2) {
        med.median = med.median_high = med.median_low = input_sorted->data[(input_sorted->count-1)/2];
    } else {
        med.median_low = input_sorted->data[input_sorted->count/2-1];
        med.median_high = input_sorted->data[input_sorted->count/2];
        med.median = (med.median_low+med.median_high)/2;
    }

    return med;
}

int num_t_cmpfunc(const void *a, const void *b) {
    return ( *(num_t*)a - *(num_t*)b );
}

num_t first(num_input_t* input) {
    return input->data[0];
}

num_t last(num_input_t* input) {
    return input->data[input->count-1];
}

num_t n(num_input_t* input) {
    return input->count;
}

num_t min(num_input_t* input) {
    num_t m = input->data[0];
    for(count_t i = 1; i < input->count; i++) {
        if(input->data[i] < m) {
            m = input->data[i];
        }
    }

    return m;
}

num_t max(num_input_t* input) {
    num_t m = input->data[0];
    for(count_t i = 1; i < input->count; i++) {
        if(input->data[i] > m) {
            m = input->data[i];
        }
    }

    return m;
}

num_t range(num_input_t* input) {
    num_t ma = input->data[0];
    num_t mi = input->data[0];
    for(count_t i = 1; i < input->count; i++) {
        if(input->data[i] > ma) {
            ma = input->data[i];
        }
        if(input->data[i] < mi) {
            mi = input->data[i];
        }
    }

    return ma-mi;
}

num_t mean(num_input_t* input) {
    return sum(input)/input->count;
}

num_t sum(num_input_t* input) {
    num_t s = 0;
    for(count_t i = 0; i < input->count; i++) {
        s += input->data[i];
    }
    return s;
}

void read_input(num_input_t* input) {
    count_t count = 0;
    count_t max = 100;
    num_t *data = (num_t*)malloc(sizeof(num_t)*max);

    num_t n;
    while(scanf(NUMT_SCANF, &n) != EOF) {
        data[count++] = n;
        if(max == count) {
            max = 2*max;
            data = (num_t*)realloc(data, sizeof(num_t)*max);
        }
    }

    input->count = count;
    input->max = max;
    input->data = data;
}
