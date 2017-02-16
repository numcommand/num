# Build

To build the `num` script:

    awk 'FNR==1 && NR!=1 {print "\n"}{print}' \
    $(cat src/num.awk | sed -n 's/^\@include "\(.*\)"/\1/p') | more

We have a goal to make the build process simpler.
