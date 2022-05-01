#!/bin/sh

function calculator
{
    export VAR=$1; let "VAR=VAR+$2"; echo "sum $1 + $2 = $VAR";
    export VAR=$1; let "VAR=VAR-$2"; echo "diff $1 - $2 $VAR";
    export VAR=$1; let "VAR=VAR*$2"; echo "mult $1 * $2 = $VAR";
    export VAR=$1; let "VAR=VAR/$2"; echo "div $1 / $2 = = $VAR";
}

calculator $1 $2