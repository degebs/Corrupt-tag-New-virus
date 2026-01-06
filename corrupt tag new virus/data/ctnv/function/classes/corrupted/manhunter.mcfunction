#███╗   ███╗ █████╗ ███╗   ██╗██╗  ██╗██╗   ██╗███╗   ██╗████████╗███████╗██████╗ 
#████╗ ████║██╔══██╗████╗  ██║██║  ██║██║   ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗
#██╔████╔██║███████║██╔██╗ ██║███████║██║   ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝
#██║╚██╔╝██║██╔══██║██║╚██╗██║██╔══██║██║   ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗
#██║ ╚═╝ ██║██║  ██║██║ ╚████║██║  ██║╚██████╔╝██║ ╚████║   ██║   ███████╗██║  ██║
#╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
                                                                                
# this corrupted class will use the new spear item they added in the lates version of minecraft


# give him his armor
item replace entity @s armor.chest with copper_chestplate[trim={pattern:dune,material:amethyst},enchantments={binding_curse:1}]
item replace entity @s armor.head with copper_helmet[trim={pattern:silence,material:amethyst},enchantments={binding_curse:1}]
item replace entity @s armor.legs with copper_leggings[trim={pattern:snout,material:amethyst},enchantments={binding_curse:1}]
item replace entity @s armor.feet with copper_boots[trim={pattern:flow,material:netherite},enchantments={binding_curse:1}]

#=====================================================================================================================
# his spear will have the lunge enchantment. and it will get progressivly better as his corruption increases

# he spawns with no lunge
execute if score @s corruption matches ..15 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_spear",Slot:0b}]}] run clear @s iron_spear
execute if score @s corruption matches ..15 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_spear",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:iron_spear"}}]
execute if score @s corruption matches ..15 unless entity @s[nbt={Inventory:[{id:"minecraft:iron_spear",Slot:0b}]}] run item replace entity @s hotbar.0 with iron_spear[custom_name=[{"text":"The hunter","italic":false}],rarity=uncommon,enchantments={unbreaking:255},attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1767673547656"},{type:attack_speed,amount:-0.5,operation:add_multiplied_base,id:"1767673547657"}]]


# his 15% ability has lunge 1
execute if score @s corruption matches 16..49 unless entity @s[nbt={Inventory:[{id:"minecraft:golden_spear",Slot:0b}]}] run clear @s golden_spear
execute if score @s corruption matches 16..49 unless entity @s[nbt={Inventory:[{id:"minecraft:golden_spear",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:golden_spear"}}]
execute if score @s corruption matches 16..49 unless entity @s[nbt={Inventory:[{id:"minecraft:golden_spear",Slot:0b}]}] run item replace entity @s hotbar.0 with golden_spear[custom_name=[{"text":"The MAN hunter","italic":false}],enchantments={lunge:1,unbreaking:255},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:0,operation:"add_value",slot:"mainhand"},{type:"attack_speed",id:"attack_speed",amount:-0.5,operation:"add_multiplied_base",slot:"mainhand"}]]
# message
execute if score @s corruption matches 16 if score corruption_tick corruption matches 1 if score tick time matches 1 run tellraw @s [{"text":"Y","color":"#fb00ff"},{"text":"o","color":"#fb00f6"},{"text":"u","color":"#fb00ed"},{"text":"r","color":"#fb00e4"},{"text":" ","color":"#fc00db"},{"text":"s","color":"#fc00d1"},{"text":"p","color":"#fc00c8"},{"text":"e","color":"#fc00bf"},{"text":"a","color":"#fc00b6"},{"text":"r","color":"#fc00ad"},{"text":" ","color":"#fc00a4"},{"text":"i","color":"#fd009b"},{"text":"n","color":"#fd0092"},{"text":"c","color":"#fd0089"},{"text":"r","color":"#fd0080"},{"text":"e","color":"#fd0076"},{"text":"a","color":"#fd006d"},{"text":"s","color":"#fd0064"},{"text":"e","color":"#fe005b"},{"text":"s","color":"#fe0052"},{"text":" ","color":"#fe0049"},{"text":"i","color":"#fe0040"},{"text":"n","color":"#fe0037"},{"text":" ","color":"#fe002e"},{"text":"p","color":"#fe0024"},{"text":"o","color":"#ff001b"},{"text":"w","color":"#ff0012"},{"text":"e","color":"#ff0009"},{"text":"r","color":"#ff0000"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 1 run playsound entity.wither.ambient hostile @s ~ ~ ~ 1 0.1 1

# his 50% ability has lunge 2
execute if score @s corruption matches 50..89 unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_spear",Slot:0b}]}] run clear @s diamond_spear
execute if score @s corruption matches 50..89 unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_spear",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:diamond_spear"}}]
execute if score @s corruption matches 50..89 unless entity @s[nbt={Inventory:[{id:"minecraft:diamond_spear",Slot:0b}]}] run item replace entity @s hotbar.0 with diamond_spear[custom_name=[{"text":"The MAN destroyer","italic":false}],enchantments={lunge:2,unbreaking:255},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:0,operation:"add_value",slot:"mainhand"},{type:"attack_speed",id:"attack_speed",amount:-0.5,operation:"add_multiplied_base",slot:"mainhand"}]]
#message
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 1 run tellraw @s [{"text":"S","color":"#fb00ff"},{"text":"H","color":"#fb00f0"},{"text":"O","color":"#fb00e1"},{"text":"W","color":"#fc00d2"},{"text":" ","color":"#fc00c3"},{"text":"T","color":"#fc00b4"},{"text":"H","color":"#fc00a5"},{"text":"E","color":"#fd0096"},{"text":"M","color":"#fd0087"},{"text":" ","color":"#fd0078"},{"text":"N","color":"#fd0069"},{"text":"O","color":"#fe005a"},{"text":" ","color":"#fe004b"},{"text":"M","color":"#fe003c"},{"text":"E","color":"#fe002d"},{"text":"R","color":"#fe001e"},{"text":"C","color":"#ff000f"},{"text":"Y","color":"#ff0000"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 1 run playsound entity.wither.ambient hostile @s ~ ~ ~ 1 0.1 1
# his 90% ability has lunge 3
execute if score @s corruption matches 90..100 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:0b}]}] run clear @s netherite_spear
execute if score @s corruption matches 90..100 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:netherite_spear"}}]
execute if score @s corruption matches 90..100 unless entity @s[nbt={Inventory:[{id:"minecraft:netherite_spear",Slot:0b}]}] run item replace entity @s hotbar.0 with netherite_spear[custom_name=[{"text":"The genocide","italic":false}],enchantments={lunge:3,unbreaking:255},attribute_modifiers=[{type:"attack_damage",id:"attack_damage",amount:0,operation:"add_value",slot:"mainhand"},{type:"attack_speed",id:"attack_speed",amount:-0.5,operation:"add_multiplied_base",slot:"mainhand"}]]
#message
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 1 run tellraw @s [{"text":"F","color":"#fb00ff"},{"text":"I","color":"#fb00ed"},{"text":"N","color":"#fc00db"},{"text":"I","color":"#fc00c8"},{"text":"S","color":"#fc00b6"},{"text":"H","color":"#fc00a4"},{"text":" ","color":"#fd0092"},{"text":"T","color":"#fd0080"},{"text":"H","color":"#fd006d"},{"text":"E","color":"#fe005b"},{"text":"M","color":"#fe0049"},{"text":" ","color":"#fe0037"},{"text":"N","color":"#fe0024"},{"text":"O","color":"#ff0012"},{"text":"W","color":"#ff0000"}]
 execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 1 run playsound entity.wither.ambient hostile @s ~ ~ ~ 1 0.1 1
 # gotta get rid of the spear when 100%
 execute if score @s corruption matches 100.. run clear @s netherite_spear

#=====================================================================================================================
# particles
execute at @s if score @s corruption matches 50.. run particle crit ~ ~ ~ 2 2 2 0 3 force @a
execute at @s if score @s corruption matches 80.. run particle falling_lava ~ ~ ~ 2 2 2 0 3 force @a

#=====================================================================================================================
# goat horn
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:goat_horn",Slot:1b}]}] run clear @s goat_horn
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:goat_horn",Slot:1b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:goat_horn"}}]
execute if score @s corruption matches 15.. if score @s manhunter_cooldown matches 0 unless entity @s[nbt={Inventory:[{id:"minecraft:goat_horn",Slot:1b}]}] run item replace entity @s hotbar.1 with goat_horn[instrument=dream_goat_horn,custom_name=[{"text":"Seeker Horn","italic":false}]]


# goat horn delay
execute if score @s manhunter_horn_blow_detect matches 1.. run scoreboard players set @s manhunter_horn_blow_delay 1
# reset the horn detect
execute if score @s manhunter_horn_blow_detect matches 1.. run scoreboard players set @s manhunter_horn_blow_detect 0
# that will set off the dealy
execute if score @s manhunter_horn_blow_delay matches 1.. run scoreboard players add @s manhunter_horn_blow_delay 1

# after 5 seconds trigger the actuall cooldown
execute if score @s manhunter_horn_blow_delay matches 100 run scoreboard players set @s manhunter_cooldown 400
execute if score @s manhunter_horn_blow_delay matches 100 run scoreboard players set @s manhunter_horn_blow_delay 0
# 100 ticks is 5 seconds





# Decrease cooldown if active
execute if score @s manhunter_cooldown matches 1.. run scoreboard players remove @s manhunter_cooldown 1

# when the trap is dropped, play a sound
execute if score @s[scores={manhunter_cooldown=399}] manhunter_cooldown matches 399 run playsound entity.camel.ambient player @s ~ ~ ~ 1 0.6 0.5
execute if score @s[scores={manhunter_cooldown=395}] manhunter_cooldown matches 395 run playsound entity.camel.death player @s ~ ~ ~ 1 1 1

# this code was stolen from the artificer formerly hunter
execute at @s if score @s[scores={manhunter_cooldown=399}] manhunter_cooldown matches 399 run effect give @p[team=runners] glowing 30 1 true
execute at @s if score @s[scores={manhunter_cooldown=399}] manhunter_cooldown matches 399 run effect give @p[team=runners] blindness 2 1 true
execute at @p[team=runners] if score @s[scores={manhunter_cooldown=399}] manhunter_cooldown matches 399 run particle elder_guardian ~ ~ ~ 0 0 0 1 1 force @a[team=runners]
execute at @p[team=runners] if score @s[scores={manhunter_cooldown=399}] manhunter_cooldown matches 399 run particle campfire_signal_smoke ~ ~ ~ 0.1 5 0.1 0 100 force @a

execute at @p[team=runners] if score @s[scores={manhunter_cooldown=398}] manhunter_cooldown matches 398 run playsound block.sculk_shrieker.shriek block @a ~ ~ ~ 1 0.5 0.9
execute at @p[team=runners] if score @s[scores={manhunter_cooldown=397}] manhunter_cooldown matches 397 run playsound block.sculk_shrieker.shriek block @a ~ ~ ~ 1 0.6 0.9
execute at @p[team=runners] if score @s[scores={manhunter_cooldown=396}] manhunter_cooldown matches 396 run playsound block.sculk_shrieker.shriek block @a ~ ~ ~ 1 0.7 0.9
execute at @p[team=runners] if score @s[scores={manhunter_cooldown=395}] manhunter_cooldown matches 395 run playsound block.sculk_shrieker.shriek block @a ~ ~ ~ 1 0.8 0.9

# Replace trap item with gray dye to show cooldown

execute if score @s[scores={manhunter_cooldown=399}] manhunter_cooldown matches 399 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 20
execute if score @s[scores={manhunter_cooldown=380}] manhunter_cooldown matches 380 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 19
execute if score @s[scores={manhunter_cooldown=360}] manhunter_cooldown matches 360 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 18
execute if score @s[scores={manhunter_cooldown=340}] manhunter_cooldown matches 340 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 17
execute if score @s[scores={manhunter_cooldown=320}] manhunter_cooldown matches 320 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 16
execute if score @s[scores={manhunter_cooldown=300}] manhunter_cooldown matches 300 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 15
execute if score @s[scores={manhunter_cooldown=280}] manhunter_cooldown matches 280 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 14
execute if score @s[scores={manhunter_cooldown=260}] manhunter_cooldown matches 260 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 13
execute if score @s[scores={manhunter_cooldown=240}] manhunter_cooldown matches 240 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 12
execute if score @s[scores={manhunter_cooldown=220}] manhunter_cooldown matches 220 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 11
execute if score @s[scores={manhunter_cooldown=200}] manhunter_cooldown matches 200 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 10
execute if score @s[scores={manhunter_cooldown=180}] manhunter_cooldown matches 180 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 9
execute if score @s[scores={manhunter_cooldown=160}] manhunter_cooldown matches 160 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 8
execute if score @s[scores={manhunter_cooldown=140}] manhunter_cooldown matches 140 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 7
execute if score @s[scores={manhunter_cooldown=120}] manhunter_cooldown matches 120 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 6
execute if score @s[scores={manhunter_cooldown=100}] manhunter_cooldown matches 100 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 5
execute if score @s[scores={manhunter_cooldown=80}] manhunter_cooldown matches 80 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 4
execute if score @s[scores={manhunter_cooldown=60}] manhunter_cooldown matches 60 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 3
execute if score @s[scores={manhunter_cooldown=40}] manhunter_cooldown matches 40 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 2
execute if score @s[scores={manhunter_cooldown=20}] manhunter_cooldown matches 20 run item replace entity @s hotbar.1 with gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]] 1

# Remove gray dye when cooldown is done
execute if score @s manhunter_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"horn cooldown","italic":false}]]


