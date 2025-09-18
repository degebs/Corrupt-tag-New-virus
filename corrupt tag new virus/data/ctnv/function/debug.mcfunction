# basically all these funtions work together to switch the game between "loby mode" and "debug mode" very usefull for map making,
#dont bother trying to understand this stuff

# just clear the inventry of the party leader before everyone else
clear @a[team=party_lead]

execute if score toggle debug matches 0 run scoreboard players set game state 0
execute if score toggle debug matches 0 run tellraw @a ["",{"text":"debug mode off","color":"gold"}]
# there is a nasty glitch that that spamms the party leader function when turing on and off the debug mode DURING a game.
execute if score toggle debug matches 0 run reload

execute if score toggle debug matches 0 run clear @a
execute if score toggle debug matches 0 run function ctnv:one_time_function/party_leader/party_leader

execute if score toggle debug matches 1 run scoreboard players set game state -1
execute if score toggle debug matches 1 run tellraw @a ["",{"text":"debug mode on","color":"gold"}]
execute if score toggle debug matches 1 run team leave @a

execute if score toggle debug matches 1 run give @a written_book[written_book_content={pages:[[[{"text":"summon lobby beacon","color":"green","click_event":{"action":"run_command","command":"/function ctnv:one_time_function/summon_lobby_beacon"},"hover_event":{"action":"show_text","value":"sets the spawn point basically, there can only be 1 lobby beacon so there is no need to break the previous one"}},{"text":"\n\n"},{"text":"summon map beacon","color":"dark_green","click_event":{"action":"run_command","command":"/function ctnv:one_time_function/summon_map_beacon"},"hover_event":{"action":"show_text","value":"summons a map beacon. name it with a name tag. make sure the radius is open for players to spawn... take care of the turtle"}},{"text":"\n"},{"text":"destroy map beacon","color":"dark_red","click_event":{"action":"run_command","command":"/function ctnv:one_time_function/kill_map_beacon"},"hover_event":{"action":"show_text","value":"kills a map beacon if you are near... you monster "}},{"text":"\n "}]]],title:"debug book",author:degebs,generation:0}]



scoreboard players add toggle debug 1

# this function toggles between debug mode. VERY important for map making

gamemode creative @a
tp @e[name=life_detecter] @r
scoreboard players set countdown time 25



# here we remind the mappers if there are no map beacons
execute if score map_beacon_count debug matches 0 run tellraw @a ["",{"text":"WARNING: NO MAP BEACONS DETECTED","color":"dark_red"}]
scoreboard players add avalable_map_index debug 0


# acheavment
execute if score count debug matches 20 run advancement grant @a only ctnv:corrupt_tag/debug
scoreboard players add count debug 1
execute if score count debug matches 30 run scoreboard players reset count debug
