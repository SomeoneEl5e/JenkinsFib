#!/bin/bash

N=2
a=1
b=1
max_limit=9223300000000000000

if [ $userInput -eq 1 ]; then
    echo "The number is in the 1 and 2 position in the Fibonacci series"
else
    while [ $b -lt $userInput ]; do
        fn=$((a + b))
        a=$b
        b=$fn
        ((N++))
    done

    if [ $b -eq $userInput ]; then
        echo "The number is in the $N position in the Fibonacci series"
    else
        echo "The number is not in the Fibonacci series"
    fi
fi
