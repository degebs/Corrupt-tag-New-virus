# setup
scoreboard objectives add select_knight minecraft.dropped:minecraft.netherite_helmet

# KNIGHT+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_knight matches 0 run item replace entity @s inventory.14 with netherite_helmet[custom_name=[{"text":"Knight","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent damage boost","italic":false,"color":"white"}],[{"text":"- full stun and knockback immunity","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed boost item","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a temorary cure to halt the corruption","italic":false,"color":"white"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"En avant! Vive La l'empire!\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor netherite_helmet run scoreboard players set @s select_knight 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select knight class
execute if score @s select_knight matches 1 run clear @s netherite_helmet
execute if score @s select_knight matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_helmet"}}]
# selection
execute if score @s select_knight matches 1 run scoreboard players set @s evil_class 5
execute if score @s select_knight matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Knight","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_knight matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.4 1

# take a datapoint
execute if score @s select_knight matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_knight 0
