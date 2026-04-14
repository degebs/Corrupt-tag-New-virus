# setup
scoreboard objectives add select_merchant minecraft.dropped:minecraft.sunflower

# MERCHANT+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_merchant matches 0 run item replace entity @s inventory.12 with sunflower[custom_name=[{"text":"Merchant","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- Gold coin","italic":false,"color":"white"}],[{"text":"drop for a random buff or nerf. the stack ammount is your luck percent","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- crossbow","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"his gold coin can buff movement","italic":false,"color":"yellow"}],[{"text":"or nerf it ","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor sunflower run scoreboard players set @s select_merchant 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace nether_portal
# select merchant class
execute if score @s select_merchant matches 1 run clear @s sunflower
execute if score @s select_merchant matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:sunflower"}}]
# selection
execute if score @s select_merchant matches 1 run scoreboard players set @s class 8
execute if score @s select_merchant matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Merchant","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_merchant matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.5 1

# take a datapoint
execute if score @s select_merchant matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_merchant 0
