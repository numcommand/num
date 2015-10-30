# Examples: how to use Num for shell scripting


### How much data is in a directory?

We list the current directory's files,
then choose the size column, then calculate:

    $ ls -l | awk '{print $5}' | num min max mean
    265 38684 2378.23


### How busy is the computer?

We print the current system processes,
then choose the CPU column, then calculate:

    $ ps aux | awk '{print $3}' | num min max mean
    0.0 100.1 0.513028


### How wet is the weather in New York City?

We download weather data for two days then parse humidities.

    $ curl http://w1.weather.gov/data/obhistory/KNYC.html |
    tr ">" "\n" | sed -n 's/^\([0-9]\+\)%.*/\1/p' |
    num min max mean
    32 84 58.4167


### How much is an apartment in San Francisco?

We connect to the Craigslist website then parse prices.

    $ curl -s http://sfbay.craigslist.org/search/apa |
    tr ">" "\n" | sed -n 's/^\$\([0-9]\+\).*/\1/p' |
    num mean
    2974.47


### Use GNU parallel to use multi-core processing

We use the `parallel` command to divide the work among cores.

    $ cat data.txt | parallel --pipe num sum | num sum


<p><hr>
<nav>
* <b>[Prev Page: Install: how to download and set up](install.md)</b>
* <b>[Next Page: Functions: the complete list of all capabilities](functions.md)</b>
</nav>
