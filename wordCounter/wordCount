# Code written by Rohit Sattu

#!/bin/sh

if [ $# -ne 1 ]; then
        echo "Usage: sh $0 filename"
        exit 1
fi

if ! [ -f $1 ]; then
        echo "File $1 does not exist"
        exit 1
fi

if ! [ -s $1 ]; then
        echo "File $1 is empty"
        exit 1
fi

tr -sc a-zA-Z '\012' < $1 |
tr A-Z a-z |
sort |
uniq -c |

while read count word
do
        echo $word $count
done

exit 0
