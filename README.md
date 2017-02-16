<img width="750" height="430" src="assets/images/splash/splash-750x430.jpg" />

# Num: number utilities for mathematics

Num is a command line tool for mathematics and statistics data processing.
<br>Num can calculate sum, median, quartiles, standard deviation, and much more.
<br>Num can sort, map, filter, round, and use various input/output formats.

<a href="https://www.patreon.com/num">Num on Patreon: donate to help</a>
<br><a href="https://twitter.com/NumCommand">Num on Twitter: @numcommand</a>
<br><a href="http://www.numcommand.com">Num on the web: www.numcommand.com</a>

Example:

    $ num sum median variance stddev data.txt
    10 2.5 1.66667 1.29099

Install:

    sudo curl -sSL https://raw.githubusercontent.com/numcommand/num/blob/master/bin/num -o /usr/local/bin/num && sudo chmod +x /usr/local/bin/num && (command -v uname >/dev/null 2>&1) && (uname | grep -q Darwin) && (command -v brew >/dev/null 2>&1) && (brew ls --versions gawk | grep -q gawk) || brew install gawk

For more on how to install please see the [Install page](doc/install.md).
<br>To troubleshoot please see the [Troubleshooting page](doc/troubleshooting.md).


Start using Num:

* <a href="doc/tutorial.md">Tutorial: quick start, input, output, variables, options, &hellip;</a>
* <a href="doc/functions.md">Functions: sum, min, max, var, iqr, sort, round, normalize, &hellip;</a>
* <a href="doc/helpers.md">Helpers: awk, cut, sed, seq, wc, head, tail, parallel, &hellip;</a>
* <a href="doc/articles.md">Articles &amp; Blogs: Unix, EDA, Datamash, qstats, MOOCs, &hellip;</a>
* <a href="doc/faq.md">FAQ: how to help, feature roadmap, &hellip;</a>

Project pages:

* <a href="doc/donate.md">Donate: using PayPal, Patreon, Bitcoin, GitHub, etc.</a>
* <a href="doc/thanks.md">Thanks: our coders, advisors, sponsors, donors, and helpers</a>
* <a href="doc/comparisons.md">Comparisons: when to use Num vs. other tools, such as C, R, Python, etc.</a>
* <a href="doc/benchmarks.md">Benchmarks</a>
* <a href="doc/todo.md">To do</a>
* <a href="doc/known-issues.md">Known issues</a>

Programmer pages:

* <a href="doc/programmer-guide.md">Programmer guide</a>
* <a href="doc/programmer-library-of-awk-functions.md">Programmer library of awk functions</a>
* <a href="doc/files.md">Files</a>
* <a href="doc/build.md">Build</a>
* <a href="doc/test.md">Test</a>
* <a href="doc/porting.md">Porting to more languages</a>

Statistics help:

* <a href="http://debrouwere.org/2017/02/01/unlearning-descriptive-statistics/">Unlearning descriptive statistics</a>

By <a href="http://www.joelparkerhenderson.com">Joel Parker Henderson</a>
