# here all the traps are managed


#============================================================================================================
#count all traps



# the traps are represented with multiple display entity. this will need to be accouned for befroe we can limit the number of traps
# for the stunman trap, there are 2 display components. so in order to do it correctly we need to divide by 2

# it is CRITICAL TO note that if the display entitys for the traps are edited. the divisor in each test code chunk will need to be changed
# in order to accuratly count the traps
# every trap shall be checked separatly

# when making new traps, always count the number of display entitys used

#stunman traps
scoreboard players set stunman_trap_components trap_stats 0
execute as @e[tag=stunman_trap] run scoreboard players add stunman_trap_components trap_stats 1
scoreboard players set divider trap_stats 2
scoreboard players operation stunman_trap_count trap_stats = stunman_trap_components trap_stats
scoreboard players operation stunman_trap_count trap_stats /= divider trap_stats

# hunter t1 traps
scoreboard players set corrupted_t1_trap_components trap_stats 0
execute as @e[tag=corrupted_t1_trap] run scoreboard players add corrupted_t1_trap_components trap_stats 1
scoreboard players set divider trap_stats 2
scoreboard players operation corrupted_t1_trap_count trap_stats = corrupted_t1_trap_components trap_stats
scoreboard players operation corrupted_t1_trap_count trap_stats /= divider trap_stats

# hunter t2 traps
scoreboard players set corrupted_t2_trap_components trap_stats 0
execute as @e[tag=corrupted_t2_trap] run scoreboard players add corrupted_t2_trap_components trap_stats 1
scoreboard players set divider trap_stats 2
scoreboard players operation corrupted_t2_trap_count trap_stats = corrupted_t2_trap_components trap_stats
scoreboard players operation corrupted_t2_trap_count trap_stats /= divider trap_stats

# hunter t3 traps
# this is soon to change with a new model that is 6 parts
# 2 more if you include the 2 mobs controling it
scoreboard players set corrupted_t3_trap_components trap_stats 0
execute as @e[tag=corrupted_t3_trap] run scoreboard players add corrupted_t3_trap_components trap_stats 1
scoreboard players set divider trap_stats 8
scoreboard players operation corrupted_t3_trap_count trap_stats = corrupted_t3_trap_components trap_stats
scoreboard players operation corrupted_t3_trap_count trap_stats /= divider trap_stats

# fisherman trap
scoreboard players set fishing_net_trap_components trap_stats 0
execute as @e[tag=fishing_net_trap] run scoreboard players add fishing_net_trap_components trap_stats 1
scoreboard players set divider trap_stats 8
scoreboard players operation fishing_net_trap_count trap_stats = fishing_net_trap_components trap_stats
scoreboard players operation fishing_net_trap_count trap_stats /= divider trap_stats



# check if eack trap type is above the limit
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# stunman trap killer
#1. summor the trap killer
execute if score stunman_trap_count trap_stats > limit trap_stats run execute at @r run summon armor_stand ~ ~ ~ {Pose:{Head:[0f,0f,181f]},NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["trap_killer"]}
#2. teleport the trap killer to a random trap
execute if score stunman_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=stunman_trap,limit=1,sort=random] 
#3. make sure that the one to kill is not the one imidiatly placed
execute if score stunman_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
#4. kill any offending trap
execute if score stunman_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=stunman_trap,distance=..0.1]
#5. remove the trap killer
execute if score stunman_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# hunter t1 trap killer
#1. summon the trap killer
execute if score corrupted_t1_trap_count trap_stats > limit trap_stats run execute at @r run summon armor_stand ~ ~ ~ {Pose:{Head:[0f,0f,181f]},NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["trap_killer"]}
#2. teleport the trap killer to a random trap
execute if score corrupted_t1_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=corrupted_t1_trap,limit=1,sort=random]
#3. ensure it's not the one just placed
execute if score corrupted_t1_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
#4. kill offending trap
execute if score corrupted_t1_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=corrupted_t1_trap,distance=..0.1]
#5. remove trap killer
execute if score corrupted_t1_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# hunter t2 trap killer
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats run execute at @r run summon armor_stand ~ ~ ~ {Pose:{Head:[0f,0f,181f]},NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["trap_killer"]}
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=corrupted_t2_trap,limit=1,sort=random]
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=corrupted_t2_trap,distance=..0.1]
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# hunter t3 trap killer
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats run execute at @r run summon armor_stand ~ ~ ~ {Pose:{Head:[0f,0f,181f]},NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["trap_killer"]}
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=corrupted_t3_trap,limit=1,sort=random]
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=corrupted_t3_trap,distance=..0.1]
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# fisherman trap killer
execute if score fishing_net_trap_count trap_stats > limit trap_stats run execute at @r run summon armor_stand ~ ~ ~ {Pose:{Head:[0f,0f,181f]},NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["trap_killer"]}
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=fishing_net_trap,limit=1,sort=random]
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=fishing_net_trap,distance=..0.1]
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s








#============================================================================================================
# tier 1 artificer trap 

# this trap is a simple trap that will stun the player for 3 seconds




execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run particle explosion ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5

execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run effect give @a[distance=..4,team=runners] slowness 3 10
execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run kill @s



#============================================================================================================
# tier 2 artificer trap

# same as tier 1 trap exept it expodes bigger, stuns for longer, and does 1 heart of damage

execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run particle explosion_emitter ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 0.5 0.5


execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run effect give @a[distance=..6,team=runners] slowness 6 10
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run effect give @a[distance=..6,team=runners] darkness 6 10
# remove 1 health from runner (MAKE SURE THAT THIS ONLY HAPPENS TO 1 RUNNER)
# this does 2 damage for some reason
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run scoreboard players remove @a[distance=..1.5,team=runners,limit=1] health 1


execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run kill @s


# make sure that there cannot be a negative health
execute as @a if score @s health matches ..-1 run scoreboard players set @s health 0 

#============================================================================================================
# tier 3 artificer trap.
#constantly teleport the guardian to the trap 
effect give @e[type=guardian] invisibility infinite 1 true
# give the guardian some particles. the corrupted one can see the guardian, thats bad
execute at @e[type=guardian] run particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0 2 normal @a
execute at @e[type=guardian] run particle flame ~ ~0.3 ~ 0.1 0.3 0.1 0 3 normal @a


# if anyone is above 100% corruption kill the trap t3 and t2, this is to prevent a softlock
execute as @a[scores={corruption=100..},team=corrupted] run kill @e[tag=corrupted_t3_trap]
execute as @a[scores={corruption=100..},team=corrupted] run kill @e[tag=corrupted_t2_trap]
# if someone is in corruption stun kill the t3 trap
execute as @a[team=corrupted,scores={corruption_stun=1..}] at @e[tag=corrupted_t3_trap] run particle explosion_emitter ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @a[team=corrupted,scores={corruption_stun=1..}] at @e[tag=corrupted_t3_trap] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @a[team=corrupted,scores={corruption_stun=1..}] run kill @e[tag=corrupted_t3_trap]
# this code may not work if there are multiple guardian traps.
effect give @e[type=phantom] fire_resistance infinite 1 true
#constant noise
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 2 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 5 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 8 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 11 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1

#============================================================================================================
# stunman trap


# this trap is a simple trap that will stun the corrupted for 1 seconds (he can place multiple)
# the stunmans landmine is weak. but this is ofset by the fact that he can place more than one
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run particle wax_off ~ ~ ~ 0 0 0 40 100 force @a
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run playsound minecraft:entity.firework_rocket.blast block @a ~ ~ ~ 1 1 0.5
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run particle explosion ~ ~ ~ 0 0 0 0 1 force @a

# it will first clear all effects from the corrupted, meaing if they were chasing the stunman using a boost the corrupted will no longer have it
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run effect clear @e[distance=..4,team=corrupted]

# then give the debuff
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run effect give @e[distance=..4,team=corrupted] slowness 1 5
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run effect give @e[distance=..4,team=corrupted] darkness 2 5

execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run kill @s

#============================================================================================================
# fisherman trap

# this one simply slows all who cross it
execute as @e[tag=fishing_net_trap,type=item_display] at @s if entity @p[distance=..2.5,limit=1] run effect give @e[distance=..2.7] slowness 1 2 true
