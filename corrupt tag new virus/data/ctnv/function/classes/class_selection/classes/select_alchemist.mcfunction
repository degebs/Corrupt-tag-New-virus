# setup
scoreboard objectives add select_alchemist minecraft.dropped:brewing_stand

# AUTHORITY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_alchemist matches 0 run item replace entity @s inventory.24 with brewing_stand[custom_name=[{"text":"Alchemist","italic":false,"color":"white"}],lore=[[{"text":"=== 15% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- The Brewinator","italic":false,"color":"yellow"}],[{"text":"An evil device that quickly brews random potions when deployed","italic":false,"color":"white"}],[{"text":"-50 second coldown","italic":false,"color":"white"}],[{"text":"-5 potions per use","italic":false,"color":"white"}],[{"text":"=== 50% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- The Brewinator MK2","italic":false,"color":"yellow"}],[{"text":"An upgraded machine that can supply buffs for yourself","italic":false,"color":"white"}],[{"text":"-30 second coldown","italic":false,"color":"white"}],[{"text":"-6 potions per use","italic":false,"color":"white"}],[{"text":"-Immunity to your own potions","italic":false,"color":"white"}],[{"text":"=== 90% Corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- The Brewinator MK3","italic":false,"color":"yellow"}],[{"text":"A super evil upgrade that can","italic":false,"color":"white"}],[{"text":"supply more unethical potions","italic":false,"color":"white"}],[{"text":"-10 second coldown","italic":false,"color":"white"}],[{"text":"-7 potions per use","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"","italic":false,"color":"red"},{"text":"Do you smell that? Its death, lingering, forever and ever.","italic":false,"color":"red"},{"text":"!\"","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor brewing_stand run scoreboard players set @s select_alchemist 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select authority class
execute if score @s select_alchemist matches 1 run clear @s brewing_stand
execute if score @s select_alchemist matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:brewing_stand"}}]
# selection
execute if score @s select_alchemist matches 1 run scoreboard players set @s evil_class 10
execute unless score game state matches 0 if score @s select_alchemist matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Alchemist","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_alchemist matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.9 1

# take a datapoint
execute if score @s select_alchemist matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# if the class selection mode is compentitive then we disable the class
execute if score setting ST____class_selection matches 1 if score @s select_alchemist matches 1 run scoreboard players set enable select_alchemist 0
execute if score setting ST____class_selection matches 1 if score @s select_alchemist matches 1 run tellraw @a [{"text":"[x] ","color":"red","bold":true},{"text":"Alchemist","color":"dark_purple","bold":true},{"text":" will be disabled!","color":"gray"}]
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_alchemist 0
