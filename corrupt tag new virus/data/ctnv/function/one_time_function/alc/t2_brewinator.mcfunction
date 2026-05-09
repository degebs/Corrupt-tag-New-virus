# put the brewinator in the inventory slot (only if not already present)
execute if score @s corruption matches 50.. if score @s brewinator_cooldown matches 0 unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:brewing_stand"}]}] run item replace entity @s hotbar.4 with brewing_stand[custom_name=[{"text":"T","italic":false,"color":"#ff00f7"},{"text":"h","italic":false,"color":"#ff00ce"},{"text":"e","italic":false,"color":"#ff00a5"},{"text":" ","italic":false,"color":"#ff007c"},{"text":"B","italic":false,"color":"#ff0052"},{"text":"R","italic":false,"color":"#ff0029"},{"text":"EW","italic":false,"color":"#ff0000"},{"text":"I","italic":false,"color":"#f8002b"},{"text":"N","italic":false,"color":"#f10055"},{"text":"A","italic":false,"color":"#ea0080"},{"text":"T","italic":false,"color":"#e200aa"},{"text":"O","italic":false,"color":"#db00d5"},{"text":"R","italic":false,"color":"#d400ff"}],lore=[["",{"text":"drop to spawn the ","italic":false},{"text":"B","italic":false,"color":"#ff0052"},{"text":"R","italic":false,"color":"#ff0029"},{"text":"EW","italic":false,"color":"#ff0000"},{"text":"I","italic":false,"color":"#f8002b"},{"text":"N","italic":false,"color":"#f10055"},{"text":"A","italic":false,"color":"#ea0080"},{"text":"T","italic":false,"color":"#e200aa"},{"text":"O","italic":false,"color":"#db00d5"},{"text":"R  MK2","italic":false,"color":"#d400ff"}]]]

# set the 30 second cooldown
execute if score @s corruption matches 50.. if score @s brewinator_drop_detect matches 1.. run scoreboard players set @s brewinator_cooldown 600


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

execute if score @s brewinator_drop_detect matches 1 at @s run summon minecraft:block_display ~ ~0.2 ~ {Tags: ["brewinator"], Passengers: [{block_state: {Name: "minecraft:pink_stained_glass_pane", Properties: {east: "true", north: "true", south: "true", waterlogged: "false", west: "true"}}, id: "minecraft:block_display", Tags: ["brewinator","brewinator_thinker"], transformation: {left_rotation: [0.0f, -0.38268352f, 0.0f, 0.92387956f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0000001f, 0.99999964f, 1.0000007f], translation: [5.9604645E-8f, -0.3125f, -0.7071068f]}}, {block_state: {Name: "minecraft:brewing_stand", Properties: {has_bottle_0: "false", has_bottle_1: "false", has_bottle_2: "false"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, -0.49999997f, 0.0f, 0.8660255f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.9999998f, 2.0625014f, 0.9999998f], translation: [0.1830127f, -0.46875f, -0.6830127f]}}, {block_state: {Name: "minecraft:brewing_stand", Properties: {has_bottle_0: "false", has_bottle_1: "false", has_bottle_2: "false"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 2.0625f, 1.0f], translation: [-0.5f, -0.46875f, -0.5f]}}, {block_state: {Name: "minecraft:end_rod", Properties: {facing: "up"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.75f, 1.1875f, 1.75f], translation: [-0.875f, 0.46875f, -0.875f]}}], block_state: {Name: "minecraft:budding_amethyst"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.75f, 1.0f, 0.75f], translation: [-0.375f, -0.5f, -0.375f]}}
#==========================================================================================================================
# BREWINATOR LOGIC
#==========================================================================================================================

#itterate the life scoreboard
execute as @e[type=block_display,tag=brewinator] run scoreboard players add @s brewinator_lifetime 1
execute as @e[type=block_display,tag=brewinator] if score @s brewinator_lifetime matches 200.. at @s run particle poof ~ ~ ~ 0.1 0.4 0.1 0.04 50 force @a
execute as @e[type=block_display,tag=brewinator] if score @s brewinator_lifetime matches 200.. run kill @s

#------------------------------------------------------------------------------
# T2 potion rng table

# 1 to 5 potion of speed
# 6 to 10 potion of jump boost
# 11 to 20 potion of super speed
# 21 to 30 splash potion of poison and slowness and blindness
# 31 to 40 splash potion of bad omen (gives corruption)
# 41 to 50 splash potion of bad omen and slowness (gives corruption)
# 51 to 60 splash potion of instant damage and very long lasting glowing and nausia
# 61 to 70 lingering potion of bad omen (gives corruption)
# 71 to 80 lingering potion of bad omen and slowness (gives corruption)
# 81 to 99 lingering potion of instant damage and very long lasting glowing and nausia


# give 6 potions
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 20 at @s run function ctnv:one_time_function/alc/t2_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 50 at @s run function ctnv:one_time_function/alc/t2_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 80 at @s run function ctnv:one_time_function/alc/t2_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 110 at @s run function ctnv:one_time_function/alc/t2_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 140 at @s run function ctnv:one_time_function/alc/t2_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 170 at @s run function ctnv:one_time_function/alc/t1_rng_table

#------------------------------------------------------------------------------

#particle
execute as @e[tag=brewinator_thinker] at @s run particle smoke ~ ~1 ~ 0 0 0 0 1 normal @a


#==========================================================================================================================
# END OF BREWINATOR LOGIC
#==========================================================================================================================



# reset the drop score
execute if score @s brewinator_drop_detect matches 1.. run scoreboard players set @s brewinator_drop_detect 0
