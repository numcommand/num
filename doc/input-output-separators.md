# Input/Output Separators

Num enables you to use custom separators for data.


## FS &amp; RS

You can use a custom input field separator (FS) and input record separator (RS):

    $ echo "1,2,3;4,5,6;7,8,9" | num min max FS=',' RS=';'
    1 3
    4 5
    7 9


## OFS &amp; ORS

You can use a custom output field separator (OFS) and output record separator (ORS).

    $ echo "1 2 3\n4 5 6\n7 8 9" | num min max records OFS=',' ORS=';'
    1,3;4,6;7,9


## CSV &amp; TSV &amp; USV

Num has nicknames for separators for several data file exchange formats:

  * comma-separated values (CSV) is a nickname for FS="," RS="\n" OFS="," ORS="\n"
  * tab-separated values (TSV) is a nickname forFS="\t" RS="\n" OFS="\t" ORS="\n"
  * unit-separated values (USV) is a nickname for FS="&#9247;" RS="&#9246;" OFS="&#9247;" ORS="&#9246;"

Examples:

    $ echo "1,2,3\n4,5,6\n7,8,9" | num min max csv
    1,3
    4,6
    7,9

    $ echo "1\t2\t3\n4\t5\t6\n7\t8\t9" | num min max tsv
    1\t3
    4\t6
    7\t9

    $ echo "1&#9247;2&#9247;3&#9246;4&#9247;5&#9247;6&#9246;7&#9247;8&#9247;9" | num min max usv
    1&#9247;3&#9246;4&#9247;6&#9246;7&#9247;9

You can use CSV/TSV/USV on just the input or output:

    $ echo "1,2,3\n4,5,6\n7,8,9" | num min max input-csv output-tsv
    1\t3
    4\t6
    7\t9

Note: the nicknames set the separators, and do not do anything more sophisticated such as parsing escaped characters. For example, the CSV nickname sets the separators, and does not do any parsing that allows items to contain escaped commas, embedded newlines, and the like. If you need CSV parsing, consider using a prebuilt tools such as a perl module, ruby gem, or command line tool such as [`csvkit`](http://csvkit.readthedocs.org/), [`csvtool`](http://basepath.com/csv/), [`crush`](https://github.com/google/crush-tools), etc.
