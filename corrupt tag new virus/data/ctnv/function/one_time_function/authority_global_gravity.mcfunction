#----------------------------------------------------------------------------------------------------------------------------------
# for the authoritys high gravity to work it needs to be global
execute if score bool global_high_gravity matches 1 as @a[team=runners] run attribute @s gravity base set 1
execute if score bool global_high_gravity matches 1 as @a[team=corrupted] run attribute @s gravity base reset
# particles
execute if score bool global_high_gravity matches 1 as @a[team=runners] at @s run particle minecraft:ominous_spawning ~ ~ ~ 2 2 2 10 100 force @a


execute if score bool global_high_gravity matches 0 as @a run attribute @s gravity base reset
# countdown
execute as @a[scores={gravity_pull_timer=1..}] run scoreboard players remove @s gravity_pull_timer 1


# after 5 seconds (100 ticks) reset the gravity
execute if score @r[scores={gravity_pull_timer=400..500},limit=1] gravity_pull_timer matches 400..500 if score tick time matches 1 run scoreboard players set bool global_high_gravity 0
# it must be done globaly just in case