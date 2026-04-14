# setup
scoreboard objectives add select_predator minecraft.dropped:minecraft.netherite_sword

# PREDATOR+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_predator matches 0 run item replace entity @s inventory.6 with netherite_sword[custom_name=[{"text":"Predator","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- smell the fear of the runners, the smell fules your speed boost (passive)","italic":false,"color":"white"}],[{"text":"- slowness when far away from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a invisability item","italic":false,"color":"white"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain an item to remotly stun all runners ","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"Just hit a millie! Wheres my Playbutton?\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor netherite_sword run scoreboard players set @s select_predator 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select predator class
execute if score @s select_predator matches 1 run clear @s netherite_sword
execute if score @s select_predator matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_sword"}}]
# selection
execute if score @s select_predator matches 1 run scoreboard players set @s evil_class 2
execute if score @s select_predator matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Predator","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_predator matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.1 1

# take a datapoint
execute if score @s select_predator matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_predator 0
