#███████╗██████╗  █████╗  ██████╗███████╗███╗   ███╗ █████╗ ███╗   ██╗
#██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝████╗ ████║██╔══██╗████╗  ██║
#███████╗██████╔╝███████║██║     █████╗  ██╔████╔██║███████║██╔██╗ ██║
#╚════██║██╔═══╝ ██╔══██║██║     ██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
#███████║██║     ██║  ██║╚██████╗███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                                     
# the man in SPACE!!!!!!
# WOW. he has low gravity and teleportation abilitys!


#==============================================================================================================================================================
#give the miner_lantern his spear
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:golden_spear",Slot:0b}]}] run clear @s golden_spear

execute unless entity @s[nbt={Inventory:[{id:"minecraft:golden_spear",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:golden_spear"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:golden_spear",Slot:0b}]}] run item replace entity @s hotbar.0 with golden_spear[custom_name=[{"text":"LAIKA","italic":false}],rarity=uncommon,enchantments={unbreaking:255},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]
kill @e[type=item,nbt={Item:{id:"minecraft:barrier"}}]

#==============================================================================================================================================================
#low gravity
#==============================================================================================================================================================
execute if score bool global_high_gravity matches 0 run attribute @s gravity base set 0.04


#==============================================================================================================================================================
# rewind shard
# part 1
#==============================================================================================================================================================
scoreboard players add @s spaceman_rewind_shard_detect 0
scoreboard players add @s spaceman_rewind_shard_state 0
scoreboard players add @s spaceman_teleport_detect 0
scoreboard players add @s spaceman_teleport_cooldown 0
scoreboard players add @s spaceman_teleport_count 0

# detect if the shard dropped
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run summon minecraft:item_display ~ ~0.1 ~ {Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_data":{rewind_shard:1b}}},Tags:["rewind_shard"],transformation:{left_rotation:[-0.50000006f,-0.5f,-0.5f,0.50000006f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.62500036f,0.6250002f,0.62500006f],translation:[-0.11718749f,0.0f,0.11718752f]}},{Passengers:[{id:"minecraft:item_display",item:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_data":{rewind_shard:1b}}},Tags:["rewind_shard"],transformation:{left_rotation:[0.0f,0.7071068f,0.7071068f,0.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0000001f,0.99999994f,0.99999994f],translation:[-0.17039391f,-0.0625f,-0.030880034f]}}],id:"minecraft:item_display",item:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_data":{rewind_shard:1b}}},Tags:["rewind_shard"],transformation:{left_rotation:[-0.7071068f,0.0f,0.0f,0.7071068f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0000001f,0.99999994f,0.99999994f],translation:[0.01710608f,-0.0625f,0.15661997f]}}],item:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_data":{rewind_shard:1b}}},Tags:["rewind_shard"],transformation:{left_rotation:[-0.5f,0.5f,0.5f,0.5f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.62500006f,0.6249997f,0.6249999f],translation:[0.0f,0.0f,0.0f]}}
#execute if score @s spaceman_rewind_shard_detect matches 1 at @s run summon 


execute if score @s spaceman_rewind_shard_detect matches 1 at @s run scoreboard players set @s spaceman_rewind_shard_state 1
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run kill @e[type=item,nbt={Item:{id:"minecraft:echo_shard"}}]
# do a bunch of sounds
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 1
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.9
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.8
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.7
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.6
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.5
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.4
execute if score @s spaceman_rewind_shard_detect matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.3


execute if score @s spaceman_rewind_shard_detect matches 1 at @s run scoreboard players set @s spaceman_rewind_shard_detect 0
# this will sumon the rewind shard then set the rewind state to 1 before resetting

# the item
execute at @s if score @s spaceman_rewind_shard_detect matches 0 if score @s spaceman_rewind_shard_state matches 0 if score @s spaceman_teleport_cooldown matches 0 unless block ~ ~-1 ~ air run item replace entity @s hotbar.2 with echo_shard[custom_name=[{"text":"Rewind Shard","italic":false}],rarity=rare]
execute at @s if block ~ ~-1 ~ air run clear @s echo_shard
#==============================================================================================================================================================
# rewind shard
# part 2
#==============================================================================================================================================================
# now we must do the actual teleporation.

# sounds and particles
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.3
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.5
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound entity.player.teleport player @a ~ ~ ~ 1 0.5
#particle
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run particle minecraft:portal ~ ~ ~ 0 0 0 1 100 normal @a
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @e[tag=rewind_shard_trail,type=block_display] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0.5 50 normal @a
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @e[tag=rewind_shard,type=item_display] run particle minecraft:end_rod ~ ~ ~ 0 1 0 0.5 500 force @a


# the item
execute if score @s spaceman_teleport_detect matches 0 if score @s spaceman_rewind_shard_state matches 1 run item replace entity @s hotbar.2 with music_disc_5[custom_name=[{"text":"Primed Rewind Shard","italic":false}],rarity=rare]
# check if they drop it
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run tp @s @e[tag=rewind_shard,sort=nearest,limit=1]
# the nausia effects
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run effect give @s nausea 8 5 false
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run effect give @s slowness 10 4 true
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run effect give @s darkness 4 4 true

execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_5"}}]
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run kill @e[tag=rewind_shard,distance=..2]
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run kill @e[tag=rewind_shard_trail]


# after sounds
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.3
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound item.lodestone_compass.lock master @s ~ ~ ~ 1 0.5
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound entity.player.teleport player @a ~ ~ ~ 1 1
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound block.sculk.spread player @a ~ ~ ~ 1 1
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run playsound block.beacon.activate player @a ~ ~ ~ 1 1.6

# finish
execute if score @s spaceman_teleport_detect matches 1 if score @s spaceman_rewind_shard_state matches 1 at @s run scoreboard players set @s spaceman_rewind_shard_state 2
execute if score @s spaceman_teleport_detect matches 1 run scoreboard players add @s spaceman_teleport_count 1


execute if score @s spaceman_teleport_detect matches 1 run scoreboard players set @s spaceman_teleport_detect 0

# make sure that only YOUR particles are yours by adding the tag of the player. there could be multiple spacemen
#execute at @s run tag @e[type=block_display,tag=rewind_shard_trail,distance=..5] add 
# turns out you cant just add tags that are player names. i have minecraft coding

#==============================================================================================================================================================
# the cooldown
#==============================================================================================================================================================
# 40 second cooldown
execute if score @s spaceman_rewind_shard_state matches 2 run scoreboard players set @s spaceman_teleport_cooldown 800
execute if score @s spaceman_rewind_shard_state matches 2 run scoreboard players set @s spaceman_rewind_shard_state 0

execute if score @s spaceman_teleport_cooldown matches 1.. run scoreboard players remove @s spaceman_teleport_cooldown 1

# the cooldown
execute if score @s spaceman_teleport_cooldown matches 1199.. run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 60
execute if score @s spaceman_teleport_cooldown matches 1180 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 59
execute if score @s spaceman_teleport_cooldown matches 1160 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 58
execute if score @s spaceman_teleport_cooldown matches 1140 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 57
execute if score @s spaceman_teleport_cooldown matches 1120 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 56
execute if score @s spaceman_teleport_cooldown matches 1100 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 55
execute if score @s spaceman_teleport_cooldown matches 1080 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 54
execute if score @s spaceman_teleport_cooldown matches 1060 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 53
execute if score @s spaceman_teleport_cooldown matches 1040 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 52
execute if score @s spaceman_teleport_cooldown matches 1020 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 51
execute if score @s spaceman_teleport_cooldown matches 1000 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 50
execute if score @s spaceman_teleport_cooldown matches 980 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 49
execute if score @s spaceman_teleport_cooldown matches 960 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 48
execute if score @s spaceman_teleport_cooldown matches 940 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 47
execute if score @s spaceman_teleport_cooldown matches 920 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 46
execute if score @s spaceman_teleport_cooldown matches 900 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 45
execute if score @s spaceman_teleport_cooldown matches 880 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 44
execute if score @s spaceman_teleport_cooldown matches 860 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 43
execute if score @s spaceman_teleport_cooldown matches 840 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 42
execute if score @s spaceman_teleport_cooldown matches 820 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 41
execute if score @s spaceman_teleport_cooldown matches 800 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 40
execute if score @s spaceman_teleport_cooldown matches 780 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 39
execute if score @s spaceman_teleport_cooldown matches 760 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 38
execute if score @s spaceman_teleport_cooldown matches 740 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 37
execute if score @s spaceman_teleport_cooldown matches 720 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 36
execute if score @s spaceman_teleport_cooldown matches 700 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 35
execute if score @s spaceman_teleport_cooldown matches 680 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 34
execute if score @s spaceman_teleport_cooldown matches 660 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 33
execute if score @s spaceman_teleport_cooldown matches 640 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 32
execute if score @s spaceman_teleport_cooldown matches 620 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 31
execute if score @s spaceman_teleport_cooldown matches 599 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 30
execute if score @s spaceman_teleport_cooldown matches 580 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 29
execute if score @s spaceman_teleport_cooldown matches 560 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 28
execute if score @s spaceman_teleport_cooldown matches 540 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 27
execute if score @s spaceman_teleport_cooldown matches 520 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 26
execute if score @s spaceman_teleport_cooldown matches 500 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 25
execute if score @s spaceman_teleport_cooldown matches 480 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 24
execute if score @s spaceman_teleport_cooldown matches 460 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 23
execute if score @s spaceman_teleport_cooldown matches 440 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 22
execute if score @s spaceman_teleport_cooldown matches 420 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 21
execute if score @s spaceman_teleport_cooldown matches 400 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 20
execute if score @s spaceman_teleport_cooldown matches 380 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 19
execute if score @s spaceman_teleport_cooldown matches 360 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 18
execute if score @s spaceman_teleport_cooldown matches 340 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 17
execute if score @s spaceman_teleport_cooldown matches 320 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 16
execute if score @s spaceman_teleport_cooldown matches 300 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 15
execute if score @s spaceman_teleport_cooldown matches 280 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 14
execute if score @s spaceman_teleport_cooldown matches 260 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 13
execute if score @s spaceman_teleport_cooldown matches 240 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 12
execute if score @s spaceman_teleport_cooldown matches 220 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 11
execute if score @s spaceman_teleport_cooldown matches 200 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 10
execute if score @s spaceman_teleport_cooldown matches 180 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 9
execute if score @s spaceman_teleport_cooldown matches 160 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 8
execute if score @s spaceman_teleport_cooldown matches 140 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 7
execute if score @s spaceman_teleport_cooldown matches 120 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 6
execute if score @s spaceman_teleport_cooldown matches 100 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 5
execute if score @s spaceman_teleport_cooldown matches 80 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 4
execute if score @s spaceman_teleport_cooldown matches 60 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 3
execute if score @s spaceman_teleport_cooldown matches 40 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 2
execute if score @s spaceman_teleport_cooldown matches 20 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]] 1
execute if score @s spaceman_teleport_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"Rewind shard cooldown","italic":false}]]
