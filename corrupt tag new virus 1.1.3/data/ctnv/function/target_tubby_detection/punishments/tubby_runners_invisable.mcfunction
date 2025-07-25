# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 200
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 199 run tellraw @a [{"selector":"@a[team=corrupted]","color":"red"}," ",{"text":"IS A TARGET TUBBY!  ","color":"gold"},{"text":"Good luck targeting now idiot","color":"white"}]
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 10.. run effect give @a[team=runners] invisibility 30 1 true
execute as @a[scores={target_tubby_punishment_duration=190..}] at @s if score @s target_tubby_punishment_duration matches 190.. run particle minecraft:end_rod ~ ~1 ~ 0.5 0.5 0.5 0.01 100 force @a

#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0