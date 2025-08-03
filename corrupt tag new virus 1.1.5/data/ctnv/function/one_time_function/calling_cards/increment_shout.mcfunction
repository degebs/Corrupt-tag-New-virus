# here this entire function is dedicated to increment the number to unlock the "shout" calling card

scoreboard players add @s shout 1
execute if score @s shout matches 6 run advancement grant @s only ctnv:corrupt_tag/shout
execute if score @s shout matches 6 run scoreboard players reset @s shout