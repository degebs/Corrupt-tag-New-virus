# this kills everything
kill @e[type=turtle]
kill @e[type=armor_stand]
forceload remove all
scoreboard objectives remove ordered_map_list
scoreboard objectives remove map_list
scoreboard objectives remove map_selection
function ctnv:one_time_function/remove_all_scoreboards

tellraw @a ["",{"text":"all beacons have been destroyed you will have to summon new ones","color":"red"}]

reload