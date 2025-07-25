# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 150
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================
execute as @a if score @s target_tubby_punishment_duration matches 149 run tellraw @a [{"selector":"@a[team=corrupted]","color":"red"}," ",{"text":"IS A TARGET TUBBY!  ","color":"gold"},{"text":"You have had ENOUGH of thay guy. Go after someone else.","color":"white"}]
execute as @a if score @s target_tubby_punishment_duration matches 149 run attribute @s movement_speed base set 0.0
execute as @a if score @s target_tubby_punishment_duration matches 10 run attribute @s movement_speed base reset
execute as @a if score @s target_tubby_punishment_duration matches 149 run attribute @s jump_strength base set 0.0
execute as @a if score @s target_tubby_punishment_duration matches 10 run attribute @s jump_strength base reset
# we use attributes to that anyone with resisances like the knight cannot defeeat it

# more insulting messages
execute as @a if score @s target_tubby_punishment_duration matches 100 run tellraw @a ["Dont even thing about doing that again"]
execute as @a if score @s target_tubby_punishment_duration matches 5 run tellraw @a ["Alright buddy, im gonna let you go, but you better not do that again"]
#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0