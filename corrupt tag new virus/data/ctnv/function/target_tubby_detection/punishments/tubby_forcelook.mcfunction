# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 200
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================
execute as @a if score @s target_tubby_punishment_duration matches 199 run tellraw @a [{"selector":"@a[team=corrupted]","color":"red"}," ",{"text":"IS A TARGET TUBBY!  ","color":"gold"},{"text":"Please just go and look at ANYTHING ELSE","color":"white"}]
# force the corrupted to look at the corrupted part, the armorstand used to determine the nearest corrupted
execute as @a[scores={target_tubby_punishment_duration=2..}] at @s if score @s target_tubby_punishment_duration matches 1.. run tp @s ~ ~ ~ facing entity @e[type=armor_stand,tag=corruption_part,limit=1,sort=nearest] eyes
execute as @a[scores={target_tubby_punishment_duration=2..}] at @s if score @s target_tubby_punishment_duration matches 1.. run particle angry_villager ~ ~ ~ 3 3 3 0.01 1 force @a

#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0