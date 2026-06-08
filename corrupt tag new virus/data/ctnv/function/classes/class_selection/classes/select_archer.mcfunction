# setup
scoreboard objectives add select_archer minecraft.dropped:minecraft.bow

# ARCHER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_archer matches 0 run item replace entity @s inventory.1 with bow[custom_name=[{"text":"Archer","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- arrows (6 - maximum)","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- knockback bow","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- permanent speed boost","italic":false,"color":"yellow"}],[{"text":"- jump boost candle","italic":false,"color":"yellow"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor bow run scoreboard players set @s select_archer 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select archer class
execute if score @s select_archer matches 1 run clear @s bow
execute if score @s select_archer matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}}]
# selection
execute if score @s select_archer matches 1 run scoreboard players set @s class 2
execute unless score game state matches 0 if score @s select_archer matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Archer","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_archer matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 0.9 1

# take a datapoint
execute if score @s select_archer matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_archer matches 1 run scoreboard players set enable select_archer 0
execute if score setting ST____class_selection matches 1 if score @s select_archer matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Archer","color":"dark_aqua","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_archer 0
