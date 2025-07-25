#███████╗██╗███████╗██╗  ██╗███████╗██████╗ ███╗   ███╗ █████╗ ███╗   ██╗
#██╔════╝██║██╔════╝██║  ██║██╔════╝██╔══██╗████╗ ████║██╔══██╗████╗  ██║
#█████╗  ██║███████╗███████║█████╗  ██████╔╝██╔████╔██║███████║██╔██╗ ██║
#██╔══╝  ██║╚════██║██╔══██║██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══██║██║╚██╗██║
#██║     ██║███████║██║  ██║███████╗██║  ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║
#╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                                        
# a brand new class for corrupt tag new virus. he gets the cool new stuff they added in minecraft like wind charges


#==============================================================================================================================================================
#give the fisherman his fishing rod

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:0b}]}] run clear @s fishing_rod

execute unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:fishing_rod"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:0b}]}] run item replace entity @s hotbar.0 with fishing_rod[custom_name=[{"text":"yee old fishing rod","italic":false}],enchantments={knockback:1,unbreaking:255}]
#==============================================================================================================================================================
# permanent speed boost (identical to archer)
effect give @s speed 6 0 true

#==============================================================================================================================================================
#give the fisherman his fishing net

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# fisherman trap (stolen from stunman)

# When the player drops the trap, start a cooldown (20s = 400 ticks), and remove the item
execute unless entity @s[nbt={Inventory:[{Slot:3b,id:"minecraft:cobweb"}]}] if score @s fishing_net_trap matches 0 unless block ~ ~-1 ~ minecraft:air run scoreboard players set @s fishing_net_trap 400

# give the hunter a trap item, make sure he cannot drop it
# Give the hunter a trap item in hotbar slot 3 if they don't already have it and are at least 15% corrupt
execute unless data entity @s Inventory[{Slot:3b,id:"minecraft:cobweb"}] run kill @e[type=item,nbt={Item:{id:"minecraft:cobweb"}}]
execute unless data entity @s Inventory[{Slot:3b,id:"minecraft:cobweb"}] if score @s fishing_net_trap matches 0 run item replace entity @s hotbar.3 with cobweb[custom_name=[{"text":"fishing net","italic":false,"color":"blue"}],lore=[[{"text":"drop to place a trap","italic":false}]]]

# Decrease cooldown if active
execute if score @s fishing_net_trap matches 1.. run scoreboard players remove @s fishing_net_trap 1

# when the trap is dropped, play a sound
execute if score @s[scores={fishing_net_trap=399}] fishing_net_trap matches 399 run playsound item.bucket.fill_fish player @s ~ ~ ~ 1 0.8 0.5

# summon the block display that is the trap
# dont kill existing traps. this is because there can be multiple stunmen
#execute if score @s[scores={fishing_net_trap=399}] fishing_net_trap matches 399 run kill @e[tag=fishing_net_trap]

# summon the trap item display at the player's location
execute at @s if score @s[scores={fishing_net_trap=399}] fishing_net_trap matches 399 run summon minecraft:item_display ~ ~ ~ {Tags:["fishing_net_trap"],Passengers:[{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:cobweb"},transformation:{left_rotation:[0.7071068f,0.0f,0.0f,0.7071068f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[3.000001f,3.000001f,3.000001f],translation:[0.0f,0.0625f,0.0f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.4731468f,0.5254828f,0.5254828f,0.4731468f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749989f,1.8749986f],translation:[-1.4790804f,0.125f,-1.2671341f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6963643f,-0.122787826f,-0.122787826f,0.6963643f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749998f,1.8749995f,1.8749993f],translation:[1.7084196f,0.125f,-0.6421341f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6963643f,-0.122787826f,-0.122787826f,0.6963643f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749998f,1.8749995f,1.8749993f],translation:[-1.7290804f,0.125f,0.5453659f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6797147f,0.19490509f,0.19490509f,0.6797147f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749985f,1.8749982f],translation:[-0.29158044f,0.125f,1.6703659f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.6797147f,0.19490509f,0.19490509f,0.6797147f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749985f,1.8749982f],translation:[0.45841956f,0.125f,-1.8296341f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["fishing_net_trap"],item:{count:1,id:"minecraft:stick"},transformation:{left_rotation:[-0.4731468f,0.5254828f,0.5254828f,0.4731468f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.8749986f,1.8749989f,1.8749986f],translation:[1.3959196f,0.125f,1.1703659f]}}],fall_distance:0.0d,item:{count:1,id:"minecraft:cobweb"},transformation:{left_rotation:[0.67056614f,0.22436827f,-0.22436827f,0.67056614f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[3.000001f,3.0000007f,3.0000012f],translation:[0.0f,0.0f,0.0f]}}

# Replace trap item with gray dye to show cooldown
execute if score @s[scores={fishing_net_trap=399}] fishing_net_trap matches 399 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 20
execute if score @s[scores={fishing_net_trap=380}] fishing_net_trap matches 380 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 19
execute if score @s[scores={fishing_net_trap=360}] fishing_net_trap matches 360 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 18
execute if score @s[scores={fishing_net_trap=340}] fishing_net_trap matches 340 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 17
execute if score @s[scores={fishing_net_trap=320}] fishing_net_trap matches 320 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 16
execute if score @s[scores={fishing_net_trap=300}] fishing_net_trap matches 300 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 15
execute if score @s[scores={fishing_net_trap=280}] fishing_net_trap matches 280 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 14
execute if score @s[scores={fishing_net_trap=260}] fishing_net_trap matches 260 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 13
execute if score @s[scores={fishing_net_trap=240}] fishing_net_trap matches 240 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 12
execute if score @s[scores={fishing_net_trap=220}] fishing_net_trap matches 220 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 11
execute if score @s[scores={fishing_net_trap=200}] fishing_net_trap matches 200 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 10
execute if score @s[scores={fishing_net_trap=180}] fishing_net_trap matches 180 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 9
execute if score @s[scores={fishing_net_trap=160}] fishing_net_trap matches 160 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 8
execute if score @s[scores={fishing_net_trap=140}] fishing_net_trap matches 140 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 7
execute if score @s[scores={fishing_net_trap=120}] fishing_net_trap matches 120 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 6
execute if score @s[scores={fishing_net_trap=100}] fishing_net_trap matches 100 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 5
execute if score @s[scores={fishing_net_trap=80}] fishing_net_trap matches 80 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 4
execute if score @s[scores={fishing_net_trap=60}] fishing_net_trap matches 60 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 3
execute if score @s[scores={fishing_net_trap=40}] fishing_net_trap matches 40 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 2
execute if score @s[scores={fishing_net_trap=20}] fishing_net_trap matches 20 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 1

# Remove gray dye when cooldown is done
execute if score @s fishing_net_trap matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]]

# When cooldown is over, give the trap back if missing
execute if score @s fishing_net_trap matches 0 unless entity @s[nbt={Inventory:[{id:"minecraft:cobweb",Slot:3b}]}] run item replace entity @s hotbar.3 with cobweb[custom_name=[{"text":"fishing net","italic":false,"color":"blue"}],lore=[[{"text":"drop to place a trap","italic":false}]]]