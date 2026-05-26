# this function prevents the rng system from automatically selecting a evil class that is disabled

# how to do this
# 1. check the current players class.
# 2. check if its enabled
# 3. if its not move to the next one

# Corrupted classes (evil_class IDs 1-12)
execute as @a[scores={evil_class=1}] if score enable select_corruptor matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=2}] if score enable select_manhunter matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=3}] if score enable select_artificer matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=4}] if score enable select_predator matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=5}] if score enable select_dark_star matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=6}] if score enable select_apparition matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=7}] if score enable select_knight matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=8}] if score enable select_authority matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=9}] if score enable select_marksman matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=10}] if score enable select_alchemist matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=11}] if score enable select_Fracturizer matches 0 run scoreboard players add @s evil_class 1
execute as @a[scores={evil_class=12}] if score enable select_singularity matches 0 run scoreboard players set @s evil_class 1

# cant forget the wraparound
