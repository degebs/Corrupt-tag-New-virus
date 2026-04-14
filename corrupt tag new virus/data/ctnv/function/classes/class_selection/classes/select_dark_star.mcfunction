# setup
scoreboard objectives add select_dark_star minecraft.dropped:minecraft.nether_star

# DARK STAR+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_dark_star matches 0 run item replace entity @s inventory.15 with nether_star[custom_name=[{"text":"Dark Star","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"- gain an item to blind all runners","italic":false,"color":"white"}],[{"text":"=== 20% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a wind charge","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed bost item","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- supreme supernova! bathe the entire world in fire","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"I'll bathe the universe divide with the blood that you cherish so...\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor nether_star run scoreboard players set @s select_dark_star 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select dark star class
execute if score @s select_dark_star matches 1 run clear @s nether_star
execute if score @s select_dark_star matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}}]
# selection
execute if score @s select_dark_star matches 1 run scoreboard players set @s evil_class 6
execute if score @s select_dark_star matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"DARK Star","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_dark_star matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.5 1

# take a datapoint
execute if score @s select_dark_star matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_dark_star 0
