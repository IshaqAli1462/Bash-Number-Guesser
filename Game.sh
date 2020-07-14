#!/bin/bash

# rannum=$(((RANDOM % 10) + 1 ))  Random has range of 0-32767, modulo (%) divides it by the amount stated, so 10 and then takes the remainder to use. 
valid='0-9' # Trying regex, might break

function start
{
rannum=$(((RANDOM % 10) + 1 ))	
echo "Please pick a number between 1 and 10"
read guess
if (( $guess == $rannum ));
then
sleep .4	
echo "Well done $name, you got it right. The number was '$rannum'"
sleep .6
playagain
elif [[  $guess =~ [$valid] ]];
then
sleep .4
echo "Unlucky $name, you got it wrong. The number was '$rannum'"
sleep .6
playagain
else
echo "ERROR: Game can only accept a number!"
sleep 2
start
fi
}

function playagain
{
echo "Do you want to play again? (y/n)"
read playerinput
if [ "$playerinput" = "y" ];
then
start
elif [ "$playerinput" = "n" ]; 
then
echo "Thanks for playing!"
sleep .5
exit 0
else
echo "ERROR: Enter only (y/n)"
sleep 2
playagain
fi
}

echo "Please enter your name"
read name 
echo "Welcome $name to guessing game!"
sleep .6
start



