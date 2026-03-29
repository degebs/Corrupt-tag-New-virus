# This logic is part of gamestate 0
# The only reason it is here is because if it's not, it will trigger as SOON AS IT IS GIVEN
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] at @s run scoreboard players add anti_autodrop players_online 1

execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] at @s run scoreboard players add anti_autodrop players_online 1
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 1 run tellraw @a "Are you sure?"
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 1 run item replace entity @a[team=party_lead] hotbar.0 with blue_dye[custom_name=[{"text":"drop twice to start game","italic":false}],enchantment_glint_override=true,rarity=epic]
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. run scoreboard players set drop_detect_function_Delay time 5


# if the party leader drops the dye AND there are enough players, set the game state to 1
execute if entity @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. if score anti_autodrop players_online matches 2.. run scoreboard players set game state 1



# If the criteria to move into the next state does not work, do this
# this code will trigger if the item is dropped AND there are not enough players
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run item replace entity @p[team=party_lead] hotbar.0 with lime_dye[custom_name=[{"text":"drop to start game","italic":false}],enchantment_glint_override=true,rarity=epic]
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run tellraw @a [{"text":"error: not enough players","color":"red"}]
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run scoreboard players set drop_detect_function_Delay time 5
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run scoreboard players set anti_autodrop players_online 0





# Do some particle and sound fanfare
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run playsound minecraft:block.beacon.power_select master @a ~ ~ ~
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run particle minecraft:glow_squid_ink ^ ^1 ^1 0 0 0 0.1 25
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run particle minecraft:happy_villager ~ ~ ~ ~ ~ ~ 0.2 100
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run particle minecraft:glow ^ ^1.5 ^1 0 0 0 0.2 100
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run playsound minecraft:block.beacon.activate master @a ~ ~ ~
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run tellraw @a [{"text":"----------------------------------------------",color:"green"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. at @s if score anti_autodrop players_online matches 2.. run tellraw @a [{"text":"game starts in ","color":"white"},{"text":"30 seconds","color":"dark_purple"}]



# Kill the dropped item
execute if entity @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] if score Online players_online matches 2.. run clear @a minecraft:blue_dye
execute if entity @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:blue_dye"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}]



