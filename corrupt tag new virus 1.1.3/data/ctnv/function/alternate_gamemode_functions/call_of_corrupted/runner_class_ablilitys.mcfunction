# the runners ability

#=================================================================================================================================================
# medical rose

execute if score @s ITEM____healing_rose matches 1 run playsound entity.dolphin.ambient player @s ~ ~ ~ 1 1 0.5
execute if score @s ITEM____healing_rose matches 1 run playsound entity.warden.heartbeat player @s ~ ~ ~ 1 1 0.5
execute if score @s ITEM____healing_rose matches 170.. run kill @e[tag=heal_totem]

execute if score @s ITEM____healing_rose matches 1 at @s run summon armor_stand ~ ~ ~ {Pose:{Body:[0f,0f,181f]},Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["heal_totem"]}
execute as @a if score @s ITEM____healing_rose matches 1..180 run scoreboard players add @s ITEM____healing_rose 2
execute as @a if score @s ITEM____healing_rose matches 1.. run kill @e[type=item,nbt={Item:{id:"minecraft:poppy"}}]

# rotate the totem for the fancy particles
execute store result storage minecraft:med_rot angle int 1 run scoreboard players get @s ITEM____healing_rose

execute as @e[type=armor_stand,tag=heal_totem] store result entity @s Rotation[0] float 1 run data get storage minecraft:med_rot angle

# fancy particles
execute as @e[tag=heal_totem] if score @a[team=runners,limit=1] ITEM____healing_rose matches 1..180 at @s run particle happy_villager ^ ^1 ^2 0 0 0 0 2 force @a
execute as @e[tag=heal_totem] if score @a[team=runners,limit=1] ITEM____healing_rose matches 1..180 at @s run particle happy_villager ^ ^1 ^-2 0 0 0 0 2 force @a
execute as @e[tag=heal_totem] if score @a[team=runners,limit=1] ITEM____healing_rose matches 1..180 at @s run particle happy_villager ^-2 ^1 ^ 0 0 0 0 2 force @a
execute as @e[tag=heal_totem] if score @a[team=runners,limit=1] ITEM____healing_rose matches 1..180 at @s run particle happy_villager ^2 ^1 ^ 0 0 0 0 2 force @a

# heal all within its range UNLESS the runners in the range are already at max health
execute if score @s ITEM____healing_rose matches 3.. run execute as @e[tag=heal_totem] at @s run scoreboard players add @a[distance=..2,team=runners] health 1
# the healing rose here is more POWERFULL, and for good reason
# zombies will be everywhere
execute as @a if score @s ITEM____healing_rose matches 181.. run scoreboard players reset @s ITEM____healing_rose 
# kill it again just in case
execute unless score @a[limit=1] ITEM____healing_rose matches 1.. run kill @e[tag=heal_totem]

#=================================================================================================================================================
# speed boost
execute if score @s ITEM____speed_buff matches 1 run playsound block.beacon.activate block @s ~ ~ ~ 1 2 1
execute if score @s ITEM____speed_buff matches 1 run tellraw @s [{"text":"SPEED","color":"yellow","bold":true,"italic":true}]
execute if score @s ITEM____speed_buff matches 1 run effect give @s speed 400 1 true
execute if score @s ITEM____speed_buff matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:heart_of_the_sea"}}]
execute if score @s ITEM____speed_buff matches 1 run scoreboard players add @s ITEM____speed_buff 1
execute if score @s ITEM____speed_buff matches 2 run scoreboard players reset @s ITEM____speed_buff 

#=================================================================================================================================================
# jump candle
# start counting up
execute if score @s ITEM____jump_candle matches 1.. run scoreboard players add @s ITEM____jump_candle 1
execute if score @s ITEM____jump_candle matches 2 run kill @e[type=item,nbt={Item:{id:"minecraft:cyan_candle"}}]

# sound effect
execute if score @s ITEM____jump_candle matches 2 at @s run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 0.8 0.5
execute if score @s ITEM____jump_candle matches 2 at @s run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 1 0.5

# fancy particles
execute if score @s ITEM____jump_candle matches 1.. at @s run particle wax_on ~ ~0.1 ~ 0.5 0 0.5 0.2 10 force @a

execute if score @s ITEM____jump_candle matches 2 run effect give @s jump_boost 5 1
execute if score @s ITEM____jump_candle matches 2 run effect give @s slowness 5 1

# reset after 5 seconds
execute if score @s ITEM____jump_candle matches 100.. run scoreboard players reset @s ITEM____jump_candle

#=================================================================================================================================================
# totem of undying

# this needs to be constantly running

#=================================================================================================================================================
# speed ink
execute if score @s ITEM____speed_ink matches 1.. run effect give @s speed 5 2

# sound effect
execute if score @s ITEM____speed_ink matches 1 at @s run playsound entity.firework_rocket.launch player @s ~ ~ ~ 1 0.8 0.5
execute if score @s ITEM____speed_ink matches 1 at @s run playsound entity.generic.explode player @s ~ ~ ~ 1 1 0.5

# fancy particles
execute if score @s ITEM____speed_ink matches 1 at @s run particle large_smoke ~ ~0.1 ~ 0.5 0 0.5 0.2 10 force @a
execute if score @s ITEM____speed_ink matches 1 at @s run particle campfire_signal_smoke ~ ~0.1 ~ 0.5 1 0.5 0.1 100 force @a
execute if score @s ITEM____speed_ink matches 1 at @s run particle white_smoke ~ ~0.1 ~ 0 0 0 0.01 1 force @a
# reset
execute if score @s ITEM____speed_ink matches 1 at @s run kill @e[type=item,nbt={Item:{id:"minecraft:ink_sac"}}]
execute if score @s ITEM____speed_ink matches 1 at @s run scoreboard players reset @s ITEM____speed_ink

#=================================================================================================================================================
# invisability watch

execute if score @s ITEM____invis_watch matches 1.. run effect give @s invisibility 100 2

# sound effect
execute if score @s ITEM____invis_watch matches 1 at @s run playsound block.smoker.smoke player @s ~ ~ ~ 1 0.8 0.5
execute if score @s ITEM____invis_watch matches 1 at @s run playsound entity.tnt.primed player @s ~ ~ ~ 1 1 0.5

# fancy particles
execute if score @s ITEM____invis_watch matches 1 at @s run particle large_smoke ~ ~0.1 ~ 0.5 0 0.5 0.2 10 force @a
execute if score @s ITEM____invis_watch matches 1 at @s run particle campfire_signal_smoke ~ ~0.1 ~ 0.5 1 0.5 0.1 100 force @a
execute if score @s ITEM____invis_watch matches 1 at @s run particle white_smoke ~ ~0.1 ~ 0 0 0 0.01 1 force @a
# reset
execute if score @s ITEM____invis_watch matches 1 at @s run kill @e[type=item,nbt={Item:{id:"minecraft:clock"}}]
execute if score @s ITEM____invis_watch matches 1 at @s run scoreboard players reset @s ITEM____invis_watch
#=================================================================================================================================================
# stunman mines

execute at @s if score @s ITEM____stunman_trap matches 1 run summon minecraft:item_display ~ ~0.1 ~ {Tags:["stunman_trap"],Passengers: [{fall_distance: 0.0d, id: "minecraft:item_display", Tags:["stunman_trap"], item: {count: 1, id: "minecraft:sea_lantern", components: {"minecraft:custom_name": '{"text":"stunman_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.25f, 0.083333336f, 0.25f], translation: [0.0f, 0.125f, 0.0f]}}], fall_distance: 0.0d, item: {count: 1, id: "minecraft:dark_prismarine", components: {"minecraft:custom_name": '{"text":"stunman_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.4375f, 0.14583333f, 0.4375f], translation: [0.0f, 0.0f, 0.0f]}}
execute at @s if score @s ITEM____stunman_trap matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:prismarine_brick_slab"}}]

execute at @s if score @s ITEM____stunman_trap matches 1 run scoreboard players reset @s ITEM____stunman_trap


#=================================================================================================================================================
# stunman trident

execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @e[distance=..2,limit=1,team=corrupted] run effect give @e[distance=..2,limit=1,team=corrupted] slowness 2 2
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @e[distance=..2,limit=1,team=corrupted] run effect give @e[distance=..2,limit=1,team=corrupted] blindness 2 5
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @e[distance=..2,limit=1,team=corrupted] run particle flash ~ ~ ~ 0 0 0 1 1 force @a
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @e[distance=..2,limit=1,team=corrupted] run particle wax_off ~ ~ ~ 0 0 0 40 75 force @a

execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @e[distance=..2,team=corrupted] run data modify entity @s inGround set value 1b

#=================================================================================================================================================
# fisherman trident
execute at @s if score @s ITEM____fisherman_trap matches 1 run summon minecraft:item_display ~ ~ ~ {Tags:["fishing_net_trap"],Passengers:[{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:cobweb"},transformation:{left_rotation:[0.7071068f,0.0f,0.0f,0.7071068f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[3.000001f,3.000001f,3.000001f],translation:[0.0f,0.0625f,0.0f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.4731468f,0.5254828f,0.5254828f,0.4731468f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749989f,1.8749986f],translation:[-1.4790804f,0.125f,-1.2671341f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6963643f,-0.122787826f,-0.122787826f,0.6963643f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749998f,1.8749995f,1.8749993f],translation:[1.7084196f,0.125f,-0.6421341f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6963643f,-0.122787826f,-0.122787826f,0.6963643f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749998f,1.8749995f,1.8749993f],translation:[-1.7290804f,0.125f,0.5453659f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6797147f,0.19490509f,0.19490509f,0.6797147f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749985f,1.8749982f],translation:[-0.29158044f,0.125f,1.6703659f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6797147f,0.19490509f,0.19490509f,0.6797147f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749985f,1.8749982f],translation:[0.45841956f,0.125f,-1.8296341f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.4731468f,0.5254828f,0.5254828f,0.4731468f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749989f,1.8749986f],translation:[1.3959196f,0.125f,1.1703659f]}}],fall_distance:0.0d,item:{count:1,id:"minecraft:cobweb"},transformation:{left_rotation:[0.67056614f,0.22436827f,-0.22436827f,0.67056614f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[3.000001f,3.0000007f,3.0000012f],translation:[0.0f,0.0f,0.0f]}}

execute at @s if score @s ITEM____fisherman_trap matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:cobweb"}}]

execute at @s if score @s ITEM____fisherman_trap matches 1 run scoreboard players reset @s ITEM____fisherman_trap
