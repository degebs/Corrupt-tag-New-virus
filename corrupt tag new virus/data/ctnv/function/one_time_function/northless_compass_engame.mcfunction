scoreboard players add @s northless_compass_cooldown 0
#=================================================================================================================
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:recovery_compass",Slot:3b}]}] run clear @s recovery_compass

execute unless entity @s[nbt={Inventory:[{id:"minecraft:recovery_compass",Slot:3b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:recovery_compass"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:recovery_compass",Slot:3b}]}] if score @s northless_compass_cooldown matches 0 run item replace entity @s hotbar.3 with recovery_compass[minecraft:custom_data={tracker:1b},item_name="Northless recovery compass"]

#=================================================================================================================
# here the recovery_compass will point twards the corrupted player. 
#execute as @a[tag=corrupted,limit=1] at @s run setworldspawn ~ ~ ~
# does not work

# highlight with particles
# if the runner is holding the recovery_compass, reveal the corrupted with particles
execute as @s[nbt={SelectedItem:{id:"minecraft:recovery_compass"}}] at @p[team=corrupted] run particle dust{color:[0.78,0.0,1.0],scale:2} ~ ~ ~ 0 25 0 0.1 200 force @a[team=runners,scores={class=12}]


execute as @s[nbt={SelectedItem:{id:"minecraft:recovery_compass"}}] at @s run effect give @p[team=corrupted,distance=..15] glowing 1 0 true

#=================================================================================================================
# when dropped it will do a sircle of resupply
execute if score @s northless_compass_detect matches 1 at @s run scoreboard players set @s northless_compass_cooldown 600
execute if score @s northless_compass_detect matches 1 at @s run scoreboard players set @s northless_compass_detect 0
execute if score @s northless_compass_cooldown matches 1.. run scoreboard players remove @s northless_compass_cooldown 1


# spawn a compass totem that will spin, do fancy particles and heal all within its radius
execute if score @s[scores={northless_compass_cooldown=599}] northless_compass_cooldown matches 599 at @s run summon armor_stand ~ ~ ~ {Pose:{Body:[0f,0f,181f]},Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["resupply_totem"]}

# sound effect
execute if score @s[scores={northless_compass_cooldown=599}] northless_compass_cooldown matches 599 run playsound entity.dolphin.ambient player @s ~ ~ ~ 1 1 0.5
execute if score @s[scores={northless_compass_cooldown=599}] northless_compass_cooldown matches 599 run playsound block.enchantment_table.use player @s ~ ~ ~ 1 1 0.5



execute if score @s northless_compass_cooldown matches 595 at @s run function ctnv:one_time_function/reset_cooldowns

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# this code was stolen from the medic

# 30 second cooldown


execute if score @s northless_compass_cooldown matches 599.. run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 30
execute if score @s northless_compass_cooldown matches 580 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 29
execute if score @s northless_compass_cooldown matches 560 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 28
execute if score @s northless_compass_cooldown matches 540 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 27
execute if score @s northless_compass_cooldown matches 520 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 26
execute if score @s northless_compass_cooldown matches 500 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 25
execute if score @s northless_compass_cooldown matches 480 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 24
execute if score @s northless_compass_cooldown matches 460 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 23
execute if score @s northless_compass_cooldown matches 440 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 22
execute if score @s northless_compass_cooldown matches 420 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 21
execute if score @s northless_compass_cooldown matches 400 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 20
execute if score @s northless_compass_cooldown matches 380 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 19
execute if score @s northless_compass_cooldown matches 360 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 18
execute if score @s northless_compass_cooldown matches 340 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 17
execute if score @s northless_compass_cooldown matches 320 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 16
execute if score @s northless_compass_cooldown matches 300 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 15
execute if score @s northless_compass_cooldown matches 280 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 14
execute if score @s northless_compass_cooldown matches 260 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 13
execute if score @s northless_compass_cooldown matches 240 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 12
execute if score @s northless_compass_cooldown matches 220 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 11
execute if score @s northless_compass_cooldown matches 200 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 10
execute if score @s northless_compass_cooldown matches 180 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 9
execute if score @s northless_compass_cooldown matches 160 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 8
execute if score @s northless_compass_cooldown matches 140 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 7
execute if score @s northless_compass_cooldown matches 120 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 6
execute if score @s northless_compass_cooldown matches 100 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 5
execute if score @s northless_compass_cooldown matches 80 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 4
execute if score @s northless_compass_cooldown matches 60 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 3
execute if score @s northless_compass_cooldown matches 40 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 2
execute if score @s northless_compass_cooldown matches 20 run item replace entity @s hotbar.3 with minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]] 1
execute if score @s northless_compass_cooldown matches 0 run clear @s minecraft:gray_dye[custom_name=[{"text":"norhless compass cooldown","italic":false}]]