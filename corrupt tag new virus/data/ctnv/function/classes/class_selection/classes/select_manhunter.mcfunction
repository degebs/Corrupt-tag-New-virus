# setup
scoreboard objectives add select_manhunter minecraft.dropped:minecraft.netherite_spear

# MANHUNTER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_manhunter matches 0 run item replace entity @s inventory.16 with netherite_spear[custom_name=[{"text":"Manhunter","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 1 spear","italic":false,"color":"white"}],[{"text":"- gain an item to reveal the nearest runner, and stun them","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":" Lunge 2 spear","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 3 spear","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"Mercury has entered its retrograde, my genocide will be countless.\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor netherite_spear run scoreboard players set @s select_manhunter 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select manhunter class
execute if score @s select_manhunter matches 1 run clear @s netherite_spear
execute if score @s select_manhunter matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_spear"}}]
# selection
execute if score @s select_manhunter matches 1 run scoreboard players set @s evil_class 7
execute if score @s select_manhunter matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Manhunter","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_manhunter matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.6 1

# take a datapoint
execute if score @s select_manhunter matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_manhunter 0
