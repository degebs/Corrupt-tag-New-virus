# this script will lock all corrupted classes except for the one that is choesen at the begining of the game.
# this is so that they may be unlocked in the intermission shop. 

#disable the corrupted classes
scoreboard players set enable select_corruptor 0
scoreboard players set enable select_manhunter 0
scoreboard players set enable select_predator 0
scoreboard players set enable select_dark_star 0
scoreboard players set enable select_apparition 0
scoreboard players set enable select_knight 0
scoreboard players set enable select_authority 0
scoreboard players set enable select_marksman 0
scoreboard players set enable select_alchemist 0
scoreboard players set enable select_Fracturizer 0
scoreboard players set enable select_singularity 0
scoreboard players set enable select_artificer 0
# enable the current one

execute as @a[team=corrupted,scores={evil_class=1}] run scoreboard players set enable select_corruptor 1
execute as @a[team=corrupted,scores={evil_class=2}] run scoreboard players set enable select_manhunter 1
execute as @a[team=corrupted,scores={evil_class=3}] run scoreboard players set enable select_predator 1
execute as @a[team=corrupted,scores={evil_class=4}] run scoreboard players set enable select_dark_star 1
execute as @a[team=corrupted,scores={evil_class=5}] run scoreboard players set enable select_apparition 1
execute as @a[team=corrupted,scores={evil_class=6}] run scoreboard players set enable select_artificer 1
execute as @a[team=corrupted,scores={evil_class=7}] run scoreboard players set enable select_knight 1
execute as @a[team=corrupted,scores={evil_class=8}] run scoreboard players set enable select_authority 1
execute as @a[team=corrupted,scores={evil_class=9}] run scoreboard players set enable select_marksman 1
execute as @a[team=corrupted,scores={evil_class=10}] run scoreboard players set enable select_alchemist 1
execute as @a[team=corrupted,scores={evil_class=11}] run scoreboard players set enable select_Fracturizer 1
execute as @a[team=corrupted,scores={evil_class=12}] run scoreboard players set enable select_singularity 1