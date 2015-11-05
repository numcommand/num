# Install: how to download and set up

To install, download the `num` script, and save it anywhere that you can run it.

To install using `curl`:

    sudo curl -sSL https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -o /usr/local/bin/num && sudo chmod +x /usr/local/bin/num

To install using `wget`:

    sudo wget https://raw.githubusercontent.com/numcommand/num/master/implementations/num-awk/num -O /usr/local/bin/num && sudo chmod +x /usr/local/bin/num

To install on Mac OS X, you also need to install GNU awk such as:

    brew install gawk --default-names

If you use BSD, Cygwin, or any other Unix-like system that lacks GNU awk,
then here's how to [install gawk](https://www.gnu.org/software/gawk/manual/html_node/Quick-Installation.html)

Notes:

  * If you have any issues with installation, please contact us directly, or create a GitHub issue.

  * The roadmap includes a smoother safer installation process, using package managers such as `apt`, `yum`, `brew`, etc. If you would like to help with these, please contact us directly or create a GitHub issue.


<p><hr>
<nav>
<ul>
<li><b>[Next Page: Examples: how to use Num for shell scripting](examples.md)</b></li>
</ul>
</nav>
