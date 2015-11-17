# Troubleshooting

Num works on any operating system that is relatively current, and that has the GNU Awk software that is relatively current.

If Num is not working for you, please try these steps and let us know what works and what doesn't.

## Can you run GNU Awk, and is it current?

Run this:

    gawk --version

  * The version should be 4.1.3 or higher.
  * If the version is lower, please upgrade to a current version, such as by running `brew upgrade gawk`, `apt-get upgrade gawk`, etc.
  * If you don't have GNU awk, please install it; see the [Install page](install.md).

## Can you run Num, and is it current?

Run this:

    num --version

  * The version should be 1.2.0 or higher.
  * If the version is lower, please install the current version; see the [Install page](install.md).

## Can you open an issue?

Go to https://github.com/numcommand/num/issues

  * Click the "New issue" button.
  * Explain your issue: tell us what's happening, what error messages you're getting, and any other information.
