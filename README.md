<img width="750" height="430" src="assets/images/splash/splash-960x550.jpg" />

# Num: number utilities for mathematics

Num is a command line tool for mathematics and statistics data processing.
<br>Num can calculate sum, median, iqr, variance, skewness, kurtosis, and much more.

[NumCommand.com is our website.](http://www.numcommand.com)
<br>[NumCommand is on Kickstarter - please donate $1 and spread the word!](https://www.kickstarter.com/projects/joelparkerhenderson/num-number-utilities-for-mathematics)

To use Num:

    $ echo "1 2 3 4" | num sum median iqr variance skewness kurtosis
    10 2.5 1.5 13.5833 -28.2917 71.8958

To install:

    sudo curl -sSL https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -o /usr/local/bin/num && sudo chmod +x /usr/local/bin/num

To install on Mac OS X also run this:

    brew install gawk

To install on other systems please see the [Install](doc/install.md) page.

Start using Num:

* [Install](doc/install.md)
* [Tutorial](doc/tutorial.md)
* [Functions](doc/functions.md)
* [Helpers](doc/helpers.md)
* [FAQ](doc/faq.md)

Project pages:

* [Thanks: our coders, advisors, sponsors, donors, and helpers](doc/thanks.md)
* [Comparisons: when to use Num vs. other tools, such as C, R, Python, etc.](doc/comparisons.md)
* [Benchmarks](doc/benchmarks.md)
* [To do list](doc/todo.md)
* [Known issues](doc/known-issues.md)
* [Programmer guide](doc/programmer-guide.md)
* [Programmer library of awk functions](doc/programmer-library-of-awk-functions.md)
