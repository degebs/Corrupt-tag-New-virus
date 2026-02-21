scoreboard players add intermission call_of_corrupted 1
execute if score intermission call_of_corrupted matches 1 run title @a subtitle [{"text":"Intermission! take 30 seconds to upgrade your gear","color":"dark_red"}]
# start the game mode in intermission mode, this is for the very begining of the game, and for when the runners win a round. the corrupted will have 30 seconds to prepare for the next round, and they can not interact with anything. they can only summon mobs. this is to give the runners a chance to get away and prepare for the next round


# after 30 seconds switch to etherial mode
execute if score intermission call_of_corrupted matches 600.. run title @a subtitle [{"text":"Intermission over! the corrupted are now atherial, start summoning waves!","color":"dark_red"}]
execute if score intermission call_of_corrupted matches 600.. run scoreboard players set atherial_corrupted call_of_corrupted 1