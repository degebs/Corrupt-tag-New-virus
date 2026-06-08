# setup
scoreboard objectives add select_Fracturizer minecraft.dropped:crying_obsidian

# AUTHORITY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_Fracturizer matches 0 run item replace entity @s inventory.25 with crying_obsidian[custom_name=[{"text":"Fracturizer","italic":false,"color":"white"}],lore=[[{"text":"=== 15% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"-Runner swap","italic":false,"color":"yellow"}],[{"text":"-swap between you and the nearest runner","italic":false,"color":"white"}],[{"text":"=== 50% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Time Bomb","italic":false,"color":"yellow"}],[{"text":"-A bomb that when it explodes","italic":false,"color":"white"}],[{"text":"will blind, reveal, and slow all runners","italic":false,"color":"white"}],[{"text":"unless disarmed","italic":false,"color":"white"}],[{"text":"=== 90% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- The Wall","italic":false,"color":"yellow"}],[{"text":"Forces all runners into a small Dome of Doom","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"","italic":false,"color":"red"},{"text":"etjaetyrgjaetyjaetyja4ety6ja6tj","italic":false,"color":"red","obfuscated":true},{"text":"\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor crying_obsidian run scoreboard players set @s select_Fracturizer 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select authority class
execute if score @s select_Fracturizer matches 1 run clear @s crying_obsidian
execute if score @s select_Fracturizer matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}}]
# selection
execute if score @s select_Fracturizer matches 1 run scoreboard players set @s evil_class 11
execute unless score game state matches 0 if score @s select_Fracturizer matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Fracturizer","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_Fracturizer matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 2 1

# take a datapoint
execute if score @s select_Fracturizer matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_Fracturizer matches 1 run scoreboard players set enable select_Fracturizer 0
execute if score setting ST____class_selection matches 1 if score @s select_Fracturizer matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Fracturizer","color":"dark_purple","bold":true},{"text":" will be disabled!","color":"gray"}]

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_Fracturizer 0
