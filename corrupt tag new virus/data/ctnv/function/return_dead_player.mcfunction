# this command turns a specating player into a normal player
# this is a multi step process

# 1 set corrupt tag to 0
scoreboard players set @s corruption 0
# 2 set the team to runner
team leave @s
team join runners @s
# 3 add them to the bouncer list
scoreboard players set @s bouncer_list 1
# 4 tp them to the nearest players
execute at @s run tp @s @r
# 5 set there health to 1
execute as @s run scoreboard players set @s health 1