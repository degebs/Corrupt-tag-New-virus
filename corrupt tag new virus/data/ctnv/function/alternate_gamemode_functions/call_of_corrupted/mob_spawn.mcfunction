# 0-99: original spawn pool (unchanged internal logic)
execute if score rng spawn matches 30..75 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:850f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:1.5f}]}

execute if score rng spawn matches 0..5 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:amethyst",pattern:"minecraft:bolt"}}}},attributes:[{id:max_health,base:2f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 6..10 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:copper",pattern:"minecraft:coast"}}}},attributes:[{id:max_health,base:2f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 11..15 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:diamond",pattern:"minecraft:dune"}}}},attributes:[{id:max_health,base:2f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 16..20 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:emerald",pattern:"minecraft:eye"}}}},attributes:[{id:max_health,base:2f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 21..25 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:gold",pattern:"minecraft:host"}}}},attributes:[{id:max_health,base:2f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}
execute if score rng spawn matches 26..30 run summon zombie ~ ~ ~ {Team:corrupted,equipment:{head:{id:netherite_helmet,components:{"minecraft:trim":{material:"minecraft:iron",pattern:"minecraft:tide"}}}},attributes:[{id:max_health,base:2f},{id:spawn_reinforcements,base:1f},{id:block_interaction_range,base:64f}]}

execute if score rng spawn matches 76..89 run summon skeleton ~ ~ ~ {Health:2,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:850f},{id:step_height,base:3.5f},{id:attack_damage,base:0f},{id:max_health,base:1.5f}]}

execute if score rng spawn matches 90..99 run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:750f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 90..99 run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:450f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 90..99 run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 90..99 run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 90..99 run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 90..99 run summon zombie ~ ~ ~ {Health:1,Team:corrupted,equipment:{head:{id:amethyst_block},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:movement_speed,base:0.4f},{id:max_health,base:1.5f}]}

#=======================================================================================================================================================
# 101-200: corrupted ability pool (triggered passively via rng, no totem needed here)

# rat (silverfish swarm) [101..113]
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute if score rng spawn matches 101..113 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}

# zombie wave [114..120]
execute if score rng spawn matches 114..120 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 114..120 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 114..120 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 114..120 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:1.5f}]}


# zombie elite [121..122]
execute if score rng spawn matches 121..200 run summon zombie ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:blaze_rod},head:{id:netherite_helmet,components:{trim:{pattern:bolt,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:1.5f}]}
execute if score rng spawn matches 121..200 run summon zombie ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:blaze_rod},head:{id:netherite_helmet,components:{trim:{pattern:bolt,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:1.5f}]}



# make the rng less predictable and wrap back within 0-200

scoreboard players remove rng spawn 21
execute if score rng spawn matches 200.. run scoreboard players set rng spawn 0
execute if score rng spawn matches ..0 run scoreboard players set rng spawn 1
#=======================================================================================================================================================