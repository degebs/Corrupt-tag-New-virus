# setup
scoreboard objectives add select_assassin minecraft.dropped:minecraft.ink_sac

# ASSASSIN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_assassin matches 0 run item replace entity @s inventory.3 with ink_sac[custom_name=[{"text":"Assassin","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- speed boost item","italic":false,"color":"white"}],[{"text":"- speed boost item blinds the corrupted","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- daggar","italic":false,"color":"white"}],[{"text":"- crouching makes you invisable","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-only in endgame","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor ink_sac run scoreboard players set @s select_assassin 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select assassin class
execute if score @s select_assassin matches 1 run clear @s ink_sac
execute if score @s select_assassin matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:ink_sac"}}]
# selection
execute if score @s select_assassin matches 1 run scoreboard players set @s class 4
execute unless score game state matches 0 if score @s select_assassin matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Assassin","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute if score @s select_assassin matches 1 run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.1 1

# take a datapoint
execute if score @s select_assassin matches 1 run scoreboard players add @s selected_runner_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_assassin 0
