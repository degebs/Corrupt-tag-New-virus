# here is the logic that runs ONLY when the game starts. or when a round ends
clear @a
#anyone with the score "current_corrupted" shall have there team to "corrupted"
execute as @a[scores={current_corrupted=1}] run team join corrupted @s
# this is just for the very begining

# disable corruption below the runners name. its irrelavent
scoreboard objectives setdisplay below_name

# wave counter
scoreboard players add wave call_of_corrupted 1
#itle @a title [{"text":"WAVE: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}}]
title @a title [{"text":"Intermission","color":"red"}]

# points (for the hud to not break)
scoreboard players add @a[team=!corrupted] points 0

# make the corrupted into intermission mode
scoreboard players set intermission call_of_corrupted 1
scoreboard players set atherial_corrupted call_of_corrupted 0

# the points are visable in the tab menu
scoreboard objectives setdisplay list points
scoreboard objectives setdisplay below_name points

# give some time before the mobs start spawning
scoreboard players set time spawn 600

#======================================================================================================================================================
#set all runners health to the max
tp @a[team=dead] @a[team=runners,limit=1]
execute as @a if score @s health < setting ST____max_health run scoreboard players operation @s health = setting ST____max_health
scoreboard players set @a bouncer_list 1
execute as @a[team=dead] run team join runners
gamemode adventure @a
kill @e[type=shulker,tag=!wall]
# walls will presist between rounds


#======================================================================================================================================================
# calling card
execute if score wave call_of_corrupted matches 4 run advancement grant @a[team=runners] only ctnv:corrupt_tag/dolls


# if a player with class of 0 exists give them a random class
execute as @a if score @s class matches 0 run scoreboard players operation @s class = rng class