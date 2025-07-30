# all target tubby punishemts must do a few things
#1 set the duration of the punishment
#2 reset the target tubby watchlist
#3 enact the punishment
execute as @a if score @s target_tubby_punishment_duration matches -1 run scoreboard players set @s target_tubby_punishment_duration 199
execute as @a[scores={target_tubby_punishment_duration=1..}] run scoreboard players reset @s target_tubby_watchlist

#============================================================================================================================

execute as @a if score @s target_tubby_punishment_duration matches 199 run tellraw @a [{"selector":"@a[team=corrupted]","color":"red"}," ",{"text":"IS A TARGET TUBBY!  ","color":"gold"},{"text":"Has your mind gone completly corrupted!? What were you thinking?!","color":"white"}]
# increase corruption
execute as @a if score @s target_tubby_punishment_duration matches 180.. run scoreboard players add @s corruption 1
execute as @a if score @s target_tubby_punishment_duration matches 180.. run title @s title {"text":"corruption: ","color":"dark_purple","extra":[{"score":{"name":"@s","objective":"corruption"},"color":"red"}]}
# sound effect
execute as @a if score @s target_tubby_punishment_duration matches 199 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.0 1 
execute as @a if score @s target_tubby_punishment_duration matches 198 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.01 1 
execute as @a if score @s target_tubby_punishment_duration matches 197 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.02 1 
execute as @a if score @s target_tubby_punishment_duration matches 196 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.03 1 
execute as @a if score @s target_tubby_punishment_duration matches 195 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.04 1 
execute as @a if score @s target_tubby_punishment_duration matches 194 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.05 1 
execute as @a if score @s target_tubby_punishment_duration matches 193 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.06 1 
execute as @a if score @s target_tubby_punishment_duration matches 192 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.07 1 
execute as @a if score @s target_tubby_punishment_duration matches 191 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.08 1 
execute as @a if score @s target_tubby_punishment_duration matches 190 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.09 1 
execute as @a if score @s target_tubby_punishment_duration matches 189 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.1 1 
execute as @a if score @s target_tubby_punishment_duration matches 188 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.11 1 
execute as @a if score @s target_tubby_punishment_duration matches 187 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.12 1 
execute as @a if score @s target_tubby_punishment_duration matches 186 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.13 1 
execute as @a if score @s target_tubby_punishment_duration matches 185 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.14 1 
execute as @a if score @s target_tubby_punishment_duration matches 184 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.15 1 
execute as @a if score @s target_tubby_punishment_duration matches 183 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.16 1 
execute as @a if score @s target_tubby_punishment_duration matches 182 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.17 1 
execute as @a if score @s target_tubby_punishment_duration matches 181 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.18 1 
execute as @a if score @s target_tubby_punishment_duration matches 180 run playsound block.note_block.bit block @s ~ ~ ~ 1 1.19 1 

execute as @a if score @s target_tubby_punishment_duration matches 100 run tellraw @a [{"text":"You better be thankfull i did not go all the way","color":"white"}]

#=============================================================================================================================
#end
execute as @a[scores={target_tubby_punishment_duration=1..}] if score @s target_tubby_punishment_duration matches 3 run scoreboard players set trigger target_tubby_watchlist 0