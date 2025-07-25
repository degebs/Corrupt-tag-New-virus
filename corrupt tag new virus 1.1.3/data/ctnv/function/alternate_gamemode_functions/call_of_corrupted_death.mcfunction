# here is the function that handels death
# stun the corrupted.
execute as @a run effect give @a[scores={corruption=100..}] blindness 3 1 true
# dawg i dont remember why this was programed like this


attribute @a[scores={corruption=100..},limit=1] movement_speed base set 0
attribute @a[scores={corruption=100..},limit=1] minecraft:entity_interaction_range base set 0
attribute @a[scores={corruption=100..},limit=1] jump_strength base set 0
#stun all mobs
execute as @e[team=corrupted,type=!player] run attribute @s follow_range base set 0
execute as @e[team=corrupted,type=!player] run effect give @s slowness 1 25 true

# initialise the corruption stun
execute as @a[scores={corruption=100},limit=1] if score atherial_corrupted call_of_corrupted matches 0 run scoreboard players set death_stun corruption_stun 5
execute if score death_stun corruption_stun matches 5 if score tick time matches 5 run scoreboard players set @a[team=corrupted] corruption 101
# this here is to keep the corruption stun from stalling. 
execute if score tick time matches 2 run scoreboard players remove death_stun corruption_stun 1

execute as @a[scores={corruption=101..}] at @s run particle dragon_breath ~ ~ ~ 0 1 0 0.01 25 force @a
# more fancy particles
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches ..2 run particle large_smoke ~ ~ ~ 0 1 0 0.01 25 force @a





# block hitting sound that playes every second in the original corrupt tag when someone dies. its BACK in the sequel
execute if score tick time matches 9 run playsound block.stone.break block @a ~ ~ ~ 1 1 1
execute if score tick time matches 19 run playsound block.stone.break block @a ~ ~ ~ 1 1 1




# display a bunch of text about the player who just died
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run title @s title {"text":"you died","color":"dark_purple"}
# Display the time survived in seconds, minutes, and hours using title subtitles
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run title @s subtitle {"text":"you lasted: ","color":"white","extra":[{"score":{"name":"hours","objective":"time"}},{"text":" hours, ","color":"aqua"},{"score":{"name":"minutes","objective":"time"}},{"text":" minutes, ","color":"gold"},{"score":{"name":"seconds","objective":"time"}},{"text":" seconds","color":"yellow"}]}
# display a chat message to the whole server
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run tellraw @a {"text":"", "color":"white", "extra":[{"selector":"@s"},{"text":" has returned to the 4th dimention after: "},{"score":{"name":"hours","objective":"time"}},{"text":" hours, ","color":"aqua"},{"score":{"name":"minutes","objective":"time"}},{"text":" minutes, ","color":"gold"},{"score":{"name":"seconds","objective":"time"}},{"text":" seconds","color":"yellow"}]}

execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run particle dragon_breath ~ ~ ~ 0.5 0 0.5 1 650 force @a

execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run summon minecraft:experience_orb ~ ~2 ~
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run summon minecraft:experience_orb ~ ~2 ~
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run summon minecraft:experience_orb ~ ~2 ~
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run summon minecraft:experience_orb ~ ~2 ~
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run summon minecraft:experience_bottle ~ ~2 ~

#kill all the corrupted mobs
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run kill @e[type=!player,team=corrupted]

execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run clear @a[team=corrupted]
execute as @e[team=corrupted,type=!player] at @s if score death_stun corruption_stun matches ..4 run particle flame ~ ~ ~ 0 1 0 0.1 25 normal @a

execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run particle explosion_emitter ~ ~ ~ 0 0 0 0 15 force @a
execute as @a[scores={corruption=101..}] if score death_stun corruption_stun matches 0 run playsound entity.generic.explode block @a ~ ~ ~ 1 1 1

execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run scoreboard players set atherial_corrupted call_of_corrupted 1
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run function ctnv:alternate_gamemode_functions/call_of_corrupted/game_start
execute as @a[scores={corruption=101..}] at @s if score death_stun corruption_stun matches 0 run scoreboard players set @a[team=corrupted] corruption 0

# there is a glitch where the death cannot complete because the corruption is always set to 100%
