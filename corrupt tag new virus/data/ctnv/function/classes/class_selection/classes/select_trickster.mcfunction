# setup
scoreboard objectives add select_trickster minecraft.dropped:minecraft.copper_shovel

# TRICKSTER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_trickster matches 0 run item replace entity @s inventory.19 with copper_shovel[custom_name=[{"text":"T","italic":false,"color":"blue"},{"text":"r","italic":false,"color":"blue"},{"text":"i","italic":false,"color":"blue"},{"text":"c","italic":false,"color":"blue"},{"text":"k","italic":false,"color":"blue"},{"text":"s","italic":false,"color":"blue"},{"text":"t","italic":false,"color":"blue"},{"text":"er","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- decoy","italic":false,"color":"white"}],[{"text":"A dummy runner to trick the corrupted (and stun them)","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- copper shovel","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- Player swap","italic":false,"color":"blue"}],[{"text":"Can swap between you and another runner","italic":false,"color":"yellow"}]]]
execute if items entity @s player.cursor copper_shovel run scoreboard players set @s select_trickster 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace nether_portal
# select farmer class
execute if score @s select_trickster matches 1 run clear @s copper_shovel
execute if score @s select_trickster matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:copper_shovel"}}]
# selection
execute if score @s select_trickster matches 1 run scoreboard players set @s class 10
execute unless score game state matches 0 if score @s select_trickster matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Trickster","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_trickster matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.7 1

# take a datapoint
execute if score @s select_trickster matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_trickster matches 1 run scoreboard players set enable select_trickster 0
execute if score setting ST____class_selection matches 1 if score @s select_trickster matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Trickster","color":"dark_aqua","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_trickster 0
