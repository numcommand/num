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
} median_t;

void read_input(num_input_t* input);

num_t mean(num_input_t* input);
num_t sum(num_input_t* input);
num_t first(num_input_t* input);
num_t last(num_input_t* input);
num_t n(num_input_t* input);
num_t min(num_input_t* input);
num_t max(num_input_t* input);
num_t range(num_input_t* input);
median_t median(num_input_t* input_sorted);

int num_t_cmpfunc(const void *a, const void *b);

#endif
