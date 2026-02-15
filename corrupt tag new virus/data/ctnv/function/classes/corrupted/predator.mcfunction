#██████╗ ██████╗ ███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗ 
#██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
#██████╔╝██████╔╝█████╗  ██║  ██║███████║   ██║   ██║   ██║██████╔╝
#██╔═══╝ ██╔══██╗██╔══╝  ██║  ██║██╔══██║   ██║   ██║   ██║██╔══██╗
#██║     ██║  ██║███████╗██████╔╝██║  ██║   ██║   ╚██████╔╝██║  ██║
#╚═╝     ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                  
# this is the predator. and like any good minecraft youtuber, he is extrodianly good at hunting his victums

# if the predator drops the invisability item, the armor has got to go
 # this code will be on all corrupted classes with slight variations
execute unless score @s predator_corrupted_t2_cooldown matches 400.. run item replace entity @s armor.chest with leather_chestplate[trim={pattern:bolt,material:copper},enchantments={binding_curse:1}]
execute unless score @s predator_corrupted_t2_cooldown matches 400.. run item replace entity @s armor.head with leather_helmet[trim={pattern:bolt,material:copper},enchantments={binding_curse:1}]
execute unless score @s predator_corrupted_t2_cooldown matches 400.. run item replace entity @s armor.legs with netherite_leggings[trim={pattern:bolt,material:copper},enchantments={binding_curse:1}]
execute unless score @s predator_corrupted_t2_cooldown matches 400.. run item replace entity @s armor.feet with netherite_boots[trim={pattern:dune,material:copper},enchantments={binding_curse:1}]
# here is a netherite armor with a trim. with curse of binding
execute if score @s predator_corrupted_t2_cooldown matches 400.. run clear @s leather_chestplate
execute if score @s predator_corrupted_t2_cooldown matches 400.. run clear @s netherite_boots
execute if score @s predator_corrupted_t2_cooldown matches 400.. run clear @s leather_helmet
execute if score @s predator_corrupted_t2_cooldown matches 400.. run clear @s netherite_leggings

#give the corrupted his sword

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:0b}]}] run clear @s netherite_sword

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_sword"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:0b}]}] run item replace entity @s hotbar.0 with netherite_sword[custom_name=[{"text":"Corrupted blade","italic":false,"color":"dark_purple"}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]

# make sure that everyone who is a predator corrupted gets in the cooldown scoreboard
scoreboard players add @s predator_t1_speed_range 0
scoreboard players add @s predator_corrupted_t2_cooldown 0
scoreboard players add @s predator_corrupted_t3_cooldown 0


#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# the predators first abillity is to move faster when close to runners.
# we will use "predator_t1_speed_range" to accomplish this
# right now the range is 18 blocks
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=..18] run scoreboard players set @s predator_t1_speed_range 1
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s unless entity @a[team=runners,distance=..18] run scoreboard players set @s predator_t1_speed_range 0
execute if score @s predator_t1_speed_range matches 1 run effect give @s speed 1 2 true
execute if score @s predator_t1_speed_range matches 0 run effect give @s slowness 4 0 true
# heres a fun one. the predator can smell the fear of his victums. functioning as a sort of radar.
# display the subtitle only by displaying a blank title
execute if score corruption_tick corruption matches 1 if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=..30] run title @s title [{"text": " "}]
# use the subtitle command to show the distance to the nearest runner
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=25..30] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▁▁▁▁▁▁▁"]
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=20..25] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▁▁▁▃▁▁▁"]
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=15..20] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▁▁▃▅▃▁▁"]
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=10..15] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▁▃▅▆▅▃▁"]
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=5..10] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▃▅▇▇▇▅▃"]
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=3..5] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▅▇▇▇▇▇▅"]
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=..3] run title @s subtitle [{"text":"fear:","color":"dark_purple"}," ▇▇▇▇▇▇▇"]
# apply a little bit of extra fear by giving the runner most close the elder guardian jumpscare
execute if score @s corruption matches 15.. as @a[team=corrupted] at @s if entity @a[team=runners,distance=..3] if score tick time matches 2 run particle minecraft:elder_guardian ~ ~ ~ ~ ~ ~ 1 1 force @a[distance=..3,team=runners]


#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================



execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# the permanent jump boost
execute if score @s corruption matches 50.. run effect give @s jump_boost 2 1 true
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=





# the open_eyeblossom item
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:open_eyeblossom",Slot:4b}]}] if score @s predator_corrupted_t2_cooldown matches 0 run scoreboard players set @s predator_corrupted_t2_cooldown 600

execute if score @s corruption matches 50.. if score @s predator_corrupted_t2_cooldown matches 1.. run scoreboard players remove @s predator_corrupted_t2_cooldown 1
# give the corrupted invisibility
execute if score @s corruption matches 50.. if score @s[scores={predator_corrupted_t2_cooldown=599}] predator_corrupted_t2_cooldown matches 599 run effect give @s invisibility 15 3 true

# sound effect
execute if score @s[scores={predator_corrupted_t2_cooldown=599}] predator_corrupted_t2_cooldown matches 599 run playsound entity.vex.charge player @s ~ ~ ~ 1 0.3 0.5
execute if score @s[scores={predator_corrupted_t2_cooldown=599}] predator_corrupted_t2_cooldown matches 599 at @s run particle campfire_signal_smoke ~ ~1 ~ 0.5 0.5 0.5 0.1 150 force @a
# slight buff to the predator
execute if score @s[scores={predator_corrupted_t2_cooldown=599}] predator_corrupted_t2_cooldown matches 599 at @s run effect give @a[team=runners] glowing 5 1 true

# check to see if the open_eyeblossom has been dropped.
# give the corrupted the open_eyeblossom dust. make sure he cant manipulate it
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:open_eyeblossom",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:open_eyeblossom"}}]
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{id:"minecraft:open_eyeblossom",Slot:4b}]}] if score @s predator_corrupted_t2_cooldown matches 0 run item replace entity @s hotbar.4 with open_eyeblossom[custom_name=[{"text":"invisability","italic":false}],lore=[[{"text":"drop for invisability","italic":false}]]]

execute if score @s[scores={predator_corrupted_t2_cooldown=599}] predator_corrupted_t2_cooldown matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 30
execute if score @s[scores={predator_corrupted_t2_cooldown=580}] predator_corrupted_t2_cooldown matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 29
execute if score @s[scores={predator_corrupted_t2_cooldown=560}] predator_corrupted_t2_cooldown matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 28
execute if score @s[scores={predator_corrupted_t2_cooldown=540}] predator_corrupted_t2_cooldown matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 27
execute if score @s[scores={predator_corrupted_t2_cooldown=520}] predator_corrupted_t2_cooldown matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 26
execute if score @s[scores={predator_corrupted_t2_cooldown=500}] predator_corrupted_t2_cooldown matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 25
execute if score @s[scores={predator_corrupted_t2_cooldown=480}] predator_corrupted_t2_cooldown matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 24
execute if score @s[scores={predator_corrupted_t2_cooldown=460}] predator_corrupted_t2_cooldown matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 23
execute if score @s[scores={predator_corrupted_t2_cooldown=440}] predator_corrupted_t2_cooldown matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 22
execute if score @s[scores={predator_corrupted_t2_cooldown=420}] predator_corrupted_t2_cooldown matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 21
execute if score @s[scores={predator_corrupted_t2_cooldown=400}] predator_corrupted_t2_cooldown matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 20
execute if score @s[scores={predator_corrupted_t2_cooldown=380}] predator_corrupted_t2_cooldown matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 19
execute if score @s[scores={predator_corrupted_t2_cooldown=360}] predator_corrupted_t2_cooldown matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 18
execute if score @s[scores={predator_corrupted_t2_cooldown=340}] predator_corrupted_t2_cooldown matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 17
execute if score @s[scores={predator_corrupted_t2_cooldown=320}] predator_corrupted_t2_cooldown matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 16
execute if score @s[scores={predator_corrupted_t2_cooldown=300}] predator_corrupted_t2_cooldown matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 15
execute if score @s[scores={predator_corrupted_t2_cooldown=280}] predator_corrupted_t2_cooldown matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 14
execute if score @s[scores={predator_corrupted_t2_cooldown=260}] predator_corrupted_t2_cooldown matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 13
execute if score @s[scores={predator_corrupted_t2_cooldown=240}] predator_corrupted_t2_cooldown matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 12
execute if score @s[scores={predator_corrupted_t2_cooldown=220}] predator_corrupted_t2_cooldown matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 11
execute if score @s[scores={predator_corrupted_t2_cooldown=200}] predator_corrupted_t2_cooldown matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 10
execute if score @s[scores={predator_corrupted_t2_cooldown=180}] predator_corrupted_t2_cooldown matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 9
execute if score @s[scores={predator_corrupted_t2_cooldown=160}] predator_corrupted_t2_cooldown matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 8
execute if score @s[scores={predator_corrupted_t2_cooldown=140}] predator_corrupted_t2_cooldown matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 7
execute if score @s[scores={predator_corrupted_t2_cooldown=120}] predator_corrupted_t2_cooldown matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 6
execute if score @s[scores={predator_corrupted_t2_cooldown=100}] predator_corrupted_t2_cooldown matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 5
execute if score @s[scores={predator_corrupted_t2_cooldown=80}] predator_corrupted_t2_cooldown matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 4
execute if score @s[scores={predator_corrupted_t2_cooldown=60}] predator_corrupted_t2_cooldown matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 3
execute if score @s[scores={predator_corrupted_t2_cooldown=40}] predator_corrupted_t2_cooldown matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 2
execute if score @s[scores={predator_corrupted_t2_cooldown=20}] predator_corrupted_t2_cooldown matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s predator_corrupted_t2_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"invisability cooldown","italic":false}]]
# if the predator attacks and lands a hit clear the invisability
execute if entity @a[team=runners,limit=1,scores={hit=1..}] run effect clear @s invisibility
execute at @s if entity @a[team=runners,limit=1,scores={hit=1..}] run particle raid_omen ~ ~1 ~ 1 0 1 0.5 55 force @a



#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1


# the permanent speed boost
execute if score @s corruption matches 90.. run effect give @s speed 2 1 true

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tier 3 item
# an item that can remotly stunn all runners for a few seconds

# tier 3 ability: remote stun (slowness) for all runners when dropping a prismarine shard

# check if the corrupted has dropped the prismarine shard (slot 6)
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:prismarine_shard",Slot:6b}]}] if score @s predator_corrupted_t3_cooldown matches 0 run scoreboard players set @s predator_corrupted_t3_cooldown 400

# remove cooldown
execute if score @s corruption matches 90.. if score @s predator_corrupted_t3_cooldown matches 1.. run scoreboard players remove @s predator_corrupted_t3_cooldown 1

# apply slowness to all runners when ability is used
execute if score @s[scores={predator_corrupted_t3_cooldown=399}] predator_corrupted_t3_cooldown matches 399 run effect give @a[team=runners] slowness 12 10 true
execute if score @s[scores={predator_corrupted_t3_cooldown=320..}] predator_corrupted_t3_cooldown matches 320.. at @a[team=runners] run particle raid_omen ~ ~1 ~ 0.05 0.5 0.05 0.2 20 force @a 


# sound effect for activation
execute if score @s[scores={predator_corrupted_t3_cooldown=399}] predator_corrupted_t3_cooldown matches 399 run playsound entity.evoker.prepare_attack player @a ~ ~ ~ 1 1 1
# buff for the predator
execute if score @s[scores={predator_corrupted_t3_cooldown=399}] predator_corrupted_t3_cooldown matches 399 run effect give @a[team=runners] glowing 5 1 true


# make sure the corrupted can't manipulate the prismarine shard
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:prismarine_shard",Slot:6b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:prismarine_shard"}}]
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{id:"minecraft:prismarine_shard",Slot:6b}]}] if score @s predator_corrupted_t3_cooldown matches 0 run item replace entity @s hotbar.6 with prismarine_shard[custom_name=[{"text":"Remote Stun","italic":false}],lore=[[{"text":"Drop to stun all runners!","italic":false}]]]


# cooldown indicator (gray dye)
execute if score @s[scores={predator_corrupted_t3_cooldown=399}] predator_corrupted_t3_cooldown matches 399 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 20
execute if score @s[scores={predator_corrupted_t3_cooldown=380}] predator_corrupted_t3_cooldown matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 19
execute if score @s[scores={predator_corrupted_t3_cooldown=360}] predator_corrupted_t3_cooldown matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 18
execute if score @s[scores={predator_corrupted_t3_cooldown=340}] predator_corrupted_t3_cooldown matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 17
execute if score @s[scores={predator_corrupted_t3_cooldown=320}] predator_corrupted_t3_cooldown matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 16
execute if score @s[scores={predator_corrupted_t3_cooldown=300}] predator_corrupted_t3_cooldown matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 15
execute if score @s[scores={predator_corrupted_t3_cooldown=280}] predator_corrupted_t3_cooldown matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 14
execute if score @s[scores={predator_corrupted_t3_cooldown=260}] predator_corrupted_t3_cooldown matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 13
execute if score @s[scores={predator_corrupted_t3_cooldown=240}] predator_corrupted_t3_cooldown matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 12
execute if score @s[scores={predator_corrupted_t3_cooldown=220}] predator_corrupted_t3_cooldown matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 11
execute if score @s[scores={predator_corrupted_t3_cooldown=200}] predator_corrupted_t3_cooldown matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 10
execute if score @s[scores={predator_corrupted_t3_cooldown=180}] predator_corrupted_t3_cooldown matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 9
execute if score @s[scores={predator_corrupted_t3_cooldown=160}] predator_corrupted_t3_cooldown matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 8
execute if score @s[scores={predator_corrupted_t3_cooldown=140}] predator_corrupted_t3_cooldown matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 7
execute if score @s[scores={predator_corrupted_t3_cooldown=120}] predator_corrupted_t3_cooldown matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 6
execute if score @s[scores={predator_corrupted_t3_cooldown=100}] predator_corrupted_t3_cooldown matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 5
execute if score @s[scores={predator_corrupted_t3_cooldown=80}] predator_corrupted_t3_cooldown matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 4
execute if score @s[scores={predator_corrupted_t3_cooldown=60}] predator_corrupted_t3_cooldown matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 3
execute if score @s[scores={predator_corrupted_t3_cooldown=40}] predator_corrupted_t3_cooldown matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 2
execute if score @s[scores={predator_corrupted_t3_cooldown=20}] predator_corrupted_t3_cooldown matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]] 1

# clear the gray dye when cooldown is done
execute if score @s predator_corrupted_t3_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"stun cooldown","italic":false}]]


#===========================================================================================================================================================
# calling card
# if the predator wins in hide and reap he gets this card
execute if score victory_timer victory matches 10 run advancement grant @s only ctnv:corrupt_tag/lether_terror