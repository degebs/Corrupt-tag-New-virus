# 1 check if the corrupted as a "spawn_eggs_purchesed" score of 1 or higher. if they do then we give a random egg then subtract 
# until it is 0
# cant forget about the rng
# the rng has 16 entres 

# slightly ungredictable rng
scoreboard players add rng spawn_eggs_purchesed 1
execute if score tick time matches 3 run scoreboard players add rng spawn_eggs_purchesed 1
execute if score 360 time matches 3 run scoreboard players add rng spawn_eggs_purchesed 1
execute if score seconds time matches 10 run scoreboard players add rng spawn_eggs_purchesed 1
# make it so that rare OP eggs cannot be obtained early on
execute if score wave call_of_corrupted matches ..2 if score rng spawn_eggs_purchesed matches 5.. run scoreboard players set rng spawn_eggs_purchesed 2
execute if score wave call_of_corrupted matches ..3 if score rng spawn_eggs_purchesed matches 6.. run scoreboard players set rng spawn_eggs_purchesed 1
execute if score wave call_of_corrupted matches ..4 if score rng spawn_eggs_purchesed matches 8.. run scoreboard players set rng spawn_eggs_purchesed 1
execute if score wave call_of_corrupted matches ..5 if score rng spawn_eggs_purchesed matches 10.. run scoreboard players set rng spawn_eggs_purchesed 1
execute if score wave call_of_corrupted matches ..6 if score rng spawn_eggs_purchesed matches 11.. run scoreboard players set rng spawn_eggs_purchesed 1
execute if score wave call_of_corrupted matches ..7 if score rng spawn_eggs_purchesed matches 12.. run scoreboard players set rng spawn_eggs_purchesed 1

# dont go over
execute if score rng spawn_eggs_purchesed matches 17.. run scoreboard players set rng spawn_eggs_purchesed 1
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# give the spawn eggs based on rng

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 1 run give @a[team=corrupted] wandering_trader_spawn_egg[custom_name=[{"text":"Summon Wall","italic":false,"color":"gold"}],lore=[[{"text":"Drop to summon a mysterious wall.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 2 run give @a[team=corrupted] zombie_spawn_egg[custom_name=[{"text":"Zombie Horde","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a horde of zombies.","italic":false}]]]
execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 3 run give @a[team=corrupted] skeleton_spawn_egg[custom_name=[{"text":"Skeleton Horde","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a horde of skeletons.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 4 run give @a[team=corrupted] stray_spawn_egg[custom_name=[{"text":"Stray Horde","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a horde of strays.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 5 run give @a[team=corrupted] silverfish_spawn_egg[custom_name=[{"text":"Rat Plague","italic":false,"color":"red"}],lore=[[{"text":"Drop to summon a rat plague.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 6 run give @a[team=corrupted] creeper_spawn_egg[custom_name=[{"text":"Creeper Horde","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a bunch of creepers.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 7 run give @a[team=corrupted] bogged_spawn_egg[custom_name=[{"text":"Mini Creepers","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a bunch of mini creepers.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 8 run give @a[team=corrupted] husk_spawn_egg[custom_name=[{"text":"Zombie Elites","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a bunch of powerful zombies.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 9 run give @a[team=corrupted] wither_skeleton_spawn_egg[custom_name=[{"text":"Skeleton Elites","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of powerful skeletons.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 10 run give @a[team=corrupted] ghast_spawn_egg[custom_name=[{"text":"Stray Elites","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of powerful strays.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 11 run give @a[team=corrupted] phantom_spawn_egg[custom_name=[{"text":"Phantom Menace","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a phantom.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 12 run give @a[team=corrupted] allay_spawn_egg[custom_name=[{"text":"Phantom Elite","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a phantom elite.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 13 run give @a[team=corrupted] guardian_spawn_egg[custom_name=[{"text":"Phantom Laser","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a phantom laser.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 14 run give @a[team=corrupted] pillager_spawn_egg[custom_name=[{"text":"Pillager Wave","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of pillagers.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 15 run give @a[team=corrupted] vindicator_spawn_egg[custom_name=[{"text":"Vindicator Wave","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of vindicators.","italic":false}]]]

execute if score @s spawn_eggs_purchesed matches 1.. if score rng spawn_eggs_purchesed matches 16 run give @a[team=corrupted] ravager_spawn_egg[custom_name=[{"text":"Pillager Raid","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a full pillager raid.","italic":false}]]]



#subtract at the end
execute if score @s spawn_eggs_purchesed matches 1.. run scoreboard players remove @s spawn_eggs_purchesed 1

#====================================================================================================================================================





# do the function of spawning the mobs

#rat++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_rat matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_rat"]}

execute at @e[tag=TOTEM_rat] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_rat] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
execute at @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 5 run summon silverfish ~ ~ ~ {Health:1,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:1f}]}
# kill totem
execute as @e[tag=TOTEM_rat] if score @a[team=corrupted,limit=1] WAVE_rat matches 4 run kill @s

#zombie++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_zombie matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_zombie"]}

execute at @e[tag=TOTEM_zombie] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_zombie] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_zombie] if score @a[team=corrupted,limit=1] WAVE_zombie matches 5 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_zombie] if score @a[team=corrupted,limit=1] WAVE_zombie matches 5 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_zombie] if score @a[team=corrupted,limit=1] WAVE_zombie matches 5 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:3f}]} 
execute at @e[tag=TOTEM_zombie] if score @a[team=corrupted,limit=1] WAVE_zombie matches 5 run summon zombie ~ ~ ~ {Health:2,Team:corrupted,equipment:{head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0.5f},{id:max_health,base:3f}]} 
# kill totem
execute as @e[tag=TOTEM_zombie] if score @a[team=corrupted,limit=1] WAVE_zombie matches 4 run kill @s

#skeleton++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_skeleton matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_skeleton"]}

execute at @e[tag=TOTEM_skeleton] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_skeleton] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_skeleton] if score @a[team=corrupted,limit=1] WAVE_skeleton matches 5 run summon skeleton ~ ~ ~ {Health:2,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_skeleton] if score @a[team=corrupted,limit=1] WAVE_skeleton matches 5 run summon skeleton ~ ~ ~ {Health:2,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_skeleton] if score @a[team=corrupted,limit=1] WAVE_skeleton matches 5 run summon skeleton ~ ~ ~ {Health:2,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet},chest:{id:netherite_chestplate},legs:{id:netherite_leggings},feet:{id:netherite_boots}},attributes:[{id:follow_range,base:350f},{id:step_height,base:3.5f},{id:attack_damage,base:0f},{id:max_health,base:3f}]}
# kill totem
execute as @e[tag=TOTEM_skeleton] if score @a[team=corrupted,limit=1] WAVE_skeleton matches 4 run kill @s

#zombie_elite++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_zombie_elite matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_zombie_elite"]}

execute at @e[tag=TOTEM_zombie_elite] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_zombie_elite] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_zombie_elite] if score @a[team=corrupted,limit=1] WAVE_zombie_elite matches 5 run summon zombie ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:blaze_rod},head:{id:netherite_helmet,components:{trim:{pattern:bolt,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_zombie_elite] if score @a[team=corrupted,limit=1] WAVE_zombie_elite matches 5 run summon zombie ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:blaze_rod},head:{id:netherite_helmet,components:{trim:{pattern:bolt,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}
# kill totem
execute as @e[tag=TOTEM_zombie_elite] if score @a[team=corrupted,limit=1] WAVE_zombie_elite matches 4 run kill @s

#skeleton_elite++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_skeleton_elite matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_skeleton_elite"]}

execute at @e[tag=TOTEM_skeleton_elite] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_skeleton_elite] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_skeleton_elite] if score @a[team=corrupted,limit=1] WAVE_skeleton_elite matches 5 run summon skeleton ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet,components:{trim:{pattern:bolt,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_skeleton_elite] if score @a[team=corrupted,limit=1] WAVE_skeleton_elite matches 5 run summon skeleton ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet,components:{trim:{pattern:bolt,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}

# kill totem
execute as @e[tag=TOTEM_skeleton_elite] if score @a[team=corrupted,limit=1] WAVE_skeleton_elite matches 4 run kill @s

#phantom++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_phantom matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_phantom"]}

execute at @e[tag=TOTEM_phantom] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_phantom] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_phantom] if score @a[team=corrupted,limit=1] WAVE_phantom matches 5 run summon phantom ~ ~ ~ {Health:2,PersistenceRequired:1b,Team:corrupted,active_effects:[{id:fire_resistance,duration:9999,amplifier:1,show_particles:0b}],attributes:[{id:max_health,base:2f}]}
# kill totem
execute as @e[tag=TOTEM_phantom] if score @a[team=corrupted,limit=1] WAVE_phantom matches 4 run kill @s

#phantom_elite++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_phantom_elite matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_phantom_elite"]}

execute at @e[tag=TOTEM_phantom_elite] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_phantom_elite] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_phantom_elite] if score @a[team=corrupted,limit=1] WAVE_phantom_elite matches 5 run summon phantom ~ ~ ~ {Health:2,Team:corrupted,active_effects:[{id:fire_resistance,duration:9999,amplifier:1,show_particles:0b}],attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}],Passengers:[{id:skeleton,Health:2,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet}},attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}]}]}
# kill totem
execute as @e[tag=TOTEM_phantom_elite] if score @a[team=corrupted,limit=1] WAVE_phantom_elite matches 4 run kill @s

#phantom_laser++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_phantom_laser matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_phantom_laser"]}

execute at @e[tag=TOTEM_phantom_laser] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_phantom_laser] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_phantom_laser] if score @a[team=corrupted,limit=1] WAVE_phantom_laser matches 5 run summon phantom ~ ~ ~ {Health:2,Team:corrupted,active_effects:[{id:fire_resistance,duration:9999,amplifier:1,show_particles:0b}],attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}],Passengers:[{id:guardian,Health:2,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}]}]}
# kill totem
execute as @e[tag=TOTEM_phantom_laser] if score @a[team=corrupted,limit=1] WAVE_phantom_laser matches 4 run kill @s

#stray++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_stray matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_stray"]}

execute at @e[tag=TOTEM_stray] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_stray] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_stray] if score @a[team=corrupted,limit=1] WAVE_stray matches 5 run summon stray ~ ~ ~ {Health:2,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet}},attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}]}
execute at @e[tag=TOTEM_stray] if score @a[team=corrupted,limit=1] WAVE_stray matches 5 run summon stray ~ ~ ~ {Health:2,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet}},attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}]}
execute at @e[tag=TOTEM_stray] if score @a[team=corrupted,limit=1] WAVE_stray matches 5 run summon stray ~ ~ ~ {Health:2,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet}},attributes:[{id:follow_range,base:300f},{id:max_health,base:2f}]}


# kill totem
execute as @e[tag=TOTEM_stray] if score @a[team=corrupted,limit=1] WAVE_stray matches 4 run kill @s

#stray_elite++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_stray_elite matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_stray_elite"]}

execute at @e[tag=TOTEM_stray_elite] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_stray_elite] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 5 run execute at @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 5 run summon stray ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet,components:{trim:{pattern:vex,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 5 run execute at @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 5 run summon stray ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet,components:{trim:{pattern:vex,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}
execute at @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 5 run execute at @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 5 run summon stray ~ ~ ~ {Health:3,Team:corrupted,equipment:{mainhand:{id:bow},head:{id:netherite_helmet,components:{trim:{pattern:vex,material:amethyst}}},chest:{id:netherite_chestplate,components:{trim:{pattern:bolt,material:amethyst}}},legs:{id:netherite_leggings,components:{trim:{pattern:bolt,material:amethyst}}},feet:{id:netherite_boots,components:{trim:{pattern:bolt,material:amethyst}}}},attributes:[{id:follow_range,base:300f},{id:max_health,base:3f}]}

# kill totem
execute as @e[tag=TOTEM_stray_elite] if score @a[team=corrupted,limit=1] WAVE_stray_elite matches 4 run kill @s

#creeper++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_creeper matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_creeper"]}

execute at @e[tag=TOTEM_creeper] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_creeper] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_creeper] if score @a[team=corrupted,limit=1] WAVE_creeper matches 5 run summon creeper ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:5f},{id:attack_damage,base:0.5f}]}
execute at @e[tag=TOTEM_creeper] if score @a[team=corrupted,limit=1] WAVE_creeper matches 5 run summon creeper ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:5f},{id:attack_damage,base:0.5f}]}

# kill totem
execute as @e[tag=TOTEM_creeper] if score @a[team=corrupted,limit=1] WAVE_creeper matches 4 run kill @s

#mini_creeper++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_mini_creeper matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_mini_creeper"]}

execute at @e[tag=TOTEM_mini_creeper] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_mini_creeper] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_mini_creeper] if score @a[team=corrupted,limit=1] WAVE_mini_creeper matches 5 run summon creeper ~ ~ ~ {Health:1,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:scale,base:0.4f},{id:max_health,base:5f},{id:attack_damage,base:0.5f}]}
execute at @e[tag=TOTEM_mini_creeper] if score @a[team=corrupted,limit=1] WAVE_mini_creeper matches 5 run summon creeper ~ ~ ~ {Health:1,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:scale,base:0.4f},{id:max_health,base:5f},{id:attack_damage,base:0.5f}]}
execute at @e[tag=TOTEM_mini_creeper] if score @a[team=corrupted,limit=1] WAVE_mini_creeper matches 5 run summon creeper ~ ~ ~ {Health:1,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:scale,base:0.4f},{id:max_health,base:5f},{id:attack_damage,base:0.5f}]}
execute at @e[tag=TOTEM_mini_creeper] if score @a[team=corrupted,limit=1] WAVE_mini_creeper matches 5 run summon creeper ~ ~ ~ {Health:1,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:scale,base:0.4f},{id:max_health,base:5f},{id:attack_damage,base:0.5f}]}

# kill totem
execute as @e[tag=TOTEM_mini_creeper] if score @a[team=corrupted,limit=1] WAVE_mini_creeper matches 4 run kill @s

#pillager++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_pillager matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_pillager"]}

execute at @e[tag=TOTEM_pillager] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_pillager] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_pillager] if score @a[team=corrupted,limit=1] WAVE_pillager matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pillager] if score @a[team=corrupted,limit=1] WAVE_pillager matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pillager] if score @a[team=corrupted,limit=1] WAVE_pillager matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}

# kill totem
execute as @e[tag=TOTEM_pillager] if score @a[team=corrupted,limit=1] WAVE_pillager matches 4 run kill @s

#vindicator++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_vindicator matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_vindicator"]}

execute at @e[tag=TOTEM_vindicator] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_vindicator] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_vindicator] if score @a[team=corrupted,limit=1] WAVE_vindicator matches 5 run summon vindicator ~ ~ ~ {Health:6,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:iron_axe}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_vindicator] if score @a[team=corrupted,limit=1] WAVE_vindicator matches 5 run summon vindicator ~ ~ ~ {Health:6,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:iron_axe}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}

# kill totem
execute as @e[tag=TOTEM_vindicator] if score @a[team=corrupted,limit=1] WAVE_vindicator matches 4 run kill @s

#pilager_raid++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_pilager_raid matches 99 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_pilager_raid"]}

execute at @e[tag=TOTEM_pilager_raid] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_pilager_raid] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon vindicator ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:iron_axe}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon vindicator ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:iron_axe}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon vindicator ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:iron_axe}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon pillager ~ ~ ~ {Health:5,PersistenceRequired:1b,Team:corrupted,equipment:{mainhand:{id:crossbow}},attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}
execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run execute at @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 5 run summon ravager ~ ~ ~ {Health:15,PersistenceRequired:1b,Team:corrupted,attributes:[{id:follow_range,base:300f},{id:max_health,base:5f}]}



# kill totem
execute as @e[tag=TOTEM_pilager_raid] if score @a[team=corrupted,limit=1] WAVE_pilager_raid matches 4 run kill @s

#imidiate_manefestation++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 99 run effect give @s slowness 5 5 true
#execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 99 run tellraw @a ["the ",{"text":"corrupted","color":"dark_purple"}," will manifest sooner than expected"]
#execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 5.. run scoreboard players set corrupt_manifestation call_of_corrupted 205

#summon_wall++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
execute as @a[team=corrupted] at @s unless entity @a[distance=..4,team=runners,scores={health=1..}] if score @s WAVE_summon_wall matches 6 run summon armor_stand ~ ~ ~ {Pose:{LeftLeg:[175f,0f,0f],RightLeg:[165f,0f,0f]},ShowArms:1b,Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:917504,Tags:["TOTEM_summon_wall"]}
# have an outline for the wall when the corrupted is holding the item
execute as @a[team=corrupted] at @s if data entity @s {SelectedItem:{id:"minecraft:wandering_trader_spawn_egg"}} run function ctnv:alternate_gamemode_functions/call_of_corrupted/wall_visualiser
execute at @e[tag=TOTEM_summon_wall] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute at @e[tag=TOTEM_summon_wall] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a

execute as @a[team=corrupted] at @s if score @s WAVE_summon_wall matches 5 run function ctnv:alternate_gamemode_functions/call_of_corrupted/wall_summoner

# kill totem
execute as @e[tag=TOTEM_summon_wall] if score @a[team=corrupted,limit=1] WAVE_summon_wall matches 4 run kill @s



# i now realise the superiority of using this new mehtod.
# this new method of using scoreboards to track the droping of a specific item
# it requires not cooldowns, no edge case prevention.
# it does not require constant control of the variables
# and that glitch that triggers the function immititly as it is given for 1 tick is not present here.
# i wish i had used this method the moment i started. but alas... technical debt
# set up the cooldown timers
execute as @a[team=corrupted] if score @s WAVE_rat matches 1 run scoreboard players set @s WAVE_rat 100
execute as @a[team=corrupted] if score @s WAVE_zombie matches 1 run scoreboard players set @s WAVE_zombie 100
execute as @a[team=corrupted] if score @s WAVE_skeleton matches 1 run scoreboard players set @s WAVE_skeleton 100
execute as @a[team=corrupted] if score @s WAVE_zombie_elite matches 1 run scoreboard players set @s WAVE_zombie_elite 100
execute as @a[team=corrupted] if score @s WAVE_skeleton_elite matches 1 run scoreboard players set @s WAVE_skeleton_elite 100
execute as @a[team=corrupted] if score @s WAVE_phantom matches 1 run scoreboard players set @s WAVE_phantom 100
execute as @a[team=corrupted] if score @s WAVE_phantom_elite matches 1 run scoreboard players set @s WAVE_phantom_elite 100
execute as @a[team=corrupted] if score @s WAVE_phantom_laser matches 1 run scoreboard players set @s WAVE_phantom_laser 100
execute as @a[team=corrupted] if score @s WAVE_stray matches 1 run scoreboard players set @s WAVE_stray 100
execute as @a[team=corrupted] if score @s WAVE_stray_elite matches 1 run scoreboard players set @s WAVE_stray_elite 100
execute as @a[team=corrupted] if score @s WAVE_creeper matches 1 run scoreboard players set @s WAVE_creeper 100
execute as @a[team=corrupted] if score @s WAVE_mini_creeper matches 1 run scoreboard players set @s WAVE_mini_creeper 100
execute as @a[team=corrupted] if score @s WAVE_pillager matches 1 run scoreboard players set @s WAVE_pillager 100
execute as @a[team=corrupted] if score @s WAVE_vindicator matches 1 run scoreboard players set @s WAVE_vindicator 100
execute as @a[team=corrupted] if score @s WAVE_pilager_raid matches 1 run scoreboard players set @s WAVE_pilager_raid 100
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 1 run scoreboard players set @s WAVE_imidiate_manefestation 100
execute as @a[team=corrupted] if score @s WAVE_summon_wall matches 1 run scoreboard players set @s WAVE_summon_wall 10

# make sure that this does not loop forever

execute as @a[team=corrupted] if score @s WAVE_rat matches 2 run scoreboard players reset @s WAVE_rat 
execute as @a[team=corrupted] if score @s WAVE_zombie matches 2 run scoreboard players reset @s WAVE_zombie 
execute as @a[team=corrupted] if score @s WAVE_skeleton matches 2 run scoreboard players reset @s WAVE_skeleton 
execute as @a[team=corrupted] if score @s WAVE_zombie_elite matches 2 run scoreboard players reset @s WAVE_zombie_elite 
execute as @a[team=corrupted] if score @s WAVE_skeleton_elite matches 2 run scoreboard players reset @s WAVE_skeleton_elite 
execute as @a[team=corrupted] if score @s WAVE_phantom matches 2 run scoreboard players reset @s WAVE_phantom 
execute as @a[team=corrupted] if score @s WAVE_phantom_elite matches 2 run scoreboard players reset @s WAVE_phantom_elite 
execute as @a[team=corrupted] if score @s WAVE_phantom_laser matches 2 run scoreboard players reset @s WAVE_phantom_laser 
execute as @a[team=corrupted] if score @s WAVE_stray matches 2 run scoreboard players reset @s WAVE_stray 
execute as @a[team=corrupted] if score @s WAVE_stray_elite matches 2 run scoreboard players reset @s WAVE_stray_elite 
execute as @a[team=corrupted] if score @s WAVE_creeper matches 2 run scoreboard players reset @s WAVE_creeper 
execute as @a[team=corrupted] if score @s WAVE_mini_creeper matches 2 run scoreboard players reset @s WAVE_mini_creeper 
execute as @a[team=corrupted] if score @s WAVE_pillager matches 2 run scoreboard players reset @s WAVE_pillager 
execute as @a[team=corrupted] if score @s WAVE_vindicator matches 2 run scoreboard players reset @s WAVE_vindicator 
execute as @a[team=corrupted] if score @s WAVE_pilager_raid matches 2 run scoreboard players reset @s WAVE_pilager_raid 
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 2 run scoreboard players reset @s WAVE_imidiate_manefestation 
execute as @a[team=corrupted] if score @s WAVE_summon_wall matches 2 run scoreboard players reset @s WAVE_summon_wall 

# when the corrupted have the timer responsible for spawning that particular wave count down

execute as @a[team=corrupted] if score @s WAVE_rat matches 1.. run scoreboard players remove @s WAVE_rat 1
execute as @a[team=corrupted] if score @s WAVE_zombie matches 1.. run scoreboard players remove @s WAVE_zombie 1
execute as @a[team=corrupted] if score @s WAVE_skeleton matches 1.. run scoreboard players remove @s WAVE_skeleton 1
execute as @a[team=corrupted] if score @s WAVE_zombie_elite matches 1.. run scoreboard players remove @s WAVE_zombie_elite 1
execute as @a[team=corrupted] if score @s WAVE_skeleton_elite matches 1.. run scoreboard players remove @s WAVE_skeleton_elite 1
execute as @a[team=corrupted] if score @s WAVE_phantom matches 1.. run scoreboard players remove @s WAVE_phantom 1
execute as @a[team=corrupted] if score @s WAVE_phantom_elite matches 1.. run scoreboard players remove @s WAVE_phantom_elite 1
execute as @a[team=corrupted] if score @s WAVE_phantom_laser matches 1.. run scoreboard players remove @s WAVE_phantom_laser 1
execute as @a[team=corrupted] if score @s WAVE_stray matches 1.. run scoreboard players remove @s WAVE_stray 1
execute as @a[team=corrupted] if score @s WAVE_stray_elite matches 1.. run scoreboard players remove @s WAVE_stray_elite 1
execute as @a[team=corrupted] if score @s WAVE_creeper matches 1.. run scoreboard players remove @s WAVE_creeper 1
execute as @a[team=corrupted] if score @s WAVE_mini_creeper matches 1.. run scoreboard players remove @s WAVE_mini_creeper 1
execute as @a[team=corrupted] if score @s WAVE_pillager matches 1.. run scoreboard players remove @s WAVE_pillager 1
execute as @a[team=corrupted] if score @s WAVE_vindicator matches 1.. run scoreboard players remove @s WAVE_vindicator 1
execute as @a[team=corrupted] if score @s WAVE_pilager_raid matches 1.. run scoreboard players remove @s WAVE_pilager_raid 1
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 1.. run scoreboard players remove @s WAVE_imidiate_manefestation 1
execute as @a[team=corrupted] if score @s WAVE_summon_wall matches 1.. run scoreboard players remove @s WAVE_summon_wall 1

# kill the spawn egg item
execute as @a[team=corrupted] if score @s WAVE_rat matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:silverfish_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_zombie matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:zombie_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_skeleton matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:skeleton_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_zombie_elite matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:husk_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_skeleton_elite matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:wither_skeleton_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_phantom matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:phantom_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_phantom_elite matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:allay_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_phantom_laser matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:guardian_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_stray matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:stray_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_stray_elite matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ghast_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_creeper matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:creeper_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_mini_creeper matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:bogged_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_pillager matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:pillager_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_vindicator matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:vindicator_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_pilager_raid matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:ravager_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:warden_spawn_egg"}}]
execute as @a[team=corrupted] if score @s WAVE_summon_wall matches 1.. run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:wandering_trader_spawn_egg"}}]
