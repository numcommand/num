# Kickstarter project

This is the Kickstarter project text for Num.


### What is Num?

Num is a computer software program that makes it easy to run mathematics functions and statistics, such as sum, average, range, variance, standard deviation, and more.

Num will be open source and free for everyone.

The project is on GitHub at https://github.com/numcommand/num

Here is a screenshot of simple Num commands:

[Screenshot Image]

Caption: Num command line examples


### Who is Num for?

Num is for people who use computer command line tools and who want a quick and easy utility program for data processing. The Num documentation includes examples.


### Why are we creating Num?

We're software developers and we want to create Num to give computer users an easy way to do calculations using quick command line tools. We believe Num fills a gap because it handles common needs and can be simpler than programming languages.


### What can Num do?

We're aiming to do everything in this section.

* Functions for count, min, max, range, first, last, mean, median, mode, variance, standard deviation, coefficient of variance, sort, unique, and absolute value. If the project raises 2k the goals are similar functions such as quantiles, iqr, antimode, pstdev, sstdev, pvar, svar, mad, madraw, sskew, pskew, skurt, pkurt, jarque, dpo, etc.

* Input that uses numbers, i.e. input data must be clean. If the project raises 3k the goals are the most important input-scrubbing capabilities, such as extracting numbers from mixed-type data, parsing numbers that look like currencies or percentages, handling missing data or malformed data, alerting if non-numbers are disrupting results, etc.

* Options for input and output, including a custom input field separator, input record separator, output field separator, output record separator, as well as input optimizations for presorted data, and output formats for comma separated values (CSV) and tab separated values (TSV). If the project raises 4k the goals are upgrading options for input and output, columns and rows, headers and labels, output formats for HTML/JSON/JSONB, Unicode symbols, and similar kinds of  IO needs.

* Publishing including documentation, examples, a git repository, wiki, license page, contributing page, and a set of tests. If the project raises 5k the goals are improving documenation and accessibility by adding a Num website, IRC help channel, more examples including Unix toolchain commands, and working directly with experts in R and Python to make Num an "on ramp" for more-powerful stats tools. If the project raises 6k the goals are writing and publishing the documentation as a PDF book focused on command-line statistics because our experience shows this is an important way to drive adoption in larger organizations especially academia and enterprises.

* Implementation using GNU awk, a.k.a. gawk. If we raise $7000 and above, our stretch goal is pure Mac OS X compatibility, and also pure POSIX compatibility, and Cygwin compatibility for Windows. If we raise $8000 and above, our stretch goal is implementation speed increases by using caching, memoization, heuristics, and input hinting. If we raise $9000 and above, our stretch goal is starting placeholders for command-line-compatible implementations by the community using other languages, including Python, etc.

* Installation by downloading one file, which is a shell script. If the project raises 10k the goals are work on packaging Num for various package managers, including apt, brew, yum, etc. We believe that packaging is the most important single item for making any program widely available on Unix.

* Processing that takes all input at the start of the program. If the project raises 12k the goals include additive statistics, such as taking an input of an existing count and mean, and appending new numbers to the statistics. We believe this is a killer feature for combining batch-oriented processing with stream-oriented processing. Our testing so far shows that additive statistics can give speed increases of 2x-5x for the real-world data we're using in real-world projects.

* Speed that is fine for small data and small projects. If the project raises 15k and above, our stretch goal is to write a long term command-line-compatible implementation in C, which we expect to make Num run 2x-5x faster, and also open up long term possibilities for more advanced data structures. There is excellent work in C in the datamash tool and qstats tool, and these are open source, so if you personally need speed soon, try datamash and qstats.


### How about examples?

Here are examples for people who know about command line tools:

  * How much data is in a directory?

  * How busy is the computer?

[Screenshot Image]

Caption: Num examples for computer users


### Why use Num instead of any other tool?

Because Num aims to be easy to install and use. There are many great statistics tools such as datamash, qstats, pandas, R, and Julia, and if you're already using these by all means keep using them. We encourage command-line-compatible implementations using any of these other tools.

We believe Num can be easier to install because it uses built-in Unix commands, and does not need other tools or languages such GCC, Go, Python, R, etc. We believe this makes it easier to fast-track Num for use on many Unix systems, and also for any system that has the awk tool available.

We believe Num can be easier to use because it emphasizes common needs. Num does what you expect, without needing formal syntax or formatting. We believe this makes it easier for novices to get started, and also for experts to quickly write scripts that are portable among many systems.

Num documentation will include information about these other tools, so users can understand how to use Num for many quick simple needs, and how to step up to other tools that have more power and sophistication.

If you're a programmer who already uses these other tools, then you know firsthand the value of numeric utilities. We want to make these concepts and capabilities available to more people and accessible on a wide range of systems.


### Num is simple

For people who use command line tools, Num is simple to install and simple to use. It is also simple to connect to other typical Unix tools.

For people who are programmers, Num is easy to extend with new functions and calculations. All the source code is free and open.


### Num is free

Num is free, open source, and open to anyone to contribute new ideas, new code, and new documentation.

Num will be hosted on GitHub, and have all the typical ways of opening issues, contributing code, and getting your own copy by cloning or forking.

The open source licensing will use each system's normal license. We expect to use GPL for Linux systems, BSD for FreeBSD systems, and so on. Our goal with the licensing is to make it as easy as possible for the system administrators to use Num and package it for the systems.


### Num is for quick data scripts

Num has a sweet spot for quick data scripts, such as pulling in data and calculating summary statistics.

Here are a couple examples of Num for quick data scripts - these are quick and dirty, and not intended for production applications.

  * How wet is the weather in New York City?

  * How much is an apartment in San Francisco?

[Screenshot Immge]

Caption: Num examples for quick data scripts


### Stretch goals to help us accomplish more

We believe that numeric processing is increasingly valuable for many professional needs as well as for education needs. We want Unix to have a built-in numbers command, similar to how Unix has built-in text commands such as grep and sed.

Here are our goals for raising money:

* 1k - launch Num with a successful Kickstarter, and with all the capabilities described above.

* 2k - create similar kinds of functions for quantiles, iqr, antimode, pstdev, sstdev, pvar, svar, mad, madraw, sskew, pskew, skurt, pkurt, jarque, dpo, etc.

* 3k - create the most important input-scrubbing capabilities, such as extracting numbers from mixed-type data, parsing numbers that look like currencies or percentages, handling missing data or malformed data, alerting if non-numbers are disrupting results, etc.

* 4k - upgrade options for input and output, columns and rows, headers and labels, output formats for HTML/JSON/JSONB, Unicode symbols, etc.

* 5k - improving documenation and accessibility by adding a Num website, IRC help channel, more examples including Unix toolchain commands, and working directly with experts in R and Python to make Num an "on ramp" for more-powerful stats tools.

* 6k - writing and publishing the documentation as a PDF book focused on command-line statistics because our experience shows this is an important way to drive adoption in larger organizations especially academia and enterprises.

* 7k - implementation upgrades to add pure Mac OS X compatibility, and pure POSIX compatibility, and Cygwin compatibility for Windows.

* 8k - implementation speed increases by using caching, memoization, heuristics, and input hinting.

* 9k - implemenation project expansion by pgrade to add starting placeholders for command-line-compatible implementations by the community using other languages, including Python, etc.

* 10k - packaging Num for various package managers, including apt, brew, yum, etc. We believe that packaging is the most important one item for making any program widely available on Unix.

* 12k - create additive statistics, such as taking an input of an existing count and mean, and appending new numbers to the statistic\ s. We believe this is a killer feature for combining batch-oriented processing with stream-oriented processing. Our testing so far shows that additive statistics can give speed increases of 2x-5x for the real-world data we're\ using in real-world projects.

* 15k - implementation in C, which we expect to make Num run 2x-5x faster, and also open up long term possibilities for more advanced data structures. We hope to be able to jumpstart this by working with existing open source statistics programmers and code bases, such as datamash and qsort.

* 20k - widespread sharing of Num with leadership organizations, including working with teaching groups (e.g. edX, Khan Academy, Coursera, Udacity), coding groups (e.g. RedHat, Canonical, Apple, Google), and publishing groups (e.g. Amazon, O'Reilly, Pragmatic).

Long term we want to advocate for Num to become a Unix command that is automatically installed on all Unix systems, much like common command line tools such as grep and sed. We want this to include working with system vendors and also with programmers who can make the code faster and better for cross-platform uses.


### General Questions & Answers

Q. Is this a one-time project or an ongoing project?

A. Ongoing. We expect to work on Num for a long time, to improve it and make it available on more systems, and using more implemenations.

Q. How do I pronounce Num?

A. Num is pronounced like num-ber.

Q. What is the logo?

A. The logo is a circle and number sign. The circle is the symbol for a function in a computer software data flow diagram. The number sign is also known as a hash, or octothorpe. If you're a logo creator or graphics designer, we're open to a new logo.

Q. Why do a Kickstarter?

A. Kickstarter is to get the project launched, and also help more people learn about it. We will use the money to take our existing open source hobby project and turn it into a better, stronger, faster, longer lived project.


### Technical Questions & Answers

Q. Can I help?

A. Yes please, and thank you!

- If you know programming or UI/UX, we're building Num using GitHub. We welcome help with coding, UI/UX, documentation, examples, community building, and the like.

- If you know mathematics and statistics, we will love your opinions about what functionality we should build, and how to get the software to you and your peers.

Q. Where is Num published and maintained?

A. Num will be published on GitHub.

- For the time being, at https://github.com/joelparkerhenderson/nums.

- We want to create an independent GitHub account and add maintainers. If you would like to help with this, or have advice about it, we welcome hearing from you.

Q. Can Num add feature X?

A. Generally yes, if you're able to write the code, or contribute to help fund it.

- We want to focus right now on launching Num with widely useful features. After Num launches then we want to add more specialized features.

- Contact us to let us know what you'd like. If you like, we can provide code samples and templates to help you write your own functions and tests that we can add quickly.

Q. How fast is NUMS?

A. Fast enough for small data and small tasks. For example, NUMS can sum a million integers in half a second on a current Mac laptop.

- For the time being, Num uses the awk command under the hood. The awk command is general purpose and not optimized for mathematics and statistics. As we raise money, we want to enable command-line-compatible implementations that use faster languages, such as Python and C.

- Fast speed is a stretch goal - we want to upgrade Num to make it faster by writing it in C. If you're a C programmer who would like to help, we would love to hear from you. We estimate that using C can speed up calculations 2x-5x.

Q. Could any programmer write these kinds of functions in a handful of lines using another tool such as datamash or qstats, or another language such as C or R?

A. Yes. In the past we've written these kinds of functions in these other tools and languages, and now we want to create a software utility that is simpler and also straightforward for standards tracking.

- We've tried these, and we've built up libraries of many dozens of functions. We have learned that we like being able to use mathematics and statistics, for big tasks and also for for quick little tasks.

- We want an easy way to make these functions widely available, even for systems that are locked down or can't have additional programming tools installed. We found that awk provides a good solution for now because it's widely available and very good at handling fields and records.

Q. Can I install Num using my system's package manager?

A. That's a stretch goal.

- For the time being, you'll install Num by downloading a single file, using a command such as curl, wget, git, etc. Details will be posted on the GitHub README page.

- After Num launches, we expect to look at package managers including apt, yum, brew, etc.


### Special Thanks

Tony Fischetti, author of the qstats tool, and its contributors; Assaf Gordon, maintainer of the datamash tool, and its contributors; Arnold Robbins, maintainer of the gawk tool on Unix and POSIX systems, and its maintainers and contributors on all systems; Ross Ihaka and Robert Gentleman, creators of the R language, and its contributors; Jeff Bezanson, Stefan Karpinski, Viral B. Shah, and Alan Edelman, creators of the Julia language, and its contributors; Linus Torvalds, creator of Linux and git, and their contributors; and all the myriad open source authors, advocates, and users.

Advisers and draft readers, including Bill Lazar at Sumo Logic, Lawrence Yu at Blue Otter, Michael Pope at Living Social, and Even Howard at House in the Moon.
