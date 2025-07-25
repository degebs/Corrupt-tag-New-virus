
# if the party leader drops the dye AND there are enough players, set the game state to 1
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. run scoreboard players set game state 1



# If the criteria to move into the next state does not work, do this
# this code will trigger if the item is dropped AND there are not enough players
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run tellraw @a [{"text":"error: not enough players","color":"red"}]
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run give @a[team=party_lead] lime_dye[custom_name=[{"text":"drop to start game","italic":false}],enchantment_glint_override=true,rarity=epic]
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 1 run scoreboard players set drop_detect_function_Delay time 2


# This logic is part of gamestate 0
# The only reason it is here is because if it's not, it will trigger as SOON AS IT IS GIVEN



# Do some particle and sound fanfare
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run playsound minecraft:block.beacon.power_select master @a ~ ~ ~
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run particle minecraft:glow_squid_ink ^ ^1 ^1 0 0 0 0.1 25
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run particle minecraft:happy_villager ~ ~ ~ ~ ~ ~ 0.2 100
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run particle minecraft:glow ^ ^1.5 ^1 0 0 0 0.2 100
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run tellraw @a [{"text":"----------------------------------------------",color:"green"}]
execute as @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. at @s run tellraw @a [{"text":"game starts in ","color":"white"},{"text":"30 seconds","color":"dark_purple"}]



# Kill the dropped item
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] if score Online players_online matches 2.. run clear @a minecraft:lime_dye
execute if entity @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:lime_dye"}}]




