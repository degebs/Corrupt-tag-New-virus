# █████╗ ██████╗ ██████╗  █████╗ ██████╗ ██╗████████╗██╗ ██████╗ ███╗   ██╗
#██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║╚══██╔══╝██║██╔═══██╗████╗  ██║
#███████║██████╔╝██████╔╝███████║██████╔╝██║   ██║   ██║██║   ██║██╔██╗ ██║
#██╔══██║██╔═══╝ ██╔═══╝ ██╔══██║██╔══██╗██║   ██║   ██║██║   ██║██║╚██╗██║
#██║  ██║██║     ██║     ██║  ██║██║  ██║██║   ██║   ██║╚██████╔╝██║ ╚████║
#╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝

# give the apparition his armor until his 15% abbility
execute as @s[team=corrupted] unless score @s corruption matches 15.. run item replace entity @s[scores={evil_class=3}] armor.chest with netherite_chestplate[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:bolt,material:redstone}]
execute as @s[team=corrupted] unless score @s corruption matches 15.. run item replace entity @s[scores={evil_class=3}] armor.head with netherite_helmet[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:bolt,material:redstone}]
execute as @s[team=corrupted] unless score @s corruption matches 15.. run item replace entity @s[scores={evil_class=3}] armor.legs with netherite_leggings[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:silence,material:redstone}]
execute as @s[team=corrupted] unless score @s corruption matches 15.. run item replace entity @s[scores={evil_class=3}] armor.feet with netherite_boots[rarity=uncommon,enchantments={binding_curse:1,},trim={pattern:bolt,material:redstone}]
# the "as @s[team=corrupted]" part is because there is a glitch that causes all players in the loby to get this armor, even if they are not corrupted.
# i honestly have no idea why this happens, but thankfully this fixes it. 
# UPDATE: the "as @s[team=corrupted]" was entirely unnessary. it was caused by a command block that was triggering the function even when it was not needed.

# there is a need to clear all the stained glass that drops from the apparition hotbar
# clear the pink, red and magenta stained glass panes from the hotbar
execute as @e[type=item,nbt={Item:{id:"minecraft:pink_stained_glass_pane"}}] run kill @s
execute as @e[type=item,nbt={Item:{id:"minecraft:magenta_stained_glass_pane"}}] run kill @s
execute as @e[type=item,nbt={Item:{id:"minecraft:red_stained_glass_pane"}}] run kill @s

#occasionaly clear the hotbar of the apparition
execute if score corruption_tick corruption matches 1 run clear @s[type=item,nbt={Item:{id:"minecraft:red_stained_glass_pane"}}]
execute if score corruption_tick corruption matches 1 run clear @s[type=item,nbt={Item:{id:"minecraft:pink_stained_glass_pane"}}]
execute if score corruption_tick corruption matches 1 run clear @s[type=item,nbt={Item:{id:"minecraft:magenta_stained_glass_pane"}}]

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s[scores={evil_class=3}] [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.ambient player @s ~ ~ ~ 1 1 1
# remove the armor when permanently invisable
execute if score @s corruption matches 15.. run effect give @s[scores={evil_class=3}] invisibility 1 1 true
execute if score @s corruption matches 15 run clear @s[scores={evil_class=3}] netherite_boots
execute if score @s corruption matches 15 run clear @s[scores={evil_class=3}] netherite_leggings
execute if score @s corruption matches 15 run clear @s[scores={evil_class=3}] netherite_chestplate
execute if score @s corruption matches 15 run clear @s[scores={evil_class=3}] netherite_helmet
execute if score @s corruption matches 15 at @s[scores={evil_class=3}] run particle campfire_signal_smoke ~ ~ ~ 0.2 0.5 0.2 0.1 25 normal @a

# make the corrupted one slow when closer to runners
execute at @s if entity @a[distance=..2,team=runners] run effect give @s[scores={evil_class=3}] slowness 2 2 true
execute at @s if entity @a[distance=3..5,team=runners] run effect give @s[scores={evil_class=3}] slowness 2 1 true
execute at @s unless entity @a[distance=..5,team=runners] run effect clear @s[scores={evil_class=3}] slowness
# speed when far away from runners
execute at @s unless entity @a[distance=30..,team=runners] run effect give @s speed 1 1 true
# apply slowness to the runners
execute at @s if entity @a[distance=..3,team=runners] run effect give @a[distance=3..5,team=runners] slowness 2 2 true

# a particle effect
execute if score @s corruption matches 15.. run execute at @s if entity @e[distance=..5,team=runners] run particle portal ~ ~1 ~ 3 2 3 0.1 1 normal @a

# thre will be a cool effect that in the mittle hotbar slot with glass pains
execute if score @s corruption matches 15.. unless score @s apparition_light_level matches 1 if score tick time matches 4 run item replace entity @s[scores={evil_class=3}] hotbar.0 with magenta_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. unless score @s apparition_light_level matches 1 if score tick time matches 10 run item replace entity @s[scores={evil_class=3}] hotbar.1 with magenta_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. unless score @s apparition_light_level matches 1 if score tick time matches 16 run item replace entity @s[scores={evil_class=3}] hotbar.2 with magenta_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]

execute if score @s corruption matches 15.. unless score @s apparition_light_level matches 1 if score tick time matches 16 run item replace entity @s[scores={evil_class=3}] hotbar.6 with magenta_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. unless score @s apparition_light_level matches 1 if score tick time matches 10 run item replace entity @s[scores={evil_class=3}] hotbar.7 with magenta_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. unless score @s apparition_light_level matches 1 if score tick time matches 4 run item replace entity @s[scores={evil_class=3}] hotbar.8 with magenta_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
# pulsing animation
execute if score @s corruption matches 15.. if score tick time matches 1 run item replace entity @s[scores={evil_class=3}] hotbar.0 with pink_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. if score tick time matches 6 run item replace entity @s[scores={evil_class=3}] hotbar.1 with pink_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. if score tick time matches 12 run item replace entity @s[scores={evil_class=3}] hotbar.2 with pink_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]


execute if score @s corruption matches 15.. if score tick time matches 1 run item replace entity @s[scores={evil_class=3}] hotbar.8 with pink_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. if score tick time matches 6 run item replace entity @s[scores={evil_class=3}] hotbar.7 with pink_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s corruption matches 15.. if score tick time matches 12 run item replace entity @s[scores={evil_class=3}] hotbar.6 with pink_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]

#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================



execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s[scores={evil_class=3}] [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# the corrupted shall get a speed boost. ONLY IN THE DARK


# Example: Give speed if player is in darkness (light level 0..7)
# using the predicate component in the execute command we can check light levels
execute at @s[scores={evil_class=3}] if predicate {"condition": "minecraft:location_check","predicate": {"light": {"light": {"min": 0,"max": 7}}}} if score @s corruption matches 50.. run scoreboard players set @s apparition_light_level 1
execute at @s[scores={evil_class=3}] unless predicate {"condition": "minecraft:location_check","predicate": {"light": {"light": {"min": 0,"max": 7}}}} if score @s corruption matches 50.. run scoreboard players set @s apparition_light_level 0
# give the apparition speed when in the dark
execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. run effect give @s speed 3 3 true

# the pulsing animation will change to a red stained glass pane only when in the dark
execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. if score tick time matches 4 run item replace entity @s[scores={evil_class=3}] hotbar.0 with red_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. if score tick time matches 10 run item replace entity @s[scores={evil_class=3}] hotbar.1 with red_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. if score tick time matches 16 run item replace entity @s[scores={evil_class=3}] hotbar.2 with red_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]

execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. if score tick time matches 4 run item replace entity @s[scores={evil_class=3}] hotbar.8 with red_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. if score tick time matches 10 run item replace entity @s[scores={evil_class=3}] hotbar.7 with red_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]
execute if score @s[scores={evil_class=3}] apparition_light_level matches 1 if score @s corruption matches 50.. if score tick time matches 16 run item replace entity @s[scores={evil_class=3}] hotbar.6 with red_stained_glass_pane[custom_name=[{"text":" ","italic":false}]]

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
# give the apparition his reveal all players ability (its identical in every whay to the corruptor's ability)
# with one exeption: at 90% this ability will be replaced with the 90% ability

# Apparition reveal ability (50%..89% corruption, uses apparition_t2_cooldown, disables at 90%)
# if the player drops the glowstone item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s[scores={evil_class=3}] corruption matches 50..90 unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:4b}]}] if score @s apparition_corrupted_t2_cooldown matches 0 run scoreboard players set @s apparition_corrupted_t2_cooldown 600

execute if score @s[scores={evil_class=3}] corruption matches 50..90 if score @s apparition_corrupted_t2_cooldown matches 1.. run scoreboard players remove @s apparition_corrupted_t2_cooldown 1
# give the corrupted his vission of all runners
execute if score @s[scores={evil_class=3}] corruption matches 50..90 if score @s[scores={apparition_corrupted_t2_cooldown=599}] apparition_corrupted_t2_cooldown matches 599 run effect give @a[team=runners] glowing 15 1

# sound effect
execute if score @s[scores={apparition_corrupted_t2_cooldown=599,evil_class=3}] apparition_corrupted_t2_cooldown matches 599 run playsound block.beacon.activate player @s ~ ~ ~ 1 1 0.5

# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s[scores={evil_class=3}] corruption matches 50..90 unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust"}}]
execute if score @s[scores={evil_class=3}] corruption matches 50..90 unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:4b}]}] if score @s apparition_corrupted_t2_cooldown matches 0 run item replace entity @s hotbar.4 with glowstone_dust[custom_name=[{"text":"reveal players","italic":false,"color":"yellow"}],lore=[[{"text":"drop to reveal players","italic":false}]]]

# do a cooldown timer with gray dye
execute if score @s[scores={apparition_corrupted_t2_cooldown=599}] apparition_corrupted_t2_cooldown matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 30
execute if score @s[scores={apparition_corrupted_t2_cooldown=580}] apparition_corrupted_t2_cooldown matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 29
execute if score @s[scores={apparition_corrupted_t2_cooldown=560}] apparition_corrupted_t2_cooldown matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 28
execute if score @s[scores={apparition_corrupted_t2_cooldown=540}] apparition_corrupted_t2_cooldown matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 27
execute if score @s[scores={apparition_corrupted_t2_cooldown=520}] apparition_corrupted_t2_cooldown matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 26
execute if score @s[scores={apparition_corrupted_t2_cooldown=500}] apparition_corrupted_t2_cooldown matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 25
execute if score @s[scores={apparition_corrupted_t2_cooldown=480}] apparition_corrupted_t2_cooldown matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 24
execute if score @s[scores={apparition_corrupted_t2_cooldown=460}] apparition_corrupted_t2_cooldown matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 23
execute if score @s[scores={apparition_corrupted_t2_cooldown=440}] apparition_corrupted_t2_cooldown matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 22
execute if score @s[scores={apparition_corrupted_t2_cooldown=420}] apparition_corrupted_t2_cooldown matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 21
execute if score @s[scores={apparition_corrupted_t2_cooldown=400}] apparition_corrupted_t2_cooldown matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 20
execute if score @s[scores={apparition_corrupted_t2_cooldown=380}] apparition_corrupted_t2_cooldown matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 19
execute if score @s[scores={apparition_corrupted_t2_cooldown=360}] apparition_corrupted_t2_cooldown matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 18
execute if score @s[scores={apparition_corrupted_t2_cooldown=340}] apparition_corrupted_t2_cooldown matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 17
execute if score @s[scores={apparition_corrupted_t2_cooldown=320}] apparition_corrupted_t2_cooldown matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 16
execute if score @s[scores={apparition_corrupted_t2_cooldown=300}] apparition_corrupted_t2_cooldown matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 15
execute if score @s[scores={apparition_corrupted_t2_cooldown=280}] apparition_corrupted_t2_cooldown matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 14
execute if score @s[scores={apparition_corrupted_t2_cooldown=260}] apparition_corrupted_t2_cooldown matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 13
execute if score @s[scores={apparition_corrupted_t2_cooldown=240}] apparition_corrupted_t2_cooldown matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 12
execute if score @s[scores={apparition_corrupted_t2_cooldown=220}] apparition_corrupted_t2_cooldown matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 11
execute if score @s[scores={apparition_corrupted_t2_cooldown=200}] apparition_corrupted_t2_cooldown matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 10
execute if score @s[scores={apparition_corrupted_t2_cooldown=180}] apparition_corrupted_t2_cooldown matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 9
execute if score @s[scores={apparition_corrupted_t2_cooldown=160}] apparition_corrupted_t2_cooldown matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 8
execute if score @s[scores={apparition_corrupted_t2_cooldown=140}] apparition_corrupted_t2_cooldown matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 7
execute if score @s[scores={apparition_corrupted_t2_cooldown=120}] apparition_corrupted_t2_cooldown matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 6
execute if score @s[scores={apparition_corrupted_t2_cooldown=100}] apparition_corrupted_t2_cooldown matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 5
execute if score @s[scores={apparition_corrupted_t2_cooldown=80}] apparition_corrupted_t2_cooldown matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 4
execute if score @s[scores={apparition_corrupted_t2_cooldown=60}] apparition_corrupted_t2_cooldown matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 3
execute if score @s[scores={apparition_corrupted_t2_cooldown=40}] apparition_corrupted_t2_cooldown matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 2
execute if score @s[scores={apparition_corrupted_t2_cooldown=20}] apparition_corrupted_t2_cooldown matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s apparition_corrupted_t2_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]]

#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1


# the better permanent jump boost
execute if score @s corruption matches 90.. run effect give @s jump_boost 2 2 true

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tier 3 item
# this one will work a little bit diffrent. because the player needs to EAT this particluar item to trigger it
# the teleport fruit item
execute if score @s corruption matches 90.. run effect give @a[team=runners] glowing 1 1 true
execute if score @s corruption matches 90.. run clear @s glowstone_dust
# detect if the corrupted has eaten the fruit
execute if score @s corruption_fruit_eat matches 1.. run scoreboard players set @s apparition_corrupted_t3_cooldown 600
scoreboard players set @s corruption_fruit_eat 0

# make sure that if the item is dropped put it back in the inventory. the trigger for this abbility will be eating. and NOT dropping
execute if score @s corruption matches 90.. if score @s apparition_corrupted_t3_cooldown matches 1.. run scoreboard players remove @s apparition_corrupted_t3_cooldown 1
# allow teleportation when dropped
execute if score @s corruption matches 90.. if score @s[scores={apparition_corrupted_t3_cooldown=599}] apparition_corrupted_t3_cooldown matches 599 run effect give @s resistance 3 4 true
execute if score @s corruption matches 90.. if score @s[scores={apparition_corrupted_t3_cooldown=599}] apparition_corrupted_t3_cooldown matches 599 run effect give @s glowing 3 1 true
execute if score @s corruption matches 90.. if score @s[scores={apparition_corrupted_t3_cooldown=599}] apparition_corrupted_t3_cooldown matches 599 run tp @s @r[team=runners]
execute if score @s corruption matches 90.. if score @s[scores={apparition_corrupted_t3_cooldown=599}] apparition_corrupted_t3_cooldown matches 599 run tp @e[tag=corruption_part] @s
# sound effect
execute if score @s[scores={apparition_corrupted_t3_cooldown=599}] apparition_corrupted_t3_cooldown matches 599 run playsound entity.enderman.teleport player @s ~ ~ ~ 1 1 1

# check to see if the teleport fruit has been dropped.
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}}]
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:4b}]}] if score @s apparition_corrupted_t3_cooldown matches 0 run clear @s chorus_fruit
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:4b}]}] if score @s apparition_corrupted_t3_cooldown matches 0 run item replace entity @s hotbar.4 with chorus_fruit[custom_name=[{"text":"teleport fruit","italic":false,"color":"light_purple"}],lore=[[{"text":"eat to teleport","italic":false}]]]

execute if score @s[scores={apparition_corrupted_t3_cooldown=599}] apparition_corrupted_t3_cooldown matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 30
execute if score @s[scores={apparition_corrupted_t3_cooldown=580}] apparition_corrupted_t3_cooldown matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 29
execute if score @s[scores={apparition_corrupted_t3_cooldown=560}] apparition_corrupted_t3_cooldown matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 28
execute if score @s[scores={apparition_corrupted_t3_cooldown=540}] apparition_corrupted_t3_cooldown matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 27
execute if score @s[scores={apparition_corrupted_t3_cooldown=520}] apparition_corrupted_t3_cooldown matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 26
execute if score @s[scores={apparition_corrupted_t3_cooldown=500}] apparition_corrupted_t3_cooldown matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 25
execute if score @s[scores={apparition_corrupted_t3_cooldown=480}] apparition_corrupted_t3_cooldown matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 24
execute if score @s[scores={apparition_corrupted_t3_cooldown=460}] apparition_corrupted_t3_cooldown matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 23
execute if score @s[scores={apparition_corrupted_t3_cooldown=440}] apparition_corrupted_t3_cooldown matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 22
execute if score @s[scores={apparition_corrupted_t3_cooldown=420}] apparition_corrupted_t3_cooldown matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 21
execute if score @s[scores={apparition_corrupted_t3_cooldown=400}] apparition_corrupted_t3_cooldown matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 20
execute if score @s[scores={apparition_corrupted_t3_cooldown=380}] apparition_corrupted_t3_cooldown matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 19
execute if score @s[scores={apparition_corrupted_t3_cooldown=360}] apparition_corrupted_t3_cooldown matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 18
execute if score @s[scores={apparition_corrupted_t3_cooldown=340}] apparition_corrupted_t3_cooldown matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 17
execute if score @s[scores={apparition_corrupted_t3_cooldown=320}] apparition_corrupted_t3_cooldown matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 16
execute if score @s[scores={apparition_corrupted_t3_cooldown=300}] apparition_corrupted_t3_cooldown matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 15
execute if score @s[scores={apparition_corrupted_t3_cooldown=280}] apparition_corrupted_t3_cooldown matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 14
execute if score @s[scores={apparition_corrupted_t3_cooldown=260}] apparition_corrupted_t3_cooldown matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 13
execute if score @s[scores={apparition_corrupted_t3_cooldown=240}] apparition_corrupted_t3_cooldown matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 12
execute if score @s[scores={apparition_corrupted_t3_cooldown=220}] apparition_corrupted_t3_cooldown matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 11
execute if score @s[scores={apparition_corrupted_t3_cooldown=200}] apparition_corrupted_t3_cooldown matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 10
execute if score @s[scores={apparition_corrupted_t3_cooldown=180}] apparition_corrupted_t3_cooldown matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 9
execute if score @s[scores={apparition_corrupted_t3_cooldown=160}] apparition_corrupted_t3_cooldown matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 8
execute if score @s[scores={apparition_corrupted_t3_cooldown=140}] apparition_corrupted_t3_cooldown matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 7
execute if score @s[scores={apparition_corrupted_t3_cooldown=120}] apparition_corrupted_t3_cooldown matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 6
execute if score @s[scores={apparition_corrupted_t3_cooldown=100}] apparition_corrupted_t3_cooldown matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 5
execute if score @s[scores={apparition_corrupted_t3_cooldown=80}] apparition_corrupted_t3_cooldown matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 4
execute if score @s[scores={apparition_corrupted_t3_cooldown=60}] apparition_corrupted_t3_cooldown matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 3
execute if score @s[scores={apparition_corrupted_t3_cooldown=40}] apparition_corrupted_t3_cooldown matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 2
execute if score @s[scores={apparition_corrupted_t3_cooldown=20}] apparition_corrupted_t3_cooldown matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s apparition_corrupted_t3_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"teleport cooldown","italic":false}]]