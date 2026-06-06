# here all the traps are managed



execute if score tick time matches 1 run function ctnv:classes/trap_limiter





#============================================================================================================
# tier 1 artificer trap 

# this trap is a simple trap that will stun the player for 3 seconds




execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run particle explosion ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5

execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run effect give @a[distance=..4,team=runners] slowness 3 10
execute as @e[type=item_display,tag=corrupted_t1_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run kill @s



#============================================================================================================
# tier 2 artificer trap

# same as tier 1 trap exept it expodes bigger, stuns for longer, and does 1 heart of damage

execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run particle explosion_emitter ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 0.5 0.5


execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run effect give @a[distance=..6,team=runners] slowness 6 10
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run effect give @a[distance=..6,team=runners] darkness 6 10
# remove 1 health from runner (MAKE SURE THAT THIS ONLY HAPPENS TO 1 RUNNER)
# this does 2 damage for some reason
execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run scoreboard players remove @a[distance=..1.5,team=runners,limit=1] health 1


execute as @e[type=item_display,tag=corrupted_t2_trap] at @s if entity @p[distance=..1.5,limit=1,team=runners] run kill @s


# make sure that there cannot be a negative health
execute as @a if score @s health matches ..-1 run scoreboard players set @s health 0 

#============================================================================================================
# tier 3 artificer trap.
#constantly teleport the guardian to the trap 
effect give @e[type=guardian] invisibility infinite 1 true
# give the guardian some particles. the corrupted one can see the guardian, thats bad
execute at @e[type=guardian] run particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0 2 normal @a
execute at @e[type=guardian] run particle flame ~ ~0.3 ~ 0.1 0.3 0.1 0 3 normal @a


# if anyone is above 100% corruption kill the trap t3 and t2, this is to prevent a softlock
execute as @a[scores={corruption=100..},team=corrupted] run kill @e[tag=corrupted_t3_trap]
execute as @a[scores={corruption=100..},team=corrupted] run kill @e[tag=corrupted_t2_trap]
# if someone is in corruption stun kill the t3 trap
execute as @a[team=corrupted,scores={corruption_stun=1..}] at @e[tag=corrupted_t3_trap] run particle explosion_emitter ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @a[team=corrupted,scores={corruption_stun=1..}] at @e[tag=corrupted_t3_trap] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @a[team=corrupted,scores={corruption_stun=1..}] run kill @e[tag=corrupted_t3_trap]
# this code may not work if there are multiple guardian traps.
effect give @e[type=phantom] fire_resistance infinite 1 true
#constant noise
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 2 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 5 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 8 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1
execute at @e[type=guardian,tag=corrupted_t3_trap] if score tick time matches 11 run playsound block.note_block.hat hostile @a ~ ~ ~ 1 2 0.1

#============================================================================================================
# stunman trap


# this trap is a simple trap that will stun the corrupted for 1 seconds (he can place multiple)
# the stunmans landmine is weak. but this is ofset by the fact that he can place more than one
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run particle wax_off ~ ~ ~ 0 0 0 40 100 force @a
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run playsound minecraft:entity.firework_rocket.blast block @a ~ ~ ~ 1 1 0.5
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run particle explosion ~ ~ ~ 0 0 0 0 1 force @a

# it will first clear all effects from the corrupted, meaing if they were chasing the stunman using a boost the corrupted will no longer have it
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run effect clear @e[distance=..4,team=corrupted]

# then give the debuff
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run effect give @e[distance=..4,team=corrupted] slowness 3 5
execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run effect give @e[distance=..4,team=corrupted] darkness 5 5

execute as @e[type=item_display,tag=stunman_trap] at @s if entity @e[distance=..0.8,limit=1,team=corrupted] run kill @s

#============================================================================================================
# fisherman trap

# this one simply slows all who cross it
execute as @e[tag=fishing_net_trap,type=item_display] at @s if entity @p[distance=..2.5,limit=1] run effect give @e[distance=..2.7,team=corrupted] slowness 1 2 true
# livetime
execute as @e[tag=fishing_net_trap,type=item_display] run scoreboard players add @s fishing_net_lifetime 1
# if 45 seconds the trap will die (just like farmers farm)
execute as @e[tag=fishing_net_trap,type=item_display] at @s if score @s fishing_net_lifetime matches 900 run particle poof ~ ~ ~ 0.4 0.1 0.4 0.2 15 force @a

execute as @e[tag=fishing_net_trap,type=item_display] at @s if score @s fishing_net_lifetime matches 900 run playsound minecraft:entity.item.break block @a ~ ~ ~ 1 1 0.5

execute as @e[tag=fishing_net_trap,type=item_display] at @s if score @s fishing_net_lifetime matches 900 run kill @s
#============================================================================================================
# authority Reveal Players Modulator
execute as @e[type=item_display,tag=Reveal_Players_Modulator] at @s if entity @p[distance=..2.5,limit=1,team=runners] run particle explosion ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @e[type=item_display,tag=Reveal_Players_Modulator] at @s if entity @p[distance=..2.5,limit=1,team=runners] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @e[type=item_display,tag=Reveal_Players_Modulator] at @s if entity @p[distance=..2.5,limit=1,team=runners] run playsound entity.glow_squid.death block @a ~ ~ ~ 1 0.7 0.5

execute as @e[type=item_display,tag=Reveal_Players_Modulator] at @s if entity @p[distance=..2.5,limit=1,team=runners] run effect give @a[distance=..4,team=runners] blindness 1 10
execute as @e[type=item_display,tag=Reveal_Players_Modulator] at @s if entity @p[distance=..2.5,limit=1,team=runners] run kill @s

execute as @e[type=item_display,tag=Reveal_Players_Modulator] run effect give @a[team=runners] glowing 1 1
execute as @e[type=item_display,tag=Reveal_Players_Modulator] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 0.05 1 normal @a
execute as @e[type=item_display,tag=Reveal_Players_Modulator,limit=1] at @a[team=runners] run particle minecraft:firework ~ ~ ~ 0 0.9 0 0.05 1 force @a
# if a new corrupted player gets selected delete the modulator
execute if score @p[team=corrupted] corruption_stun matches 1.. run kill @e[tag=reveal_players_modulator]

#============================================================================================================
# authority's secuirty
# if anyone is above 100% corruption kill the mobs t3, this is to prevent a softlock
execute as @a[scores={corruption=100..},team=corrupted] run kill @e[tag=security]
execute as @a[scores={corruption=100..},team=corrupted] run kill @e[tag=security]
# if someone is in corruption stun kill the t3 mobs
execute as @a[team=corrupted,scores={corruption_stun=1..}] at @e[tag=security] run particle explosion_emitter ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @a[team=corrupted,scores={corruption_stun=1..}] at @e[tag=security] run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @a[team=corrupted,scores={corruption_stun=1..}] run kill @e[tag=security]

#============================================================================================================
# farmers farm
# the life time will tick down
execute as @e[tag=farm] at @s if score @s farm_lifetime matches 1.. run scoreboard players remove @s farm_lifetime 1
#particles
execute as @e[tag=farm] at @s if score @s farm_lifetime matches 1 at @s run particle minecraft:smoke ~ ~ ~ 1 0.5 1 0.05 85 normal @a
#sound
execute as @e[tag=farm] at @s if score @s farm_lifetime matches 1 at @s run playsound minecraft:block.fungus.break block @a ~ ~ ~ 1 0.5 0.5


# if the lifetime hits 0, the trap will be removed
execute as @e[tag=farm] at @s if score @s farm_lifetime matches 0 run kill @s

# faster regen particle
execute at @e[tag=farm_heal_source] as @a[team=runners,distance=..2,limit=1] run particle minecraft:happy_villager ~ ~ ~ 0.5 1.5 0.5 1 1 normal @a
# night vision
execute at @e[tag=farm_heal_source] as @a[team=runners,distance=..2,limit=1] run effect give @s night_vision 2 0
# healing 
execute as @e[tag=farm_heal_source] at @s if score @s farm_lifetime matches 150 run scoreboard players add @p[team=runners,distance=..2] health 1
execute as @e[tag=farm_heal_source] at @s if score @s farm_lifetime matches 150 run playsound minecraft:entity.player.levelup block @a[distance=..2] ~ ~ ~ 1 1 0.5

execute as @e[tag=farm_heal_source] at @s if score @s farm_lifetime matches 50 run scoreboard players add @p[team=runners,distance=..2] health 1
execute as @e[tag=farm_heal_source] at @s if score @s farm_lifetime matches 50 run playsound minecraft:entity.player.levelup block @a[distance=..2] ~ ~ ~ 1 1 0.5

#============================================================================================================
# Store skeleton's health as integer (rounded down)
execute as @e[type=skeleton,tag=decoy] store result score @s decoy_health run data get entity @s Health 1

# Trigger explosion when health <= 1 and not already exploded
execute as @e[type=skeleton,tag=decoy,scores={decoy_health=..1}] unless entity @s[tag=decoy_exploded] at @s run tag @s add decoy_exploding

# Do explosion effects (only once)
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] at @s run particle minecraft:explosion_emitter ~ ~ ~ 0.1 0.1 0.1 0.2 5 force @a
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] at @s run playsound minecraft:entity.generic.explode block @a ~ ~ ~ 1 1 0.5
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] at @s run effect give @a[distance=..4,team=corrupted] slowness 3 10
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] at @s run effect give @a[distance=..4,team=corrupted] darkness 3 10
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] at @s run effect give @a[distance=..4,team=corrupted] glowing 5 10

# Summon wind charge
# make sure that runners cannot use the explosion to boost themselves, this is done by checking if there are any runners within 5 blocks before summoning the wind charge. if there are, the explosion will still happen, but no wind charge will be summoned, preventing any boost abuse
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] at @s unless entity @a[team=runners,distance=..5] run summon wind_charge ~ ~ ~ {Tags:["decoy_explosion"],Motion:[0.0,-0.5,0.0],Team:"runners"}

# Kill the skeleton and mark as exploded
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] run kill @s
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] run tag @s add decoy_exploded
# Clean up tag
execute as @e[type=skeleton,tag=decoy,tag=decoy_exploding] run tag @s remove decoy_exploding


#============================================================================================================
# the rewind shard
# this part shall summon a trail from the spaceman to the shard itself
execute as @a[team=runners,scores={spaceman_rewind_shard_state=1}] at @s if score tick time matches 1 run summon block_display ~ ~1 ~ {Tags:["rewind_shard_trail"]}
execute as @a[team=runners,scores={spaceman_rewind_shard_state=1}] at @s if score tick time matches 5 run summon block_display ~ ~1 ~ {Tags:["rewind_shard_trail"]}
execute as @a[team=runners,scores={spaceman_rewind_shard_state=1}] at @s if score tick time matches 10 run summon block_display ~ ~1 ~ {Tags:["rewind_shard_trail"]}
execute as @a[team=runners,scores={spaceman_rewind_shard_state=1}] at @s if score tick time matches 15 run summon block_display ~ ~1 ~ {Tags:["rewind_shard_trail"]}


# step 1: rotate the marker to face the shard
execute as @e[type=block_display,tag=rewind_shard_trail] at @s run tp @s ~ ~ ~ facing entity @e[tag=rewind_shard,limit=1]
# step 2: move it forward now that it's facing the right direction
execute as @e[type=block_display,tag=rewind_shard_trail] at @s run tp @s ^ ^ ^0.5
# particle
execute as @e[type=block_display,tag=rewind_shard_trail] at @s run particle minecraft:electric_spark ~ ~ ~ 0 0 0 1 1 force @a
execute as @e[type=block_display,tag=rewind_shard_trail] at @s run particle minecraft:sculk_charge_pop ~ ~ ~ 0 0 0 0.01 1 normal @a
# basic collison check so that the particles dont go through walls
execute as @e[type=block_display,tag=rewind_shard_trail] at @s unless block ~ ~ ~ air run tp @s ^0.5 ^1 ^-0.4

# kill the marker when it reaches the shard (saves on lag)
execute as @e[type=block_display,tag=rewind_shard_trail] at @s if entity @e[type=item_display,tag=rewind_shard,distance=..0.5] run kill @s
# obscructon
# basically team mates can stand on the shard to block it
execute as @a[team=runners] at @s if entity @e[type=item_display,tag=rewind_shard,distance=..1] run clear @p[team=runners,scores={class=11,spaceman_rewind_shard_state=1}] music_disc_5
execute as @a[team=runners] at @s if entity @e[type=item_display,tag=rewind_shard,distance=..1] run item replace entity @p[team=runners,scores={class=11,spaceman_rewind_shard_state=1}] hotbar.2 with barrier[custom_name='SHARD OBSTRUCTED']
# if a corrupted player touches the shard it will force it to activate
execute as @a[team=corrupted] at @s if entity @e[type=item_display,tag=rewind_shard,distance=..1] run playsound block.respawn_anchor.deplete block @a ~ ~ ~ 1 1 0.5
execute as @a[team=corrupted] at @s if entity @e[type=item_display,tag=rewind_shard,distance=..1] run playsound entity.ghast.hurt block @a ~ ~ ~ 1 1 0.5

execute as @a[team=corrupted] at @s if entity @e[type=item_display,tag=rewind_shard,distance=..1] run scoreboard players set @p[team=runners,scores={class=11,spaceman_rewind_shard_state=1}] spaceman_teleport_detect 1

#============================================================================================================
# i make 1 exseption
# the marksmans evil arrows
execute if entity @a[scores={evil_class=9}] run function ctnv:one_time_function/evil_arrows


#============================================================================================================
# fracturizer time bomb
# it will spin in place
execute as @e[type=block_display,tag=time_bomb] at @s run tp @s ~ ~ ~ ~5 ~
# the thinker will determine if the time bomb explodes. it will keep track of how long the bomb has been alive, and when it reaches 10 seconds, it will explode
execute as @e[type=block_display,tag=time_bomb_thinker] run scoreboard players add @s fracturizer_time_bomb 1
# it will emit particles that hoan in on runners until it explodes, giving a visual indication of where the bomb is and what its target is
execute as @e[type=block_display,tag=time_bomb_thinker] at @s if score tick time matches 5 run summon item_display ~ ~ ~ {Tags:["time_bomb_particle"]}
execute as @e[type=block_display,tag=time_bomb_thinker] at @s if score tick time matches 15 run summon item_display ~ ~ ~ {Tags:["time_bomb_particle"]}
# the particles will home in on the random runner, giving a visual indication of where the bomb is targeting
execute as @e[type=item_display,tag=time_bomb_particle] at @s run tp @s ~ ~ ~ facing entity @r[team=runners]
execute as @e[type=item_display,tag=time_bomb_particle] at @s run tp @s ^ ^0.1 ^0.5
# to prevent lag kill particles in walls
execute as @e[type=item_display,tag=time_bomb_particle] at @s unless block ~ ~ ~ air run kill @s
# the actual particle effect
execute as @e[type=item_display,tag=time_bomb_particle] at @s run particle minecraft:dragon_breath ~ ~ ~ 0.1 0.1 0.1 0.001 1 force @a
# just like the revival shard, the bomb will explode when it gets within 0.5 blocks of a runner, this is to prevent the bomb from being completely useless if it gets stuck on a wall or something
# start with particles of defusing
execute as @e[type=item_display,tag=time_bomb] at @s if entity @p[distance=..2.5,limit=1,team=runners] run particle minecraft:poof ~ ~ ~ 0.5 0.5 0.5 0.01 100 normal @a
execute as @e[type=item_display,tag=time_bomb] at @s if entity @p[distance=..2.5,limit=1,team=runners] run playsound minecraft:block.fungus.break block @a ~ ~ ~ 1 0.5 0.5
execute as @e[type=item_display,tag=time_bomb] at @s if entity @p[distance=..2.5,limit=1,team=runners] run effect give @a[distance=..4,team=runners] blindness 1 10
execute as @e[type=item_display,tag=time_bomb] at @s if entity @p[distance=..2.5,limit=1,team=runners] run kill @e[tag=time_bomb_particle]
execute as @e[tag=time_bomb] at @s if entity @p[distance=..2.5,limit=1,team=runners] run kill @s

# the thinker will use the subtitle to count down from 10 to 0, giving the runners a visual indication of how much time they have left to defuse the bomb
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 20 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 20 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 10 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 20 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 40 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 40 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 9 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 40 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 60 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 60 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 8 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 60 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 80 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 80 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 7 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 80 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 100 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 100 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 6 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 100 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 120 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 120 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 5 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 120 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 140 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 140 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 4 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 140 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 160 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 160 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 3 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 160 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 180 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 180 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 2 SECONDS ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 180 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 200 run title @a title " "
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 200 run title @a subtitle [{"text":"TIME BOMB DETONATION IN 1 SECOND ","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] at @a if score @s fracturizer_time_bomb matches 200 run playsound minecraft:block.note_block.hat master @a ~ ~ ~ 1 1.5

# final explosion
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 run title @a title [{"text":"KABOOM","color":"dark_red"}]
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 run title @a subtitle [{"text":" ","color":"dark_red"}]

# multiple explosion sounds for all runners
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a run playsound minecraft:entity.tnt.primed master @a ~ ~ ~ 1 0.8
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 0.5
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1 1.2

# massive particles at each runner's location
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a[team=runners] run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0 200 force
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a[team=runners] run particle minecraft:explosion ~ ~ ~ 5 5 5 0.01 50 force
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a[team=runners] run particle minecraft:firework ~ ~ ~ 0.5 0.5 0.5 0 20 force
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a[team=runners] run particle minecraft:large_smoke ~ ~ ~ 2 2 2 0.1 100 force
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 at @a[team=runners] run particle minecraft:campfire_cosy_smoke ~ ~ ~ 1.5 1.5 1.5 0.05 80 force

# apply slowness blindness and glowing to all runners for failing to defuse the bomb
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 run effect give @a[team=runners] slowness 10 5
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 run effect give @a[team=runners] blindness 10 5
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 run effect give @a[team=runners] glowing 10 5


# kill the time bomb after detonation
execute as @e[tag=time_bomb_thinker] if score @s fracturizer_time_bomb matches 220 run kill @e[tag=time_bomb]
# if a new corrupted player gets selected delete the bomb
execute if score @p[team=corrupted] corruption_stun matches 1.. run kill @e[tag=time_bomb]

#============================================================================================================
#fracturizer wall
# to prevent players from using the wall to escape the map, they will all become invincible
effect give @e[type=shulker,tag=wall] resistance infinite 255 true
# make one invisable randomly for a cool efect
execute as @e[type=shulker,tag=wall,limit=2,sort=random] run effect give @s invisibility 1 1 true
execute as @e[type=shulker,tag=wall,limit=4,sort=random] run effect give @s glowing 1 1 true
# this one will progressivly make the glowing more purple
execute as @e[type=shulker,tag=wall,limit=5,sort=random] run team join corrupted

# do a bunch of evil particles
execute as @e[type=shulker,tag=wall,limit=1,sort=random] at @s run particle minecraft:sculk_charge_pop ~ ~ ~ 0.5 0.5 0.5 0.01 50 normal @a
