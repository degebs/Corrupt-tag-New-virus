
#the puropuse of this funtion is to keep all players in aventure mode UNLESS debug mode is toggled

execute as @a[team=!dead] run gamemode adventure @s

effect give @a saturation 3 1 true


#ensure that the turtle cannot be seen
effect give @e[type=turtle] invisibility 1 1 true

# make the health ALWAYS THE MAX HEALTH
effect give @a instant_health infinite 25 true

# make sure that dead people have there atrebutes reset
execute as @a[team=dead] if score @s corruption_stun matches 0 run attribute @s movement_speed base reset
execute as @a[team=dead] if score @s corruption_stun matches 0 run attribute @s minecraft:entity_interaction_range base reset
execute as @a[team=dead] if score @s corruption_stun matches 0 run attribute @s jump_strength base reset

effect give @a resistance infinite 3 true

#----------------------------------------------------------------------------------------------------------------------------------
# for the authoritys high gravity to work it needs to be global
execute if entity @a[scores={evil_class=8}] run function ctnv:one_time_function/authority_global_gravity