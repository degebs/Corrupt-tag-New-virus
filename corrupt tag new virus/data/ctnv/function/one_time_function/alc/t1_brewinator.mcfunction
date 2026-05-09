# put the brewinator in the inventory slot (only if not already present)
execute if score @s corruption matches 15.. if score @s brewinator_cooldown matches 0 unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:brewing_stand"}]}] run item replace entity @s hotbar.4 with brewing_stand[custom_name=[{"text":"T","italic":false,"color":"#ff00f7"},{"text":"h","italic":false,"color":"#ff00ce"},{"text":"e","italic":false,"color":"#ff00a5"},{"text":" ","italic":false,"color":"#ff007c"},{"text":"B","italic":false,"color":"#ff0052"},{"text":"R","italic":false,"color":"#ff0029"},{"text":"EW","italic":false,"color":"#ff0000"},{"text":"I","italic":false,"color":"#f8002b"},{"text":"N","italic":false,"color":"#f10055"},{"text":"A","italic":false,"color":"#ea0080"},{"text":"T","italic":false,"color":"#e200aa"},{"text":"O","italic":false,"color":"#db00d5"},{"text":"R","italic":false,"color":"#d400ff"}],lore=[["",{"text":"drop to spawn the ","italic":false},{"text":"B","italic":false,"color":"#ff0052"},{"text":"R","italic":false,"color":"#ff0029"},{"text":"EW","italic":false,"color":"#ff0000"},{"text":"I","italic":false,"color":"#f8002b"},{"text":"N","italic":false,"color":"#f10055"},{"text":"A","italic":false,"color":"#ea0080"},{"text":"T","italic":false,"color":"#e200aa"},{"text":"O","italic":false,"color":"#db00d5"},{"text":"R","italic":false,"color":"#d400ff"}]]]

# set the 50 second cooldown
execute if score @s corruption matches 15.. if score @s brewinator_drop_detect matches 1.. run scoreboard players set @s brewinator_cooldown 1000


# remove any extra brewing stands from inventory (if player somehow has more than one)
execute if score @s corruption matches 15.. if score @s brewinator_cooldown matches 1.. run clear @s minecraft:brewing_stand 1

# kill any dropped brewing stand items (to prevent farming)
execute if score @s corruption matches 15.. if score @s brewinator_cooldown matches 1.. run kill @e[type=item,nbt={Item:{id:"minecraft:brewing_stand"}}]
# sound effects
execute if score @s brewinator_drop_detect matches 1 at @s run playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1
execute if score @s brewinator_drop_detect matches 1 at @s run playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1.5
execute if score @s brewinator_drop_detect matches 1 at @s run playsound block.brewing_stand.brew block @a ~ ~ ~ 1 0.5


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# summon the brewinator
execute if score @s brewinator_drop_detect matches 1 at @s run summon minecraft:block_display ~ ~0.3 ~ {Passengers: [{block_state: {Name: "minecraft:brewing_stand", Properties: {has_bottle_0: "false", has_bottle_1: "false", has_bottle_2: "false"}}, id: "minecraft:block_display", Tags: ["brewinator"], transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 2.0625f, 1.0f], translation: [-0.5f, -0.46875f, -0.5f]}}], Tags: ["brewinator","brewinator_thinker"], block_state: {Name: "minecraft:budding_amethyst"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.4375f, 0.75f, 0.4375f], translation: [-0.21875f, -0.375f, -0.21875f]}}
#==========================================================================================================================
# BREWINATOR LOGIC
#==========================================================================================================================

#itterate the life scoreboard
execute as @e[type=block_display,tag=brewinator] run scoreboard players add @s brewinator_lifetime 1
execute as @e[type=block_display,tag=brewinator] if score @s brewinator_lifetime matches 200.. at @s run particle poof ~ ~ ~ 0.1 0.4 0.1 0.04 50 force @a
execute as @e[type=block_display,tag=brewinator] if score @s brewinator_lifetime matches 200.. run kill @s

#------------------------------------------------------------------------------
# T1 potion rng table

# 1 to 20 = splash potion of harming
# 21 to 25 = splash potion slowness
# 26 to 35 = splash potion of poison
# 36 to 40 = splash potion of poison better
# 41 to 50 = lingering potion of slowness
# 51 to 60 = lingering potion of slowness and poison
# 61 to 81 = splash potion of glowing and blindness
# 82 to 90 = splash potion of blindnes and harming
# 91 to 100 = lingering potion of blindnes and poison and glowing

# give 5 potions
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 40 at @s run function ctnv:one_time_function/alc/t1_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 70 at @s run function ctnv:one_time_function/alc/t1_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 100 at @s run function ctnv:one_time_function/alc/t1_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 130 at @s run function ctnv:one_time_function/alc/t1_rng_table
execute as @e[type=block_display,tag=brewinator_thinker] if score @s brewinator_lifetime matches 160 at @s run function ctnv:one_time_function/alc/t1_rng_table

#------------------------------------------------------------------------------

#particle
execute as @e[tag=brewinator_thinker] at @s run particle smoke ~ ~1 ~ 0 0 0 0 1 normal @a


#==========================================================================================================================
# END OF BREWINATOR LOGIC
#==========================================================================================================================



# reset the drop score
execute if score @s brewinator_drop_detect matches 1.. run scoreboard players set @s brewinator_drop_detect 0
