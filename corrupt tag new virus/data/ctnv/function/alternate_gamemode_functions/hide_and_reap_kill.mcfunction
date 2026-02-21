#=======================================BEGINNING OF CORRUPTION killing LOGIC===================================================
# reset the hit variable so that the players health is not drained
execute as @a if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players reset @s hit
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# if the runners health gets to 0, set the corrupted ones health to the max health
# this will make the corrupted one no logner corrupted. meanwhile the runner has a health of 0
# also clear the corrupted inventory so that items dont transfer
execute as @a[team=runners] if score @s health matches 0 run clear @a[team=corrupted]
execute as @a[team=runners] if score @s health matches 0 run scoreboard players operation @a[team=corrupted] health = @a[scores={ST____max_health=1..}] ST____max_health




# make sure that everone ONLY has the items allowed by there class and team
# there is a glitch where if a player has items then gets corrupted or vice versa, they may keep illigal items.
# to fix this we must clear the inventory of any player with a health of 0 and a team of runners.
# this will ensure a 1 tick gap where the invetory of all players can be kept in check
execute as @a[team=runners] if score @s health matches 0 run clear @s
# do a chat message to tell everone who just got corrupted
execute as @a[team=runners] if score @s health matches 0 unless score trigger hide_and_reap_death_trigger matches 0 run title @a[team=!dead] title [{"selector":"@s","color":"light_purple"},{"text":" IS IT!","color":"dark_purple","bold":true}]
execute as @a[team=runners] if score @s health matches 0 unless score trigger hide_and_reap_death_trigger matches 0 run tellraw @a [{"selector":"@s"},{"text":" IS NOW CORRUPTED!","color":"dark_purple","bold":true}]
# for this game mode we need to disable corruption swapping AFTER the first one.
execute if score trigger hide_and_reap_death_trigger matches 1.. if score @a[team=corrupted,limit=1] corruption_stun matches 0 run scoreboard players set trigger hide_and_reap_death_trigger 0
execute if score trigger hide_and_reap_death_trigger matches 0 as @a[team=runners] if score @s health matches 0 run team join dead @s
# you died message for the runners who got tagged

# particles for the death of the runner
execute as @a[team=dead] if score @s health matches 0 if score trigger hide_and_reap_death_trigger matches 0 if score @s hide_and_reap_death_trigger matches 1 at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 15 force @a
execute as @a[team=dead] if score @s health matches 0 if score trigger hide_and_reap_death_trigger matches 0 if score @s hide_and_reap_death_trigger matches 1 at @s run playsound entity.generic.explode block @a ~ ~ ~ 1 1 1




execute as @a[team=dead] if score @s health matches 0 if score trigger hide_and_reap_death_trigger matches 0 if score @s hide_and_reap_death_trigger matches 1 unless score runner_win hide_and_reap_death_trigger matches 1 run title @s title {"text":"you got caught","color":"dark_purple"}
# Display the time survived in seconds, minutes, and hours using title subtitles
execute as @a[team=dead] if score @s health matches 0 if score trigger hide_and_reap_death_trigger matches 0 if score @s hide_and_reap_death_trigger matches 1 unless score runner_win hide_and_reap_death_trigger matches 1 run title @s subtitle {"text":"you lasted: ","color":"white","extra":[{"score":{"name":"hours","objective":"time"}},{"text":" hours, ","color":"aqua"},{"score":{"name":"minutes","objective":"time"}},{"text":" minutes, ","color":"gold"},{"score":{"name":"seconds","objective":"time"}},{"text":" seconds","color":"yellow"}]}
# display a chat message to the whole server
execute as @a[team=dead] if score @s health matches 0 if score trigger hide_and_reap_death_trigger matches 0 if score @s hide_and_reap_death_trigger matches 1 unless score runner_win hide_and_reap_death_trigger matches 1 run tellraw @a {"text":"", "color":"white", "extra":[{"selector":"@s","color":"white"},{"text":" got caught after: ","color":"white"},{"score":{"name":"hours","objective":"time"},"color":"white"},{"text":" hours, ","color":"gold"},{"score":{"name":"minutes","objective":"time"},"color":"yellow"},{"text":" minutes, ","color":"white"},{"score":{"name":"seconds","objective":"time"},"color":"white"},{"text":" seconds","color":"green"}]}
# make sure that spectators get this message only once
execute as @a[team=!dead] run scoreboard players set @s hide_and_reap_death_trigger 1
execute as @a[team=dead] run scoreboard players set @s hide_and_reap_death_trigger 0


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# reset the hit variable again so that extra health is not given
execute as @a if score @s hit matches 1.. if score @s health matches 1.. run scoreboard players reset @s hit
#=======================================END OF CORRUPTION kiling LOGIC===================================================
