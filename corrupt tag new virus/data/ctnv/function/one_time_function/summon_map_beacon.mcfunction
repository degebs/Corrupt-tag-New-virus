# this function is used for summoning a map beacon
# a map beacon has a few requirements
# 1. a name for the party leader to select
# 2. a way to teleport all players around it


#----------this chunk summons all the entitiys-----------------------
summon armor_stand ~ ~ ~ {Invisible:1b,NoBasePlate:1b,Small:1b,DisabledSlots:4128768,CustomName:[{text:map}],Invulnerable:1b,NoAI:1b,NoGravity:1b,Silent:1b,Tags:["map"]}
particle dragon_breath ~ ~1 ~ 0.1 1 0.1 0.1 400
particle firework ~ ~1 ~ 0.1 1 0.1 1 400
playsound block.beacon.power_select block @a ~ ~ ~ 1 1
particle enchant ~ ~ ~ 0 0 0 1 25

summon turtle ~ ~ ~ {CustomName:[{text:"map name"}],Invulnerable:1b,NoAI:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:["map"]}
forceload add ~ ~



#update the map beacon count-------------------------------------------------------



scoreboard players add map_beacon_count debug 1
scoreboard players operation @e[type=turtle,distance=..2] ordered_map_list = avalable_map_index debug
scoreboard players add avalable_map_index debug 1

# tell in chat how many map beacons there are
tellraw @a ["",{"text":"there are ","color":"gold"},{"color":"gold","score":{"objective":"debug","name":"map_beacon_count"}},{"color":"gold","text":" map beacons alive "}]
# unfortulatly there is a serious issue. when the last server shuts down the datapack forgets how many map beacons there are.
# this is a serious issue that causes severe desync issues.
# to fix this we need the number of map beacons that exists to be store into somthing that will presist between server restarts
# it just so happens that the life detecter armor stand is a perfect candidate for this
# using the the y-value of the life detecter armor stand we can store the number of map beacons that exist

# nvm it fixed itslef for some reason. i dont know how but it did, but im not changinging the code i used to try to fix it.

execute as @e[tag=life_detector] run tp @e[tag=life_detector] ~ ~1 ~

