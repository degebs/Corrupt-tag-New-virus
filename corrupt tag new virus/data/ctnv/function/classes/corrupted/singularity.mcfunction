#  █████████   ███                                 ████                       ███   █████              
# ███▒▒▒▒▒███ ▒▒▒                                 ▒▒███                      ▒▒▒   ▒▒███               
#▒███    ▒▒▒  ████  ████████    ███████ █████ ████ ▒███   ██████   ████████  ████  ███████   █████ ████
#▒▒█████████ ▒▒███ ▒▒███▒▒███  ███▒▒███▒▒███ ▒███  ▒███  ▒▒▒▒▒███ ▒▒███▒▒███▒▒███ ▒▒▒███▒   ▒▒███ ▒███ 
# ▒▒▒▒▒▒▒▒███ ▒███  ▒███ ▒███ ▒███ ▒███ ▒███ ▒███  ▒███   ███████  ▒███ ▒▒▒  ▒███   ▒███     ▒███ ▒███ 
# ███    ▒███ ▒███  ▒███ ▒███ ▒███ ▒███ ▒███ ▒███  ▒███  ███▒▒███  ▒███      ▒███   ▒███ ███ ▒███ ▒███ 
#▒▒█████████  █████ ████ █████▒▒███████ ▒▒████████ █████▒▒████████ █████     █████  ▒▒█████  ▒▒███████ 
# ▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒███  ▒▒▒▒▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒    ▒▒▒▒▒    ▒▒▒▒▒███ 
#                              ███ ▒███                                                       ███ ▒███ 
#                             ▒▒██████                                                       ▒▒██████  
#                              ▒▒▒▒▒▒                                                         ▒▒▒▒▒▒   
# the very last one. probably the most powerfull of them all

#give the corrupted his knockback axe

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run clear @s netherite_axe

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_axe"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run item replace entity @s hotbar.0 with netherite_axe[custom_name=[{"text":"Corrupted axe","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]

# the armor set
item replace entity @s armor.chest with netherite_chestplate[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:sentry,material:redstone},dyed_color=6101357]
item replace entity @s armor.head with wither_skeleton_skull[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:tide,material:redstone},dyed_color=6101357]
item replace entity @s armor.legs with netherite_leggings[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:sentry,material:redstone},dyed_color=6101357]
item replace entity @s armor.feet with netherite_boots[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:eye,material:redstone},dyed_color=6101357]



#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

scoreboard players add @s singularity_t1_cooldown 0
# put the brewinator in the inventory slot (only if not already present)
execute if score @s corruption matches 15.. if score @s singularity_t1_cooldown matches 0 unless entity @s[nbt={Inventory:[{Slot:2b,id:"minecraft:brewing_stand"}]}] run item replace entity @s hotbar.2 with eye_armor_trim_smithing_template[custom_name=[{"text":"reveal players"}]]
# set the 20 second cooldown
execute if score @s corruption matches 15.. if score @s singularity_t1_dectect matches 1.. run scoreboard players set @s singularity_t1_cooldown 410




# kill any dropped brewing stand items (to prevent farming)
# sound effects
execute if score @s singularity_t1_dectect matches 1 at @s run playsound block.beacon.activate block @a ~ ~ ~ 1 1

#
execute if score @s singularity_t1_cooldown matches 1.. run scoreboard players remove @s singularity_t1_cooldown 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# do the effect
execute if score @s singularity_t1_dectect matches 1 at @s run effect give @a[team=runners] glowing 10 1 true
execute if score @s singularity_t1_dectect matches 1 at @a run particle elder_guardian ~ ~ ~ 0 0 0 1 1 force @a[team=runners]
# remove any extra brewing stands from inventory (if player somehow has more than one)
execute if score @s singularity_t1_dectect matches 1 run clear @s eye_armor_trim_smithing_template
execute if score @s singularity_t1_dectect matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:eye_armor_trim_smithing_template"}}]

# reset the drop score
execute if score @s singularity_t1_dectect matches 1.. run scoreboard players set @s singularity_t1_dectect 0


# do a cooldown timer with drey dye

execute if score @s singularity_t1_cooldown matches 400.. run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 20
execute if score @s singularity_t1_cooldown matches 380 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 19
execute if score @s singularity_t1_cooldown matches 360 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 18
execute if score @s singularity_t1_cooldown matches 340 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 17
execute if score @s singularity_t1_cooldown matches 320 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 16
execute if score @s singularity_t1_cooldown matches 300 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 15
execute if score @s singularity_t1_cooldown matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 14
execute if score @s singularity_t1_cooldown matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 13
execute if score @s singularity_t1_cooldown matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 12
execute if score @s singularity_t1_cooldown matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 11
execute if score @s singularity_t1_cooldown matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 10
execute if score @s singularity_t1_cooldown matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 9
execute if score @s singularity_t1_cooldown matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 8
execute if score @s singularity_t1_cooldown matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 7
execute if score @s singularity_t1_cooldown matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 6
execute if score @s singularity_t1_cooldown matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 5
execute if score @s singularity_t1_cooldown matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 4
execute if score @s singularity_t1_cooldown matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 3
execute if score @s singularity_t1_cooldown matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 2
execute if score @s singularity_t1_cooldown matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s singularity_t1_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]]


#==========================================================================================================================================================
# 50% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

execute if score @s corruption matches 50.. run effect give @s speed 2 0 true


scoreboard players add @s singularity_t2_cooldown 0
# put the brewinator in the inventory slot (only if not already present)
execute if score @s corruption matches 50.. if score @s singularity_t2_cooldown matches 0 unless entity @s[nbt={Inventory:[{Slot:4b,id:"minecraft:brewing_stand"}]}] run item replace entity @s hotbar.4 with ward_armor_trim_smithing_template[custom_name=[{"text":"Peacemaker"}]]
# set the 20 second cooldown
execute if score @s corruption matches 50.. if score @s singularity_t2_dectect matches 1.. run scoreboard players set @s singularity_t2_cooldown 600


# remove any extra brewing stands from inventory (if player somehow has more than one)

# kill any dropped brewing stand items (to prevent farming)
# sound effects
execute if score @s singularity_t2_dectect matches 1 at @s run playsound block.respawn_anchor.deplete block @a ~ ~ ~ 1 0.1

#
execute if score @s singularity_t2_cooldown matches 1.. run scoreboard players remove @s singularity_t2_cooldown 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

execute if score @s singularity_t2_dectect matches 1 run clear @s ward_armor_trim_smithing_template
execute if score @s singularity_t2_dectect matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:ward_armor_trim_smithing_template"}}]

# reset the drop score
execute if score @s singularity_t2_dectect matches 1.. run scoreboard players set @s singularity_t2_dectect 0

# for the peacemaker we will need to set the runner ability cooldowns for all players so an absurdly high number, then keep it that way for 10 seconds
# if the cooldown is above 400 ticks then we do it
execute if score @s singularity_t2_cooldown matches 400.. run function ctnv:one_time_function/singularity_peacemaker

# 30 second cooldown timer with gray dye
execute if score @s singularity_t2_cooldown matches 580.. run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 30
execute if score @s singularity_t2_cooldown matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 29
execute if score @s singularity_t2_cooldown matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 28
execute if score @s singularity_t2_cooldown matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 27
execute if score @s singularity_t2_cooldown matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 26
execute if score @s singularity_t2_cooldown matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 25
execute if score @s singularity_t2_cooldown matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 24
execute if score @s singularity_t2_cooldown matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 23
execute if score @s singularity_t2_cooldown matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 22
execute if score @s singularity_t2_cooldown matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 21
execute if score @s singularity_t2_cooldown matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 20
execute if score @s singularity_t2_cooldown matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 19
execute if score @s singularity_t2_cooldown matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 18
execute if score @s singularity_t2_cooldown matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 17
execute if score @s singularity_t2_cooldown matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 16
execute if score @s singularity_t2_cooldown matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 15
execute if score @s singularity_t2_cooldown matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 14
execute if score @s singularity_t2_cooldown matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 13
execute if score @s singularity_t2_cooldown matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 12
execute if score @s singularity_t2_cooldown matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 11
execute if score @s singularity_t2_cooldown matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 10
execute if score @s singularity_t2_cooldown matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 9
execute if score @s singularity_t2_cooldown matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 8
execute if score @s singularity_t2_cooldown matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 7
execute if score @s singularity_t2_cooldown matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 6
execute if score @s singularity_t2_cooldown matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 5
execute if score @s singularity_t2_cooldown matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 4
execute if score @s singularity_t2_cooldown matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 3
execute if score @s singularity_t2_cooldown matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]] 2
execute if score @s singularity_t2_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"Peacemaker cooldown","italic":false}]]
# clear it when done

#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 0.7 1

# here his 90% is called devils hand and it 1 hit kills anyone it touches.

# do a bunch of scary particles to telegraph the ability
execute if score @s singularity_t3_cooldown matches 300.. run execute if score @s corruption matches 90.. at @s if score tick time matches 2 run particle raid_omen ~ ~1 ~ 0.5 0.5 0.5 0.1 1 force @a
execute if score @s singularity_t3_cooldown matches 300.. run execute if score @s corruption matches 90.. at @s if score tick time matches 3 run particle sculk_charge_pop ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force @a
execute if score @s singularity_t3_cooldown matches 300.. run execute if score @s corruption matches 90.. at @s if score tick time matches 4 run particle soul ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force @a
execute if score @s singularity_t3_cooldown matches 300.. run execute if score @s corruption matches 90.. at @s if score tick time matches 5 run particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0.1 10 force @a
execute if score @s singularity_t3_cooldown matches 300.. run execute if score @s corruption matches 90.. at @s if score tick time matches 6 run particle firework ~ ~1 ~ 0.5 0.5 0.5 0.1 1 force @a



scoreboard players add @s singularity_t3_cooldown 0
#1. give respawn anchor
execute if score @s corruption matches 90.. if score @s singularity_t3_cooldown matches 0 run item replace entity @s hotbar.6 with silence_armor_trim_smithing_template[custom_name=[{"text":"Devil's Hand","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:silence_armor_trim_smithing_template",Slot:6b}]}] if score @s singularity_t3_cooldown matches 1.. run clear @s silence_armor_trim_smithing_template
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:silence_armor_trim_smithing_template",Slot:6b}]}] if score @s singularity_t3_cooldown matches 0 run item replace entity @s hotbar.6 with silence_armor_trim_smithing_template[custom_name=[{"text":"Devil's Hand","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]

# sound effect
execute as @a[scores={singularity_t3_dectect=1}] run playsound entity.warden.angry player @a ~ ~ ~ 1 1 1
execute as @a[scores={singularity_t3_dectect=1}] at @s run playsound item.goat_horn.sound.4 player @a ~ ~ ~ 1 0.2 1

# speed bost
execute as @a[scores={singularity_t3_dectect=1}] run effect give @s speed 5 3 false


#2. dectect if dropepd trim 
execute as @a[scores={singularity_t3_dectect=1}] run scoreboard players set @s singularity_t3_cooldown 400
execute as @a[scores={singularity_t3_dectect=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:silence_armor_trim_smithing_template"}}]
execute as @a[scores={singularity_t3_dectect=1}] run clear @s silence_armor_trim_smithing_template

execute as @a[scores={singularity_t3_dectect=1}] run scoreboard players set @s singularity_t3_dectect 0
#cooldown
execute if score @s singularity_t3_cooldown matches 1.. run scoreboard players remove @s singularity_t3_cooldown 1



execute if score @s singularity_t3_cooldown matches 400.. run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 20
execute if score @s singularity_t3_cooldown matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 19
execute if score @s singularity_t3_cooldown matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 18
execute if score @s singularity_t3_cooldown matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 17
execute if score @s singularity_t3_cooldown matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 16
execute if score @s singularity_t3_cooldown matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 15
execute if score @s singularity_t3_cooldown matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 14
execute if score @s singularity_t3_cooldown matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 13
execute if score @s singularity_t3_cooldown matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 12
execute if score @s singularity_t3_cooldown matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 11
execute if score @s singularity_t3_cooldown matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 10
execute if score @s singularity_t3_cooldown matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 9
execute if score @s singularity_t3_cooldown matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 8
execute if score @s singularity_t3_cooldown matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 7
execute if score @s singularity_t3_cooldown matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 6
execute if score @s singularity_t3_cooldown matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 5
execute if score @s singularity_t3_cooldown matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 4
execute if score @s singularity_t3_cooldown matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 3
execute if score @s singularity_t3_cooldown matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 2
execute if score @s singularity_t3_cooldown matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]] 1

execute if score @s singularity_t3_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"Devil's Hand cooldown","italic":false}]]

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++==
#  Devil's Hand 1 hit kill logic
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++==
# a TON of explosions and sounds to make it feel powerful
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:explosion_emitter ~ ~ ~ 12 2 12 0 500 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:end_rod ~ ~ ~ 1 1 1 1 300 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:campfire_cosy_smoke ~ ~ ~ 3 3 3 0.1 400 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:soul_fire_flame ~ ~ ~ 2 2 2 0.05 300 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:dust_plume ~ ~ ~ 3 1 3 0 200 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:large_smoke ~ ~ ~ 2 2 2 0.1 300 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:firework ~ ~1 ~ 1 1 1 0 200 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:sculk_soul ~ ~ ~ 4 2 4 0.5 500 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run particle minecraft:sonic_boom ~ ~ ~ 2 1 2 0 50 force
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 5 0.5
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 4 1
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 6 0.8
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:entity.dragon_fireball.explode master @a ~ ~ ~ 5 1.2
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:item.firecharge.use master @a ~ ~ ~ 3 0.7
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:ambient.cave master @a ~ ~ ~ 4 0.5
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:entity.evoker_fangs.attack master @a ~ ~ ~ 3 1.5
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute at @a[team=runners,limit=1,scores={hit=1..}] run playsound minecraft:entity.warden.sonic_boom master @a ~ ~ ~ 4 0.8

execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run title @s actionbar [{"text":"KILL THEM! KILL THEM! KILL THEM! KILL THEM! KILL THEM! KILL THEM! KILL THEM! KILL THEM! KILL THEM! KILL THEM!","color":"red","bold":true}]


# the actual 1 hit kill
execute if score @s corruption matches 90..99 if score @s singularity_t3_cooldown matches 300.. run execute as @a[limit=1,team=runners,scores={hit=1..}] run scoreboard players set @s health 0