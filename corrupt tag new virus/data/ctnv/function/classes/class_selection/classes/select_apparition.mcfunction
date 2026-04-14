# setup
scoreboard objectives add select_apparition minecraft.dropped:minecraft.vex_spawn_egg

# APPARITION+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_apparition matches 0 run item replace entity @s inventory.7 with vex_spawn_egg[custom_name=[{"text":"Apparition","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent invisability","italic":false,"color":"white"}],[{"text":"- slowness when close from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- speed boost in darkness","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"If you don't know the art of disappearance,","italic":false,"color":"red"}],[{"text":"learn it because you will need it","italic":false,"color":"red"}],[{"text":"every time you get bored of the society you are living in!\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor vex_spawn_egg run scoreboard players set @s select_apparition 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select apparition class
execute if score @s select_apparition matches 1 run clear @s vex_spawn_egg
execute if score @s select_apparition matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:vex_spawn_egg"}}]
# selection
execute if score @s select_apparition matches 1 run scoreboard players set @s evil_class 3
execute if score @s select_apparition matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Apparition","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_apparition matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.2 1

# take a datapoint
execute if score @s select_apparition matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
scoreboard players set @s select_apparition 0
