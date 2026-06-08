# setup
scoreboard objectives add select_marksman minecraft.dropped:crossbow

# AUTHORITY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_marksman matches 0 run item replace entity @s inventory.23 with crossbow[custom_name=[{"text":"Marksman","italic":false,"color":"#c800ff"}],lore=[[{"text":"=== 0% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Get 2 arrows back every 20 seconds","italic":false,"color":"white"}],[{"text":"- Start with a bow","italic":false,"color":"white"}],[{"text":"=== 15% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"The Scent","italic":false,"color":"yellow"}],[{"text":"- All runners get a permanent smoke trail for you to follow","italic":false,"color":"white"}],[{"text":"=== 50% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Gain a crossbow that replaces your bow","italic":false,"color":"white"}],[{"text":"- The crossbow has Quick-Charge 3","italic":false,"color":"white"}],[{"text":"- Arrows in the ground do damage after a short delay","italic":false,"color":"white"}],[{"text":"- Arrow regen speed increase","italic":false,"color":"white"}],[{"text":"=== 90% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Quick-Charge 5","italic":false,"color":"white"}],[{"text":"- Infinite ammo","italic":false,"color":"yellow"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"You better run, child; I can inflict more pain than you could ever possibly imagine!\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor crossbow run scoreboard players set @s select_marksman 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select authority class
execute if score @s select_marksman matches 1 run clear @s crossbow
execute if score @s select_marksman matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:crossbow"}}]
# selection
execute if score @s select_marksman matches 1 run scoreboard players set @s evil_class 9
execute unless score game state matches 0 if score @s select_marksman matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Marksman","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_marksman matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.8 1

# take a datapoint
execute if score @s select_marksman matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_marksman matches 1 run scoreboard players set enable select_marksman 0
execute if score setting ST____class_selection matches 1 if score @s select_marksman matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Marksman","color":"dark_purple","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_marksman 0
