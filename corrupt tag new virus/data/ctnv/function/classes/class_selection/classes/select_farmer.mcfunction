# setup
scoreboard objectives add select_farmer minecraft.dropped:minecraft.iron_hoe

# FARMER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_farmer matches 0 run item replace entity @s inventory.18 with iron_hoe[custom_name=[{"text":"F","italic":false,"color":"blue"},{"text":"a","italic":false,"color":"blue"},{"text":"r","italic":false,"color":"blue"},{"text":"m","italic":false,"color":"blue"},{"text":"er","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- Wheat farm.","italic":false,"color":"white"}],[{"text":"a temporary safe place to heal","italic":false,"color":"blue"}],[{"text":"- animal farm attack","italic":false,"color":"white"}],[{"text":"launch a pig that can explode","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- Farming hoe","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"nothing... you are a farmer","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor iron_hoe run scoreboard players set @s select_farmer 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace nether_portal
# select farmer class
execute if score @s select_farmer matches 1 run clear @s iron_hoe
execute if score @s select_farmer matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:iron_hoe"}}]
# selection
execute if score @s select_farmer matches 1 run scoreboard players set @s class 9
execute if score @s select_farmer matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Farmer","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_farmer matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.6 1

# take a datapoint
execute if score @s select_farmer matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_farmer 0
