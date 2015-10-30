# Programmer guide

This file is for programmers who are reading the Num source code or writing Num functions.


### Introduction

A typical `awk` function looks like this:

    function sum(num,  i, x) {
        for (i in num) x += num[i]
        return x
    }

A `num` function is similar, plus has parameters for numbers metadata, and arbitrary options, and a function name:

    function sum(num, num_  options,  f, i, x) {  # The num_ underscore array is metadata
        f = "sum"                                 # The function name is the metadata key
        if (!(f in num_)) {                       # Check the metadata cache
            for (i in num) x += num[i]            # Calculate as usual
            num_[f] = x                           # Set the metadata cache
        }
        return num_[f]
    }

Each `num` function also has a corresponding metadata function, that defines help, also-known-as synonyms, and possibly more in the future.

    function sum_(  f)
        f = "sum"
        function_[f,"help"] = "Sum all the values."
        function_[f,"aka"] = "total"
    }

A metadata varaible always ends with an underscore. This helps us keep track.


### Metadata Optimization

A `num` function may be able to use metadata optimization.

For example, if the `min` function knows that the numbers are sorted ascending or sorted desending, then the `min` function can immediately return the first or last item, rather than doing a full array scan.

Example:

    function min(num, num_,  options,  f, x, i) {
        f = "min"
        if (!(f in num_)) {
            if (num_["ascending"])
                num_[f] = first(num)
            else if (num_["descending"])
                num_[f] = last(num)
            else {
                for (i in num) if (x == "" || num[i] < x) x = num[i]
                num_[f] = x
            }
        }
        return num_[f]
    }


Some of the metadata keys that we're aiming to use:

  * `nums_["linear"]` boolean 0|1 if nums is linear numbers.
  * `nums_["unique"]` boolean 0|1 if nums is all unique numbers.
  * `nums_["integer"]` boolean 0|1 if nums is all integer numbers.
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

  * Prefer term `num` for a numbers array vs. `arr` for a generic array.

  * Prefer operatior whitespace vs. none. Example: use `a = b` not `a=b`.
    This is atypical for awk, but typical for Go, Python, Ruby, etc.

  * Prefer POSIX vs. gawk for coding. Example: use `x ^ 2` not `x ** 2`.
    For significant divergences between POSIX and gawk, ideally this code
    has a POSIX function and gawk function, and chooses the right one.

  * Prefer clarity vs. small optimizations. Example: intermediate vars.
    Big optimizations are always welcome and can be added here quickly.
    If a user has a need for speed or size, it is wiser to use R, Go, etc.

  * Local vars may be prefixed with "\_". Example: "\_foo" is local.
    This is most useful when a var has the same name as a function.

  * Metadata vars may be suffixed with "\_". Example: "foo\_" is metadata.

Rule out for now:

  * Launch using `#/usr/bin/env awk` because we need the `-f` arg.
  * Launch using `#/usr/bin/env -S ..` because we want POSIX.


<p><hr>
<nav>
<ul>
<li><b>[Prev Page: Known issues](known-issues.md)</b></li>
<li><b>[Next Page: Programmer library of awk functions](programmer-library-of-awk-functions.md)</b></li>
</ul>
</nav>
