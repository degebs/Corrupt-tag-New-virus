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
execute if score projectile_launch armageddion_logic matches 2 as @e[tag=summoner] run function ctnv:corrupted_supercharge_ability/arrow_ball
# prevent lag
execute if score projectile_launch armageddion_logic matches 59 run kill @e[type=arrow,tag=diety]


#=================================================================================================================
# move the summoners around by teleporting them above players
execute if score summoner_movement armageddion_logic matches 10 run tp @e[tag=summoner,limit=2] @r[team=!corrupted,sort=nearest]
execute if score summoner_movement armageddion_logic matches 10 at @s unless score time armageddion_logic matches 5800.. run tp @e[tag=summoner,limit=2] ~ ~4 ~
execute if score summoner_movement armageddion_logic matches 10 as @e[tag=summoner,limit=2,sort=nearest] at @s run tp @s ~ ~ ~ facing entity @p eyes

# more summoner movement
execute if score summoner_movement armageddion_logic matches 100 run tp @e[tag=summoner,limit=2,sort=furthest] @r[team=!corrupted,sort=random]
execute if score summoner_movement armageddion_logic matches 100 at @s unless score time armageddion_logic matches 9800.. run tp @e[tag=summoner,limit=2,sort=furthest] ~ ~15 ~
execute if score summoner_movement armageddion_logic matches 100 as @e[tag=summoner,limit=2,sort=furthest] at @s run tp @s ~ ~ ~ facing entity @p eyes


# if too close to players, move them higher
execute as @e[tag=summoner] at @s if entity @p[distance=..10,team=!corrupted] run tp @s ~ ~0.3 ~
execute as @e[tag=summoner] at @s if entity @p[distance=..10,team=!corrupted] run playsound block.beacon.deactivate ambient @a ~ ~ ~ 1 0.5 1
execute as @e[tag=summoner] at @s if entity @p[distance=..10,team=!corrupted] run function ctnv:corrupted_supercharge_ability/swirl_particle

# all of them will slowly move forward
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 10 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 20 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 30 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 40 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 50 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 60 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 70 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 80 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 90 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 100 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 110 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 120 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 130 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 140 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 150 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 160 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 170 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 180 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 190 run tp @s ^0.0 ^0.0 ^0.5
execute as @e[tag=summoner] at @s if score summoner_movement armageddion_logic matches 200 run tp @s ^0.0 ^0.0 ^0.5

#=================================================================================================================
# one of the must terrifying parts. summoning lightning bolts at the arrows
execute as @e[type=arrow,tag=diety,sort=random,limit=1] at @s if score time armageddion_logic matches 200.. run summon lightning_bolt ~ ~1 ~


execute as @e[type=arrow,tag=diety,sort=random,limit=4] at @s if score time armageddion_logic matches 2000.. run summon lightning_bolt ~ ~1 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=5] at @s if score time armageddion_logic matches 2600.. run summon lightning_bolt ~ ~1 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=6] at @s if score time armageddion_logic matches 3200.. run summon lightning_bolt ~ ~2 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=7] at @s if score time armageddion_logic matches 3800.. run summon lightning_bolt ~ ~2 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=8] at @s if score time armageddion_logic matches 4400.. run summon lightning_bolt ~ ~2 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=9] at @s if score time armageddion_logic matches 5000.. run summon lightning_bolt ~ ~3 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=10] at @s if score time armageddion_logic matches 5600.. run summon lightning_bolt ~ ~3 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=11] at @s if score time armageddion_logic matches 6200.. run summon lightning_bolt ~ ~3 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=12] at @s if score time armageddion_logic matches 6800.. run summon lightning_bolt ~ ~-3 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=13] at @s if score time armageddion_logic matches 7400.. run summon lightning_bolt ~ ~-4 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=14] at @s if score time armageddion_logic matches 8000.. run summon lightning_bolt ~ ~-4 ~

execute as @e[type=arrow,tag=diety,sort=random,limit=15] at @s if score time armageddion_logic matches 8600.. run summon lightning_bolt ~ ~-4 ~
execute if score time armageddion_logic matches 8600.. run effect give @a[team=runners] blindness 20 1 true

execute as @e[type=arrow,tag=diety,sort=random,limit=16] at @s if score time armageddion_logic matches 9200.. run summon lightning_bolt ~ ~ ~

execute as @e[type=arrow,tag=diety,sort=random,limit=17] at @s if score time armageddion_logic matches 9800.. run summon lightning_bolt ~ ~ ~

execute as @e[type=arrow,tag=diety,sort=furthest,limit=18] at @s if score time armageddion_logic matches 10400.. run summon lightning_bolt ~ ~ ~

execute as @e[type=arrow,tag=diety,sort=nearest,limit=19] at @s if score time armageddion_logic matches 10900.. run summon lightning_bolt ~ ~ ~

execute as @e[type=arrow,tag=diety] at @s if score time armageddion_logic matches 11000.. run summon lightning_bolt ~ ~ ~

#=================================================================================================================
# the screaming will be uneading
# random scream sound effects around players
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 300..400 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.2 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 900..1000 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.3 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 1500..1600 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.5 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 2100..2200 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.5 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 2700..2800 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.6 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 3300..3400 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.7 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 3900..4000 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.8 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 4500..4600 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 0.9 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 5100..5200 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.0 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 5700..5800 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.1 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 6300..6400 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.2 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 6900..7000 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.3 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 7500..7600 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.4 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 8100..8200 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.5 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 8700..8800 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.6 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 9300..9400 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.7 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 9900..10000 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.8 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 10500..10600 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 1.9 1
execute as @a at @s if score 360 time matches 10 if score time armageddion_logic matches 11100..11200 run playsound entity.evoker.prepare_wololo ambient @a ~ ~ ~ 1 2.0 1

#=================================================================================================================
# end the whole thing after a while
execute if score time armageddion_logic matches 11000.. run weather clear
execute if score time armageddion_logic matches 11000.. run kill @e[tag=summoner]
execute if score time armageddion_logic matches 11000.. run kill @e[type=arrow,tag=diety]
execute if score time armageddion_logic matches 11000.. run kill @e[tag=evil_cloud]
