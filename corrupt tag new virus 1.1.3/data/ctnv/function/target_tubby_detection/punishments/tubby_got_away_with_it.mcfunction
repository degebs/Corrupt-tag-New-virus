# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 15
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================
# here we do nothing
# this is the "got away with it" punishment
execute as @a if score @s target_tubby_punishment_duration matches 14 run tellraw @a [{"selector":"@a[scores={target_tubby_punishment_duration=14}]","color":"yellow"}," ",{"text":"doesn't look like the kind of guy who would be a target tubby","color":"white"}]
#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0