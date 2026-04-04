# █████╗ ██╗   ██╗████████╗██╗  ██╗ ██████╗ ██████╗ ██╗████████╗██╗   ██╗
#██╔══██╗██║   ██║╚══██╔══╝██║  ██║██╔═══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝
#███████║██║   ██║   ██║   ███████║██║   ██║██████╔╝██║   ██║    ╚████╔╝ 
#██╔══██║██║   ██║   ██║   ██╔══██║██║   ██║██╔══██╗██║   ██║     ╚██╔╝  
#██║  ██║╚██████╔╝   ██║   ██║  ██║╚██████╔╝██║  ██║██║   ██║      ██║   
#╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   
                                                                        
# big and mean
# lot of experamental features

#====================================================================================================
# armor

item replace entity @s armor.chest with copper_chestplate[trim={pattern:silence,material:lapis},enchantments={binding_curse:1}]
item replace entity @s armor.head with minecraft:blue_stained_glass[enchantments={binding_curse:1}]
item replace entity @s armor.legs with copper_leggings[trim={pattern:snout,material:lapis},enchantments={binding_curse:1}]
item replace entity @s armor.feet with copper_boots[trim={pattern:snout,material:lapis},enchantments={binding_curse:1}]

# wepons
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run clear @s netherite_axe

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_axe"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run item replace entity @s hotbar.0 with netherite_axe[custom_name=[{"text":"Corrupted axe","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]

# make sure it cannot be moved
#execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run clear @s shield

execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:105b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:shield"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:105b}]}] run item replace entity @s weapon.offhand with shield[banner_patterns=[{pattern:gradient_up,color:magenta},{pattern:gradient_up,color:black},{pattern:skull,color:black},{pattern:triangles_top,color:black},{pattern:triangle_bottom,color:black}],base_color=purple]


#==========================================================================================================================================================
# 15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# skulk shrieker
# gravity pull

# pulls down all players for 5 seconds by increasing gravity
# the cooldown is 30 seconds

#1. give gravity pull
execute if score @s corruption matches 15.. if score @s gravity_pull_timer matches 0 if score @s gravity_pull_timer matches 0 run item replace entity @s hotbar.2 with sculk_shrieker[custom_name=[{"text":"Gravity pull","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:sculk_shrieker",Slot:2b}]}] if score @s gravity_pull_timer matches 0 run clear @s sculk_shrieker
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:sculk_shrieker",Slot:2b}]}] if score @s gravity_pull_timer matches 0 run item replace entity @s hotbar.2 with sculk_shrieker[custom_name=[{"text":"Gravity pull","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]

# sound effect
execute as @a[scores={gravity_pull_detect=1}] run playsound entity.ender_dragon.death player @a ~ ~ ~ 1 1.5 1
# speed bost
execute as @a[scores={gravity_pull_detect=1}] run effect give @s speed 5 3 true


#2. dectect if dropepd sculk shrieker
execute as @a[scores={gravity_pull_detect=1}] run scoreboard players set @s gravity_pull_timer 600
execute as @a[scores={gravity_pull_detect=1}] run scoreboard players set bool global_high_gravity 1
execute as @a[scores={gravity_pull_detect=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:sculk_shrieker"}}]
execute as @a[scores={gravity_pull_detect=1}] run scoreboard players reset @s gravity_pull_detect
# THE COUNTDOWN WILL OCCOR GLOBALY IN THE GAMEMODE ENFORCEMENT FUNCTION

# cooldown 30seconds

# do a cooldown timer with drey dye
execute if score @s gravity_pull_timer matches 599 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 30
execute if score @s gravity_pull_timer matches 580 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 29
execute if score @s gravity_pull_timer matches 560 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 28
execute if score @s gravity_pull_timer matches 540 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 27
execute if score @s gravity_pull_timer matches 520 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 26
execute if score @s gravity_pull_timer matches 500 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 25
execute if score @s gravity_pull_timer matches 480 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 24
execute if score @s gravity_pull_timer matches 460 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 23
execute if score @s gravity_pull_timer matches 440 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 22
execute if score @s gravity_pull_timer matches 420 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 21
execute if score @s gravity_pull_timer matches 400 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 20
execute if score @s gravity_pull_timer matches 380 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 19
execute if score @s gravity_pull_timer matches 360 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 18
execute if score @s gravity_pull_timer matches 340 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 17
execute if score @s gravity_pull_timer matches 320 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 16
execute if score @s gravity_pull_timer matches 300 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 15
execute if score @s gravity_pull_timer matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 14
execute if score @s gravity_pull_timer matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 13
execute if score @s gravity_pull_timer matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 12
execute if score @s gravity_pull_timer matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 11
execute if score @s gravity_pull_timer matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 10
execute if score @s gravity_pull_timer matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 9
execute if score @s gravity_pull_timer matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 8
execute if score @s gravity_pull_timer matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 7
execute if score @s gravity_pull_timer matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 6
execute if score @s gravity_pull_timer matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 5
execute if score @s gravity_pull_timer matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 4
execute if score @s gravity_pull_timer matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 3
execute if score @s gravity_pull_timer matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 2
execute if score @s gravity_pull_timer matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s gravity_pull_timer matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"Gravity pull cooldown","italic":false}]]

# after 5 seconds (100 ticks) reset the gravity
execute if score @s gravity_pull_timer matches 500 if score tick time matches 1 run scoreboard players set bool global_high_gravity 0

#==========================================================================================================================================================
# 50% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
# the permanent jump boost
execute if score @s corruption matches 50.. run effect give @s jump_boost 2 1 true
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=

# reveal players modulator
# its a trap that reveals all players for as long as its alive
# can be destroyed by runners

#1. reveal players modulator
execute if score @s corruption matches 50.. if score @s Reveal_Players_Modulator_timer matches 0 if score @s Reveal_Players_Modulator_timer matches 0 run item replace entity @s hotbar.4 with vault[custom_name=[{"text":"Reveal Players Modulator","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:vault",Slot:4b}]}] if score @s Reveal_Players_Modulator_timer matches 0 run clear @s vault
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:vault",Slot:4b}]}] if score @s Reveal_Players_Modulator_timer matches 0 run item replace entity @s hotbar.2 with vault[custom_name=[{"text":"Reveal Players Modulator","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
# sound effect
execute as @a[scores={Reveal_Players_Modulator=1}] run playsound entity.glow_squid.squirt player @s ~ ~ ~ 1 1 1

# 60 seconds cooldown
#2. dectect if dropepd reveal players modulator
execute as @a[scores={Reveal_Players_Modulator=1}] run scoreboard players set @s Reveal_Players_Modulator_timer 1200
execute as @a[scores={Reveal_Players_Modulator=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:vault"}}]
execute as @a[scores={Reveal_Players_Modulator=1}] run scoreboard players reset @s Reveal_Players_Modulator

# place the trap
execute if score @s Reveal_Players_Modulator_timer matches 1200 at @s run summon minecraft:item_display ~ ~ ~ {Tags:["Reveal_Players_Modulator"],Passengers: [{id: "minecraft:item_display", item: {count: 1, id: "minecraft:heavy_core"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.68749994f, 0.62499994f, 0.74999994f], translation: [0.0f, 0.46875f, 0.0f]}, Tags:["Reveal_Players_Modulator"]}, {id: "minecraft:item_display", item: {count: 1, id: "minecraft:beacon"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.1413768f, 0.42968744f, 0.14062497f], translation: [0.0f, 0.46875f, 0.0f]}, Tags:["Reveal_Players_Modulator"]}], item: {count: 1, id: "minecraft:vault"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.6875f, 0.3125f, 0.75f], translation: [0.0f, 0.0f, 0.0f]}, Tags:["Reveal_Players_Modulator"]}

# cooldown
execute if score @s Reveal_Players_Modulator_timer matches 1.. run scoreboard players remove @s Reveal_Players_Modulator_timer 1

# 60 seconds cooldown

execute if score @s Reveal_Players_Modulator_timer matches 1199 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 60
execute if score @s Reveal_Players_Modulator_timer matches 1180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 59
execute if score @s Reveal_Players_Modulator_timer matches 1160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 58
execute if score @s Reveal_Players_Modulator_timer matches 1140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 57
execute if score @s Reveal_Players_Modulator_timer matches 1120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 56
execute if score @s Reveal_Players_Modulator_timer matches 1100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 55
execute if score @s Reveal_Players_Modulator_timer matches 1080 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 54
execute if score @s Reveal_Players_Modulator_timer matches 1060 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 53
execute if score @s Reveal_Players_Modulator_timer matches 1040 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 52
execute if score @s Reveal_Players_Modulator_timer matches 1020 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 51
execute if score @s Reveal_Players_Modulator_timer matches 1000 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 50
execute if score @s Reveal_Players_Modulator_timer matches 980 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 49
execute if score @s Reveal_Players_Modulator_timer matches 960 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 48
execute if score @s Reveal_Players_Modulator_timer matches 940 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 47
execute if score @s Reveal_Players_Modulator_timer matches 920 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 46
execute if score @s Reveal_Players_Modulator_timer matches 900 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 45
execute if score @s Reveal_Players_Modulator_timer matches 880 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 44
execute if score @s Reveal_Players_Modulator_timer matches 860 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 43
execute if score @s Reveal_Players_Modulator_timer matches 840 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 42
execute if score @s Reveal_Players_Modulator_timer matches 820 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 41
execute if score @s Reveal_Players_Modulator_timer matches 800 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 40
execute if score @s Reveal_Players_Modulator_timer matches 780 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 39
execute if score @s Reveal_Players_Modulator_timer matches 760 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 38
execute if score @s Reveal_Players_Modulator_timer matches 740 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 37
execute if score @s Reveal_Players_Modulator_timer matches 720 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 36
execute if score @s Reveal_Players_Modulator_timer matches 700 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 35
execute if score @s Reveal_Players_Modulator_timer matches 680 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 34
execute if score @s Reveal_Players_Modulator_timer matches 660 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 33
execute if score @s Reveal_Players_Modulator_timer matches 640 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 32
execute if score @s Reveal_Players_Modulator_timer matches 620 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 31
execute if score @s Reveal_Players_Modulator_timer matches 600 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 30
execute if score @s Reveal_Players_Modulator_timer matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 29
execute if score @s Reveal_Players_Modulator_timer matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 28
execute if score @s Reveal_Players_Modulator_timer matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 27
execute if score @s Reveal_Players_Modulator_timer matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 26
execute if score @s Reveal_Players_Modulator_timer matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 25
execute if score @s Reveal_Players_Modulator_timer matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 24
execute if score @s Reveal_Players_Modulator_timer matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 23
execute if score @s Reveal_Players_Modulator_timer matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 22
execute if score @s Reveal_Players_Modulator_timer matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 21
execute if score @s Reveal_Players_Modulator_timer matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 20
execute if score @s Reveal_Players_Modulator_timer matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 19
execute if score @s Reveal_Players_Modulator_timer matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 18
execute if score @s Reveal_Players_Modulator_timer matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 17
execute if score @s Reveal_Players_Modulator_timer matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 16
execute if score @s Reveal_Players_Modulator_timer matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 15
execute if score @s Reveal_Players_Modulator_timer matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 14
execute if score @s Reveal_Players_Modulator_timer matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 13
execute if score @s Reveal_Players_Modulator_timer matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 12
execute if score @s Reveal_Players_Modulator_timer matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 11
execute if score @s Reveal_Players_Modulator_timer matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 10
execute if score @s Reveal_Players_Modulator_timer matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 9
execute if score @s Reveal_Players_Modulator_timer matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 8
execute if score @s Reveal_Players_Modulator_timer matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 7
execute if score @s Reveal_Players_Modulator_timer matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 6
execute if score @s Reveal_Players_Modulator_timer matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 5
execute if score @s Reveal_Players_Modulator_timer matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 4
execute if score @s Reveal_Players_Modulator_timer matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 3
execute if score @s Reveal_Players_Modulator_timer matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 2
execute if score @s Reveal_Players_Modulator_timer matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]] 1

execute if score @s Reveal_Players_Modulator_timer matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"reveal players modulator cooldown","italic":false}]]


#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 0.7 1
# his t3 is to summon a small army to fight the runners 
# they all die if a the corruption switches or the corrupted dies
# its just multiple artificer drones exsept they are slow and 2 blocks tall and less terrifying
# respawn anchor

scoreboard players add @s security_spawn_cooldown 0
#1. give respawn anchor
execute if score @s corruption matches 90.. if score @s security_spawn_cooldown matches 0 run item replace entity @s hotbar.6 with sculk_shrieker[custom_name=[{"text":"SECURITY","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:respawn_anchor",Slot:6b}]}] if score @s security_spawn_cooldown matches 0 run clear @s respawn_anchor
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:respawn_anchor",Slot:6b}]}] if score @s security_spawn_cooldown matches 0 run item replace entity @s hotbar.6 with respawn_anchor[custom_name=[{"text":"SECURITY","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]

# sound effect
execute as @a[scores={security_spawn=1}] run playsound entity.ender_dragon.ambient player @a ~ ~ ~ 1 1 1
execute as @a[scores={security_spawn=1}] at @s run playsound item.goat_horn.sound.4 player @a ~ ~ ~ 1 0.2 1

# speed bost
execute as @a[scores={security_spawn=1}] run effect give @s speed 5 3 true


#2. dectect if dropepd respawn anchor
execute as @a[scores={security_spawn=1}] run scoreboard players set @s security_spawn_cooldown 600
execute as @a[scores={security_spawn=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:respawn_anchor"}}]
#spawn security
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.49f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.49f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.5f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.5f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.5f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.5f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.8f},{id:"scale",base:0.4f}]}
execute as @a[scores={security_spawn=1}] at @s run summon zombie ~ ~ ~ {Tags:["security"],Team:corrupted,equipment:{mainhand:{id:copper_axe},head:{id:blue_stained_glass},chest:{id:copper_chestplate,components:{trim:{pattern:silence,material:lapis},enchantments:{binding_curse:1}}},legs:{id:copper_leggings,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}},feet:{id:copper_boots,components:{trim:{pattern:snout,material:lapis},enchantments:{binding_curse:1}}}},attributes:[{id:follow_range,base:2048f},{id:spawn_reinforcements,base:1f},{id:step_height,base:3f},{id:movement_speed,base:0.5f},{id:"scale",base:0.4f}]}


execute as @a[scores={security_spawn=1}] run scoreboard players set @s security_spawn 0
#cooldown
execute if score @s security_spawn_cooldown matches 1.. run scoreboard players remove @s security_spawn_cooldown 1


execute if score @s security_spawn_cooldown matches 599 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 30
execute if score @s security_spawn_cooldown matches 580 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 29
execute if score @s security_spawn_cooldown matches 560 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 28
execute if score @s security_spawn_cooldown matches 540 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 27
execute if score @s security_spawn_cooldown matches 520 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 26
execute if score @s security_spawn_cooldown matches 500 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 25
execute if score @s security_spawn_cooldown matches 480 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 24
execute if score @s security_spawn_cooldown matches 460 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 23
execute if score @s security_spawn_cooldown matches 440 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 22
execute if score @s security_spawn_cooldown matches 420 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 21
execute if score @s security_spawn_cooldown matches 400 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 20
execute if score @s security_spawn_cooldown matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 19
execute if score @s security_spawn_cooldown matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 18
execute if score @s security_spawn_cooldown matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 17
execute if score @s security_spawn_cooldown matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 16
execute if score @s security_spawn_cooldown matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 15
execute if score @s security_spawn_cooldown matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 14
execute if score @s security_spawn_cooldown matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 13
execute if score @s security_spawn_cooldown matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 12
execute if score @s security_spawn_cooldown matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 11
execute if score @s security_spawn_cooldown matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 10
execute if score @s security_spawn_cooldown matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 9
execute if score @s security_spawn_cooldown matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 8
execute if score @s security_spawn_cooldown matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 7
execute if score @s security_spawn_cooldown matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 6
execute if score @s security_spawn_cooldown matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 5
execute if score @s security_spawn_cooldown matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 4
execute if score @s security_spawn_cooldown matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 3
execute if score @s security_spawn_cooldown matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 2
execute if score @s security_spawn_cooldown matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]] 1

execute if score @s security_spawn_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"SECURITY pull cooldown","italic":false}]]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++==
# spawn in the security
