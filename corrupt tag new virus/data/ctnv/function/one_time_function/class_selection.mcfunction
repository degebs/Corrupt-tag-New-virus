#this function handles all class selection logic



# the cooldown and the neter portals are there so that players dont spam.


# MEDIC+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run item replace entity @s inventory.1 with poppy[custom_name=[{"text":"Medic","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- healing rose (drop to heal)","italic":false,"color":"white"}],[{"text":"- healing rose can heal teamates","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- medical knockback hoe","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- jump boost when using the healing rose","italic":false,"color":"white"}],[{"text":"- only works in endgame","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select medic class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run clear @s poppy
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:poppy"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run scoreboard players set @s class 1
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"medic","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 0.8 1 
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:10b}]}] run item replace entity @s inventory.1 with poppy[custom_name=[{"text":"Medic","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- healing rose (drop to heal)","italic":false,"color":"white"}],[{"text":"- healing rose can heal teamates","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- medical knockback hoe","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- jump boost when using the healing rose","italic":false,"color":"white"}],[{"text":"- only works in endgame","italic":false,"color":"red"}]]]

# ARCHER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run item replace entity @s inventory.2 with bow[custom_name=[{"text":"Archer","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- arrows (6 - maximum)","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- knockback bow","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- permanent speed boost","italic":false,"color":"yellow"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run clear @s bow
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run scoreboard players set @s class 2
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Archer","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 0.9 1 
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:11b}]}] run item replace entity @s inventory.2 with bow[custom_name=[{"text":"Archer","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- arrows (6 - maximum)","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- knockback bow","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- permanent speed boost","italic":false,"color":"yellow"}]]]

# BULK+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run item replace entity @s inventory.3 with iron_sword[custom_name=[{"text":"Bulk","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- jump boost item","italic":false,"color":"white"}],[{"text":"- totem of undying","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- bulky sword","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- faster natural regeneration","italic":false,"color":"yellow"}],[{"text":"- slowness when jump boost item used","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run clear @s iron_sword
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run scoreboard players set @s class 3
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Bulk","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 1 1 
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:12b}]}] run item replace entity @s inventory.3 with iron_sword[custom_name=[{"text":"Bulk","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- jump boost item","italic":false,"color":"white"}],[{"text":"- totem of undying","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- bulky sword","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"- faster natural regeneration","italic":false,"color":"yellow"}],[{"text":"- slowness when jump boost item used","italic":false,"color":"red"}]]]

# ASSASSIN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run item replace entity @s inventory.4 with ink_sac[custom_name=[{"text":"Assassin","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- speed boost item","italic":false,"color":"white"}],[{"text":"- speed boost item blinds the corrupted","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- daggar","italic":false,"color":"white"}],[{"text":"- crouching makes you invisable","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-only in endgame","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run clear @s ink_sac
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:ink_sac"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run scoreboard players set @s class 4
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Assassin","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.1 1
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:ink_sac",Slot:13b}]}] run item replace entity @s inventory.4 with ink_sac[custom_name=[{"text":"Assassin","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- speed boost item","italic":false,"color":"white"}],[{"text":"- speed boost item blinds the corrupted","italic":false,"color":"yellow"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- daggar","italic":false,"color":"white"}],[{"text":"- crouching makes you invisable","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-only in endgame","italic":false,"color":"red"}]]]

# STUNMAN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run item replace entity @s inventory.5 with trident[custom_name=[{"text":"Stunman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- stun landmines","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- electric trident","italic":false,"color":"white"}],[{"text":"- electric trident","italic":false,"color":"yellow"},{"text":" ","italic":false,"color":"white"},{"text":"stuns corrupted","italic":false,"color":"yellow"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-only in endgame","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run clear @s trident
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:trident"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run scoreboard players set @s class 5
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Stunman","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.2 1 
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:trident",Slot:14b}]}] run item replace entity @s inventory.5 with trident[custom_name=[{"text":"Stunman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- stun landmines","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- electric trident","italic":false,"color":"white"}],[{"text":"- electric trident","italic":false,"color":"yellow"},{"text":" ","italic":false,"color":"white"},{"text":"stuns corrupted","italic":false,"color":"yellow"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-only in endgame","italic":false,"color":"red"}]]]

# FISHERMAN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run item replace entity @s inventory.6 with fishing_rod[custom_name=[{"text":"Fisherman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- fishing net trap","italic":false,"color":"white"}],[{"text":"- slows down everyone","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- fishing rod","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent speed boost","italic":false,"color":"yellow"}],[{"text":"-jump boost ","italic":false,"color":"yellow"},{"text":"only during endgame","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run clear @s fishing_rod
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:fishing_rod"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run scoreboard players set @s class 6
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Fisherman","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.3 1 
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:fishing_rod",Slot:15b}]}] run item replace entity @s inventory.6 with fishing_rod[custom_name=[{"text":"Fisherman","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- fishing net trap","italic":false,"color":"white"}],[{"text":"- slows down everyone","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- fishing rod","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-permanent speed boost","italic":false,"color":"yellow"}],[{"text":"-jump boost ","italic":false,"color":"yellow"},{"text":"only during endgame","italic":false,"color":"red"}]]]

# MINER+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run item replace entity @s inventory.7 with copper_pickaxe[custom_name=[{"text":"Miner","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- Gold Nugget","italic":false,"color":"white"}],[{"text":"gives everyone around him a speed boost","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- Copper Pickaxe","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-Lantern","italic":false,"color":"yellow"}],[{"text":"makes you tunnel underground ","italic":false,"color":"yellow"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches 0..28 if score @s class_selection_cooldown matches 2 run fill ~2 ~2 ~2 ~-2 ~-2 ~-2 air replace nether_portal
# select miner class
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run clear @s copper_pickaxe
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:copper_pickaxe"}}]
# selection
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run scoreboard players set @s class 7
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Miner","color":"dark_aqua"}," ",{"text":"class","color":"white"}]
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run playsound block.note_block.guitar block @a ~ ~ ~ 1 1.4 1 
execute as @a if score countdown time matches 0..28 unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:16b}]}] run item replace entity @s inventory.7 with copper_pickaxe[custom_name=[{"text":"Miner","italic":false,"color":"blue"}],lore=[[{"text":"--- item ---","italic":false,"color":"dark_aqua"}],[{"text":"- Gold Nugget","italic":false,"color":"white"}],[{"text":"gives everyone around him a speed boost","italic":false,"color":"white"}],[{"text":"--- weapon ---","italic":false,"color":"dark_aqua"}],[{"text":"- Copper Pickaxe","italic":false,"color":"white"}],[{"text":"--- movement ---","italic":false,"color":"dark_aqua"}],[{"text":"-Lantern","italic":false,"color":"yellow"}],[{"text":"makes you tunnel underground ","italic":false,"color":"yellow"}]]]







# Corruptor+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run item replace entity @s inventory.19 with chorus_fruit[custom_name=[{"text":"Corruptor","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain an item to see the location of all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a speed boost item","italic":false,"color":"white"}],[{"text":"=== 75% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"We shall become one, you can never escape what we have taken.\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run clear @s chorus_fruit
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:chorus_fruit"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run scoreboard players set @s evil_class 1
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Corruptor","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:chorus_fruit",Slot:28b}]}] run item replace entity @s inventory.19 with chorus_fruit[custom_name=[{"text":"Corruptor","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain an item to see the location of all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a speed boost item","italic":false,"color":"white"}],[{"text":"=== 75% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"We shall become one, you can never escape what we have taken.\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]

# Predator+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run item replace entity @s inventory.20 with netherite_sword[custom_name=[{"text":"Predator","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- smell the fear of the runners, the smell fules your speed boost (passive)","italic":false,"color":"white"}],[{"text":"- slowness when far away from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a invisability item","italic":false,"color":"white"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain an item to remotly stun all runners ","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"Just hit a millie! Wheres my Playbutton?\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run clear @s netherite_sword
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_sword"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run scoreboard players set @s evil_class 2
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Predator","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.1 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_sword",Slot:29b}]}] run item replace entity @s inventory.20 with netherite_sword[custom_name=[{"text":"Predator","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- smell the fear of the runners, the smell fules your speed boost (passive)","italic":false,"color":"white"}],[{"text":"- slowness when far away from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a invisability item","italic":false,"color":"white"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain an item to remotly stun all runners ","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"Just hit a millie! Wheres my Playbutton?\"","italic":false,"color":"red"}],[{"text":" ","italic":false}]]]

# APParition+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run item replace entity @s inventory.21 with vex_spawn_egg[custom_name=[{"text":"Apparition","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent invisability","italic":false,"color":"white"}],[{"text":"- slowness when close from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- speed boost in darkness","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"If you don't know the art of disappearance,","italic":false,"color":"red"}],[{"text":"learn it because you will need it","italic":false,"color":"red"}],[{"text":"every time you get bored of the society you are living in!\"","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run clear @s vex_spawn_egg
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:vex_spawn_egg"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run scoreboard players set @s evil_class 3
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Apparition","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.2 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg",Slot:30b}]}] run item replace entity @s inventory.21 with vex_spawn_egg[custom_name=[{"text":"Apparition","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent invisability","italic":false,"color":"white"}],[{"text":"- slowness when close from runners","italic":false,"color":"red"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- speed boost in darkness","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a fruit to teleport you to a random player","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"If you don't know the art of disappearance,","italic":false,"color":"red"}],[{"text":"learn it because you will need it","italic":false,"color":"red"}],[{"text":"every time you get bored of the society you are living in!\"","italic":false,"color":"red"}]]]

# Artificer+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run item replace entity @s inventory.22 with tnt[custom_name=[{"text":"Artificer","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain the ability to place traps","italic":false,"color":"white"}],[{"text":"- gain an item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain superior traps","italic":false,"color":"white"}],[{"text":"- jump boost","italic":false,"color":"white"}],[{"text":"=== 80% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a sentry trap","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"Don't test my mettle boy! I'd cut ya without a glimpse from my eye.\"","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run clear @s tnt
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:tnt"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run scoreboard players set @s evil_class 4
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Artificer","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.3 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:31b}]}] run item replace entity @s inventory.22 with tnt[custom_name=[{"text":"Artificer","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain the ability to place traps","italic":false,"color":"white"}],[{"text":"- gain an item to reveal all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain superior traps","italic":false,"color":"white"}],[{"text":"- jump boost","italic":false,"color":"white"}],[{"text":"=== 80% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent speed boost","italic":false,"color":"white"}],[{"text":"- gain a sentry trap","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false}],[{"text":"\"Don't test my mettle boy! I'd cut ya without a glimpse from my eye.\"","italic":false,"color":"red"}]]]

# KNIGHT+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run item replace entity @s inventory.23 with netherite_helmet[custom_name=[{"text":"Knight","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent damage boost","italic":false,"color":"white"}],[{"text":"- full stun and knockback immunity","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed boost item","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a temorary cure to halt the corruption","italic":false,"color":"white"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"En avant! Vive La l'empire!\"","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select ARCHER class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run clear @s netherite_helmet
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_helmet"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run scoreboard players set @s evil_class 5
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Knight","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.4 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_helmet",Slot:32b}]}] run item replace entity @s inventory.23 with netherite_helmet[custom_name=[{"text":"Knight","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent damage boost","italic":false,"color":"white"}],[{"text":"- full stun and knockback immunity","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed boost item","italic":false,"color":"white"}],[{"text":"- item to reveal all runners","italic":false}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- gain a temorary cure to halt the corruption","italic":false,"color":"white"}],[{"text":"-permanent jump boost","italic":false,"color":"white"}],[{"text":"-permanent speed boost","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"En avant! Vive La l'empire!\"","italic":false,"color":"red"}]]]

# DARK_STAR+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run item replace entity @s inventory.24 with nether_star[custom_name=[{"text":"Dark Star","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"- gain an item to blind all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed bost item","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- supreme supernova! bathe the entire world in fire","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"I'll bathe the universe divide with the blood that you cherish so...\"","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select  class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run clear @s nether_star
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run scoreboard players set @s evil_class 6
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"DARK Star","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.5 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:nether_star",Slot:33b}]}] run item replace entity @s inventory.24 with nether_star[custom_name=[{"text":"Dark Star","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- permanent jump boost","italic":false,"color":"white"}],[{"text":"- gain an item to blind all runners","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":"gain a speed bost item","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- supreme supernova! bathe the entire world in fire","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"I'll bathe the universe divide with the blood that you cherish so...\"","italic":false,"color":"red"}]]]

# Manhunter+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# prevent accidental instant selection
execute as @a if score countdown time matches 29 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run item replace entity @s inventory.25 with netherite_spear[custom_name=[{"text":"Manhunter","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 1 spear","italic":false,"color":"white"}],[{"text":"- gain an item to reveal the nearest runner, and stun them","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":" Lunge 2 spear","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 3 spear","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"Mercury has entered its retrograde, my genocide will be countless.\"","italic":false,"color":"red"}]]]
# set the cooldown
execute as @a at @s if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] if score @s class_selection_cooldown matches 0 run scoreboard players set @s class_selection_cooldown 3

# automatically close the player inventory on click
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 3 run fill ~ ~1 ~ ~ ~1 ~ nether_portal replace air
execute as @a at @s if score countdown time matches ..28 if score @s class_selection_cooldown matches 2 run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace nether_portal
# select  class
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run clear @s netherite_spear
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_spear"}}]
# selection
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run scoreboard players set @s evil_class 7
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run tellraw @a [{"color":"gold","selector":"@s"}," ",{"text":"picked the","color":"white"}," ",{"text":"Manhunter","color":"dark_purple"}," ",{"text":"Corrupted class","color":"white"}]
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run playsound minecraft:block.sculk_shrieker.place block @a ~ ~ ~ 1 1.6 1 
execute as @a if score countdown time matches ..28 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:34b}]}] run item replace entity @s inventory.25 with netherite_spear[custom_name=[{"text":"Manhunter","italic":false,"color":"light_purple"}],lore=[[{"text":"=== 15% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 1 spear","italic":false,"color":"white"}],[{"text":"- gain an item to reveal the nearest runner, and stun them","italic":false,"color":"white"}],[{"text":"=== 50% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- ","italic":false,"color":"white"},{"text":" Lunge 2 spear","italic":false,"color":"white"}],[{"text":"=== 90% corruption ===","italic":false,"color":"dark_purple"}],[{"text":"- Lunge 3 spear","italic":false,"color":"white"}],[{"text":"-----------------------","italic":false,"color":"dark_purple"}],[{"text":"\"Mercury has entered its retrograde, my genocide will be countless.\"","italic":false,"color":"red"}]]]

