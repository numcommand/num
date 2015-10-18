# Programmers guide

This file is for programmers who are reading the Num source code or writing Num functions.


### Introduction

A typical `awk` function uses input parameters and returns an output.

Example:


    function min(nums,  x, i) {
        x = nums[1]
        for (i in nums) if (nums[i] < x) x = nums[i]
        return x
    }

A Num function is similar, plus uses an input parameter for numbers metadata, such as caching.

The parameter for the numbers metadata ends with an underscore. This helps us keep track of it and know that it holds transient information, such as caching.

Example:

    function min(nums, nums_,   i) {
        if (!("min" in nums_)) {
            x = nums[1]
            for (i in nums) if (nums[i] < x) x = nums[i]
            nums_["min"] = x
        }
        return nums_["min"]
    }

A Num function may be able to optimize by using the numbers metadata, such as results of other functions.

See below for some of the metadata that we're aiming to use to speed up the project.

Example:

    function min(nums, nums_,  x, i) {
        if (!("min" in nums_)) {
            if (nums_["ascending"])
                nums_["min"] = nums[1]
            else {
                x = nums[1]
                for (i in nums) if (nums[i] < x) x = nums[i]
                nums_["min"] = x
            }
        }
        return nums_["min"]
    }


Some of the metadata keys that we're aiming to use:

  * `nums_["linear"]` boolean 0|1 if nums is linear numbers.
  * `nums_["unique"]` boolean 0|1 if nums is unique numbers.
  * `nums_["ascending"]` boolean 0|1 if nums is sorted ascending.
  * `nums_["descending"]` boolean 0|1 if nums is sorted descending.


### Function conventions

The project uses these function conventions:

  * Use the `awk` convention of two spaces to separate the function
    declaration list of input variables from internal variables.

  * Check if the array has a key that is the same name as the function.
    If the key exists, then skip any calculation; simply return the value.
    the value is a previously-calculated result a.k.a. a memo, a.k.a. a cache.

  * Explicitly set all internal variables because this helps
    catch bugs and prevent them, and tends to be easier to read.

  * After the loop, we cache the result in the array by using the
    opts array and a key that is the same name as the function.

  * We return the cache value, rather than the temp loop variable,
    because in our experience this helps prevent bugs.

### Coding conventions

The project uses these coding conventions:

  * Prefer term `nums` for a numbers array vs. `arr` for a generic array.
    The term `nums` is a contract that the array is always all numbers.

  * Prefer operatior whitespace vs. none. Example: use `a = b` not `a=b`.
    This is atypical for awk, but typical for Go, Python, Ruby, etc.

  * Prefer POSIX vs. gawk for coding. Example: use `x ** 2` not `x ^ 2`.
    For significant divergences between POSIX and gawk, ideally this code
    has a POSIX function and gawk function, and chooses the right one.

  * Prefer clarity vs. small optimizations. Example: intermediate vars.
    If a user has a need for speed or size, it is wiser to use R, Go, etc.
    Big optimizations are always welcome and can be added here quickly.

  * Local vars may be prefixed with "_". Example: "_foo" is local.
    This is most useful when a var has the same name as a function.

Rule out for now:

  * Launch using `#/usr/bin/env awk` because we need the `-f` arg.
  * Launch using `#/usr/bin/env -S ..` because we want POSIX.

### To Do

To do list for our upcoming work:

  * Upgrade to calc by column (a.k.a. field) or row (a.k.a. record).

  * Create packages for apt, yum, brew, etc.

  * Improve documentation, especially for novices.

  * Improve tests, especially for corner cases.

  * Improve POSIX compatibility, e.g. `length` function.

  * Improve functionality, e.g. add boolean checks, number ranges.
