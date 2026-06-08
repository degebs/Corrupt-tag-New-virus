# setup
scoreboard objectives add select_artificer minecraft.dropped:minecraft.tnt

# ARTIFICER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_artificer matches 0 run item replace entity @s inventory.8 with tnt[custom_name=[{"text":"Artificer","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain the ability to place traps","italic":false,"color":"white"}],[{"text":"- gain an item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain superior traps","italic":false,"color":"white"}],[{"text":"- jump boost","italic":false,"color":"white"}],[{"text":"=== 80% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a sentry trap","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"Don't test my mettle boy! I'd cut ya without a glimpse from my eye.\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor tnt run scoreboard players set @s select_artificer 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select artificer class
execute if score @s select_artificer matches 1 run clear @s tnt
execute if score @s select_artificer matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:tnt"}}]
# selection
execute if score @s select_artificer matches 1 run scoreboard players set @s evil_class 4
execute unless score game state matches 0 if score @s select_artificer matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Artificer","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_artificer matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.3 1

# take a datapoint
execute if score @s select_artificer matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_artificer matches 1 run scoreboard players set enable select_artificer 0
execute if score setting ST____class_selection matches 1 if score @s select_artificer matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Artificer","color":"dark_purple","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_artificer 0
