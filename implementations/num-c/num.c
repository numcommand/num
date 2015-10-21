#include "num.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

int main(int argc, char* argv[]) {
    num_input_t input;
    num_input_t input_sorted;


    num_read_input(&input);

    // TODO better argument parsing and implement more functions

    int do_sorted = 0;
    int do_median = 0;
    int do_mode = 0;
    for(int i = 0; i < argc; i++) {
        if(strcmp("median", argv[i]) == 0 || strcmp("med", argv[i]) == 0 ||
           strcmp("median-low", argv[i]) == 0 || strcmp("med-low", argv[i]) == 0 ||
           strcmp("medianlow", argv[i]) == 0 || strcmp("medlow", argv[i]) == 0 ||
           strcmp("median-high", argv[i]) == 0 || strcmp("med-high", argv[i]) == 0 ||
           strcmp("medianhigh", argv[i]) == 0 || strcmp("medhigh", argv[i]) == 0) {
            do_sorted = 1;
            do_median = 1;
        }

        if(strcmp("mode", argv[i]) == 0 || 
           strcmp("mode-low", argv[i]) == 0 || 
           strcmp("mode-high", argv[i]) == 0 ||
           strcmp("modelow", argv[i]) == 0 ||
           strcmp("modehigh", argv[i]) == 0) {
            do_sorted = 1;
            do_mode = 1;
        }
    }

    num_median_t med;
    num_mode_t mode;
    if(do_sorted) {
        input_sorted.count = input.count;
        input_sorted.max = input.count;
        input_sorted.data = (num_t*)malloc(sizeof(num_t)*input_sorted.count);
        memcpy(input_sorted.data, input.data, sizeof(num_t)*input.count);

        qsort(input_sorted.data, input_sorted.count, sizeof(num_t), num_t_cmpfunc);
    }

    if(do_mode) {
        mode = num_mode(&input_sorted);

      /* 
      // Debug mode results
        for(int i = 0; i < mode.count; i++) {
            if(i > 0) {
                printf(" ");
            }
            printf("%g", mode.modes[i]);
        }
        printf("\n");
        printf("%d modes\n", mode.count);
        printf("%d unique elements\n", mode.unique);
        printf("%d mode elements\n", mode.n);
        */
    }
    if(do_median) {
        med = num_median(&input_sorted);
    }

    for(int i = 0; i < argc; i++) {
        if(i > 1) {
            printf(" ");
        }
        if(strcmp("mean", argv[i]) == 0 || strcmp("average", argv[i]) == 0 || strcmp("avg", argv[i]) == 0) {
            printf("%g", num_mean(&input));
        } else if(strcmp("sum", argv[i]) == 0 || strcmp("total", argv[i]) == 0) {
            printf("%g", num_sum(&input));
        } else if(strcmp("all", argv[i]) == 0) {
            for(count_t j = 0; j < input.count; j++) {
                if(j > 0) {
                    printf(" ");
                }
                printf("%g", input.data[j]);
            }
        } else if(strcmp("first", argv[i]) == 0) {
            printf("%g", num_first(&input));
        } else if(strcmp("last", argv[i]) == 0) {
            printf("%g", num_last(&input));
        } else if(strcmp("n", argv[i]) == 0 || strcmp("count", argv[i]) == 0 || strcmp("length", argv[i]) == 0) {
            printf("%g", num_n(&input));
        } else if(strcmp("min", argv[i]) == 0 || strcmp("minimum", argv[i]) == 0) {
            printf("%g", num_min(&input));
        } else if(strcmp("max", argv[i]) == 0 || strcmp("maximum", argv[i]) == 0) {
            printf("%g", num_max(&input));
        } else if(strcmp("range", argv[i]) == 0 || strcmp("spread", argv[i]) == 0) {
            printf("%g", num_range(&input));
        } else if(strcmp("median", argv[i]) == 0 || strcmp("med", argv[i]) == 0) {
            printf("%g", med.median);
        } else if(strcmp("median-low", argv[i]) == 0 || strcmp("med-low", argv[i]) == 0 ||
                  strcmp("medianlow", argv[i]) == 0 || strcmp("medlow", argv[i]) == 0) {
            printf("%g", med.median_low);
        } else if(strcmp("median-high", argv[i]) == 0 || strcmp("med-high", argv[i]) == 0 ||
                  strcmp("medianhigh", argv[i]) == 0 || strcmp("medhigh", argv[i]) == 0) {
            printf("%g", med.median_high);
        } else if(strcmp("mode-high", argv[i]) == 0 ||
                  strcmp("modehigh", argv[i]) == 0) {
            printf("%g", mode.modes[mode.count-1]);
        } else if(strcmp("mode-low", argv[i]) == 0 ||
                  strcmp("modelow", argv[i]) == 0) {
            printf("%g", mode.modes[0]);
        } else if(strcmp("mode", argv[i]) == 0) {
            for(count_t j = 0; j < mode.count; j++) {
                if(j > 0) {
                    printf(" ");
                }
                printf("%g", mode.modes[j]);
            }
        } else if(strcmp("sum-of-squares", argv[i]) == 0 ||
                  strcmp("sum2", argv[i]) == 0 ||
                  strcmp("ss", argv[i]) == 0 ||
                  strcmp("sumofsquares", argv[i]) == 0 ||
                  strcmp("sum-squares", argv[i]) == 0 ||
                  strcmp("sumsquares", argv[i]) == 0) {
            printf("%g", num_sum_of_squares(&input));
        } else if(strcmp("variance", argv[i]) == 0 ||
                  strcmp("var", argv[i]) == 0) {
            printf("%g", num_variance(&input));
        } else if(strcmp("standard-deviation", argv[i]) == 0 ||
                  strcmp("standarddeviation", argv[i]) == 0 ||
                  strcmp("stdev", argv[i]) == 0 ||
                  strcmp("sd", argv[i]) == 0) {
            printf("%g", num_standard_deviation(&input));
        } else if(strcmp("coefficient-of-variance", argv[i]) == 0 ||
                  strcmp("coefficientofvariance", argv[i]) == 0 ||
                  strcmp("coefficient-variance", argv[i]) == 0 ||
                  strcmp("coefficientvariance", argv[i]) == 0 ||
                  strcmp("co-var", argv[i]) == 0 ||
                  strcmp("covar", argv[i]) == 0 ||
                  strcmp("cv", argv[i]) == 0) {
            printf("%g", num_coefficient_of_variance(&input));
        }
    }
    printf("\n");

    return 0;
}

num_mode_t num_mode(num_input_t* input_sorted) {
    num_mode_t mode;

    mode.count = 0;
    mode.max = 4;
    mode.n = 1;
    mode.modes = (num_t*)malloc(sizeof(num_t)*mode.max);
    mode.unique = 1;

    int cur_n = 1;
    num_t cur_num = input_sorted->data[0];
    mode.modes[0] = cur_num;
    for(count_t i = 1; i < input_sorted->count; i++) {
        if(input_sorted->data[i] == cur_num) {
            cur_n++;
        } else {
            mode.unique++;
            if(cur_n > mode.n) {
                mode.count = 1;
                mode.modes[0] = cur_num;
                mode.n = cur_n;
            } else if(cur_n == mode.n) {
                mode.modes[mode.count++] = cur_num;
                if(mode.count == mode.max) {
                    mode.max = 2*mode.max;
                    mode.modes = (num_t*)realloc(mode.modes, sizeof(num_t)*mode.max);
                }
            }

            cur_n = 1;
            cur_num = input_sorted->data[i];
        }
    }

    if(cur_n > mode.n) {
        mode.count = 1;
        mode.modes[0] = cur_num;
        mode.n = cur_n;
    } else if(cur_n == mode.n) {
        mode.modes[mode.count++] = cur_num;
        if(mode.count == mode.max) {
            mode.max = 2*mode.max;
            mode.modes = (num_t*)realloc(mode.modes, sizeof(num_t)*mode.max);
        }
    }

    return mode;
}

num_median_t num_median(num_input_t* input_sorted) {
    num_median_t med;

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

num_t num_first(num_input_t* input) {
    return input->data[0];
}

num_t num_last(num_input_t* input) {
    return input->data[input->count-1];
}

num_t num_n(num_input_t* input) {
    return input->count;
}

num_t num_min(num_input_t* input) {
    num_t m = input->data[0];
    for(count_t i = 1; i < input->count; i++) {
        if(input->data[i] < m) {
            m = input->data[i];
        }
    }

    return m;
}

num_t num_max(num_input_t* input) {
    num_t m = input->data[0];
    for(count_t i = 1; i < input->count; i++) {
        if(input->data[i] > m) {
            m = input->data[i];
        }
    }

    return m;
}

num_t num_range(num_input_t* input) {
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

num_t num_mean(num_input_t* input) {
    return num_sum(input)/input->count;
}

num_t num_sum(num_input_t* input) {
    num_t s = 0;
    for(count_t i = 0; i < input->count; i++) {
        s += input->data[i];
    }
    return s;
}

void num_read_input(num_input_t* input) {
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

num_t num_sum_of_squares(num_input_t *input) {
    num_t mean = num_mean(input);
    num_t sum = 0;
    for(count_t i = 0; i < input->count; i++) {
        num_t n = input->data[i]-mean;
        sum += n*n;
    }

    return sum;
}

num_t num_variance(num_input_t *input) {
    return num_sum_of_squares(input)/num_n(input);
}

num_t num_standard_deviation(num_input_t *input) {
    return sqrt(num_variance(input));
}

num_t num_coefficient_of_variance(num_input_t *input) {
    return num_standard_deviation(input) / num_mean(input);
}
