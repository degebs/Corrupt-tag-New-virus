# teleport to the nearest runner
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 0..120 run tp @s @r[team=runners,limit=1]

# count up
scoreboard players add time orbital_strike_logic 1

execute at @e[tag=orbital_strike] if score time orbital_strike_logic matches 0..200 run function ctnv:corrupted_supercharge_ability/particle_orbital


# sound effect building up
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 0..18 run playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 1 0.9 1

execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 20..23 run playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 1 1.4 1

execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 25..33 run playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 1 1.8 1

execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 35..38 run playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 1 1.4 1

execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 40..98 run playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 1 0.8 1

execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 100..120 run playsound minecraft:block.beacon.power_select block @a ~ ~ ~ 1 0.8 1
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 110..120 run playsound minecraft:block.beacon.deactivate block @a ~ ~ ~ 1 0.8 1

# the strike
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 120..200 run playsound entity.generic.explode hostile @a ~ ~ ~ 1 0.5 1
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 120 run playsound entity.ender_dragon.death hostile @a ~ ~ ~ 0.5 2 0.5

# particles and damage
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 120..200 run particle minecraft:explosion_emitter ~ ~ ~ 0 25 0 0 100 force @a
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 120..200 run damage @p[distance=..5,team=runners] 1 generic
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 120..200 run particle minecraft:campfire_signal_smoke ~ ~ ~ 0 25 0 0.25 200 force @a
execute as @e[tag=orbital_strike] at @s if score time orbital_strike_logic matches 200 run kill @e[tag=orbital_strike]
