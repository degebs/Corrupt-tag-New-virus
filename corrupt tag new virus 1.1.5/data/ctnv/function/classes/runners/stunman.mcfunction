#███████╗████████╗██╗   ██╗███╗   ██╗███╗   ███╗ █████╗ ███╗   ██╗
#██╔════╝╚══██╔══╝██║   ██║████╗  ██║████╗ ████║██╔══██╗████╗  ██║
#███████╗   ██║   ██║   ██║██╔██╗ ██║██╔████╔██║███████║██╔██╗ ██║
#╚════██║   ██║   ██║   ██║██║╚██╗██║██║╚██╔╝██║██╔══██║██║╚██╗██║
#███████║   ██║   ╚██████╔╝██║ ╚████║██║ ╚═╝ ██║██║  ██║██║ ╚████║
#╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                                 
# the stunman here is completly reworked form the original


#================================================================================================================================================
# trident logic
# the stunman can throw a loyalty trident. it must do a few things
# 1. make sure the player cant manipulate it
# 2. keep track on when the trident is thrown or not
# 3. if it hits a corrupted, stun the corrupted

# make sure it cannot be moved, but also make sure that it behaves correctly according to the checklist above
execute unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:0b}]}] if score @s trident_throw matches 0 run clear @s trident

execute unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:0b}]}] if score @s trident_throw matches 0 run kill @e[type=item,nbt={Item:{id:"minecraft:trident"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:0b}]}] if score @s trident_throw matches 0 run item replace entity @s hotbar.0 with trident[custom_name=[{"text":"electric trident","italic":false}],rarity=rare,enchantments={loyalty:1,unbreaking:255}]

execute if entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:0b}]}] run scoreboard players set @s trident_throw 0

# do the stun on the corrupted
# this method kidna increases the corrupted hitbox. 
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @p[distance=..2,limit=1,team=corrupted] run effect give @e[distance=..2,limit=1,team=corrupted] slowness 2 2
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @p[distance=..2,limit=1,team=corrupted] run effect give @e[distance=..2,limit=1,team=corrupted] blindness 2 5
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @p[distance=..2,limit=1,team=corrupted] run particle flash ~ ~ ~ 0 0 0 1 1 force @a
execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @p[distance=..2,limit=1,team=corrupted] run particle wax_off ~ ~ ~ 0 0 0 40 75 force @a

execute as @e[type=trident,nbt={inGround:0b}] at @s if entity @p[distance=..2,team=corrupted] run data modify entity @s inGround set value 1b

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# stunman trap

# When the player drops the trap, start a cooldown (20s = 400 ticks), and remove the item
execute unless entity @s[nbt={Inventory:[{Slot:3b,id:"minecraft:tripwire_hook"}]}] if score @s stunman_trap matches 0 unless block ~ ~-1 ~ minecraft:air run scoreboard players set @s stunman_trap 400

# give the hunter a trap item, make sure he cannot drop it
# Give the hunter a trap item in hotbar slot 3 if they don't already have it and are at least 15% corrupt
execute unless data entity @s Inventory[{Slot:3b,id:"minecraft:tripwire_hook"}] run kill @e[type=item,nbt={Item:{id:"minecraft:tripwire_hook"}}]
execute unless data entity @s Inventory[{Slot:3b,id:"minecraft:tripwire_hook"}] if score @s stunman_trap matches 0 run item replace entity @s hotbar.3 with tripwire_hook[custom_name=[{"text":"trap","italic":false,"color":"blue"}],lore=[[{"text":"drop to place a trap","italic":false}]]]

# Decrease cooldown if active
execute if score @s stunman_trap matches 1.. run scoreboard players remove @s stunman_trap 1

# when the trap is dropped, play a sound
execute if score @s[scores={stunman_trap=399}] stunman_trap matches 399 run playsound block.tripwire.click_on player @s ~ ~ ~ 1 0.8 0.5

# summon the block display that is the trap
# dont kill existing traps. this is because there can be multiple stunmen
#execute if score @s[scores={stunman_trap=399}] stunman_trap matches 399 run kill @e[tag=stunman_trap]

# summon the trap item display at the player's location
execute at @s if score @s[scores={stunman_trap=399}] stunman_trap matches 399 run summon minecraft:item_display ~ ~0.1 ~ {Tags:["stunman_trap"],Passengers: [{fall_distance: 0.0d, id: "minecraft:item_display", Tags:["stunman_trap"], item: {count: 1, id: "minecraft:sea_lantern", components: {"minecraft:custom_name": '{"text":"stunman_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.25f, 0.083333336f, 0.25f], translation: [0.0f, 0.125f, 0.0f]}}], fall_distance: 0.0d, item: {count: 1, id: "minecraft:dark_prismarine", components: {"minecraft:custom_name": '{"text":"stunman_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.4375f, 0.14583333f, 0.4375f], translation: [0.0f, 0.0f, 0.0f]}}

# Replace trap item with gray dye to show cooldown
execute if score @s[scores={stunman_trap=399}] stunman_trap matches 399 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 20
execute if score @s[scores={stunman_trap=380}] stunman_trap matches 380 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 19
execute if score @s[scores={stunman_trap=360}] stunman_trap matches 360 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 18
execute if score @s[scores={stunman_trap=340}] stunman_trap matches 340 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 17
execute if score @s[scores={stunman_trap=320}] stunman_trap matches 320 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 16
execute if score @s[scores={stunman_trap=300}] stunman_trap matches 300 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 15
execute if score @s[scores={stunman_trap=280}] stunman_trap matches 280 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 14
execute if score @s[scores={stunman_trap=260}] stunman_trap matches 260 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 13
execute if score @s[scores={stunman_trap=240}] stunman_trap matches 240 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 12
execute if score @s[scores={stunman_trap=220}] stunman_trap matches 220 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 11
execute if score @s[scores={stunman_trap=200}] stunman_trap matches 200 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 10
execute if score @s[scores={stunman_trap=180}] stunman_trap matches 180 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 9
execute if score @s[scores={stunman_trap=160}] stunman_trap matches 160 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 8
execute if score @s[scores={stunman_trap=140}] stunman_trap matches 140 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 7
execute if score @s[scores={stunman_trap=120}] stunman_trap matches 120 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 6
execute if score @s[scores={stunman_trap=100}] stunman_trap matches 100 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 5
execute if score @s[scores={stunman_trap=80}] stunman_trap matches 80 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 4
execute if score @s[scores={stunman_trap=60}] stunman_trap matches 60 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 3
execute if score @s[scores={stunman_trap=40}] stunman_trap matches 40 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 2
execute if score @s[scores={stunman_trap=20}] stunman_trap matches 20 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 1

# Remove gray dye when cooldown is done
execute if score @s stunman_trap matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]]

# When cooldown is over, give the trap back if missing
execute if score @s stunman_trap matches 0 unless entity @s[nbt={Inventory:[{id:"minecraft:tripwire_hook",Slot:3b}]}] run item replace entity @s hotbar.3 with tripwire_hook[custom_name=[{"text":"trap","italic":false,"color":"blue"}],lore=[[{"text":"drop to place a trap","italic":false}]]]
#================================================================================================================================================
# permanent jump boost in endgame
execute if score endgame state matches 1 run effect give @s jump_boost 1 1 true


# some more cool particles
execute at @e[type=trident] run particle electric_spark ~ ~ ~ 0 0 0 0.1 3 normal @a