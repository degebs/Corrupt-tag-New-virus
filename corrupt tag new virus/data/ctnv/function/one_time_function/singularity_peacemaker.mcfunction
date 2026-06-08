
# set all runners variables to -1
scoreboard players set @a[team=runners] bulk -1
scoreboard players set @a[team=runners] bulk_totem 3
scoreboard players set @a[team=runners] medic_heal -1
scoreboard players set @a[team=runners] medic_nearest_runner_health -1
scoreboard players set @a[team=runners] medic_nearest_runner_distance -1
scoreboard players set @a[team=runners] acher_arrow_count 0
scoreboard players set @a[team=runners] bow_shot 0
scoreboard players set @a[team=runners] assassin_charge -1
scoreboard players set @a[team=runners] assassin_hide -1
scoreboard players set @a[team=runners] trident_throw -1
scoreboard players set @a[team=runners] stunman_trap -1
scoreboard players set @a[team=runners] fishing_net_trap -1
kill @e[tag=fish_attack]
scoreboard players set @a[team=runners] miner_lantern -1
scoreboard players set @a[team=runners] merchant_coin 0
scoreboard players set @a[team=runners] merchant_rng 0
scoreboard players set @a[team=runners] merchant_arrow_count 0
scoreboard players set @a[team=runners] cross_bow_shot -1
scoreboard players set @a[team=runners] merchant_luck -1
scoreboard players set @a[team=runners] farm_lifetime -1
scoreboard players set @a[team=runners] farm_cooldown -1
scoreboard players set @a[team=runners] animal_farm_attack_cooldown -1
scoreboard players set @a[team=runners] player_swap_cooldown -1
scoreboard players set @a[team=runners] decoy_cooldown -1
scoreboard players set @a[team=runners] spaceman_teleport_cooldown -1
kill @e[tag=rewind_shard]
scoreboard players set @a[team=runners] RUM_cooldown -1
scoreboard players set @a[team=runners] northless_compass_cooldown -1
clear @a totem_of_undying
clear @a[team=runners] shield
# fill there hotbar with purple, majenta, or pink stained glass_pane to show they are affected by the peacemaker
# do it in a random chaortic order for fun
execute if score tick time matches 1 run item replace entity @a[team=runners] hotbar.0 with pink_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 2 run item replace entity @a[team=runners] hotbar.1 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 3 run item replace entity @a[team=runners] hotbar.2 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 4 run item replace entity @a[team=runners] hotbar.3 with pink_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 5 run item replace entity @a[team=runners] hotbar.4 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 6 run item replace entity @a[team=runners] hotbar.5 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 7 run item replace entity @a[team=runners] hotbar.6 with pink_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 8 run item replace entity @a[team=runners] hotbar.7 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 9 run item replace entity @a[team=runners] hotbar.8 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 10 run item replace entity @a[team=runners] hotbar.0 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 11 run item replace entity @a[team=runners] hotbar.1 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 12 run item replace entity @a[team=runners] hotbar.2 with pink_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 13 run item replace entity @a[team=runners] hotbar.3 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 14 run item replace entity @a[team=runners] hotbar.4 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 15 run item replace entity @a[team=runners] hotbar.5 with pink_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 16 run item replace entity @a[team=runners] hotbar.6 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 17 run item replace entity @a[team=runners] hotbar.7 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 18 run item replace entity @a[team=runners] hotbar.8 with magenta_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 19 run item replace entity @a[team=runners] hotbar.0 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]
execute if score tick time matches 20 run item replace entity @a[team=runners] hotbar.1 with purple_stained_glass_pane[custom_name=[{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡","italic":false,"color":"#e100ff","obfuscated":true}]]

# kill the glass_pane if dropped
execute if score tick time matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:pink_stained_glass_pane"}}]
execute if score tick time matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:magenta_stained_glass_pane"}}]
execute if score tick time matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:purple_stained_glass_pane"}}]


# some particle and sound effects to show the peacemaker is active
execute if score tick time matches 5 at @a[team=runners] run playsound block.respawn_anchor.deplete block @a ~ ~ ~ 1 1
execute if score tick time matches 5 at @a[team=runners] run particle angry_villager ~ ~ ~ 1 1 1 1 10 force @a
execute at @a[team=runners] run particle crit ~ ~ ~ 1 1 1 0.1 5 force @a

#============================================================================================================================================================================
# when the effect is done (after 10 seconds) of a 30 second cooldown, remove the glass_pane and reset the cooldown

# we are NOT saving what the cooldown was before
execute if score @s singularity_t2_cooldown matches ..401 run clear @a[team=runners] pink_stained_glass_pane
execute if score @s singularity_t2_cooldown matches ..401 run clear @a[team=runners] purple_stained_glass_pane
execute if score @s singularity_t2_cooldown matches ..401 run clear @a[team=runners] magenta_stained_glass_pane


execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] bulk 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] bulk_totem 1
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] medic_heal 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] medic_nearest_runner_health 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] medic_nearest_runner_distance 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] acher_arrow_count 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] bow_shot 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] assassin_charge 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] assassin_hide 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] trident_throw 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] stunman_trap 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] fishing_net_trap 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] miner_lantern 100
# set these 2 to 0 because the merchant cannot have high coin if this function runs (setting the rng to 50 will almost garuntee a bad result from the coin) >:)
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] merchant_coin 0
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] merchant_rng 50
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] merchant_arrow_count 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] cross_bow_shot 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] merchant_luck 0
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] farm_lifetime 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] farm_cooldown 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] animal_farm_attack_cooldown 100
# gotta make this one 1000 because its OP as shit
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] player_swap_cooldown 1000
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] decoy_cooldown 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] spaceman_teleport_cooldown 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] RUM_cooldown 100
execute if score @s singularity_t2_cooldown matches ..401 run scoreboard players set @a[team=runners] northless_compass_cooldown 100