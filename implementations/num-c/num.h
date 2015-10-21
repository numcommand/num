#ifndef __NUMCOMMAND__
#define __NUMCOMMAND__

#define NUMT_SCANF "%f"
typedef float num_t;
typedef unsigned int count_t;
typedef struct {
    num_t* data;
    count_t count;
    count_t max;
} num_input_t;

typedef struct {
    num_t median_low;
    num_t median_high;
    num_t median;
} num_median_t;

// TODO multimodal, and store an array of the modes
typedef struct {
    num_t* modes;
    count_t count; // number of modes (i.e. 1 for unimodal, 2 for bimodal, etc.)
    count_t max;   // current max array size

    count_t n; // number of elements for the current mode
    count_t unique; // number of unique elements
} num_mode_t;

void num_read_input(num_input_t* input);

num_t num_mean(num_input_t* input);
num_t num_sum(num_input_t* input);
num_t num_first(num_input_t* input);
num_t num_last(num_input_t* input);
num_t num_n(num_input_t* input);
num_t num_min(num_input_t* input);
num_t num_max(num_input_t* input);
num_t num_range(num_input_t* input);
num_median_t num_median(num_input_t* input_sorted);
num_mode_t num_mode(num_input_t* input_sorted);
num_t num_sum_of_squares(num_input_t *input);
num_t num_variance(num_input_t *input);
num_t num_standard_deviation(num_input_t *input);
num_t num_coefficient_of_variance(num_input_t *input);

int num_t_cmpfunc(const void *a, const void *b);

#endif
