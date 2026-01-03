
#           /$$                                                                                                                    /$$$$$$$ 
#          | $$                                                                                                                   | $$____/ 
#  /$$$$$$$| $$  /$$$$$$   /$$$$$$$ /$$$$$$$        /$$$$$$$ /$$  /$$  /$$  /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$$      | $$      
# /$$_____/| $$ |____  $$ /$$_____//$$_____/       /$$_____/| $$ | $$ | $$ |____  $$ /$$__  $$ /$$__  $$ /$$__  $$ /$$_____/      | $$$$$$$ 
#| $$      | $$  /$$$$$$$|  $$$$$$|  $$$$$$       |  $$$$$$ | $$ | $$ | $$  /$$$$$$$| $$  \ $$| $$$$$$$$| $$  \__/|  $$$$$$       |_____  $$
#| $$      | $$ /$$__  $$ \____  $$\____  $$       \____  $$| $$ | $$ | $$ /$$__  $$| $$  | $$| $$_____/| $$       \____  $$       /$$  \ $$
#|  $$$$$$$| $$|  $$$$$$$ /$$$$$$$//$$$$$$$/       /$$$$$$$/|  $$$$$/$$$$/|  $$$$$$$| $$$$$$$/|  $$$$$$$| $$       /$$$$$$$/      |  $$$$$$/
# \_______/|__/ \_______/|_______/|_______/       |_______/  \_____/\___/  \_______/| $$____/  \_______/|__/      |_______/        \______/ 
#                                                                                   | $$                                                    
#                                                                                   | $$                                                    
#                                                                                   |__/                                                    

# finnally we are in the actuall gameplay,
# this is the class swapers game mode
# this function is a lot bigger than the others

#================================================================================================
# create the bossbar that shows the ingame time
bossbar add game_time game_time
bossbar set minecraft:game_time players @a
bossbar set minecraft:game_time visible true
bossbar set minecraft:game_time max 2
bossbar set minecraft:game_time value 2


execute if score gamers players_online matches 2.. if score tick time matches 1 run scoreboard players add seconds time 1
execute if score seconds time matches 60.. run scoreboard players add minutes time 1
execute if score seconds time matches 60.. run scoreboard players set seconds time 0
execute if score minutes time matches 60.. run scoreboard players add hours time 1
execute if score minutes time matches 60.. run scoreboard players set minutes time 0

execute if score endgame state matches 0 run bossbar set game_time name {"text":"Time: ","color":"yellow","extra":[{"score":{"name":"hours","objective":"time"}},{"text":":","color":"gray"},{"score":{"name":"minutes","objective":"time"}},{"text":":","color":"gray"},{"score":{"name":"seconds","objective":"time"}}]}
# the color and style will change to a more intence red when the endgame condition is met.
# the endgame condition is met when there are ONLY 2 "gamers" (gamers variable)

kill @e[tag=spawn_point]
#================================================================================================
# prosess all the classes and there effects.


# the un-corrupted classes are
# 1 = medic
# 2 = archer
# 3 = bulk
# 4 = assassin
# 5 = stun man
# 6 = fisherman

# the corrupted classes are
# 1 = The Corrupted
# 2 = The Predator
# 3 = The Apparition
# 4 = The Hunter
# 5 = The Knight
# 6 = the Dark Star
execute as @a[scores={class=1},team=runners] run function ctnv:classes/runners/medic
execute as @a[scores={class=2},team=runners] run function ctnv:classes/runners/archer
execute as @a[scores={class=3},team=runners] run function ctnv:classes/runners/bulk
execute as @a[scores={class=4},team=runners] run function ctnv:classes/runners/assassin
execute as @a[scores={class=5},team=runners] run function ctnv:classes/runners/stunman
execute as @a[scores={class=6},team=runners] run function ctnv:classes/runners/fisherman

execute as @a[scores={evil_class=1},team=corrupted] if score @s corruption_stun matches ..0 run function ctnv:classes/corrupted/corrupted
execute as @a[scores={evil_class=2},team=corrupted] if score @s corruption_stun matches ..0 run function ctnv:classes/corrupted/predator
execute as @a[scores={evil_class=3},team=corrupted] if score @s corruption_stun matches ..0 run function ctnv:classes/corrupted/apparition
execute as @a[scores={evil_class=4},team=corrupted] if score @s corruption_stun matches ..0 run function ctnv:classes/corrupted/hunter
execute as @a[scores={evil_class=5},team=corrupted] if score @s corruption_stun matches ..0 run function ctnv:classes/corrupted/knight
execute as @a[scores={evil_class=6},team=corrupted] if score @s corruption_stun matches ..0 run function ctnv:classes/corrupted/dark_star

# if the bulk gets corrupted, reduse the bulk_totem by 1
# Reduce bulk_totem by 1 if the player is stunned (corruption_stun = 1) and tick time is 5
execute as @a[scores={bulk_totem=1..,corruption_stun=1}] if score tick time matches 0 run scoreboard players remove @s bulk_totem 1
#specific command for the bulk to make sure that he does not have his jump candle imidialty wasted
execute as @a[scores={class=3},team=corrupted] run scoreboard players set @s bulk 25 
# when it comes to items. they must all be clear from your inventory during a corruption stun
execute as @a[scores={corruption_stun=1..}] run clear @s
# when it comes to corruption if you aint corrupted. you aint wearing the armor
execute as @a[team=runners] run clear @s netherite_chestplate
execute as @a[team=runners] run clear @s netherite_helmet
execute as @a[team=runners] run clear @s netherite_leggings
execute as @a[team=runners] run clear @s netherite_boots

execute as @a[team=runners] run clear @s leather_chestplate
execute as @a[team=runners] run clear @s leather_helmet
execute as @a[team=runners] run clear @s leather_leggings
execute as @a[team=runners] run clear @s leather_boots

execute as @a[team=runners] run clear @s iron_chestplate
execute as @a[team=runners] run clear @s iron_helmet
execute as @a[team=runners] run clear @s iron_leggings
execute as @a[team=runners] run clear @s iron_boots

execute as @a[team=runners] run clear @s golden_helmet
# if the corruption stun is 0 the game completly breaks

# when it comes to cooldowns make sure that they dont immidialtly go off
# if the corrupted one has a long cooldown dont reset it. if its short or 0 reset it
# the corruption tier cooldowns are staggard to prevent a bug
execute as @a[scores={class=3},team=corrupted] run scoreboard players set @s bulk 10

execute as @a[scores={class=1},team=corrupted] run scoreboard players set @s medic_heal 10

execute as @a[scores={class=4},team=corrupted] run scoreboard players set @s assassin_charge 10

scoreboard players set @a[scores={class=5},team=corrupted] trident_throw 0
scoreboard players set @a[scores={class=5},team=corrupted] stunman_trap 30
scoreboard players set @a[scores={class=6},team=corrupted] fishing_net_trap 30

# corrupted
execute as @a[scores={evil_class=1},team=runners] if score @s classic_corrupted_t1_cooldown matches ..10 run scoreboard players set @s classic_corrupted_t1_cooldown 10
execute as @a[scores={evil_class=1},team=runners] if score @s classic_corrupted_t1_cooldown matches ..10 run scoreboard players set @s classic_corrupted_t2_cooldown 9
execute as @a[scores={evil_class=1},team=runners] if score @s classic_corrupted_t1_cooldown matches ..10 run scoreboard players set @s classic_corrupted_t3_cooldown 8

execute as @a[scores={evil_class=2},team=runners] if score @s predator_corrupted_t2_cooldown matches ..10 run scoreboard players set @s predator_corrupted_t2_cooldown 9
execute as @a[scores={evil_class=2},team=runners] if score @s predator_corrupted_t3_cooldown matches ..10 run scoreboard players set @s predator_corrupted_t3_cooldown 8

execute as @a[scores={evil_class=3},team=runners] if score @s apparition_light_level matches 1 run scoreboard players set @s apparition_light_level 0
execute as @a[scores={evil_class=3},team=runners] if score @s apparition_corrupted_t2_cooldown matches ..10 run scoreboard players set @s apparition_corrupted_t2_cooldown 9

execute as @a[scores={evil_class=4},team=runners] if score @s hunter_corrupted_t2_trap matches ..10 run scoreboard players set @s hunter_corrupted_t2_trap 20
execute as @a[scores={evil_class=4},team=runners] if score @s hunter_corrupted_t1_trap matches ..10 run scoreboard players set @s hunter_corrupted_t1_trap 20
execute as @a[scores={evil_class=4},team=runners] if score @s hunter_corrupted_t3_trap matches ..10 run scoreboard players set @s hunter_corrupted_t3_trap 20
execute as @a[scores={evil_class=4},team=runners] if score @s hunter_corrupted_t1_cooldown matches ..10 run scoreboard players set @s hunter_corrupted_t1_cooldown 10

execute as @a[scores={evil_class=5},team=runners] if score @s knight_corruption_blocker matches ..10 run scoreboard players set @s knight_corruption_blocker 10
execute as @a[scores={evil_class=5},team=runners] if score @s knight_reveal_players matches ..10 run scoreboard players set @s knight_reveal_players 10
execute as @a[scores={evil_class=5},team=runners] if score @s knight_speed_boost matches ..10 run scoreboard players set @s knight_speed_boost 10

execute as @a[scores={evil_class=6},team=runners] if score @s dark_star_darkness matches ..10 run scoreboard players set @s dark_star_darkness 10
execute as @a[scores={evil_class=6},team=runners] if score @s dark_star_speed_boost matches ..10 run scoreboard players set @s dark_star_speed_boost 10
execute as @a[scores={evil_class=6},team=runners] if score @s dark_star_supernova matches ..10 run scoreboard players set @s dark_star_supernova 10
execute as @a[scores={evil_class=6},team=runners] if score @s dark_star_supernova matches 170.. run scoreboard players set @s dark_star_supernova 169

# extra corrupted classes will be added later

# the corrupted one cannot have the glowing effect
execute as @a[team=corrupted] run effect clear @s glowing
# the knight will have knockback resistance. everone who is not the knight will not have that
attribute @r[team=runners] knockback_resistance base reset
# a note about classes. im calling them AS the person who is playing the class. that means that i can just use @S to 
# select the induvidual player of a specific class
#================================================================================================


#==================================================================================================
# calculate corruption percentage
execute if score gamers players_online matches 2.. if score corruption_tick corruption >= @a[limit=1,scores={ST____corruption_rate=1..}] ST____corruption_rate if score tick time matches 19 run scoreboard players add @a[team=corrupted] corruption 1
execute if score gamers players_online matches 2.. if score corruption_tick corruption >= @a[limit=1,scores={ST____corruption_rate=1..}] ST____corruption_rate if score tick time matches 19 run scoreboard players set corruption_tick corruption 0
execute if score gamers players_online matches 2.. as @a[team=corrupted] if score @s corruption_stun matches ..0 if score tick time matches 1 run scoreboard players add corruption_tick corruption 1
execute if score gamers players_online matches 2.. if score corruption_tick corruption matches 20.. run scoreboard players set corruption_tick corruption 0
#20 seconds is the highest possible corruption tick. trust me it get boring if you go any further

#==================================================================================================
# the actuall gameplay! here we do logic where if the corrupted hits the runner and there max health goes down. if it reaches 0 the corrupted becomes a runner
# and the runner becomes the corrupted.
# we can use the attrtibute command for this


# due to the fact that the current health will ALWAYS be the max health, we will do damage calculation manually.
# thankfully the scoreboard "hit" does that for us easy
# we just need to use that data properly
# if a player is "hit" we remove there health by 1, then reset the hit variable
execute as @a[team=runners] if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players remove @s health 1

#===================================================================================================================================
# the corrupted do not take damage, set there health to 20 always
execute as @a[team=corrupted] run attribute @s max_health base set 20
execute as @a[team=corrupted] run scoreboard players set @s health 0


#==================================================================================================================================
# here we use the attributes command to set the max health of a player to whatever the "health" scoreboard variable is
# unfortunatly this cannot be done procedually. (the ai copilot tried and crashed my IDE!)
# so we must create a seprate function to manually map the scoreboard health value to the actual health value

function ctnv:one_time_function/max_health_assignment
#-------------------------------------------corruption hitting logic-----------------------------------------------------------
# here is the meat and bondes of corrupt tag. the actuall "tag" part.
#the order of opperations are VITAL for correct corruption





#=======================================BEGINNING OF CORRUPTION SWAPING LOGIC===================================================
# reset the hit variable so that the players health is not drained
execute as @a if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players reset @s hit
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# here is where the only difference between the class swapers and the normal corrupt tag is
# 1. constaltly update rnd for class selection
scoreboard players add rng class 1
scoreboard players add rng evil_class 1
execute if score rng class matches 7.. run scoreboard players set rng class 1
execute if score rng evil_class matches 7.. run scoreboard players set rng evil_class 1
#2. when a player becomes corrupted scramble there class 

# if the runners health gets to 0, set the corrupted ones health to the max health
# this will make the corrupted one no logner corrupted. meanwhile the runner has a health of 0
# also clear the corrupted inventory so that items dont transfer
execute as @a[team=runners] if score @s health matches 0 run clear @a[team=corrupted]
execute as @a[team=runners] if score @s health matches 0 run scoreboard players operation @a[team=corrupted] health = @a[scores={ST____max_health=1..}] ST____max_health



#now at this point everyone is a runner. however the corrupted one just killed someone.
execute as @a if score @s health matches 1.. run team join runners @s

# make sure that everone ONLY has the items allowed by there class and team
# there is a glitch where if a player has items then gets corrupted or vice versa, they may keep illigal items.
# to fix this we must clear the inventory of any player with a health of 0 and a team of runners.
# this will ensure a 1 tick gap where the invetory of all players can be kept in check
execute as @a[team=runners] if score @s health matches 0 run clear @s
execute as @a[team=runners] if score @s health matches 0 run scoreboard players operation @s class = rng class
execute as @a[team=runners] if score @s health matches 0 run scoreboard players operation @s evil_class = rng evil_class
# to make the rng less predictable the rng does different things when this happens
execute as @a[team=runners] if score @s health matches 0 run scoreboard players add rng class 1
execute as @a[team=runners] if score @s health matches 0 run scoreboard players add rng evil_class 1
# sounds and text. so that the game mode is distingueshable
execute as @a[team=runners] if score @s health matches 0 run tellraw @a [{"text":"class swapped!","color":"dark_green"}]
execute as @a[team=runners] if score @s health matches 0 run playsound block.note_block.pling block @a ~ ~ ~ 1 1 1

# do a chat message to tell everone who just got corrupted
execute as @a[team=runners] if score @s health matches 0 run title @a[team=!dead] title [{"selector":"@s","color":"light_purple"},{"text":" IS IT!","color":"dark_purple","bold":true}]
execute as @a[team=runners] if score @s health matches 0 run tellraw @a [{"selector":"@s"},{"text":" IS NOW CORRUPTED!","color":"dark_purple","bold":true}]

# target tubby detection
# it should only really work if there are more than 2 people and its active
# its here so that we can idenfify who is currently it and who was previously it
execute unless score gamers players_online matches ..2 if score setting ST____target_tubby_detection matches 1.. run function ctnv:target_tubby_detection/detection
# for the dark stars nuke it needs to be killed when the corruption switches
execute as @a[team=runners] if score @s health matches 0 run kill @e[tag=nuke]

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset the hit variable again so that extra health is not given
execute as @a if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players reset @s hit
#=======================================END OF CORRUPTION SWAPING LOGIC===================================================

#==================================================================================================
# calculate corruption stun
#do the actuall stun effects

execute as @a[team=corrupted] if score @s corruption_stun matches 1.. run effect give @s blindness 2 1 true
execute as @a[team=corrupted] if score @s corruption_stun matches 1.. run attribute @s movement_speed base set 0
execute as @a[team=corrupted] if score @s corruption_stun matches 1.. run attribute @s minecraft:entity_interaction_range base set 0
execute as @a[team=corrupted] if score @s corruption_stun matches 1.. run attribute @s jump_strength base set 0
# fancy particles
execute as @a[team=corrupted] if score @s corruption_stun matches 1.. run particle minecraft:portal ~ ~1 ~ 0 0 0 1 6 force
#reset the atriubes if the stun stopped
execute as @a[team=corrupted] if score @s corruption_stun matches 0 run attribute @s movement_speed base reset
execute as @a[team=corrupted] if score @s corruption_stun matches 0 run attribute @s minecraft:entity_interaction_range base reset
execute as @a[team=corrupted] if score @s corruption_stun matches 0 run attribute @s jump_strength base reset
# display to the corrupted how long they are stunned

execute as @a[team=corrupted] if score @s corruption_stun matches 1.. run title @s title [{"text":":","color":"dark_purple"},{"score":{"name":"@s","objective":"corruption_stun"}},{"text":":","color":"dark_purple"}]
execute as @a[team=corrupted] if score @s corruption_stun matches 0 run title @s title [{"text":":","color":"dark_purple"},{"text":"GO","color":"dark_purple"},{"text":":","color":"dark_purple"}]
execute as @a[scores={corruption_stun=0}] run scoreboard players remove @s corruption_stun 1
execute if score tick time matches 2 as @a[scores={corruption_stun=1..}] run scoreboard players remove @a corruption_stun 1
# calculate how LONG the stun lasts
#there is a breaf moment here where all players are runners BUT one has a health of 0 FOR 1 tick. this is the newly corrupted. and we can apply the stun
#here and here only
execute as @a[team=runners] if score @s health matches 0 run scoreboard players operation @s corruption_stun = @a[limit=1,scores={ST____initial_corruption_stun = 1..}] ST____initial_corruption_stun

# my note on the corrpution delay system: its good, dispite the fact that all players are affected. only the corrupted player notices.
#so id say this code here is good
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# stun sound effects
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 10 run playsound block.note_block.harp master @s ~ ~ ~ 1 0.2
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 9 run playsound block.note_block.harp master @s ~ ~ ~ 1 0.4
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 8 run playsound block.note_block.harp master @s ~ ~ ~ 1 0.6
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 7 run playsound block.note_block.harp master @s ~ ~ ~ 1 0.8
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 6 run playsound block.note_block.harp master @s ~ ~ ~ 1 1.0
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 5 run playsound block.note_block.harp master @s ~ ~ ~ 1 1.2
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 4 run playsound block.note_block.harp master @s ~ ~ ~ 1 1.4
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 3 run playsound block.note_block.harp master @s ~ ~ ~ 1 1.6
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 2 run playsound block.note_block.harp master @s ~ ~ ~ 1 1.8
execute if score tick time matches 18 as @a[team=corrupted] at @s if score @s corruption_stun matches 1 run playsound block.note_block.harp master @s ~ ~ ~ 1 2.0





# if a runners health maches 0 they become corrupted

execute as @a[team=runners] if score @s health matches 0 run team join corrupted @s
# if a corrupted one kills a runner, he becomes a runner
# this is done by detecting if they have at least 1 health


# give the corrupted the poison effect. to signify that he is infact, corrupted
effect give @a[team=corrupted] poison 1 0 true

#particles for the stunned corrupted
execute as @a[team=corrupted] at @s if score @s corruption_stun matches 1.. run particle dust{color:[0.83,0.0,1.0],scale:1} ~ ~ ~ 0.5 1 0.5 1 55 normal @a


# only 1 corrupted player can exist
#=======================================================================================================================================
#detect if there are multiple corrupted players
#scoreboard players set corrupted_count players_online 0
#execute as @a[team=corrupted] run scoreboard players add corrupted_count players_online 1
#execute if score corrupted_count players_online matches 2.. run tellraw @a [{"text":"error: multiple corrupted players","color":"dark_red"}]


# check if there are no corrupted players (ragequit) or if a player dies
execute if score gamers players_online matches 2.. unless entity @a[team=corrupted] if score seconds time matches 2.. run tellraw @a [{"text":"picking a player to","color":"white"},{"text":" corrupt ","color":"dark_purple"},]
execute if score gamers players_online matches 2.. unless entity @a[team=corrupted] as @e[tag=corruption_part] at @e[tag=corruption_part] if score seconds time matches 2.. run scoreboard players set @a[team=runners,sort=nearest,limit=1] health 0



#=======================================================================================================================================
# update the bouncer list here
# if the corrupted player dissconnects, kick him out!
# when it comes to disconnected players,  they cannot be editied. therefor the list has to be thrown out (do NOT put dead people on the list)

#notes on this code. its terribly janky, it was origninally used to check if a player had left, then it should have lowered the variable
# gamers by 1. unfortunalty it does this and does it when a player dies normally. with no way to differenciate between leaving and dying
# removing it breaks everything.
# this code can keep out all players not ment to be in a game. but it cant keep track of how many "gamers" there are


# any player not on the bouncers list will be considered dead
execute as @a unless score @s bouncer_list matches 1 run team join dead

# reusing the "players_waiting" variable we can compare to see if a normal player left.
#1 check if "players_waiting" is equal to the "gamers" variable
#2 update the "players waiting varieble to be euqal to the gamers variable"



# reset the bouncers list
execute unless score players_waiting players_online = gamers players_online run scoreboard objectives remove bouncer_list
execute unless score players_waiting players_online = gamers players_online run scoreboard objectives add bouncer_list dummy
execute unless score players_waiting players_online = gamers players_online run scoreboard players set @a[team=!dead] bouncer_list 1


# debug
#execute unless score players_waiting players_online = gamers players_online run scoreboard objectives setdisplay sidebar bouncer_list

# set the "players waiting" variable to the gamers variable, so that the function does not constantly trigger
execute unless score players_waiting players_online = gamers players_online run scoreboard players operation players_waiting players_online = gamers players_online

# this codes purpouse is to deny anyone who joins mid-game a role.

#=======================================================================================================================================
#  gamer identification
scoreboard players set gamers players_online 0
execute as @a[team=!dead] run scoreboard players add gamers players_online 1
# in the previous gamestates the "gamers" variable was set and kept track of
# if we did not initialize the gamers variable, the game would assume that there was XXX ammount of gamers.
# and honestly i dont want to deal with that, so i initialised it in the previous function


#=======================================================================================================================================
#nautral regeneration logic.
# this code does has a few conditions
# 1. check if the time says 30 seconds
# 2. check if the player is already at max health
# 3. check if nautral regen is even on
# 4. check if the tick is 10
execute as @a[team=runners] if score tick time matches 10 if score seconds time matches 30 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run scoreboard players add @s health 1
# particles to indicate healing
execute as @a[team=runners] at @s if score seconds time matches 30 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run particle minecraft:happy_villager ~ ~1 ~ 0.2 1 0.2 1 5 force @a
# if the pleyers helth is greater then the max health. set it to the max health
execute as @a if score @s health > @a[limit=1,scores={ST____max_health=1..}] ST____max_health run scoreboard players operation @s health = @a[limit=1,scores={ST____max_health=1..}] ST____max_health


#=======================================================================================================================================
# anyone who joins the game at this point shall be a spectator
# this code is redundant
execute if score gamers players_online < Online players_online run team join dead @a[team=!runners,team=!corrupted]
execute as @a[team=dead] if entity @s[gamemode=!spectator] run gamemode spectator @s

# if someone leaves lower the score "gamer"
execute if score Online players_online < gamers players_online run scoreboard players remove gamers players_online 1

# there needs tp be a function for if the corrupted one leaves



#===========================================================================================================================================
#everyone will have an overlay. it shall contain the name of the corrupted player, and there corruption percentage.
execute as @a if score @s corruption matches 0..9 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██████████","color":"white"}]
execute as @a if score @s corruption matches 9..19 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █","color":"dark_purple"},{"text":"█████████","color":"white"}]
execute as @a if score @s corruption matches 20..29 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██","color":"dark_purple"},{"text":"████████","color":"white"}]
execute as @a if score @s corruption matches 30..39 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ███","color":"dark_purple"},{"text":"███████","color":"white"}]
execute as @a if score @s corruption matches 40..49 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ████","color":"dark_purple"},{"text":"██████","color":"white"}]
execute as @a if score @s corruption matches 50..59 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █████","color":"dark_purple"},{"text":"█████","color":"white"}]
execute as @a if score @s corruption matches 60..69 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓█████","color":"dark_purple"},{"text":"████","color":"white"}]
execute as @a if score @s corruption matches 70..79 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓█████","color":"dark_purple"},{"text":"███","color":"white"}]
execute as @a if score @s corruption matches 80..89 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓█████","color":"dark_purple"},{"text":"██","color":"white"}]
execute as @a if score @s corruption matches 90..99 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓▓█████","color":"dark_purple"},{"text":"█","color":"white"}]
execute as @a if score @s corruption matches 100.. run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▒▓▓▓▓█████","color":"dark_purple"}]

#===========================================================================================================================================
# if everyone alive is above 70%. the engame starts

# Check if all runners have at least 70% corruption, only then can the engame state start
scoreboard players set all_above_70 players_online 1
execute as @a[team=!dead] unless score @s corruption matches 70.. run scoreboard players set all_above_70 players_online 0
execute if score all_above_70 players_online matches 1 run function ctnv:endgame

#===========================================================================================================================================
#DEATH. lets talk about dying in corrupt tag.
# when your corruption reaches 100% you die, but how?
# step 1. remove all players with 100% corruption from the bouncer_list 
# step 2. do a bunch of particles, keep the corrupted alive just long enough to bask in his defeat.
# set 3. with the 100% corrupt player out of the bouncers list, he will automatically be set to team dead
# and then set to spectator mode
execute as @a[team=corrupted] unless score @s corruption matches ..99 run function ctnv:death
# fix a glitch where the dead would occasionally have there inventory flash before there eyes
scoreboard players set @a[team=dead] class -1
scoreboard players set @a[team=dead] evil_class -1


#=================================================================================================
#give particles to the "corrupted_part"
execute at @e[tag=corruption_part] if entity @a[team=corrupted,distance=5..] run particle dragon_breath ~ ~ ~ 0 0 0 0.01 10 force @a
execute at @e[tag=corruption_part] if entity @a[team=corrupted,distance=5..] run particle raid_omen ~ ~ ~ 2 0.5 2 0.01 1 force @a
execute at @e[tag=corruption_part] as @e[tag=corruption_part] if entity @a[team=corrupted,distance=5..] run particle end_rod ~ ~ ~ 0 0.5 0 0.01 2 force @a
#slowly move it to the corrupted player
# this command might be the most preformance intenceive part of the whole game
# Only move the corruption_part if a corrupted player exists and is farther than 1 block away
execute as @e[tag=corruption_part] at @s if entity @a[team=corrupted,limit=1] positioned ^ ^ ^ if entity @a[team=corrupted,distance=1.1..,limit=1] run tp @s ^ ^ ^0.5 facing entity @a[team=corrupted,limit=1]

# let the dead rest in pease
execute as @a[team=dead] run scoreboard players set @s corruption -1
execute as @a[team=dead] run attribute @s movement_speed base reset
execute as @a[team=dead] run attribute @s minecraft:entity_interaction_range base reset
execute as @a[team=dead] run attribute @s jump_strength base reset
#=================================================================================================
# trap management
# here peoples classes can change. meing that this function will have to be running constantly
# this is  the only other difference in this new game mode
function ctnv:classes/trap_management

# as of right now the stunman, hunter, and fisherman are the only classes that can place traps
# if traps are disabled kill all traps
execute if score limit trap_stats matches 0 run kill @e[tag=corrupted_t1_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=corrupted_t2_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=corrupted_t3_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=stunman_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=fishing_net_trap]
#=================================================================================================
# victory condition
# we must detect if the "gamers" variable is equal to 1
# then trigger it
execute if score gamers players_online matches 1 run function ctnv:victory


#=================================================================================================
# there is still a glitch where multiple corrupted can exist
# here we fix it

# first we count the corrupted players
scoreboard players reset count only_one_corrupted
execute as @a[team=corrupted] run scoreboard players add count only_one_corrupted 1
# then we run the function if there is more than 1 corrupted
# we cant forget to make sure that the function stops if there is only 1 survivor
execute if score count only_one_corrupted matches 2.. unless score gamers players_online matches 1 run function ctnv:one_time_function/only_one_corrupted

#=================================================================================================
#if the corrupted player disconnects, we end the game.

# first we count the corrupted players
scoreboard players reset count only_one_corrupted
execute as @a[team=corrupted] run scoreboard players add count only_one_corrupted 1
# then we run the function if there is more than 1 corrupted
# this one will be different. if there is 0 corrupted players the game ends
execute if score count only_one_corrupted matches 0.. run function ctnv:victory

#=================================================================================================
# secret corrupted supercharge "domain expansion"
execute if score enable corrupted_domain_enable matches 1 run function ctnv:corrupted_supercharge_ability/corrupted_domain_expantion