#
# ██████   █████  ███    ███ ███████     ███████ ███████ ████████ ██    ██ ██████      ██████  
#██       ██   ██ ████  ████ ██          ██      ██         ██    ██    ██ ██   ██          ██ 
#██   ███ ███████ ██ ████ ██ █████       ███████ █████      ██    ██    ██ ██████       █████  
#██    ██ ██   ██ ██  ██  ██ ██               ██ ██         ██    ██    ██ ██          ██      
# ██████  ██   ██ ██      ██ ███████     ███████ ███████    ██     ██████  ██          ███████ 
                                                                                              
 # here is where all players are teleported to the correct coresponding map, and then a corrupted one is chosen. 
 #keep in mind that NO player is alloed to move during this phase. also any new players that join at this points will be spectators                                                                                    

# reuse the countdown variable (set it to 10)
execute if score countdown time matches 0 run scoreboard players set countdown time 10
execute if score countdown time matches 1.. if score tick time matches 19 run scoreboard players remove countdown time 1
execute if score countdown time matches 2..9 run team join runners @a

bossbar set minecraft:game_time style progress

#execute unless score countdown time matches ..1 run execute as @e[scores={map_selection=1}] run tp @a @s

#=================================================================================================
# this may be set to 4 or 5.. or whatever when we add multiple gamemodes. untlil then its 3
execute if score countdown time matches 1 if score setting ST____game_mode matches 0 run scoreboard players set game state 3
execute if score countdown time matches 1 if score setting ST____game_mode matches 1 run scoreboard players set game state 4
execute if score countdown time matches 1 if score setting ST____game_mode matches 2 run scoreboard players set game state 5
execute if score countdown time matches 1 if score setting ST____game_mode matches 3 run scoreboard players set game state 6
execute if score countdown time matches 1 if score setting ST____game_mode matches 4 run scoreboard players set game state 7
execute if score countdown time matches 1 if score setting ST____game_mode matches 5 run scoreboard players set game state 8

#==============================================================================================================
# there is a glitch where players die in real life and then respawn in the lobby midgame. this cannot happen
#execute as @e[type=turtle,scores={map_selection=1}] at @s run setworldspawn ~ ~ ~
execute as @e[type=turtle,scores={map_selection=1}] at @s run spawnpoint @a ~ ~ ~




# resize the turtles so you cant hit them
execute as @e[type=turtle] run attribute @s scale base set 0.1


#=================================================================================================
# teleport each player to their corresponding armorstand based on their spawn_circle_count
# unfortulaty due to the way the teleport command works this process cannot be done proceduarlly. every index on the user_id has to have it own command
#this adds a hard limit to how many players can play corrupt tag. i think 30 should be a good hard limit
execute as @a[scores={player_ID=1}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=1},limit=1,sort=nearest]
execute as @a[scores={player_ID=2}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=2},limit=1,sort=nearest]
execute as @a[scores={player_ID=3}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=3},limit=1,sort=nearest]
execute as @a[scores={player_ID=4}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=4},limit=1,sort=nearest]
execute as @a[scores={player_ID=5}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=5},limit=1,sort=nearest]
execute as @a[scores={player_ID=6}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=6},limit=1,sort=nearest]
execute as @a[scores={player_ID=7}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=7},limit=1,sort=nearest]
execute as @a[scores={player_ID=8}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=8},limit=1,sort=nearest]
execute as @a[scores={player_ID=9}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=9},limit=1,sort=nearest]
execute as @a[scores={player_ID=10}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=10},limit=1,sort=nearest]
execute as @a[scores={player_ID=11}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=11},limit=1,sort=nearest]
execute as @a[scores={player_ID=12}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=12},limit=1,sort=nearest]
execute as @a[scores={player_ID=13}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=13},limit=1,sort=nearest]
execute as @a[scores={player_ID=14}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=14},limit=1,sort=nearest]
execute as @a[scores={player_ID=15}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=15},limit=1,sort=nearest]
execute as @a[scores={player_ID=16}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=16},limit=1,sort=nearest]
execute as @a[scores={player_ID=17}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=17},limit=1,sort=nearest]
execute as @a[scores={player_ID=18}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=18},limit=1,sort=nearest]
execute as @a[scores={player_ID=19}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=19},limit=1,sort=nearest]
execute as @a[scores={player_ID=20}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=20},limit=1,sort=nearest]
execute as @a[scores={player_ID=21}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=21},limit=1,sort=nearest]
execute as @a[scores={player_ID=22}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=22},limit=1,sort=nearest]
execute as @a[scores={player_ID=23}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=23},limit=1,sort=nearest]
execute as @a[scores={player_ID=24}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=24},limit=1,sort=nearest]
execute as @a[scores={player_ID=25}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=25},limit=1,sort=nearest]
execute as @a[scores={player_ID=26}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=26},limit=1,sort=nearest]
execute as @a[scores={player_ID=27}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=27},limit=1,sort=nearest]
execute as @a[scores={player_ID=28}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=28},limit=1,sort=nearest]
execute as @a[scores={player_ID=29}] at @s run tp @s @e[tag=spawn_point,scores={spawn_circle_count=29},limit=1,sort=nearest] 

# up next we must move everyones neck to face the center.
execute as @a[scores={player_ID=1}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=2}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=3}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=4}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=5}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=6}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=7}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=8}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=9}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=10}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=11}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=12}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=13}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=14}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=15}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=16}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=17}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=18}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=19}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=20}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=21}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=22}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=23}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=24}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=25}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=26}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=27}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=28}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]
execute as @a[scores={player_ID=29}] at @s run tp @s ~ ~ ~ facing entity @e[type=turtle,limit=1,scores={map_selection=1}]

scoreboard objectives setdisplay below_name corruption

scoreboard players reset @a hit 

title @a times 0 120 1

#==================================================================================================================================
#create a corruption dummy armorstand. its invisable. and it slowly teleports itself to the corrupted player.
#its particles are what disinguish it.
execute if score tick time matches 1 if score countdown time matches 2 as @e[type=turtle,scores={map_selection=1},limit=1,sort=nearest] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,Tags:["corruption_part"]}


#=================================================================================================
#class specific stuff

# reset the bulks totem variable
scoreboard players set @a[scores={bulk_totem=1..}] bulk_totem 0


# when it comes to cooldowns make sure that they dont immidialtly go off

# uncorrupted cooldowns
execute as @a[scores={class=3}] run scoreboard players set @s bulk 10

execute as @a[scores={class=1}] run scoreboard players set @s medic_heal 10

scoreboard players set @a[scores={class=2}] acher_arrow_count 5

scoreboard players set @a[scores={class=5}] trident_throw 0
scoreboard players set @a[scores={class=5}] stunman_trap 10

scoreboard players set @a[scores={class=6}] fishing_net_trap 3

scoreboard players set @a[scores={class=4}] assassin_charge 10
execute if score @s assassin_hide matches 1.. run scoreboard players reset @s assassin_hide
# corrupted cooldowns
execute as @a[scores={evil_class=1}] run scoreboard players set @s classic_corrupted_t1_cooldown 10
execute as @a[scores={evil_class=1}] run scoreboard players set @s classic_corrupted_t2_cooldown 10
execute as @a[scores={evil_class=1}] run scoreboard players set @s classic_corrupted_t3_cooldown 10

execute as @a[scores={evil_class=2}] run scoreboard players set @s predator_t1_speed_range 0
execute as @a[scores={evil_class=2}] run scoreboard players set @s predator_corrupted_t2_cooldown 10
execute as @a[scores={evil_class=2}] run scoreboard players set @s predator_corrupted_t2_cooldown 10

execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_light_level 0
execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_corrupted_t2_cooldown 10
#execute as @a[scores={evil_class=3}] run scoreboard players set @s apparition_corrupted_t3_cooldown 0

execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t1_cooldown 10
execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t1_trap 20
execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t2_trap 20
execute as @a[scores={evil_class=4}] run scoreboard players set @s hunter_corrupted_t3_trap 20

execute as @a[scores={evil_class=5}] run scoreboard players set @s knight_corruption_blocker 5
execute as @a[scores={evil_class=5}] run scoreboard players set @s knight_reveal_players 5
execute as @a[scores={evil_class=5}] run scoreboard players set @s knight_speed_boost 5

execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_darkness 5
execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_speed_boost 5
execute as @a[scores={evil_class=6}] run scoreboard players set @s dark_star_supernova 5


#=================================================================================================
# particles and fanfare when the game starts and a corrupted has yet to be chosen
# not working
execute if score countdown time matches 3.. as @e[type=turtle] at @s if score tick time matches 1 run summon bat ~ ~ ~ {Silent:1b,Passengers:[{id:endermite,NoAI:1b,Silent:1b}]}
execute if score countdown time matches 3.. as @e[type=turtle] at @s if score tick time matches 1 run playsound item.firecharge.use block @a ~ ~ ~ 1 1

effect give @e[type=bat] invisibility 1 9 true
execute if score countdown time matches ..3 run kill @e[type=bat]
execute as @e[type=endermite] run attribute @s scale base set 2
execute if score countdown time matches 1 run kill @e[type=endermite]


# continue the effect by teleporting the corruption part  to a random player then have all the endermites look at it
execute if score countdown time matches ..2 if score tick time matches 1 run teleport @e[type=armor_stand,tag=corruption_part,limit=1,sort=nearest] @r
execute if score countdown time matches ..3 as @e[type=endermite] at @s run tp @s ^ ^ ^0.5 facing entity @e[type=armor_stand,tag=corruption_part,limit=1]
execute if score countdown time matches ..2 as @e[type=endermite] at @s run tp @s ^ ^ ^1 facing entity @e[type=armor_stand,tag=corruption_part,limit=1]
#have a particle effect on the endermites, make is so that the particles look like a laser pointing at the corruption part
execute if score countdown time matches ..3 as @e[type=endermite] at @s run particle minecraft:electric_spark ~ ~ ~ 0.5 0.5 0.5 0.1 1 force @a

# sound
execute if score countdown time matches ..3 if score tick time matches 1 run playsound minecraft:entity.wither.ambient block @a ~ ~ ~ 1 1 1


#an extra slowness effect
effect give @a slowness 1 255 true

#=================================================================================================
# hide and reap
scoreboard players set trigger hide_and_reap_death_trigger 10
scoreboard players set runner_win hide_and_reap_death_trigger 0

#=================================================================================================
# infection
scoreboard players set infected corruption_combined 0

#=================================================================================================
# call of corrupted
scoreboard players set wave call_of_corrupted 0
scoreboard players set class_selection_delay call_of_corrupted 5
# if the game mode is call of corrupted set the arrow count to 99
execute if score setting ST____game_mode matches 4 run scoreboard players set @a acher_arrow_count 99
scoreboard players add @a ammo_type 0
scoreboard players set time spawn 0
scoreboard players reset @a crouch_time
kill @e[type=shulker]
 scoreboard players set revive_tutorial call_of_corrupted 0
 # there is a glitch where a totem can persist between reloads. thats a bad thing
kill @e[tag=TOTEM_creeper]
kill @e[tag=TOTEM_mini_creeper]
kill @e[tag=TOTEM_phantom]
kill @e[tag=TOTEM_phantom_elite]
kill @e[tag=TOTEM_phantom_laser]
kill @e[tag=TOTEM_pilager_raid]
kill @e[tag=TOTEM_pillager]
kill @e[tag=TOTEM_rat]
kill @e[tag=TOTEM_skeleton]
kill @e[tag=TOTEM_skeleton_elite]
kill @e[tag=TOTEM_stray]
kill @e[tag=TOTEM_stray_elite]
kill @e[tag=TOTEM_vindicator]
kill @e[tag=TOTEM_zombie_elite]
kill @e[tag=TOTEM_zombie]
kill @e[tag=heal_totem]
kill @e[tag=wall]
kill @e[tag=fish_attack]
kill @e[tag=splash]

#=================================================================================================
# display the maps name to all
execute as @e[type=turtle,limit=1,sort=nearest] at @r run title @a title [{"color":"gold","selector":"@s"}]



execute if score countdown time matches 3 if score tick time matches 19 run tellraw @a [{text:"==============================================","color":"green"}]