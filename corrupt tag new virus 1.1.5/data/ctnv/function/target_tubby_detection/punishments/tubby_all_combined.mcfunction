# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 200
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================
# this first one does not make a lot of sense
#execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_got_away_with_it
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_slowness
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_blindness
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_particles
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_blindness_and_slowness
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_extreme_slowness
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_corruption_increase
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_forcelook
execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_runners_invisable
#execute as @a if score @s target_tubby_punishment_duration matches 10.. run function ctnv:target_tubby_detection/punishments/tubby_all_combined
# DO NOT ALLOW THIS SHIT TO RUN RECUSRIVLY. it will crash everything!!!!!!!
#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0