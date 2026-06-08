# setup
scoreboard objectives add select_corruptor minecraft.dropped:minecraft.chorus_fruit

# CORRUPTOR+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_corruptor matches 0 run item replace entity @s inventory.5 with chorus_fruit[custom_name=[{"text":"Corruptor","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain an item to see the location of all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a speed boost item","italic":false,"color":"white"}],[{"text":"=== 75% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"We shall become one, you can never escape what we have taken.\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor chorus_fruit run scoreboard players set @s select_corruptor 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select corruptor class
execute if score @s select_corruptor matches 1 run clear @s chorus_fruit
execute if score @s select_corruptor matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}}]
# selection
execute if score @s select_corruptor matches 1 run scoreboard players set @s evil_class 1
execute unless score game state matches 0 if score @s select_corruptor matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Corruptor","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_corruptor matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1 1

# take a datapoint
execute if score @s select_corruptor matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_corruptor matches 1 run scoreboard players set enable select_corruptor 0
execute if score setting ST____class_selection matches 1 if score @s select_corruptor matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Corruptor","color":"dark_purple","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_corruptor 0
