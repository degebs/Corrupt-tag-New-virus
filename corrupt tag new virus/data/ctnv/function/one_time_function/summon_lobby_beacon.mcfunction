# this function is dedicated to the creation of the lobby beacon. THERE CAN ONLY BE 1 LOBY BEACON
# a loby beacon must be able to
# 1. be the spawn point
# 2. tp all players back when a game is done


setworldspawn ~ ~ ~
kill @e[type=armadillo,tag=lobby]
summon armadillo ~ ~2 ~ {CustomName:'{"text":"lobby"}',Invulnerable:1b,NoAI:1b,NoGravity:1b,Silent:1b,Tags:["lobby"]}
effect give @e[type=armadillo,tag=lobby,sort=nearest,limit=1] minecraft:invisibility infinite 1 true
particle happy_villager ~ ~1 ~ 0.1 1 0.1 3 400
particle firework ~ ~1 ~ 0.1 1 0.1 1 400
playsound block.beacon.activate block @a ~ ~ ~ 1 1
tellraw @a ["",{"text":"lobby beacon created!","color":"dark_green"}]
forceload add ~ ~
# the foreload command no longer works in 1.21.11 god dammit!