# setup
scoreboard objectives add select_bulk minecraft.dropped:minecraft.iron_sword

# BULK+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_bulk matches 0 run item replace entity @s inventory.2 with iron_sword[custom_name=[{"text":"Bulk","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- totem of undying","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- bulky sword","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- faster natural regeneration","italic":false,"color":"yellow"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor iron_sword run scoreboard players set @s select_bulk 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select bulk class
execute if score @s select_bulk matches 1 run clear @s iron_sword
execute if score @s select_bulk matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}]
# selection
execute if score @s select_bulk matches 1 run scoreboard players set @s class 3
execute if score @s select_bulk matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Bulk","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_bulk matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1 1

# take a datapoint
execute if score @s select_bulk matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_bulk 0
