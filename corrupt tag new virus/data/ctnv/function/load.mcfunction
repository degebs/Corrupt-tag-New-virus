
# ▄████▄   ▒█████   ██▀███   ██▀███   █    ██  ██▓███  ▄▄▄█████▓   ▄▄▄█████▓ ▄▄▄        ▄████     ███▄    █ ▓█████  █     █░    ██▒   █▓ ██▓ ██▀███   █    ██   ██████ 
#▒██▀ ▀█  ▒██▒  ██▒▓██ ▒ ██▒▓██ ▒ ██▒ ██  ▓██▒▓██░  ██▒▓  ██▒ ▓▒   ▓  ██▒ ▓▒▒████▄     ██▒ ▀█▒    ██ ▀█   █ ▓█   ▀ ▓█░ █ ░█░   ▓██░   █▒▓██▒▓██ ▒ ██▒ ██  ▓██▒▒██    ▒ 
#▒▓█    ▄ ▒██░  ██▒▓██ ░▄█ ▒▓██ ░▄█ ▒▓██  ▒██░▓██░ ██▓▒▒ ▓██░ ▒░   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░▄▄▄░   ▓██  ▀█ ██▒▒███   ▒█░ █ ░█     ▓██  █▒░▒██▒▓██ ░▄█ ▒▓██  ▒██░░ ▓██▄   
#▒▓▓▄ ▄██▒▒██   ██░▒██▀▀█▄  ▒██▀▀█▄  ▓▓█  ░██░▒██▄█▓▒ ▒░ ▓██▓ ░    ░ ▓██▓ ░ ░██▄▄▄▄██ ░▓█  ██▓   ▓██▒  ▐▌██▒▒▓█  ▄ ░█░ █ ░█      ▒██ █░░░██░▒██▀▀█▄  ▓▓█  ░██░  ▒   ██▒
#▒ ▓███▀ ░░ ████▓▒░░██▓ ▒██▒░██▓ ▒██▒▒▒█████▓ ▒██▒ ░  ░  ▒██▒ ░      ▒██▒ ░  ▓█   ▓██▒░▒▓███▀▒   ▒██░   ▓██░░▒████▒░░██▒██▓       ▒▀█░  ░██░░██▓ ▒██▒▒▒█████▓ ▒██████▒▒
#░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░  ▒ ░░        ▒ ░░    ▒▒   ▓▒█░ ░▒   ▒    ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▓░▒ ▒        ░ ▐░  ░▓  ░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒ ▒ ▒▓▒ ▒ ░
#  ░  ▒     ░ ▒ ▒░   ░▒ ░ ▒░  ░▒ ░ ▒░░░▒░ ░ ░ ░▒ ░         ░           ░      ▒   ▒▒ ░  ░   ░    ░ ░░   ░ ▒░ ░ ░  ░  ▒ ░ ░        ░ ░░   ▒ ░  ░▒ ░ ▒░░░▒░ ░ ░ ░ ░▒  ░ ░
#░        ░ ░ ░ ▒    ░░   ░   ░░   ░  ░░░ ░ ░ ░░         ░           ░        ░   ▒   ░ ░   ░       ░   ░ ░    ░     ░   ░          ░░   ▒ ░  ░░   ░  ░░░ ░ ░ ░  ░  ░  
#░ ░          ░ ░     ░        ░        ░                                         ░  ░      ░             ░    ░  ░    ░             ░   ░     ░        ░           ░  
#░                                                                                                                                  ░                                  
# welcome to corrupt tag:new virus: by Degebs
# any wouldbe modder is welcome to study this code
# you may notice that there is more comments than code, this is because in the original there was almost no comments
# and if you EVER try to understand minecraft command code without comments you will go insane
# anyway its time for the code to start running.

tellraw @a ["",{"text":"wellcome to","color":"blue"},{"text":" ","color":"light_purple"},{"text":"Corrupt tag:new virus","color":"dark_purple","bold":true},"\n "]
tellraw @a [{"text":"1.2.5.5","color":"dark_purple","bold":true},"\n "]

#set up all gamerules
gamerule minecraft:block_drops false
gamerule minecraft:spawn_mobs false
gamerule minecraft:advance_time false
time set day
gamerule minecraft:drowning_damage false
gamerule minecraft:command_block_output false
gamerule minecraft:fire_damage false
gamerule minecraft:show_death_messages false
gamerule minecraft:mob_griefing false
gamerule minecraft:fall_damage false
gamerule minecraft:advance_weather false
gamerule minecraft:respawn_radius 0
gamerule minecraft:immediate_respawn true
weather clear
gamerule minecraft:show_death_messages false
gamerule minecraft:freeze_damage false
gamerule minecraft:send_command_feedback false
difficulty easy
clear @a
gamerule minecraft:locator_bar false
gamerule allow_entering_nether_using_portals false
gamerule fire_spread_radius_around_player 0



# --------------------------------------------------------------------------------------------
# all variables must be established 
scoreboard players reset @a

#---------game state variable--------------
scoreboard objectives add state dummy
scoreboard players set game state 0
scoreboard players set endgame state 0


#--------universal timer variable--------------
scoreboard objectives add time dummy
scoreboard players set drop_detect_function_Delay time 5
scoreboard players set tick time 0
scoreboard players set 360 time 0
# this variable is used so that sertan togles can work properly
scoreboard players set seconds time 0
scoreboard players set minutes time 0
scoreboard players set hours time 0

#--------countdown variable--------------
# normaly the countdown variable is 30, but for quick testing i set it to 5
scoreboard players set countdown time 30
# this variable is used to keep track of the countdown
# dont forget to reset this thing after its done being used

#--------------item drop delay variable === DO NOT FORGET TO RESET THIS VARIABLE WHEN THE GAME RESETS
scoreboard players set drop_detect_function_Delay time 5


#-debug toggle switch---------------------------
scoreboard objectives add debug dummy
scoreboard players set toggle debug 1
# there is another variable for counting map beacons its in the map beacon create function


# --------------------------------------------------------------------------------------------
# create all teams
#remove it before rejoining it
team remove party_lead
team add party_lead
team modify party_lead color blue
team add dead
team modify dead color black
scoreboard players set overide_party_leader state 0

team add runners
team add corrupted


#--------------add the variables that check on how many platers there are
#====THIS FUNCTION CANNOT BE RUN AGAIN AFTER IT IS RAN ONCE
scoreboard objectives add playerlist dummy
scoreboard objectives add players_online dummy

#--------------setting up title commands----------------
title @a times 2 50 5


# --------------------------------------------------------------------------------------------
# create the scoreboards needed to keep track of player classes (very important) both normal and corrupted classes are here
#there are 6 of each class and they will be kept track with a number
scoreboard objectives add class trigger
scoreboard players set negitive class -1
scoreboard objectives add evil_class trigger

#--------------------------------------------class related variables----------------------------------------------------
# the bulk item delay
scoreboard objectives add bulk dummy
# the bulk totem counter
scoreboard objectives add bulk_totem dummy
# the medic healing rose
scoreboard objectives add medic_heal dummy
scoreboard players set medic_totem_rotation medic_heal 0
# and also the miners golden nugget
scoreboard players set miner_totem_rotation medic_heal 0
#the archer arrow count
scoreboard objectives add acher_arrow_count dummy
scoreboard objectives add bow_shot minecraft.used:bow
# the assassins crouch invis and his ink sack
scoreboard objectives add assassin_charge dummy
scoreboard objectives add assassin_hide minecraft.custom:sneak_time
# stunman variables
scoreboard objectives add trident_throw minecraft.used:trident
scoreboard objectives add stunman_trap dummy
#fisherman trap
scoreboard objectives add fishing_net_trap dummy
# miner lantern
scoreboard objectives add miner_lantern dummy

# classic corrupted cooldowns
scoreboard objectives add classic_corrupted_t1_cooldown dummy
scoreboard objectives add classic_corrupted_t2_cooldown dummy
scoreboard objectives add classic_corrupted_t3_cooldown dummy
# classic corrupted fruit eating detection
scoreboard objectives add corruption_fruit_eat minecraft.used:minecraft.chorus_fruit
# predator corrupted cooldowns
scoreboard objectives add predator_t1_speed_range dummy
scoreboard objectives add predator_corrupted_t2_cooldown dummy
scoreboard objectives add predator_corrupted_t3_cooldown dummy
# apparition corrupted cooldowns
scoreboard objectives add apparition_corrupted_t3_cooldown dummy
#scoreboard objectives add light_level blocklight
scoreboard objectives add apparition_light_level dummy
scoreboard objectives add apparition_corrupted_t2_cooldown dummy
scoreboard objectives add apparition_enderperal used:ender_pearl
# manhunter
scoreboard objectives add manhunter_cooldown dummy
scoreboard objectives add manhunter_horn_blow_detect minecraft.used:minecraft.goat_horn
scoreboard objectives add manhunter_horn_blow_delay dummy
#scoreboard objectives add apparition_corrupted_t3_cooldown dummy

# hunter cooldowns
scoreboard objectives add hunter_corrupted_t1_cooldown dummy
scoreboard objectives add hunter_corrupted_t1_trap dummy
scoreboard objectives add hunter_corrupted_t2_trap dummy
scoreboard objectives add hunter_corrupted_t3_trap dummy

# knight cooldowns
scoreboard objectives add knight_speed_boost dummy
scoreboard objectives add knight_reveal_players dummy
scoreboard objectives add knight_corruption_blocker dummy

#dark star cooldowns
scoreboard objectives add dark_star_darkness dummy
scoreboard objectives add dark_star_speed_boost dummy
scoreboard objectives add dark_star_supernova dummy


execute unless entity @e[tag=life_detector] run tellraw @a ["",{"text":"the life detector is missing. fixing!","color":"yellow"}]
execute unless entity @e[tag=life_detector] run tellraw @a ["",{"text":"if you see this message, uhh. you shouldnt","color":"yellow"}]

#set up the entity that detects if someone tried to kill @e (this is important for keeping track of map beacons)
# this does not work for some reason
execute unless entity @e[tag=life_detector] at @r run summon armor_stand ~ ~5 ~ {Pose:{LeftLeg:[0f,0f,277f],RightLeg:[0f,0f,65f]},Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,CustomName:[{text:life_detector}],Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["life_detector"]}
# dont do this if the life detector already exists

# for some reason people are experiencing a glitch where all becons DIE and the game breaks
# i cannot replicate this so i am throwing shit at the wall and praying that it goes away
effect give @e[tag=life_detector] glowing infinite 1


scoreboard objectives add life_detector_count dummy



#-----------CALL the function that give a random player the party leader token----
# it is important that this happens LAST
kill @e[type=item]
function ctnv:one_time_function/party_leader/party_leader


#---------------------establish the settings in scoreboard variables-------------------------
# we will use the /trigger command to set the settings witch means that each setting must be its own scoreboard objective, :(
#this is gonna be hard to visualize but it will work
#we are using /trigger because the person who is setting the settings will probably not have access to commands

scoreboard objectives add ST____time_of_day trigger
scoreboard objectives add ST____nautral_regen trigger
scoreboard objectives add ST____corruption_rate trigger
scoreboard objectives add ST____max_health trigger
scoreboard objectives add ST____game_mode trigger
scoreboard objectives add ST____initial_corruption_stun trigger
scoreboard objectives add ST____max_traps trigger
scoreboard objectives add ST____target_tubby_detection trigger
scoreboard objectives add ST____runner_name_tags trigger
scoreboard objectives add ST____super_speed trigger
scoreboard objectives add ST____COC_difuculty trigger
scoreboard objectives add ST____enable_runner_classes trigger
scoreboard objectives add ST____locacor_bar trigger
# --------------------------------------------------------------------------------------------
# for some of the settings the "setting" variable must be set to its default value manually.
# this is just for visual effect.
 scoreboard players set setting ST____corruption_rate 3
scoreboard players set setting ST____initial_corruption_stun 3
scoreboard players set setting ST____max_health 3
scoreboard players set setting ST____max_traps 2
scoreboard players set setting ST____target_tubby_detection 0
scoreboard players set setting ST____game_mode 0
scoreboard players set setting ST____runner_name_tags 0
scoreboard players set setting ST____super_speed 1
scoreboard players set setting ST____COC_difuculty 0
scoreboard players set setting ST____enable_runner_classes 1
scoreboard players set setting ST____locacor_bar 1

# when the game starts for the first time, chanses are that the ammount of map beacons is forgotten, so we can check the life detecter
# and set the map beacon count to the number of life detecters
#execute as @e[tag=life_detector] 
# this has been fixed

# this is to reset the map selector, make sure it does not remember the last map.
scoreboard players set @e[type=minecraft:turtle] map_list 0
scoreboard objectives remove map_list

#--------------------------map beacon scorboard list------------------

scoreboard objectives add map_list dummy
scoreboard objectives add ordered_map_list dummy
scoreboard objectives add 1_base_index_map_list dummy
#clear the map list imidiatly, it will be dynamicly generated later.
execute if score avalable_map_index debug matches 0 run scoreboard players add avalable_map_index debug 1
# it is critical that the avalable map index NEVER GOES DOWN!

scoreboard players set deleted_index debug 0




# cound the maps and add them to the scoreboard
scoreboard players add @e[type=turtle] map_list 0


#----------------------create the scoreboard values for the map beacon selection system----------------
scoreboard objectives add map_selection trigger
scoreboard players reset @a map_selection
#scoreboard players reset @e[type=turtle] map_selection

#-------------------------set up scoreboard for the spawing sircle-------------------------------
# we need to set a new scoreboard for the spawning circle
scoreboard objectives add spawning_circle dummy
scoreboard players reset @e spawning_circle
scoreboard objectives add spawn_circle_count dummy
scoreboard players reset @e spawn_circle_count
kill @e[tag=spawn_point]
scoreboard players set index spawn_circle_count 0

#---------------------give every player a unique id-------------------------------------------
scoreboard objectives add player_ID dummy
scoreboard players reset @a player_ID
scoreboard players reset #nextID player_ID

bossbar set minecraft:game_time visible false
# the player id is used for spawing everyone in around the spawn beacon properly.

# this next playerlist is basically a night club "bouncer" list.
# anyone who is not on the bouncer list will be dead during gameplay.
scoreboard objectives add bouncer_list dummy
# people who joined after the game started are not allowed on the list
# people with a corruption of 100% are not allowed on the list
# people who leave are removed from the list

#--------------------------corruption counters-------------------------------------------------------------
scoreboard objectives add corruption dummy {"text":"Corruption","color":"gold"}
scoreboard players set @a corruption 0

#---------------------------health----------------------------------------------------------
execute as @a run attribute @s max_health base set 20
#------------------------damage detection------------------------------------------------------------
scoreboard objectives add hit minecraft.custom:minecraft.damage_taken
scoreboard objectives add health dummy
scoreboard players reset @a health

#--------------------------- stun----------------------------------------------------------
scoreboard objectives add corruption_stun dummy
# reset stun attributes
execute as @a run attribute @s movement_speed base reset
execute as @a run attribute @s minecraft:entity_interaction_range base reset
execute as @a run attribute @s jump_strength base reset
#-----------------reset the corruption part---------------------------------------------------------------
kill @e[tag=corruption_part]

#--------------------victorty scoreboard (for the various scoreboard timers)----------------------------------
scoreboard objectives add victory dummy
scoreboard players set victory_timer victory 20

#--------------------------------trap stat counter-------------------------------------------------------------
scoreboard objectives add trap_stats dummy


#--------------------------------class selection token cooldown------------------------------------------------
scoreboard objectives add class_selection_cooldown dummy

#--------------------------------target tubby detection------------------------------------------------
scoreboard objectives add current_corrupted dummy
scoreboard objectives add previous_corrupted dummy
# here is where all potential target tubbys go. if there score is 3 then they are a certified target tubby.
# if not then there on thin ice
scoreboard objectives add target_tubby_watchlist dummy
# a scoreboard to identify detect if a player has hit another
scoreboard objectives add hit_targeting minecraft.custom:minecraft.damage_taken
# a separate hit variable is nessasary as usinging the universal one resets before it can be used to detect targeting
scoreboard objectives add target_tubby_punishment_duration dummy

#--------------------------------death scoreboards------------------------------------------------
# remove the scoreboard before adding it
scoreboard objectives remove CORRUPTION_track_for_dead 
scoreboard objectives add CORRUPTION_track_for_dead dummy {"text":"CORRUPTION","color":"dark_purple"}
# the first thing we must is to give all dead players the scoreboard
execute as @a[team=dead] run scoreboard objectives setdisplay sidebar.team.black CORRUPTION_track_for_dead

#---------------------------------hide and reap------------------------------------------------

scoreboard objectives add hide_and_reap_death_trigger dummy
scoreboard objectives add runners_alive dummy

#---------------------------------cranked it---------------------------------

scoreboard objectives add cranked_it_buff_delay dummy


#---------------------------------infection---------------------------------
scoreboard objectives add corruption_combined dummy
scoreboard objectives add chorus_fruit_runners minecraft.used:minecraft.chorus_fruit

# teleport
execute run tp @a @e[tag=lobby,limit=1] 

#-------------------------------call of corrupted------------------------------
scoreboard objectives add call_of_corrupted dummy
scoreboard objectives add points minecraft.custom:damage_dealt
scoreboard objectives add ammo_type dummy
scoreboard objectives add corrupt_manefestation dummy
scoreboard objectives add corrupted_max_health dummy
scoreboard objectives add spawn dummy
scoreboard objectives add crouch_time minecraft.custom:sneak_time
scoreboard objectives add downed dummy
# this "downed" scoreboard is here ONLY to fix a bug that i cannot seem to find

# the items in call of corrupted are unique. as in they are one time use without recharge.
# therefor they have to be stored sepparatly

# items
scoreboard objectives add ITEM____jump_candle minecraft.dropped:cyan_candle
scoreboard objectives add ITEM____healing_rose minecraft.dropped:poppy
scoreboard objectives add ITEM____stunman_trap minecraft.dropped:prismarine_brick_slab
scoreboard objectives add ITEM____totem_of_undying minecraft.dropped:totem_of_undying
scoreboard objectives add ITEM____fisherman_trap minecraft.dropped:cobweb
scoreboard objectives add ITEM____speed_ink minecraft.dropped:ink_sac
scoreboard objectives add ITEM____bow minecraft.dropped:bow
scoreboard objectives add ITEM____trident minecraft.dropped:trident
scoreboard objectives add ITEM____speed_buff minecraft.dropped:heart_of_the_sea
scoreboard objectives add ITEM____invis_watch minecraft.dropped:clock

# corrupted items
scoreboard objectives add WAVE_rat minecraft.dropped:silverfish_spawn_egg
scoreboard objectives add WAVE_zombie minecraft.dropped:zombie_spawn_egg
scoreboard objectives add WAVE_skeleton minecraft.dropped:skeleton_spawn_egg
scoreboard objectives add WAVE_zombie_elite minecraft.dropped:husk_spawn_egg
scoreboard objectives add WAVE_skeleton_elite minecraft.dropped:wither_skeleton_spawn_egg
scoreboard objectives add WAVE_phantom minecraft.dropped:phantom_spawn_egg
scoreboard objectives add WAVE_phantom_elite minecraft.dropped:allay_spawn_egg
scoreboard objectives add WAVE_phantom_laser minecraft.dropped:guardian_spawn_egg
scoreboard objectives add WAVE_stray minecraft.dropped:stray_spawn_egg
scoreboard objectives add WAVE_stray_elite minecraft.dropped:ghast_spawn_egg
scoreboard objectives add WAVE_creeper minecraft.dropped:creeper_spawn_egg
scoreboard objectives add WAVE_mini_creeper minecraft.dropped:bogged_spawn_egg
scoreboard objectives add WAVE_pillager minecraft.dropped:pillager_spawn_egg
scoreboard objectives add WAVE_vindicator minecraft.dropped:vindicator_spawn_egg
scoreboard objectives add WAVE_pilager_raid minecraft.dropped:ravager_spawn_egg
scoreboard objectives add WAVE_imidiate_manefestation minecraft.dropped:warden_spawn_egg
scoreboard objectives add WAVE_summon_wall minecraft.dropped:wandering_trader_spawn_egg

#lootbox
scoreboard objectives add lootbox dummy


# this one is used as a timer. similar to the nautral zombie spwaning
# scoreboard objectives add WAVE_trigger dummy
# on secont thought this part may not be nessasary

#-------------------------------join game------------------------------
# for the players who joined the game tp them to the loby beacon
# hard reset it every time
scoreboard objectives remove playtime
scoreboard objectives add playtime minecraft.custom:time_since_rest

#-------------------------------only 1 corrupted------------------------------------------------
scoreboard objectives add only_one_corrupted dummy

#-------------------------------reset counter------------------------------
# this function is used to detect when someone is spamming the /reload command
# people (imsqeker) would do this in order to become party leader.
# hovever there is a function that can do this much better. they just keep forgetting to use it
scoreboard objectives add reload_spam dummy
scoreboard players add count reload_spam 1

#-------------------------------ignore this one. this is for revenge-----------------------------
scoreboard objectives add revenge trigger
scoreboard players reset @a revenge


#-------------------------------calling cards------------------------------
scoreboard objectives add runner_class_victory_calling_card dummy
scoreboard players set enable runner_class_victory_calling_card 0
scoreboard objectives add running_distance minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add dark_star_nuke dummy
scoreboard objectives add first_blood dummy
scoreboard objectives add firt_endgame_blood dummy
scoreboard players add enable first_blood 0
scoreboard players add enable firt_endgame_blood 0
scoreboard objectives add weasel dummy
scoreboard objectives add crouch_time_calling_card minecraft.custom:sneak_time
scoreboard objectives add absence dummy
scoreboard objectives add damage_dealt_to_corrupted minecraft.custom:damage_dealt
scoreboard objectives add observer dummy
scoreboard objectives add escape_artist dummy
scoreboard objectives add shout dummy

# yes i am aware that there are multiple scoreboard with the same objective type. this is here because each one is treated differently
# they are cleared under different conditions

#-------------------------------fishing rod ability------------------------------
scoreboard objectives add fish_assist dummy


#-------------------------------bulk shield camping fix------------------------------
scoreboard objectives add shield_breaker dummy


#-------------------------------secret corrupted domain expantion------------------------------
scoreboard objectives add corrupted_supercharge dummy
scoreboard objectives add corrupted_supercharge_detection minecraft.custom:sneak_time
scoreboard objectives add corrupted_supercharge_secondary_validation dummy

scoreboard objectives add corrupted_domain_enable dummy
scoreboard players set enable corrupted_domain_enable 0
scoreboard players set the_eye_of_pain corrupted_domain_enable 0

scoreboard players reset hive_mind corrupted_supercharge 
scoreboard players reset the_maker corrupted_supercharge 
scoreboard players reset armageddion corrupted_supercharge 
scoreboard players reset blocker_blob corrupted_supercharge 
scoreboard players reset rain_of_spiders corrupted_supercharge 
scoreboard players reset souls_of_the_damned corrupted_supercharge 
scoreboard players reset orbital_strike corrupted_supercharge 
scoreboard players reset dimentional_merge corrupted_supercharge 

scoreboard players set hive_mind_kill corrupted_supercharge 0
scoreboard players set blob_kill corrupted_supercharge 0

scoreboard objectives add armageddion_logic dummy
scoreboard players set time armageddion_logic 0

scoreboard objectives add rain_of_spiders_logic dummy
scoreboard players set time rain_of_spiders_logic 0

scoreboard objectives add souls_of_the_damned_logic dummy
scoreboard players set kills souls_of_the_damned_logic 0
scoreboard players set count souls_of_the_damned_logic 0
scoreboard players set max_count souls_of_the_damned_logic 0

scoreboard objectives add orbital_strike_logic dummy
scoreboard players set time orbital_strike_logic 0


