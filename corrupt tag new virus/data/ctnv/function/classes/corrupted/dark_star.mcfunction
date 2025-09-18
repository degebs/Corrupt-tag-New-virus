#██████╗  █████╗ ██████╗ ██╗  ██╗    ███████╗████████╗ █████╗ ██████╗ 
#██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗
#██║  ██║███████║██████╔╝█████╔╝     ███████╗   ██║   ███████║██████╔╝
#██║  ██║██╔══██║██╔══██╗██╔═██╗     ╚════██║   ██║   ██╔══██║██╔══██╗
#██████╔╝██║  ██║██║  ██║██║  ██╗    ███████║   ██║   ██║  ██║██║  ██║
#╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
#possably the most overpowerd class in the whole game...
# god have mercy on whoever gets a nuke droped on them

# give him his armor
item replace entity @s armor.chest with netherite_chestplate[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:"flow",material:amethyst}]
item replace entity @s armor.head with netherite_helmet[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:flow,material:amethyst}]
item replace entity @s armor.legs with netherite_leggings[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:flow,material:amethyst}]
item replace entity @s armor.feet with netherite_boots[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:flow,material:amethyst}]

# start with his weapon
# make sure he cannot move it or drop it
execute unless entity @s[nbt={Inventory:[{id:"minecraft:amethyst_shard",Slot:0b}]}] run clear @s amethyst_shard

execute unless entity @s[nbt={Inventory:[{id:"minecraft:amethyst_shard",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:amethyst_shard",Slot:0b}]}] run item replace entity @s hotbar.0 with amethyst_shard[custom_name=[{"text":"dark star shard","italic":false}],rarity=epic,attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_total,id:"1748733861505"}],equippable={slot:head,equip_sound:"minecraft:block.beacon.ambient"}]

#fancy decoration
# this effect will simulate a orbiting ring of corruption
execute at @s if score tick time matches 1 run particle dust{color:[0.83,0.0,1.0],scale:1} ^0 ^1 ^2 0 0 0 0 35 normal @a
execute at @s if score tick time matches 2 run particle dust{color:[0.83,0.0,1.0],scale:1} ^0.7 ^1 ^1.87 0 0 0 0 35 normal @a
execute at @s if score tick time matches 3 run particle dust{color:[0.83,0.0,1.0],scale:1} ^1.25 ^1 ^1.55 0 0 0 0 35 normal @a
execute at @s if score tick time matches 4 run particle dust{color:[0.83,0.0,1.0],scale:1} ^1.69 ^1 ^1.07 0 0 0 0 35 normal @a
execute at @s if score tick time matches 5 run particle dust{color:[0.83,0.0,1.0],scale:1} ^1.95 ^1 ^0.45 0 0 0 0 35 normal @a
execute at @s if score tick time matches 6 run particle dust{color:[0.83,0.0,1.0],scale:1} ^1.9 ^1 ^-0.18 0 0 0 0 35 normal @a
execute at @s if score tick time matches 7 run particle dust{color:[0.83,0.0,1.0],scale:1} ^1.82 ^1 ^-0.83 0 0 0 0 35 normal @a
execute at @s if score tick time matches 8 run particle dust{color:[0.83,0.0,1.0],scale:1} ^1.48 ^1 ^-1.374 0 0 0 0 35 normal @a
execute at @s if score tick time matches 9 run particle dust{color:[0.83,0.0,1.0],scale:1} ^0.93 ^1 ^-1.7 0 0 0 0 35 normal @a
execute at @s if score tick time matches 10 run particle dust{color:[0.83,0.0,1.0],scale:1} ^0.31 ^1 ^-1.97 0 0 0 0 35 normal @a
execute at @s if score tick time matches 11 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-0.34 ^1 ^-1.96 0 0 0 0 35 normal @a
execute at @s if score tick time matches 12 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-0.96 ^1 ^-1.75 0 0 0 0 35 normal @a
execute at @s if score tick time matches 13 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-1.47 ^1 ^-1.34 0 0 0 0 35 normal @a
execute at @s if score tick time matches 14 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-1.82 ^1 ^-0.8 0 0 0 0 35 normal @a
execute at @s if score tick time matches 35 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-1.98 ^1 ^-0.35 0 0 0 0 35 normal @a
execute at @s if score tick time matches 16 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-1.93 ^1 ^0.49 0 0 0 0 35 normal @a
execute at @s if score tick time matches 17 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-1.67 ^1 ^1.09 0 0 0 0 35 normal @a
execute at @s if score tick time matches 18 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-1.22 ^1 ^1.58 0 0 0 0 35 normal @a
execute at @s if score tick time matches 19 run particle dust{color:[0.83,0.0,1.0],scale:1} ^-0.64 ^1 ^1.88 0 0 0 0 35 normal @a

# all players within the radius are blinded
execute at @s run effect give @a[team=runners,distance=..2] darkness 4 1
execute at @s run effect give @a[team=runners,distance=..2] glowing 2 1

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

#jump boost
execute if score @s corruption matches 15.. run effect give @s jump_boost 1 1 true



# if the player drops the glowstone item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:fermented_spider_eye",Slot:2b}]}] if score @s dark_star_darkness matches 0 run scoreboard players set @s dark_star_darkness 600

execute if score @s corruption matches 15.. if score @s dark_star_darkness matches 1.. run scoreboard players remove @s dark_star_darkness 1
# give the corrupted his vission of all runners
execute if score @s corruption matches 15.. if score @s[scores={dark_star_darkness=599}] dark_star_darkness matches 599 run effect give @a[team=runners] darkness 5 1

# sound effect
execute if score @s[scores={dark_star_darkness=599}] dark_star_darkness matches 599 run playsound block.bell.use player @s ~ ~ ~ 1 0.2 0.5


# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:fermented_spider_eye",Slot:2b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:fermented_spider_eye"}}]
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:fermented_spider_eye",Slot:2b}]}] if score @s dark_star_darkness matches 0 run item replace entity @s hotbar.2 with fermented_spider_eye[custom_name=[{"text":"Blind Runners","italic":false,"color":"yellow"}],lore=[[{"text":"drop to blind players","italic":false}]]]

# do a cooldown timer with drey dye
execute if score @s[scores={dark_star_darkness=599}] dark_star_darkness matches 599 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 30
execute if score @s[scores={dark_star_darkness=580}] dark_star_darkness matches 580 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 29
execute if score @s[scores={dark_star_darkness=560}] dark_star_darkness matches 560 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 28
execute if score @s[scores={dark_star_darkness=540}] dark_star_darkness matches 540 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 27
execute if score @s[scores={dark_star_darkness=520}] dark_star_darkness matches 520 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 26
execute if score @s[scores={dark_star_darkness=500}] dark_star_darkness matches 500 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 25
execute if score @s[scores={dark_star_darkness=480}] dark_star_darkness matches 480 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 24
execute if score @s[scores={dark_star_darkness=460}] dark_star_darkness matches 460 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 23
execute if score @s[scores={dark_star_darkness=440}] dark_star_darkness matches 440 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 22
execute if score @s[scores={dark_star_darkness=420}] dark_star_darkness matches 420 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 21
execute if score @s[scores={dark_star_darkness=400}] dark_star_darkness matches 400 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 20
execute if score @s[scores={dark_star_darkness=380}] dark_star_darkness matches 380 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 19
execute if score @s[scores={dark_star_darkness=360}] dark_star_darkness matches 360 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 18
execute if score @s[scores={dark_star_darkness=340}] dark_star_darkness matches 340 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 17
execute if score @s[scores={dark_star_darkness=320}] dark_star_darkness matches 320 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 16
execute if score @s[scores={dark_star_darkness=300}] dark_star_darkness matches 300 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 15
execute if score @s[scores={dark_star_darkness=280}] dark_star_darkness matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 14
execute if score @s[scores={dark_star_darkness=260}] dark_star_darkness matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 13
execute if score @s[scores={dark_star_darkness=240}] dark_star_darkness matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 12
execute if score @s[scores={dark_star_darkness=220}] dark_star_darkness matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 11
execute if score @s[scores={dark_star_darkness=200}] dark_star_darkness matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 10
execute if score @s[scores={dark_star_darkness=180}] dark_star_darkness matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 9
execute if score @s[scores={dark_star_darkness=160}] dark_star_darkness matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 8
execute if score @s[scores={dark_star_darkness=140}] dark_star_darkness matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 7
execute if score @s[scores={dark_star_darkness=120}] dark_star_darkness matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 6
execute if score @s[scores={dark_star_darkness=100}] dark_star_darkness matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 5
execute if score @s[scores={dark_star_darkness=80}] dark_star_darkness matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 4
execute if score @s[scores={dark_star_darkness=60}] dark_star_darkness matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 3
execute if score @s[scores={dark_star_darkness=40}] dark_star_darkness matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 2
execute if score @s[scores={dark_star_darkness=20}] dark_star_darkness matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s dark_star_darkness matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"blind runners cooldown","italic":false}]]












#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================

execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# speed boost
# the suggar item
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] if score @s dark_star_speed_boost matches 0 run scoreboard players set @s dark_star_speed_boost 600

execute if score @s corruption matches 50.. if score @s dark_star_speed_boost matches 1.. run scoreboard players remove @s dark_star_speed_boost 1
# give the corrupted speed
execute if score @s corruption matches 50.. if score @s[scores={dark_star_speed_boost=599}] dark_star_speed_boost matches 599 run effect give @s speed 10 3

# sound effect
execute if score @s[scores={dark_star_speed_boost=599}] dark_star_speed_boost matches 599 run playsound entity.generic.eat player @s ~ ~ ~ 1 0.3 0.5

# check to see if the sugar has been dropped.
# give the corrupted the sugar dust. make sure he cant manipulate it
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:sugar"}}]
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] if score @s dark_star_speed_boost matches 0 run item replace entity @s hotbar.4 with sugar[custom_name=[{"text":"speed boost","italic":false}],lore=[[{"text":"drop for a speed boost","italic":false}]]]


execute if score @s[scores={dark_star_speed_boost=599}] dark_star_speed_boost matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 30
execute if score @s[scores={dark_star_speed_boost=580}] dark_star_speed_boost matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 29
execute if score @s[scores={dark_star_speed_boost=560}] dark_star_speed_boost matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 28
execute if score @s[scores={dark_star_speed_boost=540}] dark_star_speed_boost matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 27
execute if score @s[scores={dark_star_speed_boost=520}] dark_star_speed_boost matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 26
execute if score @s[scores={dark_star_speed_boost=500}] dark_star_speed_boost matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 25
execute if score @s[scores={dark_star_speed_boost=480}] dark_star_speed_boost matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 24
execute if score @s[scores={dark_star_speed_boost=460}] dark_star_speed_boost matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 23
execute if score @s[scores={dark_star_speed_boost=440}] dark_star_speed_boost matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 22
execute if score @s[scores={dark_star_speed_boost=420}] dark_star_speed_boost matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 21
execute if score @s[scores={dark_star_speed_boost=400}] dark_star_speed_boost matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 20
execute if score @s[scores={dark_star_speed_boost=380}] dark_star_speed_boost matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 19
execute if score @s[scores={dark_star_speed_boost=360}] dark_star_speed_boost matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 18
execute if score @s[scores={dark_star_speed_boost=340}] dark_star_speed_boost matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 17
execute if score @s[scores={dark_star_speed_boost=320}] dark_star_speed_boost matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 16
execute if score @s[scores={dark_star_speed_boost=300}] dark_star_speed_boost matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 15
execute if score @s[scores={dark_star_speed_boost=280}] dark_star_speed_boost matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 14
execute if score @s[scores={dark_star_speed_boost=260}] dark_star_speed_boost matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 13
execute if score @s[scores={dark_star_speed_boost=240}] dark_star_speed_boost matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 12
execute if score @s[scores={dark_star_speed_boost=220}] dark_star_speed_boost matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 11
execute if score @s[scores={dark_star_speed_boost=200}] dark_star_speed_boost matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 10
execute if score @s[scores={dark_star_speed_boost=180}] dark_star_speed_boost matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 9
execute if score @s[scores={dark_star_speed_boost=160}] dark_star_speed_boost matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 8
execute if score @s[scores={dark_star_speed_boost=140}] dark_star_speed_boost matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 7
execute if score @s[scores={dark_star_speed_boost=120}] dark_star_speed_boost matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 6
execute if score @s[scores={dark_star_speed_boost=100}] dark_star_speed_boost matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 5
execute if score @s[scores={dark_star_speed_boost=80}] dark_star_speed_boost matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 4
execute if score @s[scores={dark_star_speed_boost=60}] dark_star_speed_boost matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 3
execute if score @s[scores={dark_star_speed_boost=40}] dark_star_speed_boost matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 2
execute if score @s[scores={dark_star_speed_boost=20}] dark_star_speed_boost matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s dark_star_speed_boost matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]]


#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# its time to progeam the big daddy nuke!!

# if the player drops the end crystal item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s corruption matches 91.. unless entity @s[nbt={Inventory:[{id:"minecraft:end_crystal",Slot:6b}]}] if score @s dark_star_supernova matches 0 run scoreboard players set @s dark_star_supernova 600

execute if score @s corruption matches 91.. if score @s dark_star_supernova matches 1.. run scoreboard players remove @s dark_star_supernova 1
#for this effect we need to temporarly halt the corruption
execute if score @s dark_star_supernova matches 200.. run scoreboard players set corruption_tick corruption 1



# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s corruption matches 91.. unless entity @s[nbt={Inventory:[{id:"minecraft:end_crystal",Slot:6b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:end_crystal"}}]
execute if score @s corruption matches 91.. unless entity @s[nbt={Inventory:[{id:"minecraft:end_crystal",Slot:6b}]}] if score @s dark_star_supernova matches 0 run item replace entity @s hotbar.6 with end_crystal[custom_name=[{"text":"SUPERNOVA","italic":false,"color":"aqua"}],lore=[[{"text":"drop a literal nuke","italic":false}]],rarity=epic]

# do a cooldown timer with drey dye
execute if score @s[scores={dark_star_supernova=599}] dark_star_supernova matches 599 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 30
execute if score @s[scores={dark_star_supernova=580}] dark_star_supernova matches 580 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 29
execute if score @s[scores={dark_star_supernova=560}] dark_star_supernova matches 560 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 28
execute if score @s[scores={dark_star_supernova=540}] dark_star_supernova matches 540 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 27
execute if score @s[scores={dark_star_supernova=520}] dark_star_supernova matches 520 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 26
execute if score @s[scores={dark_star_supernova=500}] dark_star_supernova matches 500 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 25
execute if score @s[scores={dark_star_supernova=480}] dark_star_supernova matches 480 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 24
execute if score @s[scores={dark_star_supernova=460}] dark_star_supernova matches 460 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 23
execute if score @s[scores={dark_star_supernova=440}] dark_star_supernova matches 440 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 22
execute if score @s[scores={dark_star_supernova=420}] dark_star_supernova matches 420 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 21
execute if score @s[scores={dark_star_supernova=400}] dark_star_supernova matches 400 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 20
execute if score @s[scores={dark_star_supernova=380}] dark_star_supernova matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 19
execute if score @s[scores={dark_star_supernova=360}] dark_star_supernova matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 18
execute if score @s[scores={dark_star_supernova=340}] dark_star_supernova matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 17
execute if score @s[scores={dark_star_supernova=320}] dark_star_supernova matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 16
execute if score @s[scores={dark_star_supernova=300}] dark_star_supernova matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 15
execute if score @s[scores={dark_star_supernova=280}] dark_star_supernova matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 14
execute if score @s[scores={dark_star_supernova=260}] dark_star_supernova matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 13
execute if score @s[scores={dark_star_supernova=240}] dark_star_supernova matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 12
execute if score @s[scores={dark_star_supernova=220}] dark_star_supernova matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 11
execute if score @s[scores={dark_star_supernova=200}] dark_star_supernova matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 10
execute if score @s[scores={dark_star_supernova=180}] dark_star_supernova matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 9
execute if score @s[scores={dark_star_supernova=160}] dark_star_supernova matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 8
execute if score @s[scores={dark_star_supernova=140}] dark_star_supernova matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 7
execute if score @s[scores={dark_star_supernova=120}] dark_star_supernova matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 6
execute if score @s[scores={dark_star_supernova=100}] dark_star_supernova matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 5
execute if score @s[scores={dark_star_supernova=80}] dark_star_supernova matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 4
execute if score @s[scores={dark_star_supernova=60}] dark_star_supernova matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 3
execute if score @s[scores={dark_star_supernova=40}] dark_star_supernova matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 2
execute if score @s[scores={dark_star_supernova=20}] dark_star_supernova matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s dark_star_supernova matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"supernova cooldown","italic":false}]]



# sound effect
execute if score @s[scores={dark_star_supernova=599}] dark_star_supernova matches 599 run playsound minecraft:block.sculk_shrieker.shriek player @s ~ ~ ~ 1 0.4 0.5


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# supernova sequence!
# the goal of this sequence is to...
#1. have every runner player with 1 heart
#2. kill the nearest runner player so that he becomes corrupted
#3. HUGE explosion that covers the entire map

#particles
execute if score @s dark_star_supernova matches 25.. at @s run particle dust{color:[0.83,0.0,1.0],scale:1} ~ ~ ~ 2 2 2 10 95 force @a
execute if score @s dark_star_supernova matches 300.. run effect give @s slowness 1 255

# a text box showing "detonation time" its really a 10 second countdown to show all players
execute if score @s dark_star_supernova matches 300.. run title @a title [{"text": " "}]
# use the subtitle command to show the countdown
execute if score @s dark_star_supernova matches 580 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"10"]
execute if score @s dark_star_supernova matches 575 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 570 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 560 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"9"]
execute if score @s dark_star_supernova matches 555 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 550 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 540 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"8"]
execute if score @s dark_star_supernova matches 535 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 530 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 520 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"7"]
execute if score @s dark_star_supernova matches 515 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 510 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 500 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"6"]
execute if score @s dark_star_supernova matches 495 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 490 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 480 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"5"]
execute if score @s dark_star_supernova matches 475 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 470 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 460 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"4"]
execute if score @s dark_star_supernova matches 455 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 450 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 440 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"3"]
execute if score @s dark_star_supernova matches 435 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 430 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 420 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"2"]
execute if score @s dark_star_supernova matches 415 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 410 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 400 run title @a subtitle [{"text":"DETONATION IN: ","color":"red"},"1"]
execute if score @s dark_star_supernova matches 395 run playsound block.note_block.bit player @a ~ ~ ~ 1 1.2 1
execute if score @s dark_star_supernova matches 390 run playsound block.note_block.bit player @a ~ ~ ~ 1 2 1

# summon the armorstand that will atcually be the nuke
execute if score @s dark_star_supernova matches 380 at @s run summon armor_stand ~ ~ ~ {Pose:{RightLeg:[175f,183f,35f]},Small:1b,DisabledSlots:1967646,Tags:["nuke"]}
effect give @e[tag=nuke] invisibility 1 1 true
execute if score @s dark_star_supernova matches ..25 run kill @e[tag=nuke]
# sound
execute if score @s dark_star_supernova matches 170..380 at @s run playsound entity.generic.explode master @a ~ ~ ~ 20 1 1
execute if score @s dark_star_supernova matches 170..380 at @s run playsound entity.firework_rocket.blast master @a ~ ~ ~ 1 0.1 1
execute if score @s dark_star_supernova matches 170..380 at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 0.5 1
execute if score @s dark_star_supernova matches 170..380 at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 2 1
execute if score @s dark_star_supernova matches 170..380 at @s run playsound ambient.basalt_deltas.mood master @a ~ ~ ~ 1 1 1
execute if score @s dark_star_supernova matches 170..380 at @s run playsound ambient.basalt_deltas.mood master @a ~ ~ ~ 1 1 1


# set the rotation of the nuke
execute if score @s dark_star_supernova matches 25.. if score nuke_rotation dark_star_supernova matches ..0 run scoreboard players set nuke_rotation dark_star_supernova 360
execute if score @s dark_star_supernova matches 25.. run scoreboard players remove nuke_rotation dark_star_supernova 14

# rotate the totem for the fancy particles
execute store result storage minecraft:nuke angle int 1 run scoreboard players get nuke_rotation dark_star_supernova

execute as @e[type=armor_stand,tag=nuke] store result entity @s Rotation[0] float 1 run data get storage minecraft:nuke angle

# particles
# the explosion particles will slowly increase in radius until its done
# also the damage radius will increase with it
execute if score @s dark_star_supernova matches 360..380 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^5 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 360..380 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-5 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 360..380 at @e[tag=nuke] run particle explosion_emitter ^5 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 360..380 at @e[tag=nuke] run particle explosion_emitter ^-5 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..380 at @s if score tick time matches 1 run scoreboard players remove @a[team=runners,distance=..5] health 1

execute if score @s dark_star_supernova matches 340..375 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^10 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 340..375 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-10 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 340..375 at @e[tag=nuke] run particle explosion_emitter ^10 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 340..375 at @e[tag=nuke] run particle explosion_emitter ^-10 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..375 at @s if score tick time matches 2 run scoreboard players remove @a[team=runners,distance=..10] health 1

execute if score @s dark_star_supernova matches 320..345 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^15 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 320..345 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-15 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 320..345 at @e[tag=nuke] run particle explosion_emitter ^15 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 320..345 at @e[tag=nuke] run particle explosion_emitter ^-15 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..345 at @s if score tick time matches 3 run scoreboard players remove @a[team=runners,distance=..15] health 1

execute if score @s dark_star_supernova matches 300..325 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^20 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 300..325 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-20 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 300..325 at @e[tag=nuke] run particle explosion_emitter ^-20 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 300..325 at @e[tag=nuke] run particle explosion_emitter ^20 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..325 at @s if score tick time matches 4 run scoreboard players remove @a[team=runners,distance=..20] health 1

execute if score @s dark_star_supernova matches 280..305 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^25 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 280..305 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-25 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 280..305 at @e[tag=nuke] run particle explosion_emitter ^25 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 280..305 at @e[tag=nuke] run particle explosion_emitter ^-25 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..305 at @s if score tick time matches 5 run scoreboard players remove @a[team=runners,distance=..25] health 1

execute if score @s dark_star_supernova matches 260..285 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^30 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 260..285 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-30 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 260..285 at @e[tag=nuke] run particle explosion_emitter ^30 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 260..285 at @e[tag=nuke] run particle explosion_emitter ^-30 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..285 at @s if score tick time matches 6 run scoreboard players remove @a[team=runners,distance=..30] health 1

execute if score @s dark_star_supernova matches 240..265 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^35 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 240..265 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-35 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 240..265 at @e[tag=nuke] run particle explosion_emitter ^35 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 240..265 at @e[tag=nuke] run particle explosion_emitter ^-35 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..265 at @s if score tick time matches 7 run scoreboard players remove @a[team=runners,distance=..35] health 1

execute if score @s dark_star_supernova matches 220..245 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^40 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 220..245 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-40 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 220..245 at @e[tag=nuke] run particle explosion_emitter ^40 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 220..245 at @e[tag=nuke] run particle explosion_emitter ^-40 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..245 at @s if score tick time matches 8 run scoreboard players remove @a[team=runners,distance=..40] health 1

execute if score @s dark_star_supernova matches 200..220 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^45 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..220 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-45 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..220 at @e[tag=nuke] run particle explosion_emitter ^45 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..220 at @e[tag=nuke] run particle explosion_emitter ^-45 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 200..220 at @s if score tick time matches 9 run scoreboard players remove @a[team=runners,distance=..55] health 1

execute if score @s dark_star_supernova matches 195..200 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^50 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 195..200 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-50 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 195..200 at @e[tag=nuke] run particle explosion_emitter ^50 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 195..200 at @e[tag=nuke] run particle explosion_emitter ^-50 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 195..200 at @s if score tick time matches 9 run scoreboard players remove @a[team=runners,distance=..65] health 1

execute if score @s dark_star_supernova matches 170..195 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^60 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..195 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-60 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..195 at @e[tag=nuke] run particle explosion_emitter ^60 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..195 at @e[tag=nuke] run particle explosion_emitter ^-60 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..195 at @s if score tick time matches 9 run scoreboard players remove @a[team=runners,distance=..75] health 1
# one final middle finger to any potential survivor ( its a last second ring expantion)
execute if score @s dark_star_supernova matches 170..185 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^100 5 15 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..185 at @e[tag=nuke] run particle explosion_emitter ^ ^ ^-100 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..185 at @e[tag=nuke] run particle explosion_emitter ^100 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..185 at @e[tag=nuke] run particle explosion_emitter ^-100 ^ ^ 5 5 5 1 15 force @a
execute if score @s dark_star_supernova matches 170..185 at @s if score tick time matches 10 run scoreboard players remove @a[team=runners,distance=..70] health 1






# extra particels
execute if score @s dark_star_supernova matches 170..380 at @s run particle campfire_signal_smoke ~ ~ ~ 10 5 10 4 200 force @a
execute if score @s dark_star_supernova matches 170..380 at @e[tag=nuke] run particle flash ^ ^ ^5 25 0 25 1 15 force @a
execute if score @s dark_star_supernova matches 170..380 at @e[tag=nuke] run particle flash ^ ^ ^-5 25 0 25 1 15 force @a
execute if score @s dark_star_supernova matches 170..380 at @e[tag=nuke] run particle flash ^5 ^ ^ 25 0 25 1 15 force @a
execute if score @s dark_star_supernova matches 170..380 at @e[tag=nuke] run particle flash ^-5 ^ ^ 25 0 25 1 15 force @a

# you only get one chance to nuke everyone
# if you miss you get your corruption set to 99
execute if score @s dark_star_supernova matches 170..190 run scoreboard players set @s corruption 99

# if the nuke does not hit anyone. set everones hearts to 1
execute if score @s dark_star_supernova matches 171 run scoreboard players set @a[team=runners] health 1


# calling card
execute if score @s dark_star_supernova matches 360..380 run advancement grant @s only ctnv:corrupt_tag/nuke
execute if score @s dark_star_supernova matches 360..380 run scoreboard players set @s dark_star_nuke 1
# other calling card
execute if score @s corruption matches 101.. if score @s dark_star_nuke matches 0 run advancement grant @s only ctnv:corrupt_tag/imaginary_fire
# make sure its acutally being checked
scoreboard players add @s dark_star_nuke 0