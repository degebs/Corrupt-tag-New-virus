# here we display all classes but then we got to make sure that when they are selected they become unavailable for selection again, otherwise the player can just drop and pick the item to get the class without cooldown. so we use a scoreboard objective to track if the player has selected the class or not, and
#=========================================================================================================
# setup
#=========================================================================================================
# there is a glitch where rng causes random classes to become unavailable, so we gotta reset that
execute if score countdown time matches 30 run scoreboard players set @a class -1
execute if score countdown time matches 30 run scoreboard players set @a evil_class -1
# when the countdown is over we let normal rng take over once again

execute if score countdown time matches 1 run scoreboard players set @a[scores={class=-1}] class 0
execute if score countdown time matches 1 run scoreboard players set @a[scores={evil_class=-1}] evil_class 0

#=========================================================================================================
# RUNNERS
#=========================================================================================================
execute unless entity @a[scores={class=1},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_medic
execute unless entity @a[scores={class=2},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_archer
execute unless entity @a[scores={class=3},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_bulk
execute unless entity @a[scores={class=4},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_stunman
execute unless entity @a[scores={class=5},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_fisherman
execute unless entity @a[scores={class=6},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_merchant
execute unless entity @a[scores={class=7},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_farmer
execute unless entity @a[scores={class=8},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_assassin
execute unless entity @a[scores={class=9},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_miner
execute unless entity @a[scores={class=10},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_trickster
execute unless entity @a[scores={class=11},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_spaceman
execute unless entity @a[scores={class=12},limit=1] run execute as @a at @s unless score @s selected_runner_class matches 1.. run function ctnv:classes/class_selection/classes/select_pirate

# clear them!
execute as @a at @s if score @s selected_runner_class matches 1 run clear @a
execute as @a at @s if score @s selected_runner_class matches 1 run scoreboard players add @s selected_runner_class 1


#=========================================================================================================
# CORRUPTED
#=========================================================================================================
execute unless entity @a[scores={evil_class=1},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_corruptor
execute unless entity @a[scores={evil_class=2},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_manhunter
execute unless entity @a[scores={evil_class=3},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_artificer
execute unless entity @a[scores={evil_class=4},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_predator
execute unless entity @a[scores={evil_class=5},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_dark_star
execute unless entity @a[scores={evil_class=6},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_apparition
execute unless entity @a[scores={evil_class=7},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_knight
execute unless entity @a[scores={evil_class=8},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_authority
execute unless entity @a[scores={evil_class=9},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_marksman
execute unless entity @a[scores={evil_class=10},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_alchemist
execute unless entity @a[scores={evil_class=11},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_fracturizer
execute unless entity @a[scores={evil_class=12},limit=1] run execute run execute as @a at @s unless score @s selected_corrupted_class matches 1.. run function ctnv:classes/class_selection/classes/select_singularity

# clear them!
execute as @a at @s if score @s selected_corrupted_class matches 1 run clear @a
execute as @a at @s if score @s selected_corrupted_class matches 1 run scoreboard players add @s selected_corrupted_class 1


