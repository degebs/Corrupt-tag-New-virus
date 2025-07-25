# when a wall is hit a price check is done. if the player has enough money, the wall is removed.
# execution will be preformed by the magma cube that was selected as the magma cube

# we have to check each price manually unfortunately

# check if the cube is of a sertain cost, then check the nearest player for the money
execute at @s if entity @s[tag=300] if entity @p[scores={points=300..}] run scoreboard players remove @p[scores={points=300..}] points 300
execute at @s if entity @s[tag=300] if entity @p[scores={points=300..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=300] if entity @p[scores={points=..299}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=200] if entity @p[scores={points=200..}] run scoreboard players remove @p[scores={points=200..}] points 200
execute at @s if entity @s[tag=200] if entity @p[scores={points=200..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=200] if entity @p[scores={points=..199}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=250] if entity @p[scores={points=250..}] run scoreboard players remove @p[scores={points=250..}] points 250
execute at @s if entity @s[tag=250] if entity @p[scores={points=250..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=250] if entity @p[scores={points=..249}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=350] if entity @p[scores={points=350..}] run scoreboard players remove @p[scores={points=350..}] points 350
execute at @s if entity @s[tag=350] if entity @p[scores={points=350..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=350] if entity @p[scores={points=..349}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=400] if entity @p[scores={points=400..}] run scoreboard players remove @p[scores={points=400..}] points 400
execute at @s if entity @s[tag=400] if entity @p[scores={points=400..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=400] if entity @p[scores={points=..399}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=500] if entity @p[scores={points=500..}] run scoreboard players remove @p[scores={points=500..}] points 500
execute at @s if entity @s[tag=500] if entity @p[scores={points=500..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=500] if entity @p[scores={points=..499}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=400] if entity @p[scores={points=400..}] run scoreboard players remove @p[scores={points=400..}] points 400
execute at @s if entity @s[tag=400] if entity @p[scores={points=400..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=400] if entity @p[scores={points=..399}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=450] if entity @p[scores={points=450..}] run scoreboard players remove @p[scores={points=450..}] points 450
execute at @s if entity @s[tag=450] if entity @p[scores={points=450..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=450] if entity @p[scores={points=..449}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=600] if entity @p[scores={points=600..}] run scoreboard players remove @p[scores={points=600..}] points 600
execute at @s if entity @s[tag=600] if entity @p[scores={points=600..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=600] if entity @p[scores={points=..599}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=1000] if entity @p[scores={points=1000..}] run scoreboard players remove @p[scores={points=1000..}] points 1000
execute at @s if entity @s[tag=1000] if entity @p[scores={points=1000..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=1000] if entity @p[scores={points=..999}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=900] if entity @p[scores={points=900..}] run scoreboard players remove @p[scores={points=900..}] points 900
execute at @s if entity @s[tag=900] if entity @p[scores={points=900..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=900] if entity @p[scores={points=..899}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=800] if entity @p[scores={points=800..}] run scoreboard players remove @p[scores={points=800..}] points 800
execute at @s if entity @s[tag=800] if entity @p[scores={points=800..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=800] if entity @p[scores={points=..799}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=850] if entity @p[scores={points=850..}] run scoreboard players remove @p[scores={points=850..}] points 850
execute at @s if entity @s[tag=850] if entity @p[scores={points=850..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=850] if entity @p[scores={points=..849}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

execute at @s if entity @s[tag=1500] if entity @p[scores={points=1500..}] run scoreboard players remove @p[scores={points=1500..}] points 1500
execute at @s if entity @s[tag=1500] if entity @p[scores={points=1500..}] run kill @e[tag=wall,distance=..9]
execute at @s if entity @s[tag=1500] if entity @p[scores={points=..1499}] run tellraw @p [{"text":"not enough money","color":"dark_red"}]

