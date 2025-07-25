#target tubby detection logic


#the point of detecting targeting is to avoid arguments, and automate justice.

# a target tubby is someone who goes after the player who just hit him. and not going after anyone else

# to identify this we must find out who is currently corrupted
# and then find out who was previously corrupted


#=============================================================================================================================================
# the "corrupted continuity" algorithm
# this algorith keeps track of 2 scoreboards: current_corrupted and previous_corrupted
# if the curent_corrupted attacks the previous_corrupted, then they are a target tubby

execute as @a[team=corrupted] run scoreboard players set @s current_corrupted 1


# right now whis whole function is running in between the begining of corruption swaping code and the end.
# this gives up the opportunity to detect runners with 0 health BEFORE they are corrupted.
# if this happens we set the current corrupted player to the previous corrupted player
# there can ONLY be 1 current_corruped and Previous_corrupted player at a time
execute as @a[scores={current_corrupted=1..},team=runners] run scoreboard players reset @a previous_corrupted 
execute as @a[scores={current_corrupted=1..},team=runners] run scoreboard players set @s previous_corrupted 1
# any runners in the "current_corrupted" scoreboard must be removed
execute as @a[scores={current_corrupted=1..},team=runners] run scoreboard players reset @s current_corrupted

# now check if the corrupted player is attacking the previous corrupted player
execute as @a[scores={previous_corrupted=1..}] if score @s hit_targeting matches 1.. run scoreboard players add @a[team=corrupted] target_tubby_watchlist 1
scoreboard players reset @a hit_targeting
# this is the reason we need a separate hit variable. the universal one is reset before the dectection can happen
#=============================================================================================================================================

# now that we know is targeting and even by how much. we can do something about it.
# roll the punishment rng
# stop rolling if any player has an active punishment

execute unless score trigger target_tubby_watchlist matches 1 run scoreboard players add rng target_tubby_watchlist 1
#debug
#scoreboard players set rng target_tubby_watchlist 9

# there are 3 tiers of target tubby detection.
# the "if score rng target_tubby_watchlist matches 4.." is 1 more than the inex. this is because one the number is met it imimediately resets the rng. preventing the final entry from being chosen
# thats why the list must be itself +1
execute if score rng target_tubby_watchlist matches 4.. if score setting ST____target_tubby_detection matches 1 run scoreboard players set rng target_tubby_watchlist 0
execute if score rng target_tubby_watchlist matches 7.. if score setting ST____target_tubby_detection matches 2 run scoreboard players set rng target_tubby_watchlist 0
execute if score rng target_tubby_watchlist matches 10.. if score setting ST____target_tubby_detection matches 3 run scoreboard players set rng target_tubby_watchlist 0

# each tier unlocks additional sets of punishments that can be rolled in the rng
# the tiers also derermine the tolerance of the triggering of the punishment
# "minor" target tubby detection will trigger a punisment if the target tubby watchlist is 6 or more
# "major" target tubby detection will trigger a punisment if the target tubby watchlist is 3 or more
# "extreme" target tubby detection will trigger a punisment if the target tubby watchlist is 1
execute if score setting ST____target_tubby_detection matches 1 run scoreboard players set threshold target_tubby_watchlist 6
execute if score setting ST____target_tubby_detection matches 2 run scoreboard players set threshold target_tubby_watchlist 3
execute if score setting ST____target_tubby_detection matches 3 run scoreboard players set threshold target_tubby_watchlist 2
# if a player is above the threshhold a trigger score will be activated and the punishment will be rolled
execute as @a if score @s target_tubby_watchlist = threshold target_tubby_watchlist run scoreboard players set trigger target_tubby_watchlist 1
# set the player who targeted "target_tubby_punishment_duration" to -1 to identify who is being punished
execute as @a if score @s target_tubby_watchlist matches 6 if score setting ST____target_tubby_detection matches 1 run scoreboard players set @s target_tubby_punishment_duration -1
execute as @a if score @s target_tubby_watchlist matches 3 if score setting ST____target_tubby_detection matches 2 run scoreboard players set @s target_tubby_punishment_duration -1
execute as @a if score @s target_tubby_watchlist matches 2 if score setting ST____target_tubby_detection matches 3 run scoreboard players set @s target_tubby_punishment_duration -1
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# there are 10 punishments
# punishments are as follows:
# 0. nothing happens

# 1. slight slowness for the target tubby
# 2. blindness for the target tubby
# 3. an absurd ammount of particles blocking the target tubbys vision

# 4. blindness and slowness for the target tubby
# 5. extreme slowness for the target tubby
# 6. the target tubby will have his corruption level increase by 15

# 7. the target tubby is forced to look in random directions
# 8. all runners will be made perfectly invisable for 30 seconds
# 9. all previous punishments are applied to the target tubby (exept for the corruption level increase)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# each punisment will have a specific duration, after that the target_tubby watchlist will be reset
# the punishment will be triggered if the watchlist is above the threshold
# this thresold is determined by the setting ST____target_tubby_detection
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 0 run function ctnv:target_tubby_detection/punishments/tubby_got_away_with_it
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 1 run function ctnv:target_tubby_detection/punishments/tubby_slowness
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 2 run function ctnv:target_tubby_detection/punishments/tubby_blindness
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 3 run function ctnv:target_tubby_detection/punishments/tubby_particles
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 4 run function ctnv:target_tubby_detection/punishments/tubby_blindness_and_slowness
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 5 run function ctnv:target_tubby_detection/punishments/tubby_extreme_slowness
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 6 run function ctnv:target_tubby_detection/punishments/tubby_corruption_increase
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 7 run function ctnv:target_tubby_detection/punishments/tubby_forcelook
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 8 run function ctnv:target_tubby_detection/punishments/tubby_runners_invisable
execute if score trigger target_tubby_watchlist matches 1 if score rng target_tubby_watchlist matches 9 run function ctnv:target_tubby_detection/punishments/tubby_all_combined

# count down the punishment duration
execute as @a if score @s target_tubby_punishment_duration matches 1.. run scoreboard players remove @s target_tubby_punishment_duration 1
execute as @a if score @s target_tubby_punishment_duration matches 0 run scoreboard players reset @s target_tubby_punishment_duration

#bugfix
scoreboard players reset @a[team=dead] current_corrupted
scoreboard players reset @a[team=dead] previous_corrupted


#=======================================================================================================================================
# im not adding this to the 1.0.9 patch notes

# due to a personal beef with imsqeker (the other guy working on corrupt tag). involving embarasing and insulting "debebs moments" texts
# i have decided to install malicious code desined to competly crash the game when "imsqeker" is the target tubby.

# a personalised message
execute if score trigger target_tubby_watchlist matches 1 if score imsqeker target_tubby_watchlist matches 1.. if score @a[limit=1,scores={revenge=1..}] revenge matches 1.. run tellraw @a ["\n\n\n\n\n\n I've come to make an announcement: imsqeker the team fortress 2, is a bitch-ass motherfucker. He make the ''degebs moment''. That's right, he took his hedgehog fucking quilly dick out and he make the ''degebs moment'', and he said his dick was this big. And I said ''that's disgusting!'' So I'm making a callout post on my Twitter dot com: ''imsqeker team fortress 2, you got a small dick, it's the size of this walnut except way smaller.'' And guess what, here's what my dong looks like: PFFFFFFFFGJT. That's right baby. All points, no quills, no pillows, look at that it looks like two balls and a bong. He made ''debebs moment'' so guess what, I'm gonna fuck the earth. That's right this is what you get, my super laser piss. Except I'm not gonna piss on the earth, I'm gonna go higher. I'm pissing on the moon! How do you like that, Obama? I pissed on the moon, you idiot! You have twenty-three hours before the piss droplets hit the fucking earth, now get out of my fucking sight before I piss on you too! also i installed a virus on your compter that crashed the game"]

# this code should be easy to disable in code and it shoulbe be easy to change the name of who is getting trolled
# he has never seen the code nor does he know whats going on. so its perfect
# this will come in the form of a special target tubby punishemnt
# there needs to be time for the text to display
execute if score trigger target_tubby_watchlist matches 1 if score imsqeker target_tubby_watchlist matches 1.. if score @a[limit=1,scores={revenge=1..}] revenge matches 1.. run function ctnv:target_tubby_detection/punishments/crash_the_game

# this code can be controled in game by setting the "revenge" variable
# to disable the trolling 
scoreboard players enable @a revenge