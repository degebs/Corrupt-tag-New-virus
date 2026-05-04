# setup
scoreboard objectives add select_pirate minecraft.dropped:minecraft.compass

# STUNMAN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_pirate matches 0 run item replace entity @s inventory.21 with compass[custom_name=[{"text":"P","italic":false,"color":"blue"},{"text":"i","italic":false,"color":"blue"},{"text":"r","italic":false,"color":"blue"},{"text":"a","italic":false,"color":"blue"},{"text":"te","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"-","italic":false,"color":"white"},{"text":"T","italic":false,"color":"white"},{"text":"he","italic":false,"color":"white"},{"text":" Nothless Compass","italic":false,"color":"white"}],[{"text":"can show you the location of the corrupted","italic":false,"color":"white"}],[{"text":"-Can reset cooldowns when dropped ","italic":false,"color":"white"},{"text":"(only in endgame)","italic":false,"color":"red"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- THE CUTLASS","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- a bottle of Rum that makes you go faster","italic":false,"color":"white"}],[{"text":"and jump higher","italic":false,"color":"white"}],[{"text":"- the Rum heals for 1 heart","italic":false,"color":"yellow"}],[{"text":"-gives nausia","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor compass run scoreboard players set @s select_pirate 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select stunman class
execute if score @s select_pirate matches 1 run clear @s compass
execute if score @s select_pirate matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:compass"}}]
# selection
execute if score @s select_pirate matches 1 run scoreboard players set @s class 12
execute if score @s select_pirate matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Pirate","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_pirate matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.9 1

# take a datapoint
execute if score @s select_pirate matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_pirate 0
