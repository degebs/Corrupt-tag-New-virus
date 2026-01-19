


execute at @e[tag=redit_hive_mind] run particle minecraft:portal ~ ~ ~ 3 0 3 0.5 25 force @s

# stolen directly form call of corrupoted gamemode
#========================================================================================================================================================================================
# passivly spawned zombies

# calulate max spawners
# how to calulate 
# 1. have 3 as a base
# 2. add the difuculty variable.
# the final result shall be max spawners
scoreboard players set max_spawners call_of_corrupted 3
scoreboard players operation max_spawners call_of_corrupted += setting ST____COC_difuculty
# check if current spawners are = max spawners
execute if score spawners call_of_corrupted < max_spawners call_of_corrupted at @e[tag=redit_hive_mind,tag=diety] run summon bat ~ ~10 ~ {PersistenceRequired:1b,Silent:1b,Team:corrupted}
effect give @e[type=bat] invisibility infinite 1 true
# the bats can still be seen. so i will make them tiny
#execute as @e[type=bat] run attribute @s scale base set 0.1

# too many bats kill them ultil there are 4
scoreboard players set spawners call_of_corrupted 0
execute as @e[type=bat] run scoreboard players add spawners call_of_corrupted 1
execute if score spawners call_of_corrupted matches 4.. as @e[type=bat,limit=1] run kill @s

# every bat will update the count
scoreboard players set spawners call_of_corrupted 0
execute as @e[type=bat,team=corrupted] run scoreboard players add spawners call_of_corrupted 1


# to do this we need a system of flying bats that are invisable.
# these bats will do the folowing while flying around

# start by setting up the spawing timer
# more mobs will be spawned in more frequently as the dificulty increases, as well as the wave
# there need to be a separate cooldown timer to make sure that the operations can orrurt
# to caltulate the spawning timer we will need to do a few steps
# 1. set the timer to 850
# 2. subtract by the dificulty number (0, 1 ,2) multiple times
# 3. subtract by the wave number
# 4. divide by 2
# 5. if the sore at the end is below 40 set it to 40

execute if score time spawn matches 0 run scoreboard players set enable spawn 0

#1.
execute if score enable spawn matches 0 run scoreboard players set time spawn 850
#2.
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= setting ST____COC_difuculty
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= setting ST____COC_difuculty
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= setting ST____COC_difuculty

#3.
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= wave call_of_corrupted
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= wave call_of_corrupted

#4.
execute if score enable spawn matches 0 run scoreboard players operation time spawn /= multiplyer call_of_corrupted
#5.
execute if score enable spawn matches 0 if score time spawn matches ..40 run scoreboard players set time spawn 40

#re enable time
execute if score enable spawn matches 0 run scoreboard players set enable spawn 1
#start counting down
execute if score enable spawn matches 1 run scoreboard players remove time spawn 1

# actually summon mobs

# 1. summon an armorstand (so that it can drop)
# 2. the armorstand spawns in a mob
# 3. the stand dies

execute if score time spawn matches 39 at @e[type=bat] run playsound entity.goat.screaming.death hostile @a ~ ~ ~ 1 0.5 1
# if the spawn time is less than 40 start summoing the armorstand
execute if score time spawn matches 39 at @e[type=bat] run summon armor_stand ~ ~ ~ {Invisible:1b,Small:1b,DisabledSlots:1966080,Invulnerable:1b,Silent:1b,Tags:["mob_spawn"]}
# wait for the armorstand to drop
execute if score time spawn matches ..20 at @e[tag=mob_spawn] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute if score time spawn matches ..20 at @e[tag=mob_spawn] run particle end_rod ~ ~1 ~ 0 0 0 1 1 force @a

# spawn the mob
# this will require its own function
execute if score time spawn matches 3 as @e[tag=mob_spawn] at @s run summon zombie ~ ~ ~ {CustomName:[{text:Redditor,color:red}],PersistenceRequired:1b,Tags:["redditor"],Team:corrupted,equipment:{head:{id:player_head,components:{profile:{name:Reddit}}},chest:{id:netherite_chestplate},legs:{id:copper_leggings},feet:{id:copper_boots}},attributes:[{id:follow_range,base:2048f},{id:movement_speed,base:0.5f}]}
# rng for the mob spawning
execute unless score time spawn matches ..10 run scoreboard players add rng spawn 2
execute if score rng spawn matches 100.. run scoreboard players set rng spawn 0
execute if score rng spawn matches ..0 run scoreboard players set rng spawn 1


# kill the amrorstand
# teleport a random bat to the corrupted just in case
execute if score time spawn matches 2 run tp @e[type=bat,limit=1] @a[team=corrupted,limit=1]

execute if score time spawn matches ..1 as @e[tag=mob_spawn] run kill @s
# in the event that the scoreboard varibles are not there during testing (this code did not run during playtesting)
scoreboard players add time spawn 0
scoreboard players add rng spawn 0
scoreboard players add enable spawn 0
# this code will make sure that all the varibles for this entire section actually run

#========================================================================================================================================================================================
# if a runner stands within the hive mind, it will count up a timer
execute as @a[team=!corrupted] at @s if entity @e[tag=redit_hive_mind,distance=..3,type=block_display] run scoreboard players add hive_mind_kill corrupted_supercharge 1

execute as @a[team=!corrupted] at @s if entity @e[tag=redit_hive_mind,distance=..3,type=block_display] run particle minecraft:crit ~ ~1 ~ 0.5 0.5 0.5 0.1 5 force @s

execute as @a[team=!corrupted] at @s if entity @e[tag=redit_hive_mind,distance=..3,type=block_display] if score tick time matches 1 run playsound entity.phantom.ambient hostile @s ~ ~ ~ 1 1 1
execute as @a[team=!corrupted] at @s if entity @e[tag=redit_hive_mind,distance=..3,type=block_display] run playsound block.fire.extinguish hostile @s ~ ~ ~ 0.5 2 0.5
#========================================================================================================================
# if the timer reaches 1000 ( 50 seconds) then the hive mind will be destroyed
execute if score hive_mind_kill corrupted_supercharge matches 1000.. at @e[tag=redit_hive_mind] run particle explosion_emitter ~ ~1 ~ 0.5 0.5 0.5 0.1 50 force @a
execute if score hive_mind_kill corrupted_supercharge matches 1000.. at @e[tag=redit_hive_mind] run playsound entity.generic.explode hostile @a ~ ~ ~ 1 1 1
execute if score hive_mind_kill corrupted_supercharge matches 1000.. at @e[tag=redit_hive_mind] run playsound entity.goat.screaming.ambient hostile @a ~ ~ ~ 1 0.1 1

execute if score hive_mind_kill corrupted_supercharge matches 1000.. as @e[tag=redditor] run kill @e[type=bat]

execute if score hive_mind_kill corrupted_supercharge matches 1000.. as @e[tag=redit_hive_mind] run kill @s
# when the hive mind is killed,
execute if score hive_mind_kill corrupted_supercharge matches 1000.. as @e[tag=redditor] run kill @s
