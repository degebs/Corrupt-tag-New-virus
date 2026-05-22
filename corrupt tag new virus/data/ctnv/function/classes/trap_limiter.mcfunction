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


# autority Reveal Players Modulator
scoreboard players set Reveal_Players_Modulator_components trap_stats 0
execute as @e[tag=Reveal_Players_Modulator] run scoreboard players add Reveal_Players_Modulator_components trap_stats 1
scoreboard players set divider trap_stats 3
scoreboard players operation Reveal_Players_Modulator_count trap_stats = Reveal_Players_Modulator_components trap_stats
scoreboard players operation Reveal_Players_Modulator_count trap_stats /= divider trap_stats

# autority security
scoreboard players set security_count trap_stats 0
execute as @e[tag=security] run scoreboard players add security_count trap_stats 1
# just 1 mob. but we need more of there. so 1 shall count as 1/4 th of a trap
scoreboard players set divider trap_stats 4
scoreboard players operation security_count trap_stats = security_count trap_stats
scoreboard players operation security_count trap_stats /= divider trap_stats

# farmers farm
scoreboard players set farm_components trap_stats 0
execute as @e[tag=farm] run scoreboard players add farm_components trap_stats 1
scoreboard players set divider trap_stats 6
scoreboard players operation farmers_farm_count trap_stats = farm_components trap_stats
scoreboard players operation farmers_farm_count trap_stats /= divider trap_stats

# trickseter decoy
scoreboard players set Decoy_count trap_stats 0
execute as @e[tag=decoy] run scoreboard players add Decoy_count trap_stats 1
# the decoy is just 1 we can just count them without doing any math


# spaceman rewind shard
scoreboard players set rewind_shard_components trap_stats 0
execute as @e[tag=rewind_shard] run scoreboard players add rewind_shard_components trap_stats 1
scoreboard players set divider trap_stats 4
scoreboard players operation rewind_shard_count trap_stats = rewind_shard_components trap_stats
scoreboard players operation rewind_shard_count trap_stats /= divider trap_stats

#Fracturizer time bomb
scoreboard players set time_bomb_components trap_stats 0
execute as @e[tag=time_bomb] run scoreboard players add time_bomb_components trap_stats 1
scoreboard players set divider trap_stats 15
scoreboard players operation time_bomb_count trap_stats = time_bomb_components trap_stats
scoreboard players operation time_bomb_count trap_stats /= divider trap_stats



# check if eack trap type is above the limit
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# stunman trap killer
#1. summor the trap killer
execute if score stunman_trap_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
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
execute if score corrupted_t1_trap_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
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
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=corrupted_t2_trap,limit=1,sort=random]
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=corrupted_t2_trap,distance=..0.1]
execute if score corrupted_t2_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# hunter t3 trap killer
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=corrupted_t3_trap,limit=1,sort=random]
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=corrupted_t3_trap,distance=..0.1]
execute if score corrupted_t3_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# fisherman trap killer
execute if score fishing_net_trap_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=fishing_net_trap,limit=1,sort=random]
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=fishing_net_trap,distance=..0.1]
execute if score fishing_net_trap_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# authority Reveal Players Modulator
execute if score Reveal_Players_Modulator_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score Reveal_Players_Modulator_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=Reveal_Players_Modulator,limit=1,sort=random]
execute if score Reveal_Players_Modulator_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score Reveal_Players_Modulator_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=Reveal_Players_Modulator,distance=..0.1]
execute if score Reveal_Players_Modulator_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# authoritys security
execute if score security_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score security_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=security,limit=1,sort=random]
execute if score security_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score security_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=security,distance=..0.1]
execute if score security_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# farmers farm
execute if score farmers_farm_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score farmers_farm_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=farm,limit=1,sort=random]
execute if score farmers_farm_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score farmers_farm_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=farm,distance=..0.1]
execute if score farmers_farm_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# trickster decoy
execute if score Decoy_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score Decoy_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=decoy,limit=1,sort=random]
execute if score Decoy_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score Decoy_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=decoy,distance=..0.1]
execute if score Decoy_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# spaceman rewind shard
execute if score rewind_shard_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score rewind_shard_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=rewind_shard,limit=1,sort=random]
execute if score rewind_shard_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score rewind_shard_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=rewind_shard,distance=..0.1]
execute if score rewind_shard_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Fracturizer time bomb
execute if score time_bomb_count trap_stats > limit trap_stats run execute at @r run summon marker ~ ~ ~ {Tags:["trap_killer"]}
execute if score time_bomb_count trap_stats > limit trap_stats as @e[tag=trap_killer] run tp @s @e[tag=time_bomb,limit=1,sort=random]
execute if score time_bomb_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s if entity @a[distance=..3] run kill @s
execute if score time_bomb_count trap_stats > limit trap_stats as @e[tag=trap_killer] at @s run kill @e[tag=time_bomb,distance=..0.1]
execute if score time_bomb_count trap_stats > limit trap_stats as @e[tag=trap_killer] run kill @s

