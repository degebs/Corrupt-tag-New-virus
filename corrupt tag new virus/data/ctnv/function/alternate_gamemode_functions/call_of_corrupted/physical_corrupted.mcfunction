
# the physical corrupted

# important stuff
execute as @a run attribute @s scale base reset
execute as @a run attribute @s entity_interaction_range base reset
#===========================================================================================================================================
#everyone will have an overlay. it shall contain the name of the corrupted player, and there corruption percentage.
execute as @a[team=corrupted] if score @s corruption matches 0..9 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██████████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 9..19 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █","color":"dark_purple"},{"text":"█████████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 20..29 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██","color":"dark_purple"},{"text":"████████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 30..39 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ███","color":"dark_purple"},{"text":"███████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 40..49 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ████","color":"dark_purple"},{"text":"██████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 50..59 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █████","color":"dark_purple"},{"text":"█████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 60..69 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓█████","color":"dark_purple"},{"text":"████","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 70..79 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓█████","color":"dark_purple"},{"text":"███","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 80..89 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓█████","color":"dark_purple"},{"text":"██","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 90..99 run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓▓█████","color":"dark_purple"},{"text":"█","color":"white"}]
execute as @a[team=corrupted] if score @s corruption matches 100.. run title @s actionbar [{"text":"wave: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}},{"text":" ","color":"blue"},{"text":"                            ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▒▓▓▓▓█████","color":"dark_purple"}]



# the corrupted class
execute as @a[scores={evil_class=1},team=corrupted] run function ctnv:classes/corrupted/corrupted
execute as @a[scores={evil_class=2},team=corrupted] run function ctnv:classes/corrupted/predator
execute as @a[scores={evil_class=3},team=corrupted] run function ctnv:classes/corrupted/apparition
execute as @a[scores={evil_class=4},team=corrupted] run function ctnv:classes/corrupted/hunter
execute as @a[scores={evil_class=5},team=corrupted] run function ctnv:classes/corrupted/knight
execute as @a[scores={evil_class=6},team=corrupted] run function ctnv:classes/corrupted/dark_star
execute as @a[scores={evil_class=7},team=corrupted] run function ctnv:classes/corrupted/manhunter



# calculate corruption percentage
execute if score gamers players_online matches 2.. if score corruption_tick corruption >= setting ST____corruption_rate if score tick time matches 18 run scoreboard players add @a[team=corrupted] corruption 1
execute if score gamers players_online matches 2.. if score corruption_tick corruption >= setting ST____corruption_rate if score tick time matches 18 run scoreboard players set corruption_tick corruption 0
execute if score gamers players_online matches 2.. as @a[team=corrupted] if score tick time matches 1 run scoreboard players add corruption_tick corruption 1
execute if score gamers players_online matches 2.. if score corruption_tick corruption matches 20.. run scoreboard players set corruption_tick corruption 0
#20 seconds is the highest possible corruption tick. trust me it get boring if you go any further
# once again stolen from the corrupt tag

#===================================================================================================================================================
#reset the corruption manefestation timer so that when the corrupted one becomes atherail again the loop will be completed
execute if score setting ST____initial_corruption_stun matches 90 run scoreboard players set corrupt_manifestation call_of_corrupted 4000
execute if score setting ST____initial_corruption_stun matches 80 run scoreboard players set corrupt_manifestation call_of_corrupted 5000
execute if score setting ST____initial_corruption_stun matches 70 run scoreboard players set corrupt_manifestation call_of_corrupted 6000
execute if score setting ST____initial_corruption_stun matches 60 run scoreboard players set corrupt_manifestation call_of_corrupted 7000
execute if score setting ST____initial_corruption_stun matches 50 run scoreboard players set corrupt_manifestation call_of_corrupted 8000
execute if score setting ST____initial_corruption_stun matches 40 run scoreboard players set corrupt_manifestation call_of_corrupted 9000
execute if score setting ST____initial_corruption_stun matches 30 run scoreboard players set corrupt_manifestation call_of_corrupted 10000
execute if score setting ST____initial_corruption_stun matches 20 run scoreboard players set corrupt_manifestation call_of_corrupted 11000
execute if score setting ST____initial_corruption_stun matches 10 run scoreboard players set corrupt_manifestation call_of_corrupted 12000
# if that does not work use a backup
execute if score corrupt_manifestation call_of_corrupted matches 0 run scoreboard players set corrupt_manifestation call_of_corrupted 13000

#===================================================================================================================================================

# if the corrupted gets to 0 health he becomes atherial again. this is done by immidialty setting his corruption to 100%
execute if score @s health matches ..0 unless score death_stun corruption_stun matches ..4 run scoreboard players add @s corruption 16

# if all the runners die make sure that the corrupted cannot die
execute if score reset runners_alive matches ..-3 run scoreboard players set @s health 10

#===================================================================================================================================================
# bring the bats to the corrupted player so that new mobs spawn around him
execute as @a[team=corrupted] at @s if score tick time matches 8 run tp @e[type=bat,sort=nearest,limit=2] @s