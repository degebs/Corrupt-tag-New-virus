# █████  ██       ██████ ██   ██ ███████ ███    ███ ██ ███████ ████████ 
#██   ██ ██      ██      ██   ██ ██      ████  ████ ██ ██         ██    
#███████ ██      ██      ███████ █████   ██ ████ ██ ██ ███████    ██    
#██   ██ ██      ██      ██   ██ ██      ██  ██  ██ ██      ██    ██    
#██   ██ ███████  ██████ ██   ██ ███████ ██      ██ ██ ███████    ██    
                                                                       
# potions and explosions.
# this corrupted class uses only bottles and THE BREWINATOR (tm)                                                             
                                                                       
                                                                       
                                                                       
# wepon
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:stick",Slot:0b}]}] run clear @s stick

execute unless entity @s[nbt={Inventory:[{id:"minecraft:stick",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:stick"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:stick",Slot:0b}]}] run item replace entity @s hotbar.0 with stick[custom_name=[{"text":"Mixing stick","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]


# armor
execute if score @s alchemist_apparition_Extract matches 0 run item replace entity @s armor.chest with iron_chestplate[trim={pattern:ward,material:diamond},enchantments={binding_curse:1}]
execute if score @s alchemist_apparition_Extract matches 0 run item replace entity @s armor.head with minecraft:chainmail_helmet[trim={pattern:flow,material:diamond},enchantments={binding_curse:1}]
execute if score @s alchemist_apparition_Extract matches 0 run item replace entity @s armor.legs with iron_leggings[trim={pattern:flow,material:diamond},enchantments={binding_curse:1}]
execute if score @s alchemist_apparition_Extract matches 0 run item replace entity @s armor.feet with netherite_boots[trim={pattern:spire,material:diamond},enchantments={binding_curse:1}]

execute if score @s alchemist_apparition_Extract matches 1.. run clear @s iron_chestplate
execute if score @s alchemist_apparition_Extract matches 1.. run clear @s chainmail_helmet
execute if score @s alchemist_apparition_Extract matches 1.. run clear @s iron_leggings
execute if score @s alchemist_apparition_Extract matches 1.. run clear @s netherite_boots

scoreboard players add @s alchemist_apparition_Extract 0

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================

# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"You have unlocked THE BREWINATOR","color":"light_purple"}]

#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================



execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"your BREWINATOR has been upgraded","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run scoreboard players set @s brewinator_cooldown 0
#immunity to your own potions
execute if score @s corruption matches 50.. run effect clear @s blindness
execute if score @s corruption matches 50.. run effect clear @s slowness
execute if score @s corruption matches 50.. run effect clear @s darkness
execute if score @s corruption matches 50.. run effect clear @s glowing
execute if score @s corruption matches 50.. run effect clear @s nausea
execute if score @s corruption matches 50.. run effect clear @s bad_omen
execute if score @s corruption matches 50.. run effect clear @s trial_omen
execute if score @s corruption matches 50.. run effect clear @s poison

#==========================================================================================================================================================
# if a player has the bad omen effect, give them corruption
execute as @a if predicate ctnv:has_bad_omen run title @s actionbar [{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡","bold":true,"italic":true,"strikethrough":true,"underlined":true,"color":"#fb00ff","shadow_color":-5373697,"obfuscated":true}]
execute as @a if predicate ctnv:has_bad_omen run title @s title [{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡","bold":true,"italic":true,"strikethrough":true,"underlined":true,"color":"#fb00ff","shadow_color":-5373697,"obfuscated":true}]
execute as @a if predicate ctnv:has_bad_omen run title @s subtitle [{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡","bold":true,"italic":true,"strikethrough":true,"underlined":true,"color":"#fb00ff","shadow_color":-5373697,"obfuscated":true}]
execute as @a if predicate ctnv:has_bad_omen if score 360 time matches 100 if score @s corruption matches ..49 run scoreboard players add @s corruption 1 
execute as @a if predicate ctnv:has_bad_omen if score 360 time matches 100 if score @s corruption matches ..49 at @s run playsound ambient.cave block @s ~ ~ ~ 1 1 1

#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"your BREWINATOR has reached its ultimate form","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run scoreboard players set @s brewinator_cooldown 0

# appariton extract
# its basically the predators t2 ability
# 15 seconds of invisablility
execute if score @s alchemist_apparition_Extract_detect matches 1 run scoreboard players set @s alchemist_apparition_Extract 400
execute if score @s alchemist_apparition_Extract matches 1.. run scoreboard players remove @s alchemist_apparition_Extract 1
execute if score @s alchemist_apparition_Extract_detect matches 1 run effect give @s invisibility 15 1 true

# sound effects
execute if score @s alchemist_apparition_Extract_detect matches 1 run playsound entity.phantom.ambient player @s ~ ~ ~ 1 1 1
execute if score @s alchemist_apparition_Extract_detect matches 1 run playsound minecraft:entity.warden.emerge player @s ~ ~ ~ 1 1 1
# particle
execute if score @s alchemist_apparition_Extract_detect matches 1 at @s run particle smoke ~ ~1 ~ 0.5 1 0.5 0.1 200 force @a

execute if score @s alchemist_apparition_Extract_detect matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:heart_of_the_sea"}}]
execute if score @s alchemist_apparition_Extract_detect matches 1 run scoreboard players set @s alchemist_apparition_Extract_detect 0


# corruption blocker
#its the knights t3 ability
execute if score @s alchemist_corruption_blocker_detect matches 1 run scoreboard players set @s alchemist_corruption_blocker 400
execute if score @s alchemist_corruption_blocker matches 1.. run scoreboard players remove @s alchemist_corruption_blocker 1
execute if score @s alchemist_corruption_blocker matches 1.. run scoreboard players set corruption_tick corruption 0
execute if score @s alchemist_corruption_blocker matches 1.. at @s run particle happy_villager ~ ~1 ~ 0.5 1 0.5 0.1 1 force @a


# sound effects
execute if score @s alchemist_corruption_blocker_detect matches 1 run playsound block.beacon.ambient player @s ~ ~ ~ 1 1 1
# particle
#execute if score @s alchemist_corruption_blocker_detect matches 1 at @s run particle smoke ~ ~1 ~ 0.5 1 0.5 0.1 200 force @a

execute if score @s alchemist_corruption_blocker_detect matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:magma_cream"}}]
execute if score @s alchemist_corruption_blocker_detect matches 1 run scoreboard players set @s alchemist_corruption_blocker_detect 0

#+++++++++++++++++++++++++++++++++++++++++++++++++
# the special chemical X effects
execute as @a if predicate ctnv:has_trial_omen at @s run function ctnv:one_time_function/alc/chem_x_efect

#==========================================================================================================================================================
#                            Brewinator controls
#==========================================================================================================================================================
scoreboard players add @s brewinator_cooldown 0

# depending of the corruption percentage a different bewinator controll logic will be used
execute if score @s corruption matches 15..49 run function ctnv:one_time_function/alc/t1_brewinator
execute if score @s corruption matches 50..89 run function ctnv:one_time_function/alc/t2_brewinator
execute if score @s corruption matches 90..100 run function ctnv:one_time_function/alc/t3_brewinator
clear @s glass_bottle
# having bad oven give corruption
#execute as @a if data entity @s ActiveEffects[{id:"minecraft:bad_omen"}] run say Has Bad Omen


#cycle BREWINATOR rng
scoreboard players add rng brewinator_rng 1
execute if score rng brewinator_rng matches 101.. run scoreboard players set rng brewinator_rng 1

# brewinator cooldown
execute if score @s brewinator_cooldown matches 1.. run scoreboard players remove @s brewinator_cooldown 1

execute if score @s brewinator_cooldown matches 999 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 50
execute if score @s brewinator_cooldown matches 979 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 49
execute if score @s brewinator_cooldown matches 959 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 48
execute if score @s brewinator_cooldown matches 939 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 47
execute if score @s brewinator_cooldown matches 919 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 46
execute if score @s brewinator_cooldown matches 899 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 45
execute if score @s brewinator_cooldown matches 879 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 44
execute if score @s brewinator_cooldown matches 859 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 43
execute if score @s brewinator_cooldown matches 839 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 42
execute if score @s brewinator_cooldown matches 819 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 41
execute if score @s brewinator_cooldown matches 799 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 40
execute if score @s brewinator_cooldown matches 779 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 39
execute if score @s brewinator_cooldown matches 759 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 38
execute if score @s brewinator_cooldown matches 739 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 37
execute if score @s brewinator_cooldown matches 719 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 36
execute if score @s brewinator_cooldown matches 699 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 35
execute if score @s brewinator_cooldown matches 679 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 34
execute if score @s brewinator_cooldown matches 659 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 33
execute if score @s brewinator_cooldown matches 639 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 32
execute if score @s brewinator_cooldown matches 619 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 31
execute if score @s brewinator_cooldown matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 30
execute if score @s brewinator_cooldown matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 29
execute if score @s brewinator_cooldown matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 28
execute if score @s brewinator_cooldown matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 27
execute if score @s brewinator_cooldown matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 26
execute if score @s brewinator_cooldown matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 25
execute if score @s brewinator_cooldown matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 24
execute if score @s brewinator_cooldown matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 23
execute if score @s brewinator_cooldown matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 22
execute if score @s brewinator_cooldown matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 21
execute if score @s brewinator_cooldown matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 20
execute if score @s brewinator_cooldown matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 19
execute if score @s brewinator_cooldown matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 18
execute if score @s brewinator_cooldown matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 17
execute if score @s brewinator_cooldown matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 16
execute if score @s brewinator_cooldown matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 15
execute if score @s brewinator_cooldown matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 14
execute if score @s brewinator_cooldown matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 13
execute if score @s brewinator_cooldown matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 12
execute if score @s brewinator_cooldown matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 11
execute if score @s brewinator_cooldown matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 10
execute if score @s brewinator_cooldown matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 9
execute if score @s brewinator_cooldown matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 8
execute if score @s brewinator_cooldown matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 7
execute if score @s brewinator_cooldown matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 6
execute if score @s brewinator_cooldown matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 5
execute if score @s brewinator_cooldown matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 4
execute if score @s brewinator_cooldown matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 3
execute if score @s brewinator_cooldown matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 2
execute if score @s brewinator_cooldown matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Brewinator cooldown","italic":false}]] 1
