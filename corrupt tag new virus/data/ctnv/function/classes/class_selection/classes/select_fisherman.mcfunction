# setup
scoreboard objectives add select_fisherman minecraft.dropped:minecraft.fishing_rod

# FISHERMAN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_fisherman matches 0 run item replace entity @s inventory.10 with fishing_rod[custom_name=[{"text":"Fisherman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- fishing net trap","italic":false,"color":"white"}],[{"text":"- slows down everyone","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- fishing rod","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent speed boost","italic":false,"color":"yellow"}],[{"text":"-jump boost ","italic":false,"color":"yellow"},{"text":"only during endgame","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor fishing_rod run scoreboard players set @s select_fisherman 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace nether_portal
# select fisherman class
execute if score @s select_fisherman matches 1 run clear @s fishing_rod
execute if score @s select_fisherman matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:fishing_rod"}}]
# selection
execute if score @s select_fisherman matches 1 run scoreboard players set @s class 6
execute unless score game state matches 0 if score @s select_fisherman matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Fisherman","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_fisherman matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.3 1

# take a datapoint
execute if score @s select_fisherman matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_fisherman 0
