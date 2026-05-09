#                                     █████                                                  
#                                    ░░███                                                   
# █████████████    ██████   ████████  ░███ █████  █████  █████████████    ██████   ████████  
#░░███░░███░░███  ░░░░░███ ░░███░░███ ░███░░███  ███░░  ░░███░░███░░███  ░░░░░███ ░░███░░███ 
# ░███ ░███ ░███   ███████  ░███ ░░░  ░██████░  ░░█████  ░███ ░███ ░███   ███████  ░███ ░███ 
# ░███ ░███ ░███  ███░░███  ░███      ░███░░███  ░░░░███ ░███ ░███ ░███  ███░░███  ░███ ░███ 
# █████░███ █████░░████████ █████     ████ █████ ██████  █████░███ █████░░████████ ████ █████
#░░░░░ ░░░ ░░░░░  ░░░░░░░░ ░░░░░     ░░░░ ░░░░░ ░░░░░░  ░░░░░ ░░░ ░░░░░  ░░░░░░░░ ░░░░ ░░░░░ 

 # the first dedicated RANGED corrupt tag class. very scary                                                                                           
                                                                                            
# give him his armor
item replace entity @s armor.chest with copper_chestplate[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:"eye",material:amethyst}]
item replace entity @s armor.head with leather_helmet[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:rib,material:amethyst}]
item replace entity @s armor.legs with netherite_leggings[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:coast,material:amethyst}]
item replace entity @s armor.feet with leather_boots[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:snout,material:amethyst}]

# give him his bow
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] if score @s corruption matches ..49 run clear @s bow

execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] if score @s corruption matches ..49 run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] if score @s corruption matches ..49 run item replace entity @s hotbar.0 with bow[custom_name=[{"text":"Corrupted bow","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]
# for the 1st 50 percent he shall have a bow



#==================================================================================================================================
# kill stationary arrows
#kill @e[type=arrow,nbt={inGround:1b}]


# slowly regenerate arrows (unless at max arrows)
execute if score seconds time matches 20 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score seconds time matches 20 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 1

execute if score seconds time matches 40 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score seconds time matches 40 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 1

execute if score seconds time matches 50 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score seconds time matches 50 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 1


# make sure that arrows cannot be duped or manipulated
execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] run clear @s arrow
execute if entity @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:arrow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 1 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 1

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 2 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 2

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 3 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 3

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 4 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 4

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 5 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 5

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 6 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 6

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 7 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 7

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 8 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 8

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 9 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 9

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 10 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 10

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 11 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 11

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 12 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 12

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 13 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 13

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 14 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 14

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 15 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 15

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 16 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 16

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 17 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 17

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 18 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 18

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 19 run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 19

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s marksman_arrow_count matches 20.. run item replace entity @s hotbar.1 with tipped_arrow[potion_contents={custom_color:9437184,custom_effects:[{id:instant_health,duration:1,amplifier:25},{id:resistance,duration:1,amplifier:4}]},custom_name=[{"text":"EVIL arrow","italic":false}]] 20

# check if the archer launches his arrow
execute if score @s bow_shot matches 1 run clear @s arrow
execute if score @s bow_shot matches 1 run scoreboard players remove @s marksman_arrow_count 1
execute if score @s bow_shot matches 1 run scoreboard players reset @s bow_shot
# also with crossbow
execute if score @s cross_bow_shot matches 1 run clear @s arrow
execute if score @s cross_bow_shot matches 1 run scoreboard players remove @s marksman_arrow_count 1
execute if score @s cross_bow_shot matches 1 run scoreboard players reset @s cross_bow_shot


# if the marksman arrow count is negative set it to 0
execute if score @s marksman_arrow_count matches ..-1 run scoreboard players set @s marksman_arrow_count 0


# kill stationary arrows (but not evil ones)
execute as @e[type=arrow,nbt={inGround:1b}] unless entity @s[tag=EVIL] run kill @s


#==================================================================================================================================
# cool effect for arrows launched by the corrupted
# need to add tag manually
execute at @s run tag @e[type=arrow,distance=..2] add EVIL
# the rest will be handled by the evil arrows function

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# the scent.
# all runners get a lingering smoke particle
execute if score @s corruption matches 15.. at @r[team=runners] run summon marker ~ ~ ~ {Tags:["trail"]}
execute if score @s corruption matches 15.. at @e[tag=trail,type=marker] run particle dust{color:[0.54,0.0,0.49],scale:1} ~ ~ ~ 0 0 0 0 1 normal @a[team=corrupted]
# to prevent lag all cent markers must die eventually
execute as @e[tag=trail,type=marker] run scoreboard players add @s scent_lifetime 1
execute as @e[tag=trail,type=marker] if score @s scent_lifetime matches 500.. run kill @s



#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================
# message

execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1



# give him his crossbow
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] if score @s corruption matches 50.. run clear @s crossbow

execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] if score @s corruption matches 50.. run kill @e[type=item,nbt={Item:{id:"minecraft:crossbow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] if score @s corruption matches 50..89 run item replace entity @s hotbar.0 with crossbow[custom_name=[{"text":"Corrupted Crossbow","italic":false,"color":"dark_purple"}],enchantments={quick_charge:3},attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]
# for 50% and byond give him a crossbow

# regenerates the arrows twice as fast as before
execute if score @s corruption matches 50.. if score seconds time matches 10 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score @s corruption matches 50.. if score seconds time matches 10 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 1

execute if score @s corruption matches 50.. if score seconds time matches 30 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score @s corruption matches 50.. if score seconds time matches 30 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 1

execute if score @s corruption matches 50.. if score seconds time matches 55 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score @s corruption matches 50.. if score seconds time matches 55 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 1

# +5 arrows per minute during endgame
execute if score endgame state matches 1 if score @s corruption matches 50.. if score seconds time matches 55 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run clear @s arrow
execute if score endgame state matches 1 if score @s corruption matches 50.. if score seconds time matches 55 if score tick time matches 3 unless score @s marksman_arrow_count matches 20 run scoreboard players add @s marksman_arrow_count 5
#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run clear @s
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"INFINITE AMMO GRANTED. KILL THEM ALL!","color":"light_purple"}]

execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

execute unless entity @s[nbt={Inventory:[{id:"minecraft:crossbow",Slot:0b}]}] if score @s corruption matches 90..99 run item replace entity @s hotbar.0 with crossbow[custom_name=[{"text":"Corrupted Crossbow","italic":false,"color":"dark_purple"}],enchantments={quick_charge:5},attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]
# for 50% and byond give him a crossbow

execute if score @s corruption matches 90.. run scoreboard players set @s marksman_arrow_count 20


#==================================================================================================================================
# remove crossbow when dying
execute if score @s corruption matches 100.. run clear @s crossbow