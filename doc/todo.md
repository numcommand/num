# To do: plans and ideas for our future versions

## Roadmap

Num top ten roadmap goals:

1. Create more functionality -- Such as for rankings, histograms, outliers, modes, jarque, dpo, and larger numbers.

2. Create input-scrubbing capabilities -- Such as extracting numbers from mixed-type data, parsing numbers that look like currencies or percentages, handling missing data or malformed data, alerting if non-numbers are disrupting results, etc.

3. Upgrade options for input and output -- Add columns and rows, headers and labels, output formats for HTML/JSON/JSONB, Unicode symbols, etc.

4. Improve help -- Continue enhanching the Num website, tutorials, examples. Add an IRC channel for people who want help and want to contribute. Collect documentation as a PDF book focused on command-line statistics, because our experience shows this is an important way to drive adoption in larger organizations including academia and enterprises.

5. Optimize speed -- Use caching, memoization, heuristics, and input hinting.

6. Implement on more systems -- Build pure Mac OS X compatibility, and pure POSIX compatibility, and Cygwin compatibility for Windows. Package Num by using various package managers, including apt, brew, yum, etc.

7. Create appendable statistics, such as taking an input of an existing count and mean, and appending new numbers to the statistic\ s. We believe this is a killer feature for combining batch-oriented processing with stream-oriented processing. Our testing so far shows that additive statistics can give speed increases of 2x-5x for the real-world data we're\ using in real-world projects.

8. Implement in a fast compiled language -- We expect this make Num run 2x-5x faster, and also open up long term possibilities for advanced data structures. We hope to be able to jumpstart this by working with existing open source statistics programmers and code bases, such as datamash and qsort.

9. Encourage use of Num -- Such as working with teaching groups (e.g. edX, Khan Academy, Coursera, Udacity), coding groups (e.g. RedHat, Canonical, Apple, Google), and publishing groups (e.g. Amazon, O'Reilly, Pragmatic). These organizations can help us achieve the best success for the project, and can also help the most people.

10. Long term we want to advocate for Num to become a Unix command that is automatically installed on all Unix systems, much like common command line tools such as grep and sed. We want this to include working with system vendors and also with programmers who can make the code faster and better for cross-platform uses.


### Ideas for version 2.x and future

Number sizes:

* Big numbers
* Research adding GNU MPFR and GNU MP (GMP).
* Research adding GNU Awk `--bignum` flag.

Number functions:

* `transpose`

* `reverse`

* `count-*`, `select-*`, `reject-*` for positive, negative, zero, even, odd, unique.

* possibly filters based on quantile, such as `=q1`, `>q1`, `<q1`

Mathematics functions:

* `absmin`, `absmax`

* `decrement`

List functions:

* `randomize` a.k.a `shuffle`

* `collapse`

Statistics functions:

* `antimode`

* `jarque`

* `dpo`

IO functions:

* `input-header` - tell Num to ignore the first line of input because has header labels.

* `output-header` - tell Num to print a first line of output that has header labels.

* `format` a.k.a. `printf` - enable output string substitutions.

* `zero-termination` - enable null-terminated data.

Table functions:

* `group`

* `filler`

Other functions such as those in other math stats tools.

Optimizaitons:

* One-pass improved calculations as described by John D. Cook, for `mean`, `variance`, `standard-deviation`, `skewness`, `kurtosis`. See http://www.johndcook.com/blog/skewness_kurtosis/

Quicksort:

* Research implementing the pivot by using Tukeys ninther,
  which is a median of medians, and may be a faster heuristic.
  See http://www.johndcook.com/blog/2009/06/23/tukey-median-ninther/

* Research implementing the small size sort using Shell sort,
  which is similar to insertion sort yet better for typical data.
  See https://en.wikipedia.org/wiki/Shellsort

* Research upgrading from single pivot to dual pivot, with the main benefit being faster speed because of fewer long scans.


<p><hr><nav>
* <b>[Prev Page: Benchmarks](benchmarks.md)</b>
* <b>[Next Page: Known issues](known-issues.md)</b>
</nav>
