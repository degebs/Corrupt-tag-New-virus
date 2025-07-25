#███╗   ███╗███████╗██████╗ ██╗ ██████╗
#████╗ ████║██╔════╝██╔══██╗██║██╔════╝
#██╔████╔██║█████╗  ██║  ██║██║██║     
#██║╚██╔╝██║██╔══╝  ██║  ██║██║██║     
#██║ ╚═╝ ██║███████╗██████╔╝██║╚██████╗
#╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝ ╚═════╝

# this class can heal himself and other IF they are not at max health
# used to be very annoying in the origional, but can now be helpfull in the sequel

#kill any loose gray dye
execute as @e[type=item,nbt={Item:{id:"minecraft:gray_dye"}}] run kill @s

scoreboard players add @s medic_heal 0

#==============================================================================================================================================================
#give the medic his knockback hoe

# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_hoe",Slot:0b}]}] run clear @s diamond_hoe

execute unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_hoe",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:diamond_hoe"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_hoe",Slot:0b}]}] run item replace entity @s hotbar.0 with diamond_hoe[custom_name=[{"text":"medical hoe","italic":false}],rarity=uncommon,enchantments={knockback:3},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]



#==============================================================================================================================================================

# if the player drops the poppy item, start a 300 tick timer. then decrese by 1 until it can be used again (15 seconds)
execute unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:1b}]}] if score @s medic_heal matches 0 run scoreboard players set @s medic_heal 300
execute if score @s medic_heal matches 1.. run scoreboard players remove @s medic_heal 1

# spawn a healing totem that will spin, do fancy particles and heal all within its radius
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 at @s run summon armor_stand ~ ~ ~ {Pose:{Body:[0f,0f,181f]},Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["heal_totem"]}
# in the endgame do a jump boost
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 at @s if score endgame state matches 1 run effect give @s jump_boost 5 2 true
# sound effect
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.dolphin.ambient player @s ~ ~ ~ 1 1 0.5
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run playsound entity.warden.heartbeat player @s ~ ~ ~ 1 1 0.5



# check to see if the poppy has been dropped.
# give the medic_heal the Jump poppy. make sure he cant manipulate it
#execute unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:1b}]}] run clear @a poppy
execute unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:1b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:poppy"}}]
execute unless entity @s[nbt={Inventory:[{id:"minecraft:poppy",Slot:1b}]}] if score @s medic_heal matches 0 run item replace entity @s hotbar.1 with poppy[custom_name=[{"text":"healing rose","italic":false,"color":"dark_green"}],lore=[[{"text":"qrop to heal","italic":false}]],rarity=uncommon]

# do a cooldown timer with drey dye
execute if score @s[scores={medic_heal=299}] medic_heal matches 299 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 15
execute if score @s[scores={medic_heal=280}] medic_heal matches 280 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 14
execute if score @s[scores={medic_heal=260}] medic_heal matches 260 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 13
execute if score @s[scores={medic_heal=240}] medic_heal matches 240 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 12
execute if score @s[scores={medic_heal=220}] medic_heal matches 220 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 11
execute if score @s[scores={medic_heal=200}] medic_heal matches 200 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 10
execute if score @s[scores={medic_heal=180}] medic_heal matches 180 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 9
execute if score @s[scores={medic_heal=160}] medic_heal matches 160 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 8
execute if score @s[scores={medic_heal=140}] medic_heal matches 140 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 7
execute if score @s[scores={medic_heal=120}] medic_heal matches 120 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 6
execute if score @s[scores={medic_heal=100}] medic_heal matches 100 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 5
execute if score @s[scores={medic_heal=80}] medic_heal matches 80 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 4
execute if score @s[scores={medic_heal=60}] medic_heal matches 60 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 3
execute if score @s[scores={medic_heal=40}] medic_heal matches 40 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 2
execute if score @s[scores={medic_heal=20}] medic_heal matches 20 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"cooldown","italic":false}]] 1


# get rid of the gray dye when the cooldown is done
execute if score @s medic_heal matches 0 run clear @s gray_dye


#=================================================================================================================================================
# set the rotation of the heal totem to the players to the players cooldown
execute if score @s medic_heal matches 299 run scoreboard players set medic_totem_rotation medic_heal 180
execute if score @s medic_heal matches 1.. run scoreboard players remove medic_totem_rotation medic_heal 6

# rotate the totem for the fancy particles
execute store result storage minecraft:med_rot angle int 1 run scoreboard players get medic_totem_rotation medic_heal

execute as @e[type=armor_stand,tag=heal_totem] store result entity @s Rotation[0] float 1 run data get storage minecraft:med_rot angle

# fancy particles
execute as @e[tag=heal_totem] at @s run particle happy_villager ^ ^1 ^2 0 0 0 0 2 force @a
execute as @e[tag=heal_totem] at @s run particle happy_villager ^ ^1 ^-2 0 0 0 0 2 force @a
execute as @e[tag=heal_totem] at @s run particle happy_villager ^-2 ^1 ^ 0 0 0 0 2 force @a
execute as @e[tag=heal_totem] at @s run particle happy_villager ^2 ^1 ^ 0 0 0 0 2 force @a

execute if score medic_totem_rotation medic_heal matches ..0 run kill @e[tag=heal_totem]
# heal all within its range UNLESS the runners in the range are already at max health
execute if score @s medic_heal matches 298 run execute as @e[tag=heal_totem] at @s run scoreboard players add @a[distance=..2,team=runners] health 1

