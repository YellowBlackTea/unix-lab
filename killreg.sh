#!/bin/sh
function killreg
{
    # first case: if no argument is input
    if [ $# -eq 0 ]; 
    then
        echo "Error, at least one argument is required !
Usage: ./killreg [-SIGNAL] <PATTERN>
    -SIGNAL: an optional signal to pass to the programs that match the <PATTERN>, e.g., -9, -TERM, etc. By default the -TERM signal is sent.
    PATTERN: a requried pattern, ./killreg kills all processes which match this pattern.";
    fi;
    
    # second case: if one argument is input. We assume that the first argument is always the pattern of the process we want to kill.
    if [ $# -eq 1 ]; 
    then
        # create a list with every process having the same pattern as the first argument
        list=$(echo `ps | awk '{print $4}' | sed -e '1d' -e '2d'| grep ^$1`);       
            # ps to show all processes currently running
            # awk to only print the last column of the ps
            # sed to delete the first line (CMD) and the second line (-bash)
            # grep to only select processes with the same pattern as the first argument
        
        for i in $list; do
            killall -15 $i 2>/dev/null;          # 2>/dev/null to ignore the error if in the list, more than once the same process is found
        done;
    fi;

    # third case: if two arguments are input
    if [ $# -eq 2 ];                                
    then
        #hyphen=$("`echo $1 | grep ^-`" != "");
        # if there is no hyphen on the first argument, print the error
        if [ "`echo $1 | grep ^-`" == "" ];       # if there is no hypen, the output is empty; if there is a hyphen, the output is not empty
        then 
            echo "Error, the first argument must start with a hyphen
Usage: ./killreg [-SIGNAL] <PATTERN>
    -SIGNAL: an optional signal to pass to the programs that match the <PATTERN>, e.g., -9, -TERM, etc. By default the -TERM signal is sent.
    PATTERN: a requried pattern , ./killreg kills all processes which match this pattern."; 
        # else (=there is a hyphen), kill processes
        else
            # create a list with every process having the same pattern as second argument
            list=$(echo `ps | awk '{print $4}' | sed -e '1d' -e '2d'| grep ^$2`);       
                # ps to show all processes currently running
                # awk to only print the last column of the ps
                # sed to delete the first line (CMD) and the second line (-bash)
                # grep to only select processes with the same pattern as the first argument

            for i in $list; do
                killall $1 $i 2>/dev/null;          # 2>/dev/null to ignore the error if in the list, more than once the same process is found
            done;
        fi;
    fi;
}
killreg $1 $2