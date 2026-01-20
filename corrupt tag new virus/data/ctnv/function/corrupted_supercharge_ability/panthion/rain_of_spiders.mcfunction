#literally just spawn in special spiders above everyone
# set up the timing logic

scoreboard players add time rain_of_spiders_logic 1

time set night
# this will make them hostile to everyone

# make sure there are not too many spiders
scoreboard players set count rain_of_spiders_logic 0
execute as @e[type=cave_spider] run scoreboard players add count rain_of_spiders_logic 1

execute at @a unless score count rain_of_spiders_logic matches 200.. run summon cave_spider ~5 ~25 ~5 {Health:1,Tags:["diety"],Team:corrupted,attributes:[{id:fall_damage_multiplier,base:0f},{id:scale,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:1f}]}
execute at @a unless score count rain_of_spiders_logic matches 200.. run summon cave_spider ~-5 ~25 ~5 {Health:1,Tags:["diety"],Team:corrupted,attributes:[{id:fall_damage_multiplier,base:0f},{id:scale,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:1f}]}
execute at @a unless score count rain_of_spiders_logic matches 200.. run summon cave_spider ~5 ~25 ~-5 {Health:1,Tags:["diety"],Team:corrupted,attributes:[{id:fall_damage_multiplier,base:0f},{id:scale,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:1f}]}
execute at @a unless score count rain_of_spiders_logic matches 200.. run summon cave_spider ~-5 ~25 ~-5 {Health:1,Tags:["diety"],Team:corrupted,attributes:[{id:fall_damage_multiplier,base:0f},{id:scale,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:1f}]}

# make it continuously rain spiders
execute if score tick time matches 1 run kill @e[type=cave_spider,limit=5]

# do more at the halfway point
execute at @a unless score count rain_of_spiders_logic matches 400.. if score time rain_of_spiders_logic matches 1500.. run summon cave_spider ~ ~25 ~ {Health:1,Tags:["diety"],Team:corrupted,attributes:[{id:fall_damage_multiplier,base:0f},{id:scale,base:0.3f},{id:follow_range,base:2048f},{id:max_health,base:1f}]}


effect give @a[team=runners] darkness 1 255 true

# after about 5 minuts of ticks kill the rain of spiders logic
execute if score time rain_of_spiders_logic matches 3000.. run kill @e[type=cave_spider]
execute if score time rain_of_spiders_logic matches 3000.. run kill @e[tag=rain_of_spiders]