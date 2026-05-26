# setup
scoreboard objectives add select_authority minecraft.dropped:minecraft.shield

# AUTHORITY+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# let the player see the selection item in their inventory
execute if score @s select_authority matches 0 run item replace entity @s inventory.17 with shield[tooltip_display={hidden_components:["minecraft:banner_patterns"]},banner_patterns=[{pattern:gradient_up,color:magenta},{pattern:gradient_up,color:black},{pattern:skull,color:black},{pattern:triangles_top,color:black},{pattern:triangle_bottom,color:black}],base_color=purple,custom_name=[{"text":"Authority","italic":false,"color":"#c800ff"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"-GRAVITY PULL","italic":false,"color":"white"}],[{"text":"- Pulls Down ALL runners for 5 seconds","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a \"reveal player modulator\"","italic":false,"color":"white"}],[{"text":"- it makes all runners glow until destroyed ","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- SECURITY","italic":false,"color":"white"}],[{"text":"- spawns an small army of guards after the runners","italic":false,"color":"yellow"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"I've heard enough, deadly force authorized!\"","italic":false,"color":"red"},{"text":" ","italic":false,"color":"red"}]]]
# do a backup selection. if the item is in the players mouse cursor then we set the selection to 1
execute if items entity @s player.cursor shield run scoreboard players set @s select_authority 1

# automatically close the player inventory on click
execute if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select authority class
execute if score @s select_authority matches 1 run clear @s shield
execute if score @s select_authority matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:shield"}}]
# selection
execute if score @s select_authority matches 1 run scoreboard players set @s evil_class 8
execute unless score game state matches 0 if score @s select_authority matches 1 run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Authority","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute if score @s select_authority matches 1 run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.7 1

# take a datapoint
execute if score @s select_authority matches 1 run scoreboard players add @s selected_corrupted_class 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset when done
# we must make it so that it does not reset during pregame
execute unless score game state matches 0 run scoreboard players set @s select_authority 0
