execute if score rng spawn matches 30..75 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:850f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:3f}]}
#75% zombie
# loot zombies (obsolete)
# they are normal now
execute if score rng spawn matches 0..5 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:amethyst",pattern:"minecraft:bolt"}}}},attributes:[{id:max_health,base:4f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 6..10 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:copper",pattern:"minecraft:coast"}}}},attributes:[{id:max_health,base:4f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 11..15 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:diamond",pattern:"minecraft:dune"}}}},attributes:[{id:max_health,base:4f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 16..20 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:emerald",pattern:"minecraft:eye"}}}},attributes:[{id:max_health,base:4f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 21..25 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:gold",pattern:"minecraft:host"}}}},attributes:[{id:max_health,base:4f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 26..30 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:iron",pattern:"minecraft:tide"}}}},attributes:[{id:max_health,base:4f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
# gamerule mob_drops true
# i have to turn mob loot on for this game mode
# for the rework mobs will not be dropping loot


#25% skeleton
execute if score rng spawn matches 76.. run summon skeleton ~ ~ ~ {Health:2,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:850f},{id:step_height,base:3.5f},{id:attack_damage,base:0f},{id:max_health,base:3f}]}

# obsenely rare change to spawn a huge wave of zombies
execute if score rng spawn matches 90.. run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:750f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:3f}]}
execute if score rng spawn matches 90.. run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:450f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:3f}]}
execute if score rng spawn matches 90.. run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:3f}]}
execute if score rng spawn matches 90.. run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:3f}]}
execute if score rng spawn matches 90.. run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:3f}]}
execute if score rng spawn matches 90.. run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:3f}]}


# make the rng less predictablez
scoreboard players remove rng spawn 21

# for some reason there is a glitch where mobs do not spawn, but this only happens during the first few nautral spawns. honestly i have no idea why this is happening