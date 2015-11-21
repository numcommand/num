<img width="750" height="430" src="assets/images/splash/splash-750x430.jpg" />

# Num: number utilities for mathematics

Num is a command line tool for mathematics and statistics data processing.
<br>Num can calculate sum, median, quartiles, standard deviation, and much more.
<br>Num can sort, map, filter, round, and use various input/output formats.

<a href="https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics">Num on Kickstarter: please donate $1 to help!</a>
<br><a href="https://www.patreon.com/num">Num on Patreon: please donate $1 to help!</a>
<br><a href="https://twitter.com/NumCommand">Num on Twitter: @numcommand</a>
<br><a href="http://www.numcommand.com">Num on the web: www.numcommand.com</a>

Example:

    $ num sum median variance stddev data.txt
    10 2.5 1.66667 1.29099

Install:

sudo curl -sSL https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -o /usr/local/bin/num && sudo chmod +x /usr/local/bin/num && (command -v uname >/dev/null 2>&1) && (uname | grep -q Darwin) && (command -v brew >/dev/null 2>&1) && (brew ls --versions gawk | grep -q gawk) || brew install gawk

For more on how to install please see the [Install page](doc/install.md).
<br>To troubleshoot please see the [Troubleshooting page](doc/troubleshooting.md).

Start using Num:

* <a href="doc/tutorial.md">Tutorial: quick start, input, output, variables, options, &hellip;</a>
* <a href="doc/functions.md">Functions: sum, min, max, var, iqr, sort, round, normalize, &hellip;</a>
* <a href="doc/helpers.md">Helpers: awk, cut, sed, seq, wc, head, tail, parallel, &hellip;</a>
* <a href="doc/articles.md">Articles &amp; Blogs: Unix, EDA, Datamash, qstats, MOOCs, &hellip;</a>
* <a href="doc/faq.md">FAQ: how to help, feature roadmap, &hellip;</a>

Project pages:

* [Donate: using PayPal, Patreon, Bitcoin, GitHub, etc.](doc/donate.md)
* [Thanks: our coders, advisors, sponsors, donors, and helpers](doc/thanks.md)
* [Comparisons: when to use Num vs. other tools, such as C, R, Python, etc.](doc/comparisons.md)
* [Benchmarks](doc/benchmarks.md)
* [To do](doc/todo.md)
* [Known issues](doc/known-issues.md)

Programmer pages:

* [Programmer guide](doc/programmer-guide.md)
* [Programmer library of awk functions](doc/programmer-library-of-awk-functions.md)
