# set the endgame flag (if it isnt already set)
execute unless score endgame state matches 1 run scoreboard players set endgame state 1

# the endgame timer
bossbar set game_time name {"text":"ENDGAME Time: ","color":"red","extra":[{"score":{"name":"hours","objective":"time"},"color":"red"},{"text":":","color":"light_purple"},{"score":{"name":"minutes","objective":"time"},"color":"red"},{"text":":","color":"light_purple"},{"score":{"name":"seconds","objective":"time"},"color":"red"}]}


# style the bossbar
execute if score tick time matches 1 run bossbar set minecraft:game_time style notched_6

execute if score tick time matches 4 run bossbar set minecraft:game_time style notched_10

execute if score tick time matches 8 run bossbar set minecraft:game_time style notched_12

execute if score tick time matches 12 run bossbar set minecraft:game_time style notched_20

execute if score tick time matches 16 run bossbar set minecraft:game_time style progress
# color the bossbar
execute if score seconds time matches 1 run bossbar set minecraft:game_time color red
execute if score seconds time matches 10 run bossbar set minecraft:game_time color pink
execute if score seconds time matches 20 run bossbar set minecraft:game_time color red
execute if score seconds time matches 30 run bossbar set minecraft:game_time color pink
execute if score seconds time matches 40 run bossbar set minecraft:game_time color red
execute if score seconds time matches 50 run bossbar set minecraft:game_time color pink


# im thinking of a way to use the subtitle tile command to increase player stress
#title @a subtitle {"text":"test"}



#==============================================================================================================
# calling card
# the "forget you" calling card
# aquired by witnessing a ragequit during the endgame

#1 compare the "players_waiting" variable to the "online" variable
execute unless score Online players_online = players_waiting players_online run advancement grant @a only ctnv:corrupt_tag/forget_you