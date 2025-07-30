
#=========================================================================================================================
# update the scoreboard
execute as @a[team=!dead] run scoreboard players operation @s CORRUPTION_track_for_dead = @s corruption
scoreboard players reset @a[team=dead] CORRUPTION_track_for_dead

scoreboard objectives setdisplay sidebar.team.black CORRUPTION_track_for_dead


#=========================================================================================================================
# ensure that the dead cannot go too far away from the living
execute as @a[team=dead] at @s unless entity @a[team=!dead,distance=..60] run tellraw @s [{"text":"you cannot go that far","color":"gold"}]
#quick ester egg
execute as @a[team=dead] at @s unless entity @a[team=!dead,distance=..60] if score 360 time matches 15 run tellraw @a [{"text":"there is no ecape for you, you are dead and dont you forget it!","color":"dark_aqua"}]
# do the tp
execute as @a[team=dead] at @s unless entity @a[team=!dead,distance=..60] run tp @s @r[team=!dead]