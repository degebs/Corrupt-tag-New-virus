# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
#4. at the end of the punishment disalbe the trigger
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 200
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================
execute as @a if score @s target_tubby_punishment_duration matches 199 run tellraw @a [{"selector":"@a[team=corrupted]","color":"red"}," ",{"text":"IS A TARGET TUBBY!  ","color":"gold"},{"text":"You need to slow down and stop being cringe.","color":"white"}]
execute as @a if score @s target_tubby_punishment_duration matches 199 run attribute @s movement_speed base set 0.04
execute as @a if score @s target_tubby_punishment_duration matches 10 run attribute @s movement_speed base reset
# we use attributes to that anyone with resisances like the knight cannot defeeat it
#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0