# this function removes all scoreboard functions completely breaking the game
scoreboard players reset @a
scoreboard objectives remove state
scoreboard players set game state 0
scoreboard players set endgame state 0
scoreboard objectives remove time
scoreboard players set tick time 0
scoreboard players set 360 time 0
scoreboard players set seconds time 0
scoreboard players set minutes time 0
scoreboard players set hours time 0
scoreboard players set countdown time 30
scoreboard players set drop_detect_function_Delay time 5
scoreboard objectives remove debug
scoreboard players set toggle debug 1
team remove party_lead
team add party_lead
team modify party_lead color blue
team add dead
team modify dead color black
scoreboard players set overide_party_leader state 0
team add runners
team add corrupted
scoreboard objectives remove playerlist
scoreboard objectives remove players_online
title @a times 2 50 5
scoreboard objectives remove class 
scoreboard objectives remove evil_class 
scoreboard objectives remove bulk
scoreboard objectives remove bulk_totem
scoreboard objectives remove medic_heal
scoreboard players set medic_totem_rotation medic_heal 0
scoreboard objectives remove acher_arrow_count
scoreboard objectives remove bow_shot
scoreboard objectives remove assassin_charge
scoreboard objectives remove assassin_hide 
scoreboard objectives remove trident_throw 
scoreboard objectives remove stunman_trap
scoreboard objectives remove fishing_net_trap
scoreboard objectives remove classic_corrupted_t1_cooldown
scoreboard objectives remove classic_corrupted_t2_cooldown
scoreboard objectives remove classic_corrupted_t3_cooldown
scoreboard objectives remove corruption_fruit_eat
scoreboard objectives remove predator_t1_speed_range
scoreboard objectives remove predator_corrupted_t2_cooldown
scoreboard objectives remove predator_corrupted_t3_cooldown
scoreboard objectives remove apparition_light_level
scoreboard objectives remove apparition_corrupted_t2_cooldown
scoreboard objectives remove hunter_corrupted_t1_cooldown
scoreboard objectives remove hunter_corrupted_t1_trap
scoreboard objectives remove hunter_corrupted_t2_trap
scoreboard objectives remove hunter_corrupted_t3_trap
scoreboard objectives remove knight_speed_boost
scoreboard objectives remove knight_reveal_players
scoreboard objectives remove knight_corruption_blocker
scoreboard objectives remove dark_star_darkness
scoreboard objectives remove dark_star_speed_boost
scoreboard objectives remove dark_star_supernova
execute unless entity @e[tag=life_detecter] run summon armor_stand ~ 0 ~ {Pose:{LeftLeg:[0f,0f,277f],RightLeg:[0f,0f,65f]},Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:1966080,CustomName:[{text:life_detector}],Invulnerable:1b,NoGravity:1b,Silent:1b,Tags:["life_detector"]}
kill @e[type=item]
function ctnv:one_time_function/party_leader/party_leader
scoreboard objectives remove ST____time_of_day 
scoreboard objectives remove ST____nautral_regen 
scoreboard objectives remove ST____corruption_rate 
scoreboard objectives remove ST____max_health 
scoreboard objectives remove ST____game_mode 
scoreboard objectives remove ST____initial_corruption_stun 
scoreboard objectives remove ST____max_traps 
scoreboard objectives remove ST____target_tubby_detection 
scoreboard objectives remove ST____runner_name_tags 
scoreboard objectives remove ST____super_speed 
scoreboard objectives remove ST____COC_difuculty 
scoreboard objectives remove ST____enable_runner_classes 
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
scoreboard players set @e[type=:turtle] map_list 0
scoreboard objectives remove map_list
scoreboard objectives remove map_list
#scoreboard objectives remove ordered_map_list
# not this one
execute if score avalable_map_index debug matches 0 run scoreboard players add avalable_map_index debug 1
scoreboard players set deleted_index debug 0
scoreboard players add @e[type=turtle] map_list 0
scoreboard objectives remove map_selection 
scoreboard players reset @a map_selection
scoreboard objectives remove spawning_circle
scoreboard players reset @e spawning_circle
scoreboard objectives remove spawn_circle_count
scoreboard players reset @e spawn_circle_count
kill @e[tag=spawn_point]
scoreboard players set index spawn_circle_count 0
scoreboard objectives remove player_ID
scoreboard players reset @a player_ID
scoreboard players reset #nextID player_ID
bossbar set :game_time visible false
scoreboard objectives remove bouncer_list
scoreboard objectives remove corruption
scoreboard players set @a corruption 0
execute as @a run attribute @s max_health base set 20
scoreboard objectives remove hit 
scoreboard objectives remove health
scoreboard players reset @a health
scoreboard objectives remove corruption_stun
execute as @a run attribute @s movement_speed base reset
execute as @a run attribute @s entity_interaction_range base reset
execute as @a run attribute @s jump_strength base reset
kill @e[tag=corruption_part]
scoreboard objectives remove victory
scoreboard players set victory_timer victory 20
scoreboard objectives remove trap_stats
scoreboard objectives remove class_selection_cooldown
scoreboard objectives remove current_corrupted
scoreboard objectives remove previous_corrupted
scoreboard objectives remove target_tubby_watchlist
scoreboard objectives remove hit_targeting 
scoreboard objectives remove target_tubby_punishment_duration
scoreboard objectives remove CORRUPTION_track_for_dead 
scoreboard objectives remove CORRUPTION_track_for_dead 
execute as @a[team=dead] run scoreboard objectives setdisplay sidebar.team.black CORRUPTION_track_for_dead
scoreboard objectives remove hide_and_reap_death_trigger
scoreboard objectives remove runners_alive
scoreboard objectives remove cranked_it_buff_delay
scoreboard objectives remove corruption_combined
scoreboard objectives remove chorus_fruit_runners 
execute run tp @a @e[tag=lobby,limit=1] 
scoreboard objectives remove call_of_corrupted
scoreboard objectives remove points 
scoreboard objectives remove ammo_type
scoreboard objectives remove corrupt_manefestation
scoreboard objectives remove corrupted_max_health
scoreboard objectives remove spawn
scoreboard objectives remove crouch_time 
scoreboard objectives remove downed
scoreboard objectives remove ITEM____jump_candle 
scoreboard objectives remove ITEM____healing_rose 
scoreboard objectives remove ITEM____stunman_trap 
scoreboard objectives remove ITEM____totem_of_undying 
scoreboard objectives remove ITEM____fisherman_trap 
scoreboard objectives remove ITEM____speed_ink 
scoreboard objectives remove ITEM____bow 
scoreboard objectives remove ITEM____trident 
scoreboard objectives remove ITEM____speed_buff 
scoreboard objectives remove ITEM____invis_watch 
scoreboard objectives remove WAVE_rat 
scoreboard objectives remove WAVE_zombie 
scoreboard objectives remove WAVE_skeleton 
scoreboard objectives remove WAVE_zombie_elite
scoreboard objectives remove WAVE_skeleton_elite 
scoreboard objectives remove WAVE_phantom 
scoreboard objectives remove WAVE_phantom_elite 
scoreboard objectives remove WAVE_phantom_laser 
scoreboard objectives remove WAVE_stray 
scoreboard objectives remove WAVE_stray_elite 
scoreboard objectives remove WAVE_creeper 
scoreboard objectives remove WAVE_mini_creeper 
scoreboard objectives remove WAVE_pillager 
scoreboard objectives remove WAVE_vindicator 
scoreboard objectives remove WAVE_pilager_raid 
scoreboard objectives remove WAVE_imidiate_manefestation 
scoreboard objectives remove playtime
scoreboard objectives remove playtime 

# this command is here because of a weird thing that happens when we were testing this on imsqekers world. some of the scoreboards came from older versions of corrupt tag
# this is here so that any broken scoreboards can be removed
tellraw @a [{"text":"All scoreboards were destroyed, the game is completely broken now... hooray for you","color":"dark_red"}]