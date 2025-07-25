execute as @a if score @s health matches 1 run attribute @s max_health base set 2
execute as @a if score @s health matches 2 run attribute @s max_health base set 4
execute as @a if score @s health matches 3 run attribute @s max_health base set 6
execute as @a if score @s health matches 4 run attribute @s max_health base set 8
execute as @a if score @s health matches 5 run attribute @s max_health base set 10
execute as @a if score @s health matches 6 run attribute @s max_health base set 12
execute as @a if score @s health matches 7 run attribute @s max_health base set 14
execute as @a if score @s health matches 8 run attribute @s max_health base set 16
execute as @a if score @s health matches 9 run attribute @s max_health base set 18
execute as @a if score @s health matches 10 run attribute @s max_health base set 20
execute as @a if score @s health matches 11 run attribute @s max_health base set 22
execute as @a if score @s health matches 12 run attribute @s max_health base set 24
execute as @a if score @s health matches 13 run attribute @s max_health base set 26
execute as @a if score @s health matches 14 run attribute @s max_health base set 28
execute as @a if score @s health matches 15 run attribute @s max_health base set 30
execute as @a if score @s health matches 16 run attribute @s max_health base set 32
execute as @a if score @s health matches 17 run attribute @s max_health base set 34
execute as @a if score @s health matches 18 run attribute @s max_health base set 36
execute as @a if score @s health matches 19 run attribute @s max_health base set 38
execute as @a if score @s health matches 20 run attribute @s max_health base set 40
execute as @a if score @s health matches 21 run attribute @s max_health base set 42
execute as @a if score @s health matches 22 run attribute @s max_health base set 44
execute as @a if score @s health matches 23 run attribute @s max_health base set 46
execute as @a if score @s health matches 24 run attribute @s max_health base set 48
execute as @a if score @s health matches 25 run attribute @s max_health base set 50
execute as @a if score @s health matches 26 run attribute @s max_health base set 52
execute as @a if score @s health matches 27 run attribute @s max_health base set 54
execute as @a if score @s health matches 28 run attribute @s max_health base set 56
execute as @a if score @s health matches 29 run attribute @s max_health base set 58
execute as @a if score @s health matches 30 run attribute @s max_health base set 60
execute as @a if score @s health matches 31 run attribute @s max_health base set 62
execute as @a if score @s health matches 32 run attribute @s max_health base set 64
execute as @a if score @s health matches 33 run attribute @s max_health base set 66
execute as @a if score @s health matches 34 run attribute @s max_health base set 68
execute as @a if score @s health matches 35 run attribute @s max_health base set 70
execute as @a if score @s health matches 36 run attribute @s max_health base set 72
execute as @a if score @s health matches 37 run attribute @s max_health base set 74
execute as @a if score @s health matches 38 run attribute @s max_health base set 76
execute as @a if score @s health matches 39 run attribute @s max_health base set 78
execute as @a if score @s health matches 40.. run attribute @s max_health base set 80

#this function basically sets the scoreboard in the number of hearts to the "health" variable. up to 40
# there is no procedual way to do this, and the settings book cant go past 10, but just in case any massocists wants to play 40 health corrupt tag
# they can. i guess

# orignally only the runners could use this function

#hoverver this @a[team=runners] is not strictly nessasary for the other game modes beacue the corrupted would always have his health at 0
# for call of corrupted the corrupted one will have finite health