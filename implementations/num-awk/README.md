This directory is for the Num implementation based on awk.

## Directories &amp; Files

Top level directory:

   * `num` is the main script that users download.

   * The script has the command line parsing, help, etc.

   * The script inlines all the code from the `src` files.

`src` directory:

   * `num.awk` is the main library file that includes all the other library files.

   * `num-*.awk` files are the library files, typically one file per concept.

   * You can use these library files in your own projects if you like.

   * The code of all these files is already included in the `num` script.

`test` directory:

   * `minitest.sh` which provides simple assertions.

   * `num-test.sh` is a test runner for all the test files.

   * `num-*-test.sh` are the test files that correspond to source files.

   * When a test runs, the script prints details, then SUCCESS or FAILURE.

`todo` directory:

   * Contains code snippets that we need to do.

   * Ideally this directory is empty.


## Build

To build the `num` script:

    awk 'FNR==1 && NR!=1 {print "\n"}{print}' \
    $(cat src/num.awk | sed -n 's/^\@include "\(.*\)"/\1/p') | more

We have a goal to make the build process simpler.


## Test

To run all test files:

    cd test
    ./num-test.sh

To run one test file, such as for variance:

    cd test
    ./num-variance-test.sh
