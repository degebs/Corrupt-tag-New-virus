#  /$$$$$$   /$$$$$$  /$$       /$$              /$$$$$$  /$$$$$$$$        /$$$$$$   /$$$$$$  /$$$$$$$  /$$$$$$$  /$$   /$$ /$$$$$$$  /$$$$$$$$ /$$$$$$$$ /$$$$$$$ 
# /$$__  $$ /$$__  $$| $$      | $$             /$$__  $$| $$_____/       /$$__  $$ /$$__  $$| $$__  $$| $$__  $$| $$  | $$| $$__  $$|__  $$__/| $$_____/| $$__  $$
#| $$  \__/| $$  \ $$| $$      | $$            | $$  \ $$| $$            | $$  \__/| $$  \ $$| $$  \ $$| $$  \ $$| $$  | $$| $$  \ $$   | $$   | $$      | $$  \ $$
#| $$      | $$$$$$$$| $$      | $$            | $$  | $$| $$$$$         | $$      | $$  | $$| $$$$$$$/| $$$$$$$/| $$  | $$| $$$$$$$/   | $$   | $$$$$   | $$  | $$
#| $$      | $$__  $$| $$      | $$            | $$  | $$| $$__/         | $$      | $$  | $$| $$__  $$| $$__  $$| $$  | $$| $$____/    | $$   | $$__/   | $$  | $$
#| $$    $$| $$  | $$| $$      | $$            | $$  | $$| $$            | $$    $$| $$  | $$| $$  \ $$| $$  \ $$| $$  | $$| $$         | $$   | $$      | $$  | $$
#|  $$$$$$/| $$  | $$| $$$$$$$$| $$$$$$$$      |  $$$$$$/| $$            |  $$$$$$/|  $$$$$$/| $$  | $$| $$  | $$|  $$$$$$/| $$         | $$   | $$$$$$$$| $$$$$$$/
# \______/ |__/  |__/|________/|________/       \______/ |__/             \______/  \______/ |__/  |__/|__/  |__/ \______/ |__/         |__/   |________/|_______/ 
                                                                                                                                                                  
#================================================================================================
# create the bossbar that shows the ingame time
bossbar add game_time game_time
bossbar set minecraft:game_time players @a
bossbar set minecraft:game_time visible true
bossbar set minecraft:game_time max 2
bossbar set minecraft:game_time value 2

# for some reason this cant count when the gamestate is 3, but it can when its 2????
execute if score count runners_alive matches 1.. if score gamers players_online matches 2.. if score tick time matches 1 run scoreboard players add seconds time 1
execute if score seconds time matches 60.. run scoreboard players add minutes time 1
execute if score seconds time matches 60.. run scoreboard players set seconds time 0
execute if score minutes time matches 60.. run scoreboard players add hours time 1
execute if score minutes time matches 60.. run scoreboard players set minutes time 0

execute if score endgame state matches 0 run bossbar set game_time name {"text":"Time: ","color":"yellow","extra":[{"score":{"name":"hours","objective":"time"}},{"text":":","color":"gray"},{"score":{"name":"minutes","objective":"time"}},{"text":":","color":"gray"},{"score":{"name":"seconds","objective":"time"}}]}
# the color and style will change to a more intence red when the endgame condition is met.
# the endgame condition is met when there are ONLY 2 "gamers" (gamers variable)

kill @e[tag=spawn_point]
                                                                                                                                                            
#this game mode will be completly different from the others.
# it folows its own chart

# the first thing we do is dermine the corrupte one with the corruted part... then we kill it
# in the other game modes, health determined corruption... not anymore. we will reuse the scoreboard "current_corrupted" from the target tubby detection

# 1. add the nearest player to the corruption part to the scoreboard "current_corrupted"
execute as @e[tag=corruption_part] at @s run scoreboard players add @p current_corrupted 1

# 2. execute the game_start function at the beginin of the game
execute if entity @e[tag=corruption_part] run function ctnv:alternate_gamemode_functions/call_of_corrupted/game_start

# 3. kill the corruption part. its not needed here.
kill @e[tag=corruption_part]

# in call of corrupted. there is no such thing as "runner classes"... while players will get there according items, anyone can use any item regardless on what "class" he should be

#==========================================================================================================================================================================================
# the runner hud

title @a[team=runners] actionbar [{"text":"wave:","color":"red"},{"text":" ","color":"gold"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":"                                                     ","color":"gold"},{"text":" $ ","color":"blue"},{"score":{"objective":"points","name":"*"}}]
#==========================================================================================================================================================================================
# the 2 states the corrupted can be in.
execute if score atherial_corrupted call_of_corrupted matches 1 run execute as @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/atherial_corrupted
execute if score atherial_corrupted call_of_corrupted matches 0 run execute as @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/physical_corrupted
execute if score atherial_corrupted call_of_corrupted matches 2 run execute as @a[team=corrupted] run function ctnv:alternate_gamemode_functions/call_of_corrupted/intermission
# atherial and physical
# when atherial he cannot do anything exept summon waves
# when physical hes just corrutped

# give the corrupted the poison effect. to signify that he is infact, corrupted
effect give @a[team=corrupted] poison 1 0 true


#==========================================================================================================================================================================================
# runners and physical corrupted must have there max health

# runners
function ctnv:one_time_function/max_health_assignment

# the corupreds max health is completly different
# its based on the current wave and the dificulty setting
# corrupted manifestation

# count down
execute if score atherial_corrupted call_of_corrupted matches 1 if score corrupt_manifestation call_of_corrupted matches 1.. run scoreboard players remove corrupt_manifestation call_of_corrupted 1

# the corrupted cannot use points
scoreboard players set @a[team=corrupted] points 0
#==========================================================================================================================================================================================
# therial and physical corruption sawping

# when it reaches 0 the atherial corrupted becomes physical (and they are given there corrupted class)
execute if score corrupt_manifestation call_of_corrupted matches 0 run scoreboard players set atherial_corrupted call_of_corrupted 0
# clear the corruptes inventory BEFORE giving them there corrupted class
execute if score corrupt_manifestation call_of_corrupted matches 1 run clear @a[team=corrupted]
execute if score corrupt_manifestation call_of_corrupted matches 1 run scoreboard players set corrupt_manifestation call_of_corrupted 0

#==========================================================================================================================================================================================
#damage
execute as @a if score @s hit matches 1.. run scoreboard players remove @s health 1
execute as @a if score @s hit matches 1.. run scoreboard players reset @s hit

#========================================================================================================================================================================================
#corrupted death
execute if score @a[team=corrupted,limit=1] corruption matches 100.. run function ctnv:alternate_gamemode_functions/call_of_corrupted_death


#========================================================================================================================================================================================
# passivly spawned zombies

# calulate max spawners
# how to calulate 
# 1. have 3 as a base
# 2. add the difuculty variable.
# the final result shall be max spawners
scoreboard players set max_spawners call_of_corrupted 3
scoreboard players operation max_spawners call_of_corrupted += setting ST____COC_difuculty
# check if current spawners are = max spawners
execute if score spawners call_of_corrupted < max_spawners call_of_corrupted at @a[team=corrupted] run summon bat ~ ~10 ~ {PersistenceRequired:1b,Silent:1b,Team:corrupted}
effect give @e[type=bat] invisibility infinite 1 true
# the bats can still be seen. so i will make them tiny
#execute as @e[type=bat] run attribute @s scale base set 0.1

# every bat will update the count
scoreboard players set spawners call_of_corrupted 0
execute as @e[type=bat,team=corrupted] run scoreboard players add spawners call_of_corrupted 1


# to do this we need a system of flying bats that are invisable.
# these bats will do the folowing while flying around

# start by setting up the spawing timer
# more mobs will be spawned in more frequently as the dificulty increases, as well as the wave
# there need to be a separate cooldown timer to make sure that the operations can orrurt
# to caltulate the spawning timer we will need to do a few steps
# 1. set the timer to 850
# 2. subtract by the dificulty number (0, 1 ,2) multiple times
# 3. subtract by the wave number
# 4. divide by 2
# 5. if the sore at the end is below 40 set it to 40

execute if score time spawn matches 0 run scoreboard players set enable spawn 0

#1.
execute if score enable spawn matches 0 run scoreboard players set time spawn 850
#2.
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= setting ST____COC_difuculty
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= setting ST____COC_difuculty
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= setting ST____COC_difuculty

#3.
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= wave call_of_corrupted
execute if score enable spawn matches 0 run scoreboard players operation time spawn -= wave call_of_corrupted

#4.
execute if score enable spawn matches 0 run scoreboard players operation time spawn /= multiplyer call_of_corrupted
#5.
execute if score enable spawn matches 0 if score time spawn matches ..40 run scoreboard players set time spawn 40

#re enable time
execute if score enable spawn matches 0 run scoreboard players set enable spawn 1
#start counting down
execute if score enable spawn matches 1 run scoreboard players remove time spawn 1

# actually summon mobs

# 1. summon an armorstand (so that it can drop)
# 2. the armorstand spawns in a mob
# 3. the stand dies

# if the spawn time is less than 40 start summoing the armorstand
execute if score time spawn matches 39 at @e[type=bat] run summon armor_stand ~ ~1 ~ {Invisible:1b,Small:1b,DisabledSlots:1966080,Invulnerable:1b,Silent:1b,Tags:["mob_spawn"]}
# wait for the armorstand to drop
execute if score time spawn matches ..20 at @e[tag=mob_spawn] run particle dust{color:[0.88,0.0,1.0],scale:4} ~ ~ ~ 0.3 1 0.3 100 50 force @a
execute if score time spawn matches ..20 at @e[tag=mob_spawn] run particle end_rod ~ ~1 ~ 0 0 0 1 1 force @a

# spawn the mob
# this will require its own function
execute if score time spawn matches 3 as @e[tag=mob_spawn] at @s run function ctnv:alternate_gamemode_functions/call_of_corrupted/mob_spawn
# rng for the mob spawning
execute unless score time spawn matches ..10 run scoreboard players add rng spawn 2
execute if score rng spawn matches 100.. run scoreboard players set rng spawn 0
execute if score rng spawn matches ..0 run scoreboard players set rng spawn 1


# kill the amrorstand
# teleport a random bat to the corrupted just in case
execute if score time spawn matches 2 run tp @e[type=bat,limit=1] @a[team=corrupted,limit=1]

execute if score time spawn matches ..1 as @e[tag=mob_spawn] run kill @s
# in the event that the scoreboard varibles are not there during testing (this code did not run during playtesting)
scoreboard players add time spawn 0
scoreboard players add rng spawn 0
scoreboard players add enable spawn 0
# this code will make sure that all the varibles for this entire section actually run
#==============================================================================================================================================


# runner death
# if the runner has -100 health just kill them.. take them off the bouncer list and all that fun stuff

execute as @a[scores={health=..-100},team=runners] run tellraw @a [{"color":"red","selector":"@s"},{"color":"red","text":" DIED"}]
execute as @a[scores={health=..-100},team=runners] run title @s title [{"color":"red","text":"YOU DIED"}]
execute as @a[scores={health=..-100},team=runners] run scoreboard players reset @s bouncer_list
execute as @a[team=dead] run gamemode spectator @s




# game over logic
# runners alive logic
execute if score count runners_alive matches 1.. run scoreboard players set count runners_alive 0
execute as @a[team=runners,scores={health=1..}] run scoreboard players add count runners_alive 1
# if it its 0 the game is over
execute if score count runners_alive matches 0 run title @a title [{"text":"GAME OVER","color":"dark_red"}]
execute if score count runners_alive matches 0 run title @a subtitle [{"text":"you survived: ","color":"dark_red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"dark_red"},"waves"]
execute if score count runners_alive matches 0 if score reset runners_alive matches -5 run tellraw @a [{"text":"everyone died at wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"dark_red"},"  \n What a shame."]

# now we wait a little before resetting
execute if score count runners_alive matches 0 run scoreboard players remove reset runners_alive 1
execute if score reset runners_alive matches -200 run kill @e[team=corrupted,type=!player]
execute if score reset runners_alive matches -200 run reload
#=======================================================================================================================================
#nautral regeneration logic.
# this code does has a few conditions
# 1. check if the time says 30 seconds
# 2. check if the player is already at max health
# 3. check if nautral regen is even on
# 4. check if the tick is 10
execute as @a[team=runners] if score tick time matches 10 if score seconds time matches 30 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 unless score @s health matches ..0 run scoreboard players add @s health 1
# particles to indicate healing
execute as @a[team=runners] at @s if score seconds time matches 30 unless score @s health = @a[limit=1] ST____max_health if score @a[limit=1] ST____nautral_regen matches 0 run particle minecraft:happy_villager ~ ~1 ~ 0.2 1 0.2 1 5 force @a
# if the pleyers helth is greater then the max health. set it to the max health
execute as @a[team=runners] if score @s health > @a[limit=1,scores={ST____max_health=1..}] ST____max_health unless score @s health matches ..0 run scoreboard players operation @s health = @a[limit=1,scores={ST____max_health=1..}] ST____max_health

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
# items using the old system need this so that they may not immidatly trigger when given to the corrupted
# corrupted
execute as @a[scores={evil_class=1}] if score atherial_corrupted call_of_corrupted matches 1 if score @s classic_corrupted_t1_cooldown matches ..10 run scoreboard players set @s classic_corrupted_t1_cooldown 10
execute as @a[scores={evil_class=1}] if score atherial_corrupted call_of_corrupted matches 1 if score @s classic_corrupted_t1_cooldown matches ..10 run scoreboard players set @s classic_corrupted_t2_cooldown 9
execute as @a[scores={evil_class=1}] if score atherial_corrupted call_of_corrupted matches 1 if score @s classic_corrupted_t1_cooldown matches ..10 run scoreboard players set @s classic_corrupted_t3_cooldown 8

execute as @a[scores={evil_class=2}] if score atherial_corrupted call_of_corrupted matches 1 if score @s predator_corrupted_t2_cooldown matches ..10 run scoreboard players set @s predator_corrupted_t2_cooldown 9
execute as @a[scores={evil_class=2}] if score atherial_corrupted call_of_corrupted matches 1 if score @s predator_corrupted_t3_cooldown matches ..10 run scoreboard players set @s predator_corrupted_t3_cooldown 8

execute as @a[scores={evil_class=3}] if score atherial_corrupted call_of_corrupted matches 1 if score @s apparition_light_level matches 1 run scoreboard players set @s apparition_light_level 0
execute as @a[scores={evil_class=3}] if score atherial_corrupted call_of_corrupted matches 1 if score @s apparition_corrupted_t2_cooldown matches ..10 run scoreboard players set @s apparition_corrupted_t2_cooldown 9

execute as @a[scores={evil_class=4}] if score atherial_corrupted call_of_corrupted matches 1 if score @s hunter_corrupted_t2_trap matches ..10 run scoreboard players set @s hunter_corrupted_t2_trap 20
execute as @a[scores={evil_class=4}] if score atherial_corrupted call_of_corrupted matches 1 if score @s hunter_corrupted_t1_trap matches ..10 run scoreboard players set @s hunter_corrupted_t1_trap 20
execute as @a[scores={evil_class=4}] if score atherial_corrupted call_of_corrupted matches 1 if score @s hunter_corrupted_t3_trap matches ..10 run scoreboard players set @s hunter_corrupted_t3_trap 20
execute as @a[scores={evil_class=4}] if score atherial_corrupted call_of_corrupted matches 1 if score @s hunter_corrupted_t1_cooldown matches ..10 run scoreboard players set @s hunter_corrupted_t1_cooldown 10

execute as @a[scores={evil_class=5}] if score atherial_corrupted call_of_corrupted matches 1 if score @s knight_corruption_blocker matches ..10 run scoreboard players set @s knight_corruption_blocker 10
execute as @a[scores={evil_class=5}] if score atherial_corrupted call_of_corrupted matches 1 if score @s knight_reveal_players matches ..10 run scoreboard players set @s knight_reveal_players 10
execute as @a[scores={evil_class=5}] if score atherial_corrupted call_of_corrupted matches 1 if score @s knight_speed_boost matches ..10 run scoreboard players set @s knight_speed_boost 10

execute as @a[scores={evil_class=6}] if score atherial_corrupted call_of_corrupted matches 1 if score @s dark_star_darkness matches ..10 run scoreboard players set @s dark_star_darkness 10
execute as @a[scores={evil_class=6}] if score atherial_corrupted call_of_corrupted matches 1 if score @s dark_star_speed_boost matches ..10 run scoreboard players set @s dark_star_speed_boost 10
execute as @a[scores={evil_class=6}] if score atherial_corrupted call_of_corrupted matches 1 if score @s dark_star_supernova matches ..10 run scoreboard players set @s dark_star_supernova 10
execute as @a[scores={evil_class=6}] if score atherial_corrupted call_of_corrupted matches 1 if score @s dark_star_supernova matches 170.. run scoreboard players set @s dark_star_supernova 169

# extra corrupted classes will be added later

# the corrupted one cannot have the glowing effect
execute as @a[team=corrupted] run effect clear @s glowing
# the knight will have knockback resistance. everone who is not the knight will not have that
attribute @r[team=runners] knockback_resistance base reset

#=================================================================================================
# trap management

function ctnv:classes/trap_management

# as of right now the stunman, hunter, and fisherman are the only classes that can place traps
# if traps are disabled kill all traps
execute if score limit trap_stats matches 0 run kill @e[tag=corrupted_t1_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=corrupted_t2_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=corrupted_t3_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=stunman_trap]
execute if score limit trap_stats matches 0 run kill @e[tag=fishing_net_trap]

#=================================================================================================

# this code was stolen from the archer class
# ammo does not regenerate by the way
# check if the runners use up there ammo
execute as @a if score @s bow_shot matches 1.. run clear @s arrow
execute as @a if score @s bow_shot matches 1.. run scoreboard players remove @s acher_arrow_count 1
execute as @a if score @s bow_shot matches 1.. run scoreboard players reset @s bow_shot

# kill stationary arrows
kill @e[type=arrow,nbt={inGround:1b}]

#All runners shall have arrows in there 9th slot

# make sure that arrows cannot be duped or manipulated
execute as @a[team=runners] unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:8b}]}] run clear @s arrow
execute as @a[team=runners] if entity @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:arrow"}}]

# since there can be a max of 99 we need a function to handle the code
#there shall be multiple ammo types
#0 = default
#1 = explosion
execute as @a[team=runners] unless entity @s[nbt={Inventory:[{id:"minecraft:arrow",Slot:8b}]}] if score @s ammo_type matches 0 run function ctnv:one_time_function/ammotype___0

#=======================================================================================================================================
# runner ablilitys
execute if score count runners_alive matches 1.. as @a[team=runners] if score @s downed matches 0 run function ctnv:alternate_gamemode_functions/call_of_corrupted/runner_class_ablilitys

# totem of undting
# make sure he cant drop it
execute as @a[team=runners] run execute if score @s ITEM____totem_of_undying matches 1 run kill @e[type=item,nbt={Item:{id:"minecraft:totem_of_undying"}}]
execute as @a[team=runners] run execute if score @s ITEM____totem_of_undying matches 1 run give @s totem_of_undying
execute as @a[team=runners] run execute if score @s ITEM____totem_of_undying matches 1 run scoreboard players reset @s ITEM____totem_of_undying

#check if he is holding it and if the health is 0
execute as @a[team=runners] run execute if score @s health matches ..0 if entity @s[nbt={SelectedItem:{id:"minecraft:totem_of_undying"}}] run scoreboard players set @s ITEM____totem_of_undying 3
# do the revive
execute as @a[team=runners] run execute if score @s ITEM____totem_of_undying matches 3 run clear @s totem_of_undying
execute as @a[team=runners] run execute if score @s ITEM____totem_of_undying matches 3 run scoreboard players operation @s health = setting ST____max_health
execute as @a[team=runners] at @s run execute if score @s ITEM____totem_of_undying matches 3 run particle totem_of_undying ~ ~1 ~ 0.5 1 0.5 1 200 force @a
execute as @a[team=runners] at @s run execute if score @s ITEM____totem_of_undying matches 3 run playsound item.totem.use player @a ~ ~ ~ 1 1
execute as @a[team=runners] at @s run execute if score @s ITEM____totem_of_undying matches 3 run scoreboard players set @s downed 0

# reset
execute as @a[team=runners] run execute if score @s ITEM____totem_of_undying matches 3 run scoreboard players reset @s ITEM____totem_of_undying


#========================================================================================================================================================================================



# prevent runners from ACTUALLY dying
effect give @a[team=runners] resistance 2 3 true
# when a runner has the health of 0 he goes down and would need to be revived
#execute as @a[team=runners] if score @s health matches 1.. run attribute @s scale base reset
#execute as @a[team=runners] if score @s health matches ..0 run attribute @s scale base set 0.5
execute as @a[team=runners] if score @s health matches ..0 run effect give @s slowness 1 2 true


# there is a glitch where the shulkers keeping the downed players down are not loayal to there spesific person.
# it is clear that this method will only work, if each shulker, has a unique id assigned to each player with an id

execute as @a[team=runners] if score @s health matches ..1 at @s run function ctnv:one_time_function/downed_player_enforcement
effect give @e[type=shulker,tag=!wall] invisibility infinite 1 true
# the mobs will coaless on top of the shulker, this is bad and needs to be fixed
execute as @e[type=!shulker,tag=!wall,team=corrupted] at @s positioned ~ ~-1 ~ if entity @e[type=shulker,tag=!wall,distance=..0.6] run tp @s ~ ~-1 ~

#particle
execute as @a[team=runners] if score @s health matches ..0 run effect give @s wither 1 0 true

# do an annoucenement in chat
execute as @a[team=runners] if score @s downed matches 1 run tellraw @a [{"color":"gold","selector":"@s"},{"color":"gold","text":" IS DOWN! "}]
# for some reason this code does not run. unless i do it manually
# its weird. because sometimes this code breeaks and sometimes it works
# if a runner dies they should have only 1 tick to be at  "0" health... for multiple reasons
#1. should not be able to nautraly regenerate back into the game
#2. the previous bug that spams the chat and for some reason makes the shulker boxes visable
# the bug is still not fixed. a new function will be needed to work around this crap
# i wish i could just use the health variable to do this but no, it had to play the "fuck you" game
# for some reason if the runners health becomes 0 it may never go lower, and there no way to tell whats doing it
execute as @a[team=runners] if score @s health matches 0 run scoreboard players set @s health -1
# this one above may sometime not work, i cant find out why. so im developing a failsafe
execute as @a[team=runners] if score @s health matches ..0 if score @s downed matches 1 run scoreboard players add @s downed 1
execute as @a[team=runners] if score @s health matches ..0 if score @s downed matches 0 run scoreboard players add @s downed 1
execute as @a[team=runners] if score @s health matches 1.. run scoreboard players set @s downed 0
# the fact that this bug is so inconsistent and unpredictable is so genuenly infuriating.
# one consequence of this bug is that sometimes properly "dying" may not be possible some games

# if a fellow runners crouches next to a downed player they will come back to life

# downed runners cannot be invisable
execute as @a[team=runners] if score @s downed matches 1.. run effect clear @s invisibility

# if the runner is crouching NOT next to another runner then just reset
execute as @a[team=runners] at @s if score @s crouch_time matches 1.. if entity @a[distance=..1.5,team=runners,scores={health=..0}] unless score @s health matches ..0 run particle happy_villager ~ ~ ~ 1 1 1 1 1 force @a
# do the actual reviving
execute as @a[team=runners] at @s if score @s crouch_time matches 1.. if entity @a[distance=..1.5,team=runners,scores={health=..0}] unless score @s health matches ..0 run function ctnv:one_time_function/revive

# if the player is not crouching reset the score
execute as @a[team=runners] at @s if score @s crouch_time matches 1.. unless entity @a[distance=..1.5,team=runners,scores={health=..0}] unless score @s health matches ..0 run scoreboard players set @s crouch_time 0
#========================================================================================================================================================================================
# loot managmement
# completly different

#========================================================================================================================================================================================
# breaking barriers
# give the runners a way to spend there money

# every barrier has a different price.
# when a runner hits it, it must check if the player has enough money to break it
# if he does, then the barrier is broken and the money is removed from the player

#1. make sure that the magma cube lock is NOT killed with brute force
effect give @e[type=magma_cube] regeneration 5 255 true
effect give @e[type=magma_cube] absorption 5 255 true

# 1.5 if a shulker block is inside another block it will make a noise. thats bad
# we must kill all shulker blocks that are inside other blocks
execute as @e[tag=wall,type=magma_cube] at @s unless block ~ ~ ~ minecraft:air run kill @s


#2. do the price check
# this function runs more than once so that will have to account for that
#nvm i fixed it
execute as @e[type=minecraft:magma_cube] if entity @s[nbt={HurtTime:1s}] run function ctnv:alternate_gamemode_functions/call_of_corrupted/wall_price_check


#=================================================================================================
# secret corrupted supercharge "domain expansion"
execute if score enable corrupted_domain_enable matches 1 run function ctnv:corrupted_supercharge_ability/corrupted_domain_expantion