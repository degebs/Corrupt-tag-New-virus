# this function prevents the rng system from automatically selecting a class that is disabled

# how to do this
# 1. check the current players class.
# 2. check if its enabled
# 3. if its not move to the next one

execute as @a[scores={class=1}] if score enable select_medic matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=2}] if score enable select_archer matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=3}] if score enable select_bulk matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=4}] if score enable select_stunman matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=5}] if score enable select_fisherman matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=6}] if score enable select_merchant matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=7}] if score enable select_farmer matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=8}] if score enable select_assassin matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=9}] if score enable select_miner matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=10}] if score enable select_trickster matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=11}] if score enable select_spaceman matches 0 run scoreboard players add @s class 1
execute as @a[scores={class=12}] if score enable select_pirate matches 0 run scoreboard players set @s class 1
# cant forget the wraparound

