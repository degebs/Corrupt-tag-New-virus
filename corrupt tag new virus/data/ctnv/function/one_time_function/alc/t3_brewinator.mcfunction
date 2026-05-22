# put the brewinator in the inventory slot (only if not already present)
execute if score @s corruption matches 50.. if score @s brewinator_cooldown matches 0 unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:brewing_stand"}]}] run item replace entity @s hotbar.4 with brewing_stand[custom_name=[{"text":"T","italic":false,"color":"#ff00f7"},{"text":"h","italic":false,"color":"#ff00ce"},{"text":"e","italic":false,"color":"#ff00a5"},{"text":" ","italic":false,"color":"#ff007c"},{"text":"B","italic":false,"color":"#ff0052"},{"text":"R","italic":false,"color":"#ff0029"},{"text":"EW","italic":false,"color":"#ff0000"},{"text":"I","italic":false,"color":"#f8002b"},{"text":"N","italic":false,"color":"#f10055"},{"text":"A","italic":false,"color":"#ea0080"},{"text":"T","italic":false,"color":"#e200aa"},{"text":"O","italic":false,"color":"#db00d5"},{"text":"R","italic":false,"color":"#d400ff"}],lore=[["",{"text":"drop to spawn the ","italic":false},{"text":"B","italic":false,"color":"#ff0052"},{"text":"R","italic":false,"color":"#ff0029"},{"text":"EW","italic":false,"color":"#ff0000"},{"text":"I","italic":false,"color":"#f8002b"},{"text":"N","italic":false,"color":"#f10055"},{"text":"A","italic":false,"color":"#ea0080"},{"text":"T","italic":false,"color":"#e200aa"},{"text":"O","italic":false,"color":"#db00d5"},{"text":"R  MK2","italic":false,"color":"#d400ff"}]]]

# set the 30 second cooldown
execute if score @s corruption matches 50.. if score @s brewinator_drop_detect matches 1.. run scoreboard players set @s brewinator_cooldown 300


# remove any extra brewing stands from inventory (if player somehow has more than one)
execute if score @s corruption matches 50.. if score @s brewinator_cooldown matches 1.. run clear @s minecraft:brewing_stand 1

# kill any dropped brewing stand items (to prevent farming)
execute if score @s corruption matches 50.. if score @s brewinator_cooldown matches 1.. run kill @e[type=item,nbt={Item:{id:"minecraft:brewing_stand"}}]
# sound effects
execute if score @s brewinator_drop_detect matches 1 at @s run playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1
execute if score @s brewinator_drop_detect matches 1 at @s run playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1.5
execute if score @s brewinator_drop_detect matches 1 at @s run playsound block.brewing_stand.brew block @a ~ ~ ~ 1 0.5


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# summon the brewinator

execute if score @s brewinator_drop_detect matches 1 at @s run summon minecraft:block_display ~ ~0.4 ~ {Tags: ["brewinator"], Passengers: [{block_state: {Name: "minecraft:end_rod", Properties: {facing: "up"}}, id: "minecraft:block_display", Tags: ["brewinator","brewinator_thinker"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.75f, 1.75f, 1.75f], translation: [-0.875f, 0.6875f, -0.875f]}}, {block_state: {Name: "minecraft:brewing_stand", Properties: {has_bottle_0: "true", has_bottle_1: "true", has_bottle_2: "true"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, -0.38268346f, 0.0f, 0.9238796f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.6250005f, 2.5624998f, 1.6249974f], translation: [-8.940697E-7f, -0.5312501f, -1.1490486f]}}, {block_state: {Name: "minecraft:brewing_stand", Properties: {has_bottle_0: "true", has_bottle_1: "true", has_bottle_2: "true"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.6250001f, 2.5624998f, 1.6249998f], translation: [-0.81250006f, -0.5312501f, -0.81250006f]}}, {Passengers: [{block_state: {Name: "minecraft:budding_amethyst"}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.25390625f, 0.76171875f, 0.25390625f], translation: [-0.12695312f, 0.8691406f, -0.12695312f]}}], block_state: {Name: "minecraft:vault", Properties: {facing: "north", ominous: "false", vault_state: "inactive"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.3125f, 0.9375f, 0.3125f], translation: [-0.15625f, 0.78125f, -0.15625f]}}, {Passengers: [{block_state: {Name: "minecraft:budding_amethyst"}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.8125f, 0.8125f, 0.8125f], translation: [-0.40625f, -0.15625f, -0.40625f]}}], block_state: {Name: "minecraft:vault", Properties: {facing: "north", ominous: "false", vault_state: "inactive"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [-0.5f, -0.25f, -0.5f]}}], block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "true", north: "true", south: "true", waterlogged: "false", west: "true"}}, transformation: {left_rotation: [0.0f, 0.38268346f, 0.0f, 0.9238795f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [3.312503f, 0.63095284f, 3.3125026f], translation: [-2.3422906f, -0.3154761f, 1.8051688E-7f]}}

#==========================================================================================================================
# BREWINATOR LOGIC
#==========================================================================================================================

#itterate the life scoreboard
execute as @e[type=block_display,tag=brewinator] run scoreboard players add @s brewinator_lifetime 1
execute as @e[type=block_display,tag=brewinator] if score @s brewinator_lifetime matches 200.. at @s run particle poof ~ ~0.3 ~ 0.1 0.4 0.1 0.04 50 force @a
execute as @e[type=block_display,tag=brewinator] if score @s brewinator_lifetime matches 200.. run kill @s

#------------------------------------------------------------------------------
# T3 potion rng table
#1 to 10 potion of speed and jump boost
#11 to 20 potion of super speed and jump boost
#21 to 30 splash potion of absurdly long darkness and nausea
#31 to 40 splash potion of SUPER slowness and damage
#40 to 59 splash potion of SUPER slowness and poison
#60 to 70 lingering potion of absurdly long darkness and nausea
#71 to 80 lingering potion of SUPER slowness and glowing
#81 to 99 lingering potion of SUPER slowness and poison

# give 6 potions
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 10 at @s run function ctnv:one_time_function/alc/t3_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 20 at @s run function ctnv:one_time_function/alc/t3_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 30 at @s run function ctnv:one_time_function/alc/t3_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 40 at @s run function ctnv:one_time_function/alc/t3_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 50 at @s run function ctnv:one_time_function/alc/t3_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 60 at @s run function ctnv:one_time_function/alc/t2_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 70 at @s run function ctnv:one_time_function/alc/t1_rng_table

#------------------------------------------------------------------------------

# move forward if air ahead, otherwise explode
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 60.. at @s unless block ^ ^ ^0.5 air run particle explosion_emitter ~ ~ ~ 0 0 0 0.5 1 force @a
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 60.. at @s unless block ^ ^ ^0.5 air run playsound entity.generic.explode block @a ~ ~ ~ 1 1 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 60.. at @s unless block ^ ^ ^0.5 air run playsound entity.ghast.hurt block @a ~ ~ ~ 1 1 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 60.. at @s unless block ^ ^ ^0.5 air run scoreboard players set @p[team=runners,distance=..5] health 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 60.. at @s unless block ^ ^ ^0.5 air run kill @s


#particle
execute as @e[tag=brewinator_thinker] at @s run particle angry_villager ~ ~1 ~ 1 1 1 0.05 1 normal @a

#missile launch. after all the potions are given the brewinator will shoot a homing projectile
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 100 at @s run playsound entity.ghast.shoot block @a ~ ~ ~ 1 1 1
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 100 at @s run playsound entity.ghast.shoot block @a ~ ~ ~ 1 1 1
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 100 at @s run playsound entity.ghast.shoot block @a ~ ~ ~ 1 1.2 1

execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 100 at @s run particle campfire_signal_smoke ~ ~1 ~ 1 1 1 0.1 1000 normal @a
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 100 at @s run summon minecraft:block_display ~ ~2 ~ {Tags: ["brewinator_rocket"], block_state: {Name: "minecraft:magma_block"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [-0.5f, -0.5f, -0.5f]}}
# the rocket keeps track of its own life
execute as @e[type=block_display,tag=brewinator_rocket] run scoreboard players add @s brewinator_lifetime 1

# first 3 seconds (60 ticks) fly straight up
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 1..30 at @s run tp @s ~ ~0.9 ~

# after 3 seconds, home in on nearest runner (move 0.5 blocks per tick toward them)
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 31.. at @s if entity @a[team=runners,distance=10..] run tp @s ^ ^ ^1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 31.. at @s if entity @a[team=runners,distance=..10] run tp @s ^ ^ ^0.4
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 31.. at @s run tp @s ~ ~ ~ facing entity @p[sort=nearest,limit=1,team=runners]

# prevent the hitting of the floor
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 31..170 at @s unless block ~ ~-5 ~ air unless entity @a[team=runners,distance=..16] run tp @s ^ ^0.8 ^


#particle trail
execute as @e[type=block_display,tag=brewinator_rocket] at @s run particle dust{color:[1.0,0.92,0.0],scale:3} ~ ~1 ~ 0 0 0 0.3 3 force @a
execute as @e[type=block_display,tag=brewinator_rocket] at @s run particle dust{color:[1.0,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 1 1 force @a
execute as @e[type=block_display,tag=brewinator_rocket] at @s run particle dust{color:[1.0,0.92,0.0],scale:3} ~ ~1 ~ 0 0 0 0 3 force @a
execute as @e[type=block_display,tag=brewinator_rocket] at @s run particle dust{color:[1.0,0.0,0.0],scale:4} ~ ~1 ~ 0 0 0 0 1 force @a

execute as @e[type=block_display,tag=brewinator_rocket] at @s run particle campfire_signal_smoke ~ ~ ~ 1 1 1 0.01 1 force @a


#sound
#execute as @e[type=block_display,tag=brewinator_rocket] at @s run playsound minecraft:entity.firework_rocket.launch block @a ~ ~ ~ 1 0.9 1


# damage and nausea to runners within 3 blocks of explosion point
execute as @e[type=block_display,tag=brewinator_rocket] unless block ~ ~ ~ air at @s run scoreboard players remove @p[distance=..3,team=runners] health 1
execute as @e[type=block_display,tag=brewinator_rocket] unless block ~ ~ ~ air at @s run effect give @p[distance=..3,team=runners] minecraft:nausea 10 1 true

# explode if too close to a runner (within 1 block)
execute as @e[type=block_display,tag=brewinator_rocket] at @s run execute if entity @p[distance=..2.5,team=runners] run particle explosion_emitter ~ ~ ~ 0 0 0 0.1 1 force @a
execute as @e[type=block_display,tag=brewinator_rocket] at @s run execute if entity @p[distance=..2.5,team=runners] run playsound entity.generic.explode block @a ~ ~ ~ 1 1 1
execute as @e[type=block_display,tag=brewinator_rocket] at @s run execute if entity @p[distance=..2.5,team=runners] run scoreboard players set @p[distance=..5,team=runners] health 1
execute as @e[type=block_display,tag=brewinator_rocket] at @s run execute if entity @p[distance=..2.5,team=runners] run effect give @p[distance=..5,team=runners] minecraft:instant_damage 1 0 true

execute as @e[type=block_display,tag=brewinator_rocket] at @s run execute if entity @p[distance=..2.5,team=runners] run kill @s

# Big red warning title for the nearest runner
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30 at @s run title @p[team=runners] title {"text":"⚠ MISSILE INCOMING ⚠","color":"red","bold":true,"underlined":true}

# Subtitle for extra urgency (optional)
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30 at @s run title @p[team=runners] subtitle {"text":"YOU ARE SO SCREWED","color":"gold","bold":true}

# Alarming sounds (plays for the targeted runner only)
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 10 at @p[team=runners] run playsound minecraft:entity.wither.spawn master @p[team=runners,limit=1,sort=nearest] ~ ~ ~ 1 0.5
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if entity @p[team=runners,distance=..15] run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.75 1

execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score tick time matches 4 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.75 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score tick time matches 9 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.75 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score tick time matches 14 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.75 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score tick time matches 19 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.75 1

execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score 360 time matches 100 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.43 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score 360 time matches 200 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.43 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score 360 time matches 300 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.43 1
execute as @e[type=block_display,tag=brewinator_rocket] if score @s brewinator_lifetime matches 30.. at @p[team=runners] if score 360 time matches 0 run playsound minecraft:block.note_block.bit master @p[team=runners] ~ ~ ~ 1 1.43 1
# this mimics tha gta5 missile lock effect


#==========================================================================================================================
# END OF BREWINATOR LOGIC
#==========================================================================================================================



# reset the drop score
execute if score @s brewinator_drop_detect matches 1.. run scoreboard players set @s brewinator_drop_detect 0



# the corruption blocker