

# run the particles function
execute at @e[tag=souls_of_the_damned] run function ctnv:corrupted_supercharge_ability/swirl_particle_2

# spawn in the vexes
scoreboard players set count souls_of_the_damned_logic 0
execute as @e[type=vex] run scoreboard players add count souls_of_the_damned_logic 1

execute if score count souls_of_the_damned_logic matches 0..100 if score 360 time matches 10 as @e[tag=souls_of_the_damned] at @s run summon vex ~ ~ ~ {Health:2,Tags:["diety"],Team:corrupted,equipment:{mainhand:{id:iron_sword}},attributes:[{id:scale,base:2f},{id:max_health,base:2f}]}
execute if score count souls_of_the_damned_logic matches 0..100 if score 360 time matches 10 as @e[tag=souls_of_the_damned] at @s run summon vex ~ ~ ~ {Health:2,Tags:["diety"],Team:corrupted,equipment:{mainhand:{id:iron_sword}},attributes:[{id:scale,base:2f},{id:max_health,base:2f}]}

# do some spinning logic for the souls of the damned idol
execute store result storage minecraft:temp angle int 1 run scoreboard players get 360 time
execute as @e[tag=souls_of_the_damned] store result entity @s Rotation[0] float 1 run data get storage minecraft:temp angle

# detect if any vex has died
execute if score count souls_of_the_damned_logic > max_count souls_of_the_damned_logic run scoreboard players add max_count souls_of_the_damned_logic 1

execute if score count souls_of_the_damned_logic < max_count souls_of_the_damned_logic run scoreboard players add kills souls_of_the_damned_logic 1
execute if score count souls_of_the_damned_logic < max_count souls_of_the_damned_logic run scoreboard players set max_count souls_of_the_damned_logic 0

# if kills gets to 50 then the hole thing dies
execute if score kills souls_of_the_damned_logic matches 50.. at @e[tag=sub_part] run particle minecraft:explosion_emitter ~ ~ ~ 3 3 3 0 10 force @a
execute if score kills souls_of_the_damned_logic matches 50.. at @e[tag=sub_part] run playsound entity.generic.explode hostile @a ~ ~ ~ 1 0.5 1
execute if score kills souls_of_the_damned_logic matches 50.. at @e[tag=sub_part] run playsound entity.wither.death hostile @a ~ ~ ~ 1 0.5 1
execute if score kills souls_of_the_damned_logic matches 50.. at @e[tag=sub_part] run playsound entity.goat.screaming.death hostile @a ~ ~ ~ 1 0.2 1
execute if score kills souls_of_the_damned_logic matches 50.. run kill @e[tag=sub_part]
execute if score kills souls_of_the_damned_logic matches 50.. run kill @e[tag=souls_of_the_damned]

#anyone within 15 blocks gets nausea and blindness
execute as @e[tag=souls_of_the_damned] run effect give @a[distance=..15,team=runners] nausea 3 1 true
execute as @e[tag=souls_of_the_damned] run effect give @a[distance=..15,team=runners] blindness 3 1 true


# play some genuenly unerving sounds
execute if score 360 time matches 10.. run playsound entity.warden.ambient block @a ~ ~ ~ 1 0.3 1

execute if score 360 time matches 140.. run playsound entity.warden.ambient block @a ~ ~ ~ 1 0.3 1
