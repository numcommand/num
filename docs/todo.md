# To do

### Planned for version 1.x

Add source code in progress.

Add installation instructions.

Announce on Kickstarter.

Add Unix options:

* `--help`
* `--version`


### Ideas for version 2.x and future

Numbers functions:

* `transpose`
* `reverse`

Count functions:

* `count-positive`
* `count-negative`
* `count-zero`
* `count-even`
* `count-odd`
* `count-unique`

Mathematics functions:

* `absmin`
* `absmax`

List functions:

* `randomize` a.k.a `shuffle`
* `collapse`

Quantile functions:

* `q0`, `q1`, `q2`, `q3`, `q4`
* `iqr`
* possibly filters based on quantile, such as `=q1`, `>q1`, `<q1`

Statistics functions:

* `antimode`
* `pstdev`
* `sstdev`
* `pvar`
* `svar`
* `mad`
* `madraw`
* `sskew`
* `pskew`
* `skurt`
* `pkurt`
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

Cleaning functions:

* `floor` a.k.a. `truncate` - adjust each number by chopping off decimal points. Example: 1.9 => 1

* `round` a.k.a. `nint` - adjust each number to the nearest integer. Example: 1.9 => 2

* `strip` a.k.a. `trim` - excise any non-number characters. Example "$1%" => 1.

Other functions such as those in other math stats tools.
