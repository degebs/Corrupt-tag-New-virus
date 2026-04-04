#███████╗ █████╗ ██████╗ ███╗   ███╗███████╗██████╗ 
#██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██╔══██╗
#█████╗  ███████║██████╔╝██╔████╔██║█████╗  ██████╔╝
#██╔══╝  ██╔══██║██╔══██╗██║╚██╔╝██║██╔══╝  ██╔══██╗
#██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗██║  ██║
#╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
                                                
# basically a worse medic
# now that i think of it. he might be better

#==============================================================================================================================================================
#give the farmer his knockback hoe

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_hoe",Slot:0b}]}] run clear @s iron_hoe
execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_hoe",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_hoe"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_hoe",Slot:0b}]}] run item replace entity @s hotbar.0 with minecraft:iron_hoe[custom_name=[{"text":"yee old hoe","italic":false}],rarity=uncommon,enchantments={knockback:1},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]

#==============================================================================================================================================================
# give the farmer his farm

#1. give farm block
execute if score @s farm_cooldown matches 0 run item replace entity @s hotbar.2 with minecraft:hay_block[custom_name=[{"text":"Deploy Farm","italic":false,"color":"blue"}]]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:hay_block",Slot:2b}]}] if score @s farm_cooldown matches 0 run clear @s minecraft:hay_block
execute unless entity @s[nbt={Inventory:[{id:"minecraft:hay_block",Slot:2b}]}] if score @s farm_cooldown matches 0 run item replace entity @s hotbar.2 with minecraft:hay_block[custom_name=[{"text":"Deploy Farm","italic":false,"color":"blue"}]]

#2. detect if dropped farm
execute as @a[scores={farm_drop_detect=1}] run scoreboard players set @s farm_cooldown 600
execute as @a[scores={farm_drop_detect=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:hay_block"}}]
execute as @a[scores={farm_drop_detect=1}] at @s run summon minecraft:item_display ~ ~ ~ {Tags:["farm"], Passengers: [{Tags:["farm","farm_heal_source"], block_state: {Name: "minecraft:wheat", Properties: {age: "7"}}, id: "minecraft:block_display", transformation: {left_rotation: [0.0f, -0.38268352f, 0.0f, 0.92387956f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 0.99999976f, 1.0f], translation: [5.9604645E-8f, 0.125f, -0.83210677f]}}, {Tags:["farm"], block_state: {Name: "minecraft:wheat", Properties: {age: "7"}}, id: "minecraft:block_display", transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [-1.125f, 0.1875f, -1.1875f]}}, {Tags:["farm"], block_state: {Name: "minecraft:wheat", Properties: {age: "7"}}, id: "minecraft:block_display", transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [0.125f, -0.0625f, -1.1875f]}}, {Tags:["farm"], block_state: {Name: "minecraft:wheat", Properties: {age: "7"}}, id: "minecraft:block_display", transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [0.125f, 0.0f, -0.0625f]}}, {Tags:["farm"], block_state: {Name: "minecraft:wheat", Properties: {age: "7"}}, id: "minecraft:block_display", transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 1.0f, 1.0f], translation: [-1.125f, 0.0f, -0.0625f]}}], item: {count: 1, id: "minecraft:farmland"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.5f, 0.31249997f, 2.5f], translation: [0.0f, 0.0f, 0.0f]}}
# give the farm a lifetime of 10 seconds
execute as @a[scores={farm_drop_detect=1}] at @s run scoreboard players set @e[tag=farm,distance=..5] farm_lifetime 200
execute as @a[scores={farm_drop_detect=1}] run scoreboard players reset @s farm_drop_detect

# do the cooldown
execute if score @s farm_cooldown matches 1.. run scoreboard players remove @s farm_cooldown 1

# cooldown timer with gray dye
execute if score @s farm_cooldown matches 599 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 30
execute if score @s farm_cooldown matches 580 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 29
execute if score @s farm_cooldown matches 560 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 28
execute if score @s farm_cooldown matches 540 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 27
execute if score @s farm_cooldown matches 520 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 26
execute if score @s farm_cooldown matches 500 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 25
execute if score @s farm_cooldown matches 480 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 24
execute if score @s farm_cooldown matches 460 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 23
execute if score @s farm_cooldown matches 440 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 22
execute if score @s farm_cooldown matches 420 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 21
execute if score @s farm_cooldown matches 400 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 20
execute if score @s farm_cooldown matches 380 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 19
execute if score @s farm_cooldown matches 360 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 18
execute if score @s farm_cooldown matches 340 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 17
execute if score @s farm_cooldown matches 320 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 16
execute if score @s farm_cooldown matches 300 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 15
execute if score @s farm_cooldown matches 280 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 14
execute if score @s farm_cooldown matches 260 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 13
execute if score @s farm_cooldown matches 240 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 12
execute if score @s farm_cooldown matches 220 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 11
execute if score @s farm_cooldown matches 200 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 10
execute if score @s farm_cooldown matches 180 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 9
execute if score @s farm_cooldown matches 160 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 8
execute if score @s farm_cooldown matches 140 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 7
execute if score @s farm_cooldown matches 120 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 6
execute if score @s farm_cooldown matches 100 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 5
execute if score @s farm_cooldown matches 80 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 4
execute if score @s farm_cooldown matches 60 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 3
execute if score @s farm_cooldown matches 40 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 2
execute if score @s farm_cooldown matches 20 run item replace entity @s hotbar.2 with minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]] 1
execute if score @s farm_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"Farm cooldown","italic":false}]]


#==============================================================================================================================================================
# animal farm attack.
# launches a pig and it explodes whenever it hit anything.
# no idea if this is possible but it would be really cool. and its a refference to animal farm


# give the farmer his pig

#1. give farm pig
execute if score @s animal_farm_attack_cooldown matches 0 run item replace entity @s hotbar.4 with minecraft:pig_spawn_egg[custom_name=[{"text":"Animal farm Attack","italic":false,"color":"blue"}]]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:pig_spawn_egg",Slot:4b}]}] if score @s animal_farm_attack_cooldown matches 0 run clear @s minecraft:pig_spawn_egg
execute unless entity @s[nbt={Inventory:[{id:"minecraft:pig_spawn_egg",Slot:4b}]}] if score @s animal_farm_attack_cooldown matches 0 run item replace entity @s hotbar.4 with minecraft:hay_block[custom_name=[{"text":"Animal farm Attack","italic":false,"color":"blue"}]]

#2. detect if dropped farm
# do a 25 second cooldown for the summon the pig
execute as @a[scores={animal_farm_attack_detect=1}] run scoreboard players set @s animal_farm_attack_cooldown 500
execute as @a[scores={animal_farm_attack_detect=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:pig_spawn_egg"}}]
execute as @a[scores={animal_farm_attack_detect=1}] at @s run summon pig ^ ^1 ^-1 {Tags:["attack_pig"],NoGravity:1b,NoAI:1b,Health:2f} 
execute as @a[scores={animal_farm_attack_detect=1}] at @s run clear @s minecraft:pig_spawn_egg
execute as @a[scores={animal_farm_attack_detect=1}] run scoreboard players reset @s animal_farm_attack_detect


#cooldown
execute if score @s animal_farm_attack_cooldown matches 1.. run scoreboard players remove @s animal_farm_attack_cooldown 1


# cooldown timer with gray dye

execute if score @s animal_farm_attack_cooldown matches 500 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 25
execute if score @s animal_farm_attack_cooldown matches 480 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 24
execute if score @s animal_farm_attack_cooldown matches 460 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 23
execute if score @s animal_farm_attack_cooldown matches 440 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 22
execute if score @s animal_farm_attack_cooldown matches 420 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 21
execute if score @s animal_farm_attack_cooldown matches 400 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 20
execute if score @s animal_farm_attack_cooldown matches 380 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 19
execute if score @s animal_farm_attack_cooldown matches 360 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 18
execute if score @s animal_farm_attack_cooldown matches 340 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 17
execute if score @s animal_farm_attack_cooldown matches 320 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 16
execute if score @s animal_farm_attack_cooldown matches 300 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 15
execute if score @s animal_farm_attack_cooldown matches 280 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 14
execute if score @s animal_farm_attack_cooldown matches 260 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 13
execute if score @s animal_farm_attack_cooldown matches 240 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 12
execute if score @s animal_farm_attack_cooldown matches 220 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 11
execute if score @s animal_farm_attack_cooldown matches 200 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 10
execute if score @s animal_farm_attack_cooldown matches 180 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 9
execute if score @s animal_farm_attack_cooldown matches 160 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 8
execute if score @s animal_farm_attack_cooldown matches 140 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 7
execute if score @s animal_farm_attack_cooldown matches 120 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 6
execute if score @s animal_farm_attack_cooldown matches 100 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 5
execute if score @s animal_farm_attack_cooldown matches 80 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 4
execute if score @s animal_farm_attack_cooldown matches 60 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 3
execute if score @s animal_farm_attack_cooldown matches 40 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 2
execute if score @s animal_farm_attack_cooldown matches 20 run item replace entity @s hotbar.4 with minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]] 1
execute if score @s animal_farm_attack_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"Animal farm attack cooldown","italic":false}]]

# make the pig fly and explode on hit. this is the part where i have no idea how to do it. so im just gonna wing it and hope for the best.

# frame 1 make the pig face the direction the player is looking
execute if score @s animal_farm_attack_cooldown matches 500 run tp @e[tag=attack_pig,limit=1,sort=nearest] @s
execute if score @s animal_farm_attack_cooldown matches 499 at @s run tp @e[tag=attack_pig,limit=1,sort=nearest] ^ ^ ^-1 facing entity @p[team=runners,scores={class=9}] feet
execute if score @s animal_farm_attack_cooldown matches 498 at @s run tp @e[tag=attack_pig,limit=1,sort=nearest] ~ ~1 ~

# make them go forward
execute as @e[type=pig,tag=attack_pig] at @s run tp @s ^ ^ ^0.7

# for the pig to explode safely it must have a delay fuse
execute as @e[type=pig,tag=attack_pig] run scoreboard players add @s animal_farm_attack_cooldown 1
# if the fuse is 0.25 second or more then it can explode (check if in wall)
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @s unless block ~ ~ ~ air run particle explosion_emitter ~ ~ ~ 1 1 1 0.1 10 force @a
# if too close to a corrupted give them blindness for 5 seconds
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @s unless block ~ ~ ~ air if entity @a[team=corrupted,distance=..4] run effect give @p[team=corrupted] blindness 5 0 true
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @s unless block ~ ~ ~ air if entity @a[team=corrupted,distance=..4] run effect give @p[team=corrupted] glowing 5 0 true
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @a unless block ~ ~ ~ air if entity @a[team=corrupted,distance=..4] run playsound block.anvil.hit master @a ~ ~ ~ 1 1 1
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @s unless block ~ ~ ~ air if entity @a[team=corrupted,distance=..4] run particle minecraft:end_rod ~ ~ ~ 2 2 2 1 55 force
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @s unless block ~ ~ ~ air if entity @a[team=corrupted,distance=..4] run particle dust{color:[1.0,0.4,0.7],scale:4.0} ~ ~ ~ 0.5 1 0.5 0.01 55 force

# for safety reason the pig cannot do damage if too close to a runner
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 4.. at @s unless block ~ ~ ~ air unless entity @a[team=runners,distance=..8] run summon creeper ~ ~ ~ {Fuse:0,Team:runners}

# particles
execute at @e[type=pig,tag=attack_pig] run particle minecraft:flame ~ ~ ~ 0.5 0.5 0.5 0.01 15 normal

# lock on target
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 20.. at @s if score tick time matches 5 unless entity @p[team=corrupted,distance=..8] run tp @s ~ ~ ~ facing entity @p[team=corrupted] feet
execute as @e[type=pig,tag=attack_pig] if score @s animal_farm_attack_cooldown matches 20.. at @s if score tick time matches 5 unless entity @p[team=corrupted,distance=..8] run particle firework ~ ~ ~ 0 0 0 0.2 100 normal @a
