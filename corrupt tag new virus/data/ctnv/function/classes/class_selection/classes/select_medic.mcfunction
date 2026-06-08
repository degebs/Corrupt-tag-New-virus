# setup
scoreboard objectives add select_medic minecraft.dropped:poppy

# MEDIC+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_medic matches 0 run item replace entity @s inventory.0 with poppy[custom_name=[{"text":"Medic","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- healing rose (drop to heal)","italic":false,"color":"white"}],[{"text":"- healing rose can heal teamates","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- medical knockback shovel","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- jump boost when using the healing rose","italic":false,"color":"white"}],[{"text":"- only works in endgame","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor poppy run scoreboard players set @s select_medic 1



# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select medic class
execute if score @s select_medic matches 1 run clear @s poppy
execute if score @s select_medic matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:poppy"}}]
# selection
execute if score @s select_medic matches 1 run scoreboard players set @s class 1
execute unless score game state matches 0 if score @s select_medic matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Medic","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_medic matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 0.8 1 

# take a datapoint
execute if score @s select_medic matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_medic matches 1 run scoreboard players set enable select_medic 0
execute if score setting ST____class_selection matches 1 if score @s select_medic matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Medic","color":"blue","bold":true},{"text":" will be disabled!","color":"gray"}]


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_medic 0
