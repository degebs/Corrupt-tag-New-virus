#████████╗██████╗ ██╗ ██████╗██╗  ██╗███████╗████████╗███████╗██████╗ 
#╚══██╔══╝██╔══██╗██║██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝██╔════╝██╔══██╗
#   ██║   ██████╔╝██║██║     █████╔╝ ███████╗   ██║   █████╗  ██████╔╝
#   ██║   ██╔══██╗██║██║     ██╔═██╗ ╚════██║   ██║   ██╔══╝  ██╔══██╗
#   ██║   ██║  ██║██║╚██████╗██║  ██╗███████║   ██║   ███████╗██║  ██║
#   ╚═╝   ╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

# this class can and will screw over all the other runners                                                                    

#==============================================================================================================================================================
#give the miner_lantern his coper Shovel
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_shovel",Slot:0b}]}] run clear @s copper_shovel

execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_shovel",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:copper_shovel"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_shovel",Slot:0b}]}] run item replace entity @s hotbar.0 with copper_shovel[custom_name=[{"text":"Stańczyk's whacking paddle","italic":false}],rarity=uncommon,enchantments={unbreaking:255},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]


#==============================================================================================================================================================
# player swap
#==============================================================================================================================================================
# for this to work there needs to be at least 3 "gamers"

# if not enough gamers. just put a barrier block in the 3rd slot and have its name be "no runners to swap with"
execute if score gamers players_online matches ..2 run item replace entity @s hotbar.2 with barrier[item_name=[{"text":"No runners to swap with","color":"red","italic":false}]]
kill @e[type=item,nbt={Item:{id:"minecraft:barrier",}}]

# if there are enough gamers do the normal thing
execute if score gamers players_online matches 3.. as @s run function ctnv:one_time_function/tricker_swap

#==============================================================================================================================================================
# decoy
#==============================================================================================================================================================
#
scoreboard players add @s decoy_detect 0
scoreboard players add @s decoy_cooldown 0

# the rng
scoreboard players add @s decoy_rng 1
execute if score @s decoy_rng matches 13.. run scoreboard players set @s decoy_rng 1

# the item
execute as @s at @s if score @s decoy_detect matches 0 if score @s decoy_cooldown matches 0 run item replace entity @s hotbar.4 with music_disc_cat[item_name=[{"text":"Decoy","color":"green","italic":false}]]
execute as @s at @s if score @s decoy_detect matches 1 run clear @s music_disc_cat
execute as @s at @s if score @s decoy_detect matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_cat"}}]
# the decoy rng number will dictate what skin the decoy uses
# medic
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 1 run summon skeleton ~ ~ ~ {CustomName:[Medic],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:diamond_shovel},offhand:{id:poppy},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
# archer
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 2 run summon skeleton ~ ~ ~ {CustomName:[Archer],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:bow},offhand:{id:cyan_candle},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
# bulk
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 3 run summon skeleton ~ ~ ~ {CustomName:[Bulk],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:iron_sword},offhand:{id:shield},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
# assassin
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 4 run summon skeleton ~ ~ ~ {CustomName:[Assassin],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:stone_sword},offhand:{id:ink_sac},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#stunman
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 5 run summon skeleton ~ ~ ~ {CustomName:[Stunman],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:trident},offhand:{id:tripwire_hook},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#fisherman
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 6 run summon skeleton ~ ~ ~ {CustomName:[Fisherman],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:trident},offhand:{id:fishing_rod},head:{id:cobweb},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#miner
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 7 run summon skeleton ~ ~ ~ {CustomName:[Miner],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:copper_pickaxe},offhand:{id:copper_lantern},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#merchant
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 8 run summon skeleton ~ ~ ~ {CustomName:[Merchant],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:crossbow},offhand:{id:sunflower},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#farmer
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 9 run summon skeleton ~ ~ ~ {CustomName:[Farmer],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:iron_hoe},offhand:{id:hay_block},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#trickster
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 10 run summon skeleton ~ ~ ~ {CustomName:[Trickster],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:copper_shovel},offhand:{id:music_disc_lava_chicken},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#spaceman
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 11 run summon skeleton ~ ~ ~ {CustomName:[Spaceman],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:golden_spear},offhand:{id:music_disc_5},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}
#pirate
execute as @s at @s if score @s decoy_detect matches 1 if score @s decoy_rng matches 12.. run summon skeleton ~ ~ ~ {CustomName:[Pirate],Tags:[decoy],CustomNameVisible:1b,Health:6,Silent:1b,home_radius:301,Team:runners,equipment:{mainhand:{id:iron_sword},offhand:{id:potion},head:{id:player_head},chest:{id:leather_chestplate},legs:{id:leather_leggings},feet:{id:leather_boots}},drop_chances:{mainhand:0f,offhand:0f,head:0f,chest:0f,legs:0f,feet:0f},attributes:[{id:movement_speed,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:4f}]}

# the decoy will be completly still for some time and then it will be alowed to roam and atack
execute as @s at @s if score @s decoy_detect matches 1 run effect give @e[type=skeleton,distance=..3] slowness 30 255 true


# 30 second cooldown
execute as @s at @s if score @s decoy_detect matches 1 run scoreboard players set @s decoy_cooldown 600
execute as @s at @s if score @s decoy_detect matches 1 run scoreboard players set @s decoy_detect 0
execute if score @s decoy_cooldown matches 1.. run scoreboard players remove @s decoy_cooldown 1

# the cooldown
execute if score @s decoy_cooldown matches 599 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 30
execute if score @s decoy_cooldown matches 580 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 29
execute if score @s decoy_cooldown matches 560 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 28
execute if score @s decoy_cooldown matches 540 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 27
execute if score @s decoy_cooldown matches 520 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 26
execute if score @s decoy_cooldown matches 500 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 25
execute if score @s decoy_cooldown matches 480 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 24
execute if score @s decoy_cooldown matches 460 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 23
execute if score @s decoy_cooldown matches 440 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 22
execute if score @s decoy_cooldown matches 420 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 21
execute if score @s decoy_cooldown matches 400 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 20
execute if score @s decoy_cooldown matches 380 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 19
execute if score @s decoy_cooldown matches 360 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 18
execute if score @s decoy_cooldown matches 340 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 17
execute if score @s decoy_cooldown matches 320 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 16
execute if score @s decoy_cooldown matches 300 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 15
execute if score @s decoy_cooldown matches 280 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 14
execute if score @s decoy_cooldown matches 260 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 13
execute if score @s decoy_cooldown matches 240 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 12
execute if score @s decoy_cooldown matches 220 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 11
execute if score @s decoy_cooldown matches 200 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 10
execute if score @s decoy_cooldown matches 180 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 9
execute if score @s decoy_cooldown matches 160 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 8
execute if score @s decoy_cooldown matches 140 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 7
execute if score @s decoy_cooldown matches 120 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 6
execute if score @s decoy_cooldown matches 100 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 5
execute if score @s decoy_cooldown matches 80 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 4
execute if score @s decoy_cooldown matches 60 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 3
execute if score @s decoy_cooldown matches 40 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 2
execute if score @s decoy_cooldown matches 20 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]] 1
execute if score @s decoy_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"Decoy cooldown","italic":false}]]


execute as @a[tag=trickster] run scoreboard players get @s decoy_cooldown