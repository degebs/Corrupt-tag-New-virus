# my sanity is dwindiling




# reset the hit variable so that the players health is not drained
execute as @a if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players reset @s hit

# prevent runners from ACTUALLY dying
effect give @a[team=runners] resistance 2 3 true
# when a runner has the health of 0 he goes down and would need to be revived
#execute as @a[team=runners] if score @s health matches 1.. run attribute @s scale base reset
#execute as @a[team=runners] if score @s health matches ..0 run attribute @s scale base set 0.5
execute as @a[team=runners] if score @s health matches ..0 run effect give @s slowness 1 2 true


# there is a glitch where the shulkers keeping the downed players down are not loayal to there spesific person.
# it is clear that this method will only work, if each shulker, has a unique id assigned to each player with an id

execute as @a[team=runners] at @s run function ctnv:one_time_function/downed_player_enforcement
effect give @e[type=shulker,tag=!wall] invisibility infinite 1 true
# the mobs will coaless on top of the shulker, this is bad and needs to be fixed
execute as @e[type=!shulker,tag=!wall,team=corrupted] at @s positioned ~ ~-1 ~ if entity @e[type=shulker,tag=!wall,distance=..0.6] run tp @s ~ ~-1 ~

#particle
execute as @a[team=runners] if score @s health matches ..0 run effect give @s wither 1 0 true

# do an annoucenement in chat
execute as @a[team=runners] if score @s downed matches 1 run tellraw @a [{"color":"gold","selector":"@s"},{"color":"gold","text":" IS DOWN! "}]
# for some reason this code does not run. unless i do it manually
# its weird. because sometimes this code breeaks and sometimes it works
# if a runner dies they should have only 1 tick to be at  "0" health... for multiple reasons
#1. should not be able to nautraly regenerate back into the game
#2. the previous bug that spams the chat and for some reason makes the shulker boxes visable
# the bug is still not fixed. a new function will be needed to work around this crap
# i wish i could just use the health variable to do this but no, it had to play the "fuck you" game
# for some reason if the runners health becomes 0 it may never go lower, and there no way to tell whats doing it
execute as @a[team=runners] if score @s health matches 0 run scoreboard players set @s health -1
# this one above may sometime not work, i cant find out why. so im developing a failsafe
execute as @a[team=runners] if score @s health matches ..0 if score @s downed matches 1 run scoreboard players add @s downed 1
execute as @a[team=runners] if score @s health matches ..0 if score @s downed matches 0 run scoreboard players add @s downed 1
execute as @a[team=runners] if score @s health matches 1.. run scoreboard players set @s downed 0
# the fact that this bug is so inconsistent and unpredictable is so genuenly infuriating.
# one consequence of this bug is that sometimes properly "dying" may not be possible some games

# if a fellow runners crouches next to a downed player they will come back to life

# downed runners cannot be invisable
execute as @a[team=runners] if score @s downed matches 1.. run effect clear @s invisibility

# if the runner is crouching NOT next to another runner then just reset
execute as @a[team=runners] at @s if score @s crouch_time matches 1.. if entity @a[distance=..1.5,team=runners,scores={health=..0}] unless score @s health matches ..0 run particle happy_villager ~ ~ ~ 1 1 1 1 1 force @a
# do the actual reviving
execute as @a[team=runners] at @s if score @s crouch_time matches 1.. if entity @a[distance=..1.5,team=runners,scores={health=..0}] unless score @s health matches ..0 run function ctnv:one_time_function/revive

# if the player is not crouching reset the score
execute as @a[team=runners] at @s if score @s crouch_time matches 1.. unless entity @a[distance=..1.5,team=runners,scores={health=..0}] unless score @s health matches ..0 run scoreboard players set @s crouch_time 0


# reset the hit variable again so that extra health is not given
execute as @a if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players reset @s hit


# if there are no runners alive left then the corrupted one wins
execute if score @r runners_alive matches 0 run team join dead @a[team=runners]
execute if score @r runners_alive matches 0 run function ctnv:alternate_gamemode_functions/hide_and_reap_corrupted_victory