#███╗   ███╗██╗███╗   ██╗███████╗██████╗ 
#████╗ ████║██║████╗  ██║██╔════╝██╔══██╗
#██╔████╔██║██║██╔██╗ ██║█████╗  ██████╔╝
#██║╚██╔╝██║██║██║╚██╗██║██╔══╝  ██╔══██╗
#██║ ╚═╝ ██║██║██║ ╚████║███████╗██║  ██║
#╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
#                                        
# this class was going to be short
# unfortulatly this was playtested but it sucked ass

#kill any loose gray dye
execute as @e[type=item,nbt={Item:{id:"minecraft:gray_dye"}}] run kill @s

scoreboard players add @s medic_heal 0

#==============================================================================================================================================================
#give the miner_lantern his coper pickaxe
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:0b}]}] run clear @s copper_pickaxe

execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:copper_pickaxe"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_pickaxe",Slot:0b}]}] run item replace entity @s hotbar.0 with copper_pickaxe[custom_name=[{"text":"'Amie' the pickaxe","italic":false}],rarity=uncommon,enchantments={knockback:1},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]



#==============================================================================================================================================================

# if the player drops the gold_nugget item, start a 300 tick timer. then decrese by 1 until it can be used again (16 seconds)
execute unless entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget",Slot:1b}]}] if score @s medic_heal matches 0 run scoreboard players set @s medic_heal 300
execute if score @s medic_heal matches 1.. run scoreboard players remove @s medic_heal 1

# spawn a healing totem that will spin, do fancy particles and heal all within its radius
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 at @s run summon armor_stand ~ ~ ~ {Pose:{Body:[0f,0f,181f]},Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["speed_totem"]}
# in the endgame do a jump boost
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 at @s if score endgame state matches 1 run effect give @s jump_boost 6 1 true
# sound effect
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.ambient player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.creeper.primed player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.ambient player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.ambient player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.ambient player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.death player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.hurt player @s ~ ~ ~ 1 1 0.6
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.goat.screaming.ambient player @s ~ ~ ~ 1 1 0.6



# check to see if the gold_nugget has been dropped.
# give the medic_heal the Jump gold_nugget. make sure he cant manipulate it
#execute unless entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget",Slot:1b}]}] run clear @a gold_nugget
execute unless entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget",Slot:1b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:gold_nugget"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:gold_nugget",Slot:1b}]}] if score @s medic_heal matches 0 run item replace entity @s hotbar.1 with gold_nugget[custom_name=[{"text":"Shiny nugget","italic":false,"color":"yellow"}],lore=[[{"text":"qrop to get a speed boost","italic":false}]],rarity=uncommon]

# do a cooldown timer with drey dye
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 16
execute if score @s[scores={medic_heal=280}] medic_heal matches 280 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 14
execute if score @s[scores={medic_heal=260}] medic_heal matches 260 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 13
execute if score @s[scores={medic_heal=240}] medic_heal matches 240 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 12
execute if score @s[scores={medic_heal=220}] medic_heal matches 220 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 11
execute if score @s[scores={medic_heal=200}] medic_heal matches 200 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 10
execute if score @s[scores={medic_heal=180}] medic_heal matches 180 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 9
execute if score @s[scores={medic_heal=160}] medic_heal matches 160 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 8
execute if score @s[scores={medic_heal=140}] medic_heal matches 140 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 7
execute if score @s[scores={medic_heal=120}] medic_heal matches 120 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s[scores={medic_heal=100}] medic_heal matches 100 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s[scores={medic_heal=80}] medic_heal matches 80 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 4
execute if score @s[scores={medic_heal=60}] medic_heal matches 60 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 3
execute if score @s[scores={medic_heal=40}] medic_heal matches 40 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 2
execute if score @s[scores={medic_heal=20}] medic_heal matches 20 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 1


# get rid of the gray dye when the cooldown is done
execute if score @s medic_heal matches 0 run clear @s gray_dye


#=================================================================================================================================================
# set the rotation of the heal totem to the players to the players cooldown
execute if score @s medic_heal matches 299 run scoreboard players set miner_lantern_totem_rotation medic_heal 180
execute if score @s medic_heal matches 1.. run scoreboard players remove miner_lantern_totem_rotation medic_heal 11 
# this code was stolen from the medic so we will have to use his objectives

# rotate the totem for the fancy particles
execute store result storage minecraft:miner_lantern_rot angle int 1 run scoreboard players get miner_lantern_totem_rotation medic_heal

execute as @e[type=armor_stand,tag=speed_totem] store result entity @s Rotation[0] float 1 run data get storage minecraft:miner_lantern_rot angle

# fancy particles
execute as @e[tag=speed_totem] at @s run particle wax_on ^ ^1 ^4 0 0.1 0 0 8 force @a
execute as @e[tag=speed_totem] at @s run particle wax_on ^ ^1 ^-4 0 0.1 0 0 8 force @a
execute as @e[tag=speed_totem] at @s run particle wax_on ^-4 ^1 ^ 0 0.1 0 0 8 force @a
execute as @e[tag=speed_totem] at @s run particle wax_on ^4 ^1 ^ 0 0.1 0 0 8 force @a

execute if score miner_lantern_totem_rotation medic_heal matches ..0 run kill @e[tag=speed_totem]
# DO THE SPEED BOOST
execute if score @s medic_heal matches 298 run execute as @e[tag=speed_totem] at @s run effect give @a[distance=..4] speed 4 2

#=================================================================================================================================================

#give the miner his lantern



# if the player drops the miner_lantern item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_lantern",Slot:4b}]}] if score @s miner_lantern matches 0 run scoreboard players set @s miner_lantern 600
execute if score @s miner_lantern matches 1.. run scoreboard players remove @s miner_lantern 1
# give the miner_lantern his jump boost
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run effect give @s speed 6 0
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run effect give @s invisibility 6 1
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run attribute @s scale base set 0.5
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run attribute @s gravity base set 20

# restore scale when done
execute if score @s[scores={miner_lantern=..470}] miner_lantern matches ..470 run attribute @s scale base reset
execute if score @s[scores={miner_lantern=..470}] miner_lantern matches ..470 run attribute @s gravity base reset

# sound effect
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run playsound entity.wither.break_block player @s ~ ~ ~ 1 0.8 0.5
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run playsound block.amethyst_block.break player @s ~ ~ ~ 1 1 0.5

# fancy particles
execute if score @s[scores={miner_lantern=470..}] miner_lantern matches 470.. at @s[scores={miner_lantern=470..}] run particle item{item:{id:cobblestone}} ~ ~0.1 ~ 0.5 0 0.5 0 100 force @a


# check to see if the candle has been dropped.
# give the miner_lantern the Jump candle. make sure he cant manipulate it
#execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_lantern",Slot:1b}]}] run clear @a copper_lantern
execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_lantern",Slot:4b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:copper_lantern"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:copper_lantern",Slot:4b}]}] if score @s miner_lantern matches 0 run item replace entity @s hotbar.4 with copper_lantern[custom_name=[{"text":"Tunneling lantern","italic":false,"color":"dark_green"}],lore=[[{"text":"drop to burrow","italic":false}]],rarity=uncommon]


# do a cooldown timer with black dye (30 seconds)
execute if score @s[scores={miner_lantern=599}] miner_lantern matches 599 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 30
execute if score @s[scores={miner_lantern=580}] miner_lantern matches 580 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 29
execute if score @s[scores={miner_lantern=560}] miner_lantern matches 560 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 28
execute if score @s[scores={miner_lantern=540}] miner_lantern matches 540 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 27
execute if score @s[scores={miner_lantern=520}] miner_lantern matches 520 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 26
execute if score @s[scores={miner_lantern=500}] miner_lantern matches 500 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 25
execute if score @s[scores={miner_lantern=480}] miner_lantern matches 480 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 24
execute if score @s[scores={miner_lantern=460}] miner_lantern matches 460 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 23
execute if score @s[scores={miner_lantern=440}] miner_lantern matches 440 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 22
execute if score @s[scores={miner_lantern=420}] miner_lantern matches 420 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 21
execute if score @s[scores={miner_lantern=400}] miner_lantern matches 400 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 20
execute if score @s[scores={miner_lantern=380}] miner_lantern matches 380 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 19
execute if score @s[scores={miner_lantern=360}] miner_lantern matches 360 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 18
execute if score @s[scores={miner_lantern=340}] miner_lantern matches 340 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 17
execute if score @s[scores={miner_lantern=320}] miner_lantern matches 320 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 16
execute if score @s[scores={miner_lantern=300}] miner_lantern matches 300 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 15
execute if score @s[scores={miner_lantern=280}] miner_lantern matches 280 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 14
execute if score @s[scores={miner_lantern=260}] miner_lantern matches 260 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 13
execute if score @s[scores={miner_lantern=240}] miner_lantern matches 240 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 12
execute if score @s[scores={miner_lantern=220}] miner_lantern matches 220 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 11
execute if score @s[scores={miner_lantern=200}] miner_lantern matches 200 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 10
execute if score @s[scores={miner_lantern=180}] miner_lantern matches 180 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 9
execute if score @s[scores={miner_lantern=160}] miner_lantern matches 160 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 8
execute if score @s[scores={miner_lantern=140}] miner_lantern matches 140 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 7
execute if score @s[scores={miner_lantern=120}] miner_lantern matches 120 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s[scores={miner_lantern=100}] miner_lantern matches 100 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 5
execute if score @s[scores={miner_lantern=80}] miner_lantern matches 80 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 4
execute if score @s[scores={miner_lantern=60}] miner_lantern matches 60 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 3
execute if score @s[scores={miner_lantern=40}] miner_lantern matches 40 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 2
execute if score @s[scores={miner_lantern=20}] miner_lantern matches 20 run item replace entity @s hotbar.4 with black_dye[custom_name=[{"text":"cooldown","italic":false}]] 1


# get rid of the black dye when the cooldown is done
execute if score @s miner_lantern matches 0 run clear @s black_dye