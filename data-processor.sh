#!/bin/sh

#curl -L https://bit.ly/2ATet9V > data.csv   # store the data into a file named data.csv

sed -e 's/,/ /g' -e '1d' data.csv | awk '{print $2, $3, $4}' | sed -e 's/@.*/@****.***/' -e 's/ /, /2'
# first sed: to replace every comma (,) to a whitespace ( ) + delete the first line (id,first_name,last_name,email)
# first awk: print the second, third and last column (first_name last_name email)
# second sed: to change everything after the @ to @****.*** + change the whitespace (last_name email) to comma-whitespace (last_name, email)
