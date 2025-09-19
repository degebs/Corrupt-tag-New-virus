# here is the start of a secret tool that all corrupted players can use, if they know the secret move set required to use it

# how it works is that you must do the move set in the lobby to enable it for the game.

# the move set in question is 
# look directly up
# crouch for extactly 25 ticks (1.25 seconds)
execute as @a if score @s corrupted_supercharge_detection matches 26.. run scoreboard players reset @s corrupted_supercharge_detection 

# if a player is looking stait up then there score for "corrupted_supercharge_secondary_validation" will increase to 1
scoreboard players set @a corrupted_supercharge_secondary_validation 0
execute as @a if entity @s[x_rotation=-90..-90] run scoreboard players set @s corrupted_supercharge_secondary_validation 1

# a particle to tell when you are on the 25th tick
execute as @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] at @s run particle electric_spark ~ ~3 ~ 0.0 0.0 0.0 0 2 force @s
# a bit more visual feedback
execute as @a[scores={corrupted_supercharge_detection=24,corrupted_supercharge_secondary_validation=1}] at @s run particle bubble ~ ~3 ~ 0.0 0.0 0.0 0 2 force @s
execute as @a[scores={corrupted_supercharge_detection=23,corrupted_supercharge_secondary_validation=1}] at @s run particle crit ~ ~3 ~ 0.0 0.0 0.0 0 2 force @s



# now for the third part. if the player uncrouches on the 25th tick, and is looking directly up, then they will have the "corrupted_supercharge" ability enabled for the game
execute if entity @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] run scoreboard players add confidence corrupted_domain_enable 1
execute unless entity @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] run scoreboard players set confidence corrupted_domain_enable 0


# add a little bit of particle effects to show that the ability has been enabled
execute as @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] if score confidence corrupted_domain_enable matches 50 run title @s title {"text":" ","color":"dark_purple"}
execute as @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] if score confidence corrupted_domain_enable matches 50 run title @s subtitle {"text":"you have awakened something truly terrible","color":"dark_purple"}
execute as @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] if score confidence corrupted_domain_enable matches 50 run playsound block.sculk_shrieker.shriek hostile @s ~ ~ ~ 1 0.1 1 

# if the confience variable is 50 then we know for sure that the player did the move set correctly
execute if score confidence corrupted_domain_enable matches 50.. run scoreboard players set @s corrupted_domain_enable 1

# just in case the 1st one does not work
execute as @a[scores={corrupted_supercharge_detection=25,corrupted_supercharge_secondary_validation=1}] if score confidence corrupted_domain_enable matches 50 run scoreboard players set enable corrupted_domain_enable 1

# this whole thing is done so that the secret tools can be unlocked in the lobby.
# i will have to reuse this code during the actuall game

# this is what selects what deity the corrupted player will use
# for now it will be 0 so that no deity is selected, the purpouse of the eye of pain is to select a deity to summon
scoreboard players set deitity_id corrupted_supercharge 0