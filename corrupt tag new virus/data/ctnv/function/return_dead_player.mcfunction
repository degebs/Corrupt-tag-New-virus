# this command turns a specating player into a normal player
# this is a multi step process

# 1 tp them to the nearest players
execute at @s run tp @s @r
# 2 set corruption to the nearest players corruption
execute as @s at @s run scoreboard players operation @s corruption = @r corruption
# 3 set the team to runner
team leave @s
team join runners @s
# 4 add them to the bouncer list
scoreboard players set @s bouncer_list 1

# 5 set there health to 1
execute as @s run scoreboard players set @s health 1