# setup
scoreboard objectives add select_spaceman minecraft.dropped:minecraft.music_disc_5

# STUNMAN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_spaceman matches 0 run item replace entity @s inventory.20 with music_disc_5[custom_name=[{"text":"Spaceman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- rewind shard","italic":false,"color":"white"}],[{"text":"-allows you to teleport to a place","italic":false,"color":"yellow"}],[{"text":"you have once been","italic":false,"color":"yellow"},{"text":" ","italic":false,"color":"yellow"},{"text":"b","italic":false,"color":"yellow"},{"text":"e","italic":false,"color":"yellow"},{"text":"f","italic":false,"color":"yellow"},{"text":"o","italic":false,"color":"yellow"},{"text":"re","italic":false,"color":"yellow"}],[{"text":"-drop once to set the teleportation shard","italic":false,"color":"white"}],[{"text":"drop again to teleport back to the shard","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- Golden spear","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- Passive low gravity","italic":false,"color":"yellow"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor music_disc_5 run scoreboard players set @s select_spaceman 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select stunman class
execute if score @s select_spaceman matches 1 run clear @s music_disc_5
execute if score @s select_spaceman matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:music_disc_5"}}]
# selection
execute if score @s select_spaceman matches 1 run scoreboard players set @s class 11
execute unless score game state matches 0 if score @s select_spaceman matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Spaceman","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_spaceman matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.8 1

# take a datapoint
execute if score @s select_spaceman matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_spaceman matches 1 run scoreboard players set enable select_spaceman 0
execute if score setting ST____class_selection matches 1 if score @s select_spaceman matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Spaceman","color":"dark_aqua","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_spaceman 0
