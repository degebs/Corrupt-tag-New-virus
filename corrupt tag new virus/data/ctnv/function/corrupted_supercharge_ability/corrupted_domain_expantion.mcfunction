# ingame version is slightly different to the lobby activation vesrsion


# crouch for extactly 30 ticks (1.5 seconds)
execute as @a if score @s corrupted_supercharge_detection matches 31.. run scoreboard players reset @s corrupted_supercharge_detection 

# if a team=corrupted,player is looking stait up then there score for "corrupted_supercharge_secondary_validation" will increase to 1
scoreboard players set @a corrupted_supercharge_secondary_validation 0
execute as @a if entity @s[team=corrupted,x_rotation=-90..-90] run scoreboard players set @s corrupted_supercharge_secondary_validation 1

# a team=corrupted,particle to tell when you are on the 30th tick
execute as @a[team=corrupted,scores={corrupted_supercharge_detection=30,corrupted_supercharge_secondary_validation=1}] if score confidence corrupted_domain_enable matches ..50 at @s run particle electric_spark ~ ~3 ~ 0.0 0.0 0.0 0 2 force @s
# a team=corrupted,bit more visual feedback
execute as @a[team=corrupted,scores={corrupted_supercharge_detection=29,corrupted_supercharge_secondary_validation=1}] at @s run particle bubble ~ ~3 ~ 0.0 0.0 0.0 0 2 force @s
execute as @a[team=corrupted,scores={corrupted_supercharge_detection=28,corrupted_supercharge_secondary_validation=1}] at @s run particle crit ~ ~3 ~ 0.0 0.0 0.0 0 2 force @s
# make rng less predictable
execute as @a[team=corrupted,scores={corrupted_supercharge_detection=29,corrupted_supercharge_secondary_validation=1}] at @s run scoreboard players add rng corrupted_domain_enable 1
execute if score rng corrupted_domain_enable matches 9.. run scoreboard players set rng corrupted_domain_enable 1



# now for the third part. if the player uncrouches on the 30th tick, and is looking directly up, then they will have the "corrupted_supercharge" ability enabled for the game
execute if entity @a[team=corrupted,scores={corrupted_supercharge_detection=30,corrupted_supercharge_secondary_validation=1}] run scoreboard players add confidence corrupted_domain_enable 1
execute unless entity @a[team=corrupted,scores={corrupted_supercharge_detection=30,corrupted_supercharge_secondary_validation=1}] run scoreboard players set confidence corrupted_domain_enable 0


# summon the great corrupted horror known as the "eye of pain" . he will be how the corrupted player selects what happens next

execute as @a[team=corrupted,scores={corrupted_supercharge_detection=30,corrupted_supercharge_secondary_validation=1}] if score confidence corrupted_domain_enable matches 50 run scoreboard players set the_eye_of_pain corrupted_domain_enable 1

# this function runs only once and is here only to summon the eye of pain 
execute as @a[team=corrupted,scores={corrupted_supercharge_detection=30,corrupted_supercharge_secondary_validation=1}] at @s if score confidence corrupted_domain_enable matches 50 run function ctnv:corrupted_supercharge_ability/summon_eye_of_pain


# if the corrupted player is NOT in this state then we kill the eye of pain and forget this ever happened


#execute as @a[team=corrupted,scores={corrupted_supercharge_secondary_validation=0}] if score confidence corrupted_domain_enable matches 0 run say the eye of pain is not here
execute as @a[team=corrupted,scores={corrupted_supercharge_secondary_validation=0}] if score confidence corrupted_domain_enable matches 0 run scoreboard players set the_eye_of_pain corrupted_domain_enable 0

execute as @a[team=corrupted,scores={corrupted_supercharge_secondary_validation=0}] if score confidence corrupted_domain_enable matches 0 run scoreboard players set @s corrupted_supercharge_detection 0

# this is what kills the eye of pain when you move or beak the ritual pose
execute if score the_eye_of_pain corrupted_domain_enable matches 0 run kill @e[tag=eye_of_pain]
# unfortunatly item displays with player heads ignore tags so we have to do this
execute if score the_eye_of_pain corrupted_domain_enable matches 0 run kill @e[type=item_display,nbt={item:{id:"minecraft:player_head"}}]
#=================================================================================================
# now lets set up the logic for the eye of pain
execute if score the_eye_of_pain corrupted_domain_enable matches 1 run function ctnv:corrupted_supercharge_ability/eye_of_pain


#=================================================================================
# here we must pause all deity activity if a runner died and became corrupted
# we can check this by checking if anyone has corruption stun
scoreboard players set pause corrupted_domain_enable 0
execute if entity @a[scores={corruption_stun=1..}] run scoreboard players set pause corrupted_domain_enable 1

# if a deitiey is selected run the function that summons them
execute if score deitity_id corrupted_supercharge matches 1.. run function ctnv:corrupted_supercharge_ability/panthion/super_summoner

#=================================================================================
# here every diety is given there own function to work. however. they may be paused at any time if the corrupted player enters corruption stun