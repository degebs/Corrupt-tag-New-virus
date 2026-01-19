scoreboard players add time armageddion_logic 1
scoreboard players add projectile_launch armageddion_logic 1
scoreboard players add summoner_movement armageddion_logic 1
# initialise timers
execute if score summoner_movement armageddion_logic matches 200.. run scoreboard players set summoner_movement armageddion_logic 0
execute if score projectile_launch armageddion_logic matches 60.. run scoreboard players set projectile_launch armageddion_logic 0

# make it rail crying obsidian particles around every player
execute as @a at @s run particle falling_obsidian_tear ~ ~15 ~ 3 0.5 3 0.1 10 force @a


#=================================================================================================================
# at this point the sky is full of "summoners"

# start by launching projectiles from each summoner
execute if score projectile_launch armageddion_logic matches 2 at @e[tag=summoner] run function ctnv:corrupted_supercharge_ability/arrow_ball
# prevent lag
execute if score projectile_launch armageddion_logic matches 59 run kill @e[type=arrow,tag=diety]


#=================================================================================================================
# move the summoners around by teleporting them above players
execute if score summoner_movement armageddion_logic matches 10 run tp @e[tag=summoner,limit=1] @r[team=!corrupted,sort=nearest]
execute if score summoner_movement armageddion_logic matches 10 run tp @e[tag=summoner,limit=1] ~ ~25 ~