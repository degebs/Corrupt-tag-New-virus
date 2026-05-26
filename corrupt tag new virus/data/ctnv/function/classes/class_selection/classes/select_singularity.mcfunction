# setup
scoreboard objectives add select_singularity minecraft.dropped:silence_armor_trim_smithing_template

# AUTHORITY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_singularity matches 0 run item replace entity @s inventory.26 with silence_armor_trim_smithing_template[custom_name=[{"text":"S","italic":false,"color":"white"},{"text":"i","italic":false,"color":"white"},{"text":"n","italic":false,"color":"white"},{"text":"g","italic":false,"color":"white"},{"text":"u","italic":false,"color":"white"},{"text":"la","italic":false,"color":"white"},{"text":"r","italic":false,"color":"white"},{"text":"i","italic":false,"color":"white"},{"text":"t","italic":false,"color":"white"},{"text":"y","italic":false,"color":"white"}],lore=[[{"text":"=== 15% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"-","italic":false,"color":"yellow"},{"text":"An item that can Reveal Players","bold":false,"italic":false,"color":"yellow"}],[{"text":"=== 50% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Peacemaker","italic":false,"color":"yellow"}],[{"text":"-sabotages all runner by forcing them to use there","italic":false,"color":"white"}],[{"text":"ability's or outright deletes them","italic":false,"color":"white"}],[{"text":"=== 90% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Devils hand","italic":false,"color":"yellow"}],[{"text":"I","italic":false,"color":"white"},{"text":"n","italic":false,"color":"white"},{"text":"s","italic":false,"color":"white"},{"text":"ta","italic":false,"color":"white"},{"text":"nt","italic":false,"color":"white"},{"text":" ","italic":false,"color":"white"},{"text":"1","italic":false,"color":"white"},{"text":" ","italic":false,"color":"white"},{"text":"h","italic":false,"color":"white"},{"text":"i","italic":false,"color":"white"},{"text":"t","italic":false,"color":"white"},{"text":" ","italic":false,"color":"white"},{"text":"k","italic":false,"color":"white"},{"text":"i","italic":false,"color":"white"},{"text":"l","italic":false,"color":"white"},{"text":"l","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"I will be all that remains. as protons decay, Forever!\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor silence_armor_trim_smithing_template run scoreboard players set @s select_singularity 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select authority class
execute if score @s select_singularity matches 1 run clear @s silence_armor_trim_smithing_template
execute if score @s select_singularity matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:silence_armor_trim_smithing_template"}}]
# selection
execute if score @s select_singularity matches 1 run scoreboard players set @s evil_class 12
execute unless score game state matches 0 if score @s select_singularity matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Singularity","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_singularity matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 2 1

# take a datapoint
execute if score @s select_singularity matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_singularity 0
