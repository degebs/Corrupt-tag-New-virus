# handle the reviveing logic

execute if score @s crouch_time matches 60 run tellraw @a [{"color":"gold","selector":"@a[distance=..1.5,team=runners,scores={health=..0}]"},{"color":"gold","text":" has been revived"}]
execute if score @s crouch_time matches 60 run playsound entity.experience_orb.pickup block @a ~ ~ ~ 1 1 0.5

execute if score @s crouch_time matches 60 run kill @e[type=shulker,distance=..1.5]
execute if score @s crouch_time matches 60 run scoreboard players operation @a[distance=..1.5,team=runners,scores={health=..0}] health = setting ST____max_health




#sounds
# Play chime sound with increasing pitch based on crouch_time
execute if score @s crouch_time matches 1 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.1 0
execute if score @s crouch_time matches 2 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.1316666667 0
execute if score @s crouch_time matches 3 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.1633333333 0
execute if score @s crouch_time matches 4 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.195 0
execute if score @s crouch_time matches 5 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.2266666667 0
execute if score @s crouch_time matches 6 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.2583333333 0
execute if score @s crouch_time matches 7 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.29 0
execute if score @s crouch_time matches 8 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.3216666667 0
execute if score @s crouch_time matches 9 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.3533333333 0
execute if score @s crouch_time matches 10 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.385 0
execute if score @s crouch_time matches 11 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.4166666667 0
execute if score @s crouch_time matches 12 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.4483333333 0
execute if score @s crouch_time matches 13 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.48 0
execute if score @s crouch_time matches 14 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.5116666667 0
execute if score @s crouch_time matches 15 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.5433333333 0
execute if score @s crouch_time matches 16 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.575 0
execute if score @s crouch_time matches 17 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.6066666667 0
execute if score @s crouch_time matches 18 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.6383333333 0
execute if score @s crouch_time matches 19 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.67 0 
execute if score @s crouch_time matches 20 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.7016666667 0
execute if score @s crouch_time matches 21 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.7333333333 0
execute if score @s crouch_time matches 22 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.765 0
execute if score @s crouch_time matches 23 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.7966666667 0
execute if score @s crouch_time matches 24 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.8283333333 0
execute if score @s crouch_time matches 25 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.86 0
execute if score @s crouch_time matches 26 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.8916666667 0
execute if score @s crouch_time matches 27 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.9233333333 0
execute if score @s crouch_time matches 28 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.955 0
execute if score @s crouch_time matches 29 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 0.9866666667 0
execute if score @s crouch_time matches 30 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.0183333333 0
execute if score @s crouch_time matches 31 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.05 0
execute if score @s crouch_time matches 32 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.0816666667 0
execute if score @s crouch_time matches 33 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.1133333333 0
execute if score @s crouch_time matches 34 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.145 0
execute if score @s crouch_time matches 35 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.1766666667 0
execute if score @s crouch_time matches 36 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.2083333333 0
execute if score @s crouch_time matches 37 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.24 0
execute if score @s crouch_time matches 38 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.2716666667 0
execute if score @s crouch_time matches 39 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.3033333333 0
execute if score @s crouch_time matches 40 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.335 0
execute if score @s crouch_time matches 41 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.3666666667 0
execute if score @s crouch_time matches 42 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.3983333333 0
execute if score @s crouch_time matches 43 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.43 0
execute if score @s crouch_time matches 44 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.4616666667 0
execute if score @s crouch_time matches 45 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.4933333333 0
execute if score @s crouch_time matches 46 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.525 0
execute if score @s crouch_time matches 47 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.5566666667 0
execute if score @s crouch_time matches 48 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.5883333333 0
execute if score @s crouch_time matches 49 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.62 0
execute if score @s crouch_time matches 50 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.6516666667 0
execute if score @s crouch_time matches 51 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.6833333333 0
execute if score @s crouch_time matches 52 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.715 0
execute if score @s crouch_time matches 53 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.7466666667 0
execute if score @s crouch_time matches 54 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.7783333333 0
execute if score @s crouch_time matches 55 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.81 0
execute if score @s crouch_time matches 56 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.8416666667 0 
execute if score @s crouch_time matches 57 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.8733333333 0
execute if score @s crouch_time matches 58 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.905 0 
execute if score @s crouch_time matches 59 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.9366666667 0
execute if score @s crouch_time matches 60 run playsound block.note_block.chime voice @a ~ ~ ~ 0.5 1.9683333333 0