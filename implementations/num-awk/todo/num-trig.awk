############################################################################
#
# num-trig.awk
#
##

# These trig functions are thanks to:
# http://www2.keck.hawaii.edu/inst/deimos/procs/calc
#
#    abs(x)  = absolute value of x
#    nint(x)   = nearest integer
#    log10(x)  = common logarithm of x
#
#    sind(x)  = sine of x (x in degrees)
#    cosd(x)  = cosine of x (x in degrees)
#
#    asin(x)   = inverse sine of x (result in radians)
#    acos(x)   = inverse cosine of x (result in radians)
#    atan(x)   = inverse tangent of x (result in radians)
#    asind(x)  = inverse sine of x (result in degrees)
#    acosd(x)  = inverse cosine of x (result in degrees)
#    atan2d(x,y) = inverse tangent of x,y (result in degrees)

function cosd(x, pi){ pi=atan2(0,-1) ; return cos(x*pi/180.) }
function sind(x, pi){ pi=atan2(0,-1) ; return sin(x*pi/180.) }
function log10(x){ return log(x)/log(10) }
function asin(x){ return atan2(x,(1.-x^2)^0.5) }
function acos(x){ return atan2((1.-x^2)^0.5,x) }
function atan(x){ return atan2(x,1) }
function asind(x, pi,rad){ pi=atan2(0,-1) ; rad=atan2(x,(1.-x^2)^0.5) ; return rad*180./pi }
function acosd(x, pi,rad){ pi=atan2(0,-1) ; rad=atan2((1.-x^2)^0.5,x) ; return rad*180./pi }
function atan2d(x,y, pi,rad){ pi=atan2(0,-1) ; rad=atan2(x,y) ; return rad*180./pi }
