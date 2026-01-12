# ██████╗ ██████╗ ██████╗ ██████╗ ██╗   ██╗██████╗ ████████╗███████╗██████╗ 
#██╔════╝██╔═══██╗██╔══██╗██╔══██╗██║   ██║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
#██║     ██║   ██║██████╔╝██████╔╝██║   ██║██████╔╝   ██║   █████╗  ██║  ██║
#██║     ██║   ██║██╔══██╗██╔══██╗██║   ██║██╔═══╝    ██║   ██╔══╝  ██║  ██║
#╚██████╗╚██████╔╝██║  ██║██║  ██║╚██████╔╝██║        ██║   ███████╗██████╔╝
# ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝        ╚═╝   ╚══════╝╚═════╝ 
#                                                                           
# the classic corrupted
# from the original is BACK in the sequel!


# this code will be on all corrupted classes with slight variations
item replace entity @s armor.chest with leather_chestplate[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:tide,material:amethyst},dyed_color=6101357]
item replace entity @s armor.head with leather_helmet[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:tide,material:amethyst},dyed_color=6101357]
item replace entity @s armor.legs with leather_leggings[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:tide,material:amethyst},dyed_color=6101357]
item replace entity @s armor.feet with leather_boots[rarity=uncommon,enchantments={binding_curse:1,knockback:2},trim={pattern:tide,material:amethyst},dyed_color=6101357]
# here is just basic netherite armor. with curse of binding

#give the corrupted his knockback axe

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run clear @s netherite_axe

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_axe"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_axe",Slot:0b}]}] run item replace entity @s hotbar.0 with netherite_axe[custom_name=[{"text":"Corrupted axe","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]

# make sure that everyone who is a classic corrupted gets in the cooldown scoreboard
scoreboard players add @s classic_corrupted_t1_cooldown 0
scoreboard players add @s classic_corrupted_t2_cooldown 0
scoreboard players add @s classic_corrupted_t3_cooldown 0

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

#unfortunatly we encounter the glitch where the item that we are looking for to drop, immidiatly triggers because when the game gives you an item
# it spawn in the word before entering your iventory therefor a dedicated function is needed for handing the 1 tick delay
# i will create a 1 tick drop delay to prevent items from imidiatly triggering as soon as they spawn


# if the player drops the glowstone item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] if score @s[scores={evil_class=1}] classic_corrupted_t1_cooldown matches 0 run scoreboard players set @s classic_corrupted_t1_cooldown 600

execute if score @s corruption matches 15.. if score @s classic_corrupted_t1_cooldown matches 1.. run scoreboard players remove @s[scores={evil_class=1}] classic_corrupted_t1_cooldown 1
# give the corrupted his vission of all runners
execute if score @s corruption matches 15.. if score @s[scores={classic_corrupted_t1_cooldown=599,evil_class=1}] classic_corrupted_t1_cooldown matches 599 run effect give @a[team=runners] glowing 15 1

# sound effect
execute if score @s[scores={classic_corrupted_t1_cooldown=599}] classic_corrupted_t1_cooldown matches 599 run playsound block.beacon.activate player @s[scores={evil_class=1}] ~ ~ ~ 1 1 0.5


# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s[scores={evil_class=1}] corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust"}}]
execute if score @s[scores={evil_class=1}] corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] if score @s classic_corrupted_t1_cooldown matches 0 run item replace entity @s hotbar.2 with glowstone_dust[custom_name=[{"text":"reveal players","italic":false,"color":"yellow"}],lore=[[{"text":"drop to reveal players","italic":false}]]]

# do a cooldown timer with drey dye
execute if score @s[scores={classic_corrupted_t1_cooldown=599}] classic_corrupted_t1_cooldown matches 599 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 30
execute if score @s[scores={classic_corrupted_t1_cooldown=580}] classic_corrupted_t1_cooldown matches 580 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 29
execute if score @s[scores={classic_corrupted_t1_cooldown=560}] classic_corrupted_t1_cooldown matches 560 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 28
execute if score @s[scores={classic_corrupted_t1_cooldown=540}] classic_corrupted_t1_cooldown matches 540 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 27
execute if score @s[scores={classic_corrupted_t1_cooldown=520}] classic_corrupted_t1_cooldown matches 520 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 26
execute if score @s[scores={classic_corrupted_t1_cooldown=500}] classic_corrupted_t1_cooldown matches 500 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 25
execute if score @s[scores={classic_corrupted_t1_cooldown=480}] classic_corrupted_t1_cooldown matches 480 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 24
execute if score @s[scores={classic_corrupted_t1_cooldown=460}] classic_corrupted_t1_cooldown matches 460 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 23
execute if score @s[scores={classic_corrupted_t1_cooldown=440}] classic_corrupted_t1_cooldown matches 440 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 22
execute if score @s[scores={classic_corrupted_t1_cooldown=420}] classic_corrupted_t1_cooldown matches 420 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 21
execute if score @s[scores={classic_corrupted_t1_cooldown=400}] classic_corrupted_t1_cooldown matches 400 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 20
execute if score @s[scores={classic_corrupted_t1_cooldown=380}] classic_corrupted_t1_cooldown matches 380 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 19
execute if score @s[scores={classic_corrupted_t1_cooldown=360}] classic_corrupted_t1_cooldown matches 360 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 18
execute if score @s[scores={classic_corrupted_t1_cooldown=340}] classic_corrupted_t1_cooldown matches 340 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 17
execute if score @s[scores={classic_corrupted_t1_cooldown=320}] classic_corrupted_t1_cooldown matches 320 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 16
execute if score @s[scores={classic_corrupted_t1_cooldown=300}] classic_corrupted_t1_cooldown matches 300 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 15
execute if score @s[scores={classic_corrupted_t1_cooldown=280}] classic_corrupted_t1_cooldown matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 14
execute if score @s[scores={classic_corrupted_t1_cooldown=260}] classic_corrupted_t1_cooldown matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 13
execute if score @s[scores={classic_corrupted_t1_cooldown=240}] classic_corrupted_t1_cooldown matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 12
execute if score @s[scores={classic_corrupted_t1_cooldown=220}] classic_corrupted_t1_cooldown matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 11
execute if score @s[scores={classic_corrupted_t1_cooldown=200}] classic_corrupted_t1_cooldown matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 10
execute if score @s[scores={classic_corrupted_t1_cooldown=180}] classic_corrupted_t1_cooldown matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 9
execute if score @s[scores={classic_corrupted_t1_cooldown=160}] classic_corrupted_t1_cooldown matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 8
execute if score @s[scores={classic_corrupted_t1_cooldown=140}] classic_corrupted_t1_cooldown matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 7
execute if score @s[scores={classic_corrupted_t1_cooldown=120}] classic_corrupted_t1_cooldown matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 6
execute if score @s[scores={classic_corrupted_t1_cooldown=100}] classic_corrupted_t1_cooldown matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 5
execute if score @s[scores={classic_corrupted_t1_cooldown=80}] classic_corrupted_t1_cooldown matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 4
execute if score @s[scores={classic_corrupted_t1_cooldown=60}] classic_corrupted_t1_cooldown matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 3
execute if score @s[scores={classic_corrupted_t1_cooldown=40}] classic_corrupted_t1_cooldown matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 2
execute if score @s[scores={classic_corrupted_t1_cooldown=20}] classic_corrupted_t1_cooldown matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s classic_corrupted_t1_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]]



#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================



execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# the permanent jump boost
execute if score @s corruption matches 50.. run effect give @s jump_boost 2 1 true
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=





# the suggar item
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] if score @s classic_corrupted_t2_cooldown matches 0 run scoreboard players set @s classic_corrupted_t2_cooldown 600

execute if score @s corruption matches 50.. if score @s classic_corrupted_t2_cooldown matches 1.. run scoreboard players remove @s classic_corrupted_t2_cooldown 1
# give the corrupted speed
execute if score @s corruption matches 50.. if score @s[scores={classic_corrupted_t2_cooldown=599}] classic_corrupted_t2_cooldown matches 599 run effect give @s speed 10 3

# sound effect
execute if score @s[scores={classic_corrupted_t2_cooldown=599}] classic_corrupted_t2_cooldown matches 599 run playsound entity.generic.eat player @s ~ ~ ~ 1 0.3 0.5

# check to see if the sugar has been dropped.
# give the corrupted the sugar dust. make sure he cant manipulate it
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:sugar"}}]
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:sugar",Slot:4b}]}] if score @s classic_corrupted_t2_cooldown matches 0 run item replace entity @s hotbar.4 with sugar[custom_name=[{"text":"speed boost","italic":false}],lore=[[{"text":"drop for a speed boost","italic":false}]]]


execute if score @s[scores={classic_corrupted_t2_cooldown=599}] classic_corrupted_t2_cooldown matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 30
execute if score @s[scores={classic_corrupted_t2_cooldown=580}] classic_corrupted_t2_cooldown matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 29
execute if score @s[scores={classic_corrupted_t2_cooldown=560}] classic_corrupted_t2_cooldown matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 28
execute if score @s[scores={classic_corrupted_t2_cooldown=540}] classic_corrupted_t2_cooldown matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 27
execute if score @s[scores={classic_corrupted_t2_cooldown=520}] classic_corrupted_t2_cooldown matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 26
execute if score @s[scores={classic_corrupted_t2_cooldown=500}] classic_corrupted_t2_cooldown matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 25
execute if score @s[scores={classic_corrupted_t2_cooldown=480}] classic_corrupted_t2_cooldown matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 24
execute if score @s[scores={classic_corrupted_t2_cooldown=460}] classic_corrupted_t2_cooldown matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 23
execute if score @s[scores={classic_corrupted_t2_cooldown=440}] classic_corrupted_t2_cooldown matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 22
execute if score @s[scores={classic_corrupted_t2_cooldown=420}] classic_corrupted_t2_cooldown matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 21
execute if score @s[scores={classic_corrupted_t2_cooldown=400}] classic_corrupted_t2_cooldown matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 20
execute if score @s[scores={classic_corrupted_t2_cooldown=380}] classic_corrupted_t2_cooldown matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 19
execute if score @s[scores={classic_corrupted_t2_cooldown=360}] classic_corrupted_t2_cooldown matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 18
execute if score @s[scores={classic_corrupted_t2_cooldown=340}] classic_corrupted_t2_cooldown matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 17
execute if score @s[scores={classic_corrupted_t2_cooldown=320}] classic_corrupted_t2_cooldown matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 16
execute if score @s[scores={classic_corrupted_t2_cooldown=300}] classic_corrupted_t2_cooldown matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 15
execute if score @s[scores={classic_corrupted_t2_cooldown=280}] classic_corrupted_t2_cooldown matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 14
execute if score @s[scores={classic_corrupted_t2_cooldown=260}] classic_corrupted_t2_cooldown matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 13
execute if score @s[scores={classic_corrupted_t2_cooldown=240}] classic_corrupted_t2_cooldown matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 12
execute if score @s[scores={classic_corrupted_t2_cooldown=220}] classic_corrupted_t2_cooldown matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 11
execute if score @s[scores={classic_corrupted_t2_cooldown=200}] classic_corrupted_t2_cooldown matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 10
execute if score @s[scores={classic_corrupted_t2_cooldown=180}] classic_corrupted_t2_cooldown matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 9
execute if score @s[scores={classic_corrupted_t2_cooldown=160}] classic_corrupted_t2_cooldown matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 8
execute if score @s[scores={classic_corrupted_t2_cooldown=140}] classic_corrupted_t2_cooldown matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 7
execute if score @s[scores={classic_corrupted_t2_cooldown=120}] classic_corrupted_t2_cooldown matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 6
execute if score @s[scores={classic_corrupted_t2_cooldown=100}] classic_corrupted_t2_cooldown matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 5
execute if score @s[scores={classic_corrupted_t2_cooldown=80}] classic_corrupted_t2_cooldown matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 4
execute if score @s[scores={classic_corrupted_t2_cooldown=60}] classic_corrupted_t2_cooldown matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 3
execute if score @s[scores={classic_corrupted_t2_cooldown=40}] classic_corrupted_t2_cooldown matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 2
execute if score @s[scores={classic_corrupted_t2_cooldown=20}] classic_corrupted_t2_cooldown matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s classic_corrupted_t2_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"speed cooldown","italic":false}]]

#==========================================================================================================================================================
#                           75% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 75 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 75% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 75 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1


# the better permanent jump boost
execute if score @s corruption matches 75.. run effect give @s jump_boost 2 2 true

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tier 3 item
# this one will work a little bit diffrent. because the player needs to EAT this particluar item to trigger it
# the teleport fruit item

# detect if the corrupted has eaten the fruit
execute if score @s corruption_fruit_eat matches 1.. run scoreboard players set @s classic_corrupted_t3_cooldown 600
scoreboard players set @s corruption_fruit_eat 0

# make sure that if the item is dropped put it back in the inventory. the trigger for this abbility will be eating. and NOT dropping
execute if score @s corruption matches 75.. if score @s classic_corrupted_t3_cooldown matches 1.. run scoreboard players remove @s classic_corrupted_t3_cooldown 1
# allow teleportation when dropped
execute if score @s corruption matches 75.. if score @s[scores={classic_corrupted_t3_cooldown=599}] classic_corrupted_t3_cooldown matches 599 run effect give @s resistance 3 4 true
execute if score @s corruption matches 75.. if score @s[scores={classic_corrupted_t3_cooldown=599}] classic_corrupted_t3_cooldown matches 599 run effect give @s glowing 3 1 true
execute if score @s corruption matches 75.. if score @s[scores={classic_corrupted_t3_cooldown=599}] classic_corrupted_t3_cooldown matches 599 run tp @s @r[team=runners]
execute if score @s corruption matches 75.. if score @s[scores={classic_corrupted_t3_cooldown=599}] classic_corrupted_t3_cooldown matches 599 run tp @e[tag=corruption_part] @s
# sound effect
execute if score @s[scores={classic_corrupted_t3_cooldown=599}] classic_corrupted_t3_cooldown matches 599 run playsound entity.enderman.teleport player @s ~ ~ ~ 1 1 1

# check to see if the teleport fruit has been dropped.
execute if score @s corruption matches 75.. unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:6b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}}]
execute if score @s corruption matches 75.. unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:6b}]}] if score @s classic_corrupted_t3_cooldown matches 0 run clear @s chorus_fruit
execute if score @s corruption matches 75.. unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:6b}]}] if score @s classic_corrupted_t3_cooldown matches 0 run item replace entity @s hotbar.6 with chorus_fruit[custom_name=[{"text":"teleport fruit","italic":false,"color":"light_purple"}],lore=[[{"text":"eat to teleport","italic":false}]]]

execute if score @s[scores={classic_corrupted_t3_cooldown=599}] classic_corrupted_t3_cooldown matches 599 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 30
execute if score @s[scores={classic_corrupted_t3_cooldown=580}] classic_corrupted_t3_cooldown matches 580 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 29
execute if score @s[scores={classic_corrupted_t3_cooldown=560}] classic_corrupted_t3_cooldown matches 560 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 28
execute if score @s[scores={classic_corrupted_t3_cooldown=540}] classic_corrupted_t3_cooldown matches 540 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 27
execute if score @s[scores={classic_corrupted_t3_cooldown=520}] classic_corrupted_t3_cooldown matches 520 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 26
execute if score @s[scores={classic_corrupted_t3_cooldown=500}] classic_corrupted_t3_cooldown matches 500 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 25
execute if score @s[scores={classic_corrupted_t3_cooldown=480}] classic_corrupted_t3_cooldown matches 480 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 24
execute if score @s[scores={classic_corrupted_t3_cooldown=460}] classic_corrupted_t3_cooldown matches 460 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 23
execute if score @s[scores={classic_corrupted_t3_cooldown=440}] classic_corrupted_t3_cooldown matches 440 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 22
execute if score @s[scores={classic_corrupted_t3_cooldown=420}] classic_corrupted_t3_cooldown matches 420 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 21
execute if score @s[scores={classic_corrupted_t3_cooldown=400}] classic_corrupted_t3_cooldown matches 400 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 20
execute if score @s[scores={classic_corrupted_t3_cooldown=380}] classic_corrupted_t3_cooldown matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 19
execute if score @s[scores={classic_corrupted_t3_cooldown=360}] classic_corrupted_t3_cooldown matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 18
execute if score @s[scores={classic_corrupted_t3_cooldown=340}] classic_corrupted_t3_cooldown matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 17
execute if score @s[scores={classic_corrupted_t3_cooldown=320}] classic_corrupted_t3_cooldown matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 16
execute if score @s[scores={classic_corrupted_t3_cooldown=300}] classic_corrupted_t3_cooldown matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 15
execute if score @s[scores={classic_corrupted_t3_cooldown=280}] classic_corrupted_t3_cooldown matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 14
execute if score @s[scores={classic_corrupted_t3_cooldown=260}] classic_corrupted_t3_cooldown matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 13
execute if score @s[scores={classic_corrupted_t3_cooldown=240}] classic_corrupted_t3_cooldown matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 12
execute if score @s[scores={classic_corrupted_t3_cooldown=220}] classic_corrupted_t3_cooldown matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 11
execute if score @s[scores={classic_corrupted_t3_cooldown=200}] classic_corrupted_t3_cooldown matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 10
execute if score @s[scores={classic_corrupted_t3_cooldown=180}] classic_corrupted_t3_cooldown matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 9
execute if score @s[scores={classic_corrupted_t3_cooldown=160}] classic_corrupted_t3_cooldown matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 8
execute if score @s[scores={classic_corrupted_t3_cooldown=140}] classic_corrupted_t3_cooldown matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 7
execute if score @s[scores={classic_corrupted_t3_cooldown=120}] classic_corrupted_t3_cooldown matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 6
execute if score @s[scores={classic_corrupted_t3_cooldown=100}] classic_corrupted_t3_cooldown matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 5
execute if score @s[scores={classic_corrupted_t3_cooldown=80}] classic_corrupted_t3_cooldown matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 4
execute if score @s[scores={classic_corrupted_t3_cooldown=60}] classic_corrupted_t3_cooldown matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 3
execute if score @s[scores={classic_corrupted_t3_cooldown=40}] classic_corrupted_t3_cooldown matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 2
execute if score @s[scores={classic_corrupted_t3_cooldown=20}] classic_corrupted_t3_cooldown matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s classic_corrupted_t3_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]]