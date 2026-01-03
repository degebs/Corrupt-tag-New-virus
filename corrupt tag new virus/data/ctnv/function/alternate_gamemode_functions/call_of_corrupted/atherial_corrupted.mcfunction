# make the atherial corrupted tiny and invisable
attribute @s scale base set 0.2
attribute @s entity_interaction_range base set 0
effect give @s invisibility 1 1 true
effect give @s jump_boost 1 1 true

attribute @s movement_speed base reset
attribute @s jump_strength base reset


#===========================================================================================================================
# atherial corruption hud

title @a[team=corrupted] actionbar [{"text":"wave: ","color":"dark_purple"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},"                                                               corrupted: ",{"score":{"objective":"call_of_corrupted","name":"mobs"}}]

scoreboard players reset mobs call_of_corrupted 
execute as @e[team=corrupted,type=!bat] run scoreboard players add mobs call_of_corrupted 1


#==========================================================================================================================================================================
# the atherial corrupted is allowed th change his corrupted class
execute as @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/atherial_class_selection
# to prevent bugs the dealy will be force enables a few ticks before the switch
execute if score corrupt_manifestation call_of_corrupted matches ..20 run scoreboard players set class_selection_delay call_of_corrupted 25
#==========================================================================================================================================================================
# an attempt to make the atherial corrupteds waling not produse any noise or particles
# for some damn reason /date modify does NOT work on players. and the worst part is that this was done intentionally!!! WTF
# on 1.21.5 they broke it for "security reasons"
effect give @s slow_falling 2 25 true

# there is not really a way to do this correctly
#==========================================================================================================================================================================
# to make sure that the atherial corrupted CANNOT spawn a wave of mobs inside the runners. copy the apparitions debuff but make it extreme
# make the corrupted one slow when closer to runners
# this code is anoying and is disabled for now
# its back. i need it now because the teleport away from runners code was never good
execute at @s if entity @a[distance=..2,team=runners] run effect give @s slowness 2 4 true
execute at @s if entity @a[distance=2..4,team=runners] run effect give @s slowness 2 3 true
execute at @s if entity @a[distance=4..8,team=runners] run effect give @s slowness 2 1 true
execute at @s unless entity @a[distance=..8,team=runners] run effect clear @s slowness

execute at @s if entity @a[distance=..6,team=runners] run effect clear @s jump_boost
# it the atherial corrupted is too close to the runners they will be teleported to a bat
#execute if score corrupt_manifestation call_of_corrupted matches 600.. at @s if entity @a[distance=..4,team=runners,scores={health=1..}] run tp @e[type=bat] ~ ~ ~
#execute if score corrupt_manifestation call_of_corrupted matches 600.. at @s if entity @a[distance=..4,team=runners,scores={health=1..}] run tellraw @s [{"text":"you cannot get close yet","color":"dark_red"}]
#execute if score corrupt_manifestation call_of_corrupted matches 600.. at @s if entity @a[distance=..4,team=runners,scores={health=1..}] run tp @s @e[type=bat,limit=1]
# turns out this sucks
# a better idea is to make it so that the aterial cannot drop mob eggs when close to the runners

#=====================================================================================================================================================
# set up the corruption stun
# normaly i would just steal the stun from another game mode but that did not work.
# thankfully we have the exact time that the corrupted will physically manifest



#==========================================================================================================================
#reset corrupted health

# the max health of the corrupted shall be calculated as such
# 1. take the max health of the runners
# 2. add the dificulty variable to it (0, 1 ,or 2)
# 3. multiply by 2
# 4. add the current wave count number to the max health

# make sure it does not blow up into infinity
#scoreboard players set @a[team=corrupted] health 0

# step 1
scoreboard players operation @a[team=corrupted] health = setting ST____max_health
# step 2
scoreboard players operation @a[team=corrupted] health += setting ST____COC_difuculty

# step 3
scoreboard players set multiplyer call_of_corrupted 2
scoreboard players operation @a[team=corrupted] health *= multiplyer call_of_corrupted

#step 4
scoreboard players operation @a[team=corrupted] health += wave call_of_corrupted

# extra step.
# afer the corrupted one dies. the death stun needs to be reset
scoreboard players set death_stun corruption_stun 6

#==========================================================================================================================
# the atherial corrupteds wave spawning abilitys

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
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 99 run effect give @s slowness 5 5 true
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 99 run tellraw @a ["the ",{"text":"corrupted","color":"dark_purple"}," will manifest sooner than expected"]
execute as @a[team=corrupted] if score @s WAVE_imidiate_manefestation matches 5.. run scoreboard players set corrupt_manifestation call_of_corrupted 205

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

#==========================================================================================================================
# give the atherial corrupted the spawn eggs.
# when to do it?
# simple

# 1. 30 second timer
# 2. subtract dificulty variable (0,1,2)
# 3. subrtract wave count
# 4. divide by 2
# 5. if the same rng value used to summon mobs natrually rolls just right the atherial corrupted will get a specific wave spawn egg
# - note that there is a high change that the corrupted will get nothing if the rng is bad. this is intentional

# 1
execute if score wave_egg call_of_corrupted matches 0 run scoreboard players set wave_egg_trigger call_of_corrupted 1
execute if score wave_egg_trigger call_of_corrupted matches 1 run scoreboard players set wave_egg call_of_corrupted 600
# 2
execute if score wave_egg_trigger call_of_corrupted matches 1 run scoreboard players operation wave_egg call_of_corrupted -= wave call_of_corrupted
# 3
execute if score wave_egg_trigger call_of_corrupted matches 1 run scoreboard players operation wave_egg call_of_corrupted -= setting ST____COC_difuculty
# 4 
execute if score wave_egg_trigger call_of_corrupted matches 1 run scoreboard players operation wave_egg call_of_corrupted /= multiplyer call_of_corrupted

# 5
execute if score wave_egg call_of_corrupted matches 3 run function ctnv:one_time_function/atherial_egg_giver

# 6
# start counting down
scoreboard players set wave_egg_trigger call_of_corrupted 0
scoreboard players add wave_egg call_of_corrupted 0
execute if score wave_egg_trigger call_of_corrupted matches 0 if score wave_egg call_of_corrupted matches 1.. run scoreboard players remove wave_egg call_of_corrupted 1 


#==========================================================================================================================
# wanrings and particles for the atherial corrupted's physical manefestation

#60 second warning
execute if score corrupt_manifestation call_of_corrupted matches 600 run tellraw @a [{"text":"The corrupted champion will manifest in 60 seconds","color":"light_purple"}]

# 30 second warning
execute if score corrupt_manifestation call_of_corrupted matches 300 run tellraw @a [{"text":"The corrupted champion will manifest in 30 seconds","color":"light_purple"}]

# 10 second particle burst
execute if score corrupt_manifestation call_of_corrupted matches 200 run tellraw @a [{"text":"The corrupted champion will manifest in 10 seconds","color":"light_purple"}]
execute if score corrupt_manifestation call_of_corrupted matches ..200 run effect give @a[team=corrupted] slowness 1 255 true
execute if score corrupt_manifestation call_of_corrupted matches ..200 at @a[team=corrupted] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute if score corrupt_manifestation call_of_corrupted matches ..200 at @a[team=corrupted] run particle explosion ~ ~1 ~ 0 0 0 1 1 force @a
execute if score corrupt_manifestation call_of_corrupted matches ..200 at @a[team=corrupted] run particle portal ~ ~1 ~ 5 5 5 1 10 force @a
execute if score corrupt_manifestation call_of_corrupted matches ..200 at @a[team=corrupted] run particle dust{color:[1,0,0.1],scale:2} ~ ~ ~ 0 5 0 100 50 force @a

execute if score corrupt_manifestation call_of_corrupted matches 200 at @a[team=corrupted] run title @s title [{"text":": 10 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 200 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.5
execute if score corrupt_manifestation call_of_corrupted matches 180 at @a[team=corrupted] run title @s title [{"text":": 9 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 180 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.45
execute if score corrupt_manifestation call_of_corrupted matches 160 at @a[team=corrupted] run title @s title [{"text":": 8 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 160 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.4
execute if score corrupt_manifestation call_of_corrupted matches 140 at @a[team=corrupted] run title @s title [{"text":": 7 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 140 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.35
execute if score corrupt_manifestation call_of_corrupted matches 120 at @a[team=corrupted] run title @s title [{"text":": 6 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 120 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.3
execute if score corrupt_manifestation call_of_corrupted matches 100 at @a[team=corrupted] run title @s title [{"text":": 5 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 100 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.25
execute if score corrupt_manifestation call_of_corrupted matches 80 at @a[team=corrupted] run title @s title [{"text":": 4 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 80 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.2
execute if score corrupt_manifestation call_of_corrupted matches 60 at @a[team=corrupted] run title @s title [{"text":": 3 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 60 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.15
execute if score corrupt_manifestation call_of_corrupted matches 40 at @a[team=corrupted] run title @s title [{"text":": 2 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 40 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.1
execute if score corrupt_manifestation call_of_corrupted matches 20 at @a[team=corrupted] run title @s title [{"text":": 1 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 20 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1.05
execute if score corrupt_manifestation call_of_corrupted matches 0 at @a[team=corrupted] run title @s title [{"text":": 0 :","color":"aqua"}]
execute if score corrupt_manifestation call_of_corrupted matches 0 at @a[team=corrupted] run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1
# do an extra mob spawn so that the runners cannot jump the corrupted
execute if score corrupt_manifestation call_of_corrupted matches 20 at @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/mob_spawn
execute if score corrupt_manifestation call_of_corrupted matches 19 at @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/mob_spawn
execute if score corrupt_manifestation call_of_corrupted matches 18 at @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/mob_spawn
