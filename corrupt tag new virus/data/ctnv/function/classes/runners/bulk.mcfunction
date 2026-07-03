
#██████╗ ██╗   ██╗██╗     ██╗  ██╗
#██╔══██╗██║   ██║██║     ██║ ██╔╝
#██████╔╝██║   ██║██║     █████╔╝ 
#██╔══██╗██║   ██║██║     ██╔═██╗ 
#██████╔╝╚██████╔╝███████╗██║  ██╗
#╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
# the defualt runner class
#significantly improved form the origional "warior"

# here is all the logic related to the bulk



#==============================================================================================================================================================
#give the bulk his knockback sword

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run clear @s iron_sword

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:iron_sword",Slot:0b}]}] run item replace entity @s hotbar.0 with iron_sword[custom_name=[{"text":"Brynhildr","italic":false}],rarity=uncommon,enchantments={knockback:1,unbreaking:255},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]


#==============================================================================================================================================================
# the totem of undying for corrupt tag


# make sure it actually works
scoreboard players add @s bulk_totem 0
execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 0 run clear @s totem_of_undying
execute if score @s bulk_totem matches 1.. run clear @s totem_of_undying


execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 0 run kill @e[type=item,nbt={Item:{id:"minecraft:totem_of_undying"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 0 run item replace entity @s hotbar.2 with totem_of_undying[item_name="Freyr"]
# if the player is at 0 health, trigger the totem.
# triggering the totem means
# 1. set the bulkts health back to its max
# 2. do particles and sounds
# 3. disable the totem 
# 4. only do any of this if the totem is in the main hand


# particles and sound effects
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. at @s run particle totem_of_undying ~ ~1 ~ 0.5 1 0.5 1 200 force @a
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. at @s run playsound item.totem.use player @a ~ ~ ~ 1 1

# update the bulk_totem count to 2. whenever the player turns from corrupted to runner bulk subtract 1 from this (unless its already 0)
# the bulk will have to be corrupted then uncorrupted twice to get the totem back
# with the bulk rework it must now be that he aquires enough rage to do this
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. run scoreboard players set @s bulk_totem 2
execute unless entity @s[nbt={Inventory:[{id:"minecraft:totem_of_undying",Slot:2b}]}] if score @s bulk_totem matches 1.. if score @s hit matches 1.. run clear @s totem_of_undying
# reset the health
execute if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] if score @s health matches 1 if score @s hit matches 1.. run scoreboard players operation @s health = @a[scores={ST____max_health=1..},limit=1,sort=arbitrary] ST____max_health






#==============================================================================================================================================================
# faster regen
# its just the regen logic but at the 10 second mark, as well as the the normal healing time.
# doing it twice technically makes this faster regeneration
execute as @a[team=runners,scores={class=3}] if score tick time matches 10 if score seconds time matches 10 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run scoreboard players add @s health 1
# particles to indicate healing
execute as @a[team=runners,scores={class=3}] at @s if score seconds time matches 10 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run particle minecraft:happy_villager ~ ~1 ~ 0.2 1 0.2 1 5 force @a

#==============================================================================================================================================================
# make his shield breakable
# if you are within 3 blocks of the corrupted, for 10 seconds, your shield will break

# for some reason this command does not work... exept when i run the command manually in game...
# fuck
execute at @s if entity @a[team=corrupted,distance=..3] run scoreboard players add @s shield_breaker 1

# 10 seconds is 200 ticks
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run clear @s shield
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run particle crit ~ ~1 ~ 0 0 0 0.2 15 force @a
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run playsound item.shield.break player @s ~ ~ ~ 1 1 0.6
execute at @s if entity @a[team=corrupted,distance=..3] if score @s shield_breaker matches 200.. run scoreboard players reset @s shield_breaker 

#==============================================================================================================================================================
#give the bulk his shield

# make sure it cannot be moved
execute if entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run clear @s minecraft:shield

execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:35b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:shield"}}]

# for some reason this shield is completly unbreakable. so i need to maunually add damage to it
execute unless entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:35b}]}] if score 360 time matches 290 run item replace entity @s weapon.offhand with shield[custom_name=[{"text":"bulky shield","italic":false}],rarity=uncommon,damage=335]


# clears any corrupted items.
# sometimes corrupted items may appear in the invetory of runners.
# we need to make sure this cannot happen
clear @s glowstone_dust
clear @s sugar
#clear @s chorus_fruit
# not this one
#==============================================================================================================================================================

# majke sure the cannot get it again until the totem is no more
execute if score @s bulk_totem matches 0 run scoreboard players set @s bulk_rage -15

# bulk rage
execute as @s if score @s corruption matches 0..9 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██████████","color":"white"}]
execute as @s if score @s corruption matches 9..19 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █","color":"dark_purple"},{"text":"█████████","color":"white"}]
execute as @s if score @s corruption matches 20..29 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██","color":"dark_purple"},{"text":"████████","color":"white"}]
execute as @s if score @s corruption matches 30..39 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ███","color":"dark_purple"},{"text":"███████","color":"white"}]
execute as @s if score @s corruption matches 40..49 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ████","color":"dark_purple"},{"text":"██████","color":"white"}]
execute as @s if score @s corruption matches 50..59 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █████","color":"dark_purple"},{"text":"█████","color":"white"}]
execute as @s if score @s corruption matches 60..69 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓█████","color":"dark_purple"},{"text":"████","color":"white"}]
execute as @s if score @s corruption matches 70..79 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓█████","color":"dark_purple"},{"text":"███","color":"white"}]
execute as @s if score @s corruption matches 80..89 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓█████","color":"dark_purple"},{"text":"██","color":"white"}]
execute as @s if score @s corruption matches 90..99 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓▓█████","color":"dark_purple"},{"text":"█","color":"white"}]
execute as @s if score @s corruption matches 100.. run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"    RAGE: ","color":"red"},{"score":{"name":"@s","objective":"bulk_rage"}},{"text":"                ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▒▓▓▓▓█████","color":"dark_purple"}]

# if the bulk himself gets hit increase his rage by 10
execute if score @s hit matches 1.. run scoreboard players add @s bulk_rage 15
# 4 block passive rage increase
execute at @s[team=runners] if entity @a[team=corrupted,distance=..4] if score tick time matches 4 run scoreboard players add @s bulk_rage 1
# passive rage increase
execute if score tick time matches 4 if score seconds time matches 20 run scoreboard players add @s[team=runners] bulk_rage 5



# getting the actuall totem
execute if score @s bulk_rage matches 100.. at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 1 100 force @a
execute if score @s bulk_rage matches 100.. at @s run particle minecraft:firework ~ ~1 ~ 1 1 1 0.1 50 force @a
execute if score @s bulk_rage matches 100.. at @s run playsound entity.evoker.prepare_wololo player @a ~ ~ ~ 1 1
execute if score @s bulk_rage matches 100.. at @s run playsound block.respawn_anchor.charge player @a ~ ~ ~ 1 1
execute if score @s bulk_rage matches 100.. at @s run tellraw @s [{"text":"You gained a Totem of Undying!","color":"gold","bold":true}]
execute if score @s bulk_rage matches 100.. at @s run title @s title [{"text":"RAGE MAXED!","color":"dark_red","bold":true}]
execute if score @s bulk_rage matches 100.. at @s run title @s subtitle [{"text":"You gained a Totem of Undying","color":"gold"}]
execute if score @s bulk_rage matches 100.. at @s run effect give @s speed 3 2 false
execute if score @s bulk_rage matches 100.. at @s run scoreboard players set @s bulk_totem 0
execute if score @s bulk_rage matches 100.. at @s run scoreboard players add @s bulk_rage_advandment 1
execute if score @s bulk_rage matches 100.. at @s run scoreboard players set @s bulk_rage -15

