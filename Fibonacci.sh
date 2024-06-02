#!/bin/bash

N=2
a=1
b=1
max_limit=9223300000000000000

# Prompt the user for input and validate it

echo "Please enter a positive integer up to $max_limit:" 
read -p "> " userInput
while ! [[ $userInput =~ ^[0-9]+$ ]] || [ $userInput -gt $max_limit ];
do
    echo "Invalid input. Please enter a positive integer up to $max_limit."
    read -p "> " userInput
done

# Convert userInput to an integer
userInput=$((userInput))

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
