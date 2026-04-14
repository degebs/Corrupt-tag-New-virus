# setup
scoreboard objectives add select_stunman minecraft.dropped:minecraft.trident

# STUNMAN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_stunman matches 0 run item replace entity @s inventory.9 with trident[custom_name=[{"text":"Stunman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- stun landmines","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- electric trident","italic":false,"color":"white"}],[{"text":"- electric trident","italic":false,"color":"yellow"},{"text":" ","italic":false,"color":"white"},{"text":"stuns corrupted","italic":false,"color":"yellow"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-only in endgame","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor trident run scoreboard players set @s select_stunman 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select stunman class
execute if score @s select_stunman matches 1 run clear @s trident
execute if score @s select_stunman matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:trident"}}]
# selection
execute if score @s select_stunman matches 1 run scoreboard players set @s class 5
execute if score @s select_stunman matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Stunman","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_stunman matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.2 1

# take a datapoint
execute if score @s select_stunman matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_stunman 0
