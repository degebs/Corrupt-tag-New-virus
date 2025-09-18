# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 400
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================

execute as @a if score @s target_tubby_punishment_duration matches 399 run tellraw @a [{"selector":"@a[team=corrupted]","color":"red"}," ",{"text":"IS A TARGET TUBBY!  ","color":"gold"},{"text":"You smell so bad the stink lines are visable.","color":"white"}]
execute as @a at @s if score @s target_tubby_punishment_duration matches 10.. run particle squid_ink ~ ~1 ~ 0.5 0.5 0.5 0.01 100 force @a
execute as @a at @s if score @s target_tubby_punishment_duration matches 10.. run particle glow_squid_ink ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force @a
execute as @a at @s if score @s target_tubby_punishment_duration matches 10.. run particle squid_ink ^ ^1 ^4 0.5 0.5 0.5 0.01 100 force @s
execute as @a at @s if score @s target_tubby_punishment_duration matches 10.. run particle squid_ink ^ ^1 ^-4 0.5 0.5 0.5 0.01 100 force @s

#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0