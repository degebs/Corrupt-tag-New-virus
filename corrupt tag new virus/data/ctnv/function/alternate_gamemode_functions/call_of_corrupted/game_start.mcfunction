# here is the logic that runs ONLY when the game starts. or when a round ends

#anyone with the score "current_corrupted" shall have there team to "corrupted"
execute as @a[scores={current_corrupted=1}] run team join corrupted @s
# this is just for the very begining

# disable corruption below the runners name. its irrelavent
scoreboard objectives setdisplay below_name

# wave counter
scoreboard players add wave call_of_corrupted 1
title @a title [{"text":"WAVE: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}}]

# points (for the hud to not break)
scoreboard players add @a[team=!corrupted] points 0

# make the corrupted into intermission mode
scoreboard players set intermission call_of_corrupted 0
scoreboard players set atherial_corrupted call_of_corrupted 2

# the points are visable in the tab menu
scoreboard objectives setdisplay list points
scoreboard objectives setdisplay below_name points

# give some time before the mobs start spawning
scoreboard players set time spawn 1000

#======================================================================================================================================================
#set all runners health to the max
tp @a[team=dead] @a[team=runners,limit=1]
execute as @a if score @s health < setting ST____max_health run scoreboard players operation @s health = setting ST____max_health
scoreboard players set @a bouncer_list 1
execute as @a[team=dead] run team join runners
gamemode adventure @a
kill @e[type=shulker,tag=!wall]
# walls will presist between rounds

# if the game mode is call of corrupted set the arrow count to 99
# this code is stolen from the setup
execute if score setting ST____game_mode matches 4 run scoreboard players set @a acher_arrow_count 99


#======================================================================================================================================================
# calling card
execute if score wave call_of_corrupted matches 4 run advancement grant @a[team=runners] only ctnv:corrupt_tag/dolls