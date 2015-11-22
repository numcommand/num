# Comparisons: when to use Num vs. other tools

Use Num when:

  * small data and small tasks
  * or one-time needs
  * or development-quality stability

Use other tools when you have:

   * large data and large tasks
   * or repeating needs and automation
   * or production-quality stability


### When to use datamash, qstats, num-utils, etc.

We suggest using these small compiled binaries when:

* You're a sysop or sysadmin.
* Your needs include systems automation.
* You think of numbers in terms of streams and pipes.
* You already use system tools, such as awk, grep, sed, make, etc.
* Your data set fits in available RAM and is suitable for Unix pipes.
* You want a quick way to pipe text to commands, with no dependencies.
* Your ideal tools are small, compiled once, with no dependencies, and no add ons.

See:

* [GNU datamash: command which performs basic numeric, textual and statistical operations](https://www.gnu.org/software/datamash/)
* [qstats: quick and dirty statistics tool for the Unix pipeline](https://github.com/tonyfischetti/qstats)
* [num-utils: a set of programs for dealing with numbers from the Unix command line](http://freecode.com/projects/num-utils)


### When to use R, Julia, Octave, etc.

We suggest using these full featured statistics environments when:

* You're a statistician.
* Your needs include doing data exploration.
* You think of numbers in terms of vectors and functions.
* You want to use an app, such as R Studio, GNU Octave, MATLAB, or Mathematica.
* Your data set fits comfortably in your computer's memory.
* You want a quick easy way to try visualizations and algorithms for yourself.
* Your ideal tools are on the leading edge of new statistics.

See:

* [R Project for Statistical Computing](https://www.r-project.org/), [Comprehensive R Archive Network](https://cran.r-project.org/)
* [Julia language](http://julialang.org/)
* [GNU Octave: high-level language for numerical computations](https://www.gnu.org/software/octave/)
* [MATLAB: high-level language and interactive environment](http://www.mathworks.com/products/matlab/)
* [Wolfram Mathematica: Modern Technical Computing](https://www.wolfram.com/mathematica/)
* [Mirador: tool for visual exploration of complex data](https://github.com/mirador/mirador)


### When to use Python, Scala, J, etc.

We suggest using these programming languages when:

* You're a coder.
* Your needs include doing data pre-processing or post-processing.
* You think of numbers in terms of objects and messages, such as OOP methods.
* You already code in Python, Scala, Java, Perl, Ruby, Go, J, etc.
* Your data set exceeds your computer's memory.
* You want production environment deployments of visualizations and algorithms.
* Your ideal tools use a general purpose programming language.

See:

* [Python programming langauage](https://www.python.org/), [Python Data Analysis Library](https://pandas.pydata.org/)
* [Scala programming language](https://www.scala-lang.org/)
* [J programming language](https://www.jsoftware.com/)

<p><hr><nav>
* <b>[Prev Page: Thanks: our coders, advisors, sponsors, donors, and helpers](thanks.md)</b>
* <b>[Next Page: Benchmarks](benchmarks.md)</b>
</nav>
