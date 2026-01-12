# this script is used to manage calling cards in the game
# this script will be trigger once and will be ran as the surviving players

# i will be honest, the way the achievements are set up is a bit of a mess.
# there was no organization in the writing of the calling cards. we just wrote the names of songs and movies that we liked. and used them as the names of the calling cards.

#===============================================================================================================
# victory classs specific calling cards

# 1. check if the game mode is corrupted tag or cranked it or class swappers. these are the game modes where there can be only 1 winner
execute if score game state matches 3 run scoreboard players set enable runner_class_victory_calling_card 1
execute if score game state matches 5 run scoreboard players set enable runner_class_victory_calling_card 1
execute if score game state matches 8 run scoreboard players set enable runner_class_victory_calling_card 1

# 2. check who is alive and what class they are playing
execute if entity @s[scores={class=1}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/goated
execute if entity @s[scores={class=2}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/archer_win
execute if entity @s[scores={class=3}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/bulk

execute if entity @s[scores={class=4}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/assassinwin

execute if entity @s[scores={class=5}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/stunmanwin

execute if entity @s[scores={class=6}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/fisherman

execute if entity @s[scores={class=7}] if score enable runner_class_victory_calling_card matches 1 run advancement grant @s only ctnv:corrupt_tag/miner

#===============================================================================================================
# calculate who has run the most distance
scoreboard players reset max_distance running_distance
scoreboard players operation max_distance running_distance = @a[scores={running_distance=1..}] running_distance
execute as @a if score @s running_distance = max_distance running_distance if score tick time matches 10 run advancement grant @s only ctnv:corrupt_tag/sane_bolt

# acheivement for the player who has run the most distance

#================================================================================================================
# for the valhala card and the "dont wait for heros" card
# these cards are given to the player who has dealt the most damage to corrupted players
# this is the cecond part of this particular card

scoreboard players reset max_ammount damage_dealt_to_corrupted
scoreboard players operation max_ammount damage_dealt_to_corrupted = @a[scores={damage_dealt_to_corrupted=1..}] damage_dealt_to_corrupted
execute as @a if score @s damage_dealt_to_corrupted = max_ammount damage_dealt_to_corrupted if score tick time matches 5 run advancement grant @s only ctnv:corrupt_tag/valhalla


#================================================================================================================
# calculate the "Chin Music for the Unsuspecting Hero" card
# given to a player who wins with 90% or higher
execute as @a[team=runners,scores={corruption=90..}] if score enable runner_class_victory_calling_card matches 1 if score tick time matches 1 run advancement grant @s only ctnv:corrupt_tag/chin_music