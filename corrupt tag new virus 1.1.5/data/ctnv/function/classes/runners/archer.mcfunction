# █████╗ ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
#██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗
#███████║██████╔╝██║     ███████║█████╗  ██████╔╝
#██╔══██║██╔══██╗██║     ██╔══██║██╔══╝  ██╔══██╗
#██║  ██║██║  ██║╚██████╗██║  ██║███████╗██║  ██║
#╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
                                        
# the infamus archer class
scoreboard players add @s acher_arrow_count 0
#==============================================================================================================================================================
#give the archer his bow

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] run clear @s bow

execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:bow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:bow",Slot:0b}]}] run item replace entity @s hotbar.0 with bow[custom_name=[{"text":"trusty bow","italic":false}],enchantments={punch:2}]

# slight permanent speed buff
effect give @s speed 6 0 true
#==============================================================================================================================================================
# the hard part of this class will be keeping track of how many arrows the archer has
# 1. keep track of arrows
# 2. make sure that they cannot be duped
# 3. decreese the arrow count when one is shot
# 4. slowly regenerate arrows until a max is reached

# make sure that arrows cannot be duped or manipulated
execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] run clear @s arrow
execute if entity @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:arrow"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 1 run item replace entity @s hotbar.1 with arrow 1

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 2 run item replace entity @s hotbar.1 with arrow 2

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 3 run item replace entity @s hotbar.1 with arrow 3

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 4 run item replace entity @s hotbar.1 with arrow 4

execute unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:1b}]}] if score @s acher_arrow_count matches 5 run item replace entity @s hotbar.1 with arrow 5

# check if the archer launches his arrow
execute if score @s bow_shot matches 1 run clear @s arrow
execute if score @s bow_shot matches 1 run scoreboard players remove @s acher_arrow_count 1
execute if score @s bow_shot matches 1 run scoreboard players reset @s bow_shot

# kill stationary arrows
kill @e[type=arrow,nbt={inGround:1b}]


# slowly regenerate arrows (unless at max arrows)
execute if score seconds time matches 20 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run clear @s arrow
execute if score seconds time matches 20 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run scoreboard players add @s acher_arrow_count 1

execute if score seconds time matches 50 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run clear @s arrow
execute if score seconds time matches 50 if score tick time matches 3 unless score @s acher_arrow_count matches 5 run scoreboard players add @s acher_arrow_count 1
