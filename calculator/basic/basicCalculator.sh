# Code written by Rohit Sattu

#!/bin/sh

if [ $# -ne 3 ]
then
        echo "Usage: sh $0 operand1 operator operand2"
        exit 1
fi

pow_func () {
        result=$1
        i=1;
        while [ $i -lt $2 ]
        do
                result=`expr $result \* $1`
                i=`expr $i + 1`
        done
        echo $result
}

if [ $2 = "+" ]
then
        echo `expr $1 + $3`
elif [ $2 = "-" ]
then
        echo `expr $1 - $3`
elif [ $2 = "x" ]
then
        echo `expr $1 \* $3`
elif [ $2 = "/" ]
then
        echo `expr $1 / $3`
elif [ $2 = "%" ]
then
        echo `expr $1 % $3`
elif [ $2 = "^" ]
then
        echo `pow_func $1 $3`
else
        echo "Error: Invalid operator"
        exit 1
fi

