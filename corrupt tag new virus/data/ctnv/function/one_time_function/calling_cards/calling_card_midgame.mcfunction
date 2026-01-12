# this calling card manager gives calling cards midgame

#================================================================================================================
# the weasel calling card
# given to whoever goes 10 minuts without a single percentage of corruption
execute as @a[team=runners,scores={corruption=0}] run scoreboard players add @s weasel 1
# only workes if there is NO corruption
execute as @a[scores={weasel=12000}] run advancement grant @s only ctnv:corrupt_tag/weasel
# 10 minuts is 12000 ticks

#================================================================================================================
# lofi chill calling card
# given to whoever crouches for 3 minuts
execute as @a[scores={crouch_time_calling_card=3600}] run advancement grant @s only ctnv:corrupt_tag/lofi


#================================================================================================================
# for the valhala card and the "dont wait for heros" card
# these cards are given to the player who has dealt the most damage to corrupted players
execute as @a[team=corrupted] run scoreboard players reset @s damage_dealt_to_corrupted

# valhala card
execute as @a if score @s damage_dealt_to_corrupted matches 100.. run advancement grant @s only ctnv:corrupt_tag/1v1

#================================================================================================================
# the observer calling card
# given to whoever goes 10 minuts with a lot of corruption
execute as @a[team=runners,scores={corruption=70..}] run scoreboard players add @s observer 1
execute as @a[team=!runners] run scoreboard players reset @s observer
# only workes if there is 70% or above corruption
execute as @a[scores={observer=9600}] run advancement grant @s only ctnv:corrupt_tag/observer
# 10 minuts is 12000 ticks


#================================================================================================================
#escape artist calling card
# given to whoever evades the corrupted while on 1 heart 3 times

#1 if a player is on 1 heart AND is close to the corupted the countdown starts
# however it cannot finish until the player is far away from the corrupted
execute as @a[scores={health=1}] at @s if entity @e[team=corrupted,distance=..12] run scoreboard players add @s escape_artist 1
# being corrupted resets the counter
execute as @a[team=corrupted] run scoreboard players reset @s escape_artist
# if they become 11 blocks away and have a high enough score, they get the calling card
execute as @a[scores={escape_artist=2400..}] at @s if entity @e[team=corrupted,distance=11..] run advancement grant @s only ctnv:corrupt_tag/ecape


