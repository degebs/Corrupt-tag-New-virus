# every shulker must target a unique id
# there are 29 ID's to check


# id 1
execute as @a[team=runners,scores={player_ID=1}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_1_shulker"]}
execute as @a[team=runners,scores={player_ID=1}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_1_shulker] @s 
execute as @a[team=runners,scores={player_ID=1}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_1_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=1}] if score @s health matches 1.. at @s run kill @e[tag=ID_1_shulker] 
execute as @a[team=dead,scores={player_ID=1}] at @s run kill @e[tag=ID_1_shulker]

# id 2
execute as @a[team=runners,scores={player_ID=2}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_2_shulker"]}
execute as @a[team=runners,scores={player_ID=2}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_2_shulker] @s 
execute as @a[team=runners,scores={player_ID=2}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_2_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=2}] if score @s health matches 1.. at @s run kill @e[tag=ID_2_shulker] 
execute as @a[team=dead,scores={player_ID=2}] at @s run kill @e[tag=ID_2_shulker]

# id 3
execute as @a[team=runners,scores={player_ID=3}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_3_shulker"]}
execute as @a[team=runners,scores={player_ID=3}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_3_shulker] @s 
execute as @a[team=runners,scores={player_ID=3}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_3_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=3}] if score @s health matches 1.. at @s run kill @e[tag=ID_3_shulker] 
execute as @a[team=dead,scores={player_ID=3}] at @s run kill @e[tag=ID_3_shulker]

# id 4
execute as @a[team=runners,scores={player_ID=4}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_4_shulker"]}
execute as @a[team=runners,scores={player_ID=4}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_4_shulker] @s 
execute as @a[team=runners,scores={player_ID=4}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_4_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=4}] if score @s health matches 1.. at @s run kill @e[tag=ID_4_shulker] 
execute as @a[team=dead,scores={player_ID=4}] at @s run kill @e[tag=ID_4_shulker]

# id 5
execute as @a[team=runners,scores={player_ID=5}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_5_shulker"]}
execute as @a[team=runners,scores={player_ID=5}] if score @s health matches ..0 at @s if score @s downed matches 1 run tp @e[type=shulker,tag=ID_5_shulker] @s 
execute as @a[team=runners,scores={player_ID=5}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_5_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=5}] if score @s health matches 1.. at @s run kill @e[tag=ID_5_shulker] 
execute as @a[team=dead,scores={player_ID=5}] at @s run kill @e[tag=ID_5_shulker]

# id 6
execute as @a[team=runners,scores={player_ID=6}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_6_shulker"]}
execute as @a[team=runners,scores={player_ID=6}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_6_shulker] @s 
execute as @a[team=runners,scores={player_ID=6}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_6_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=6}] if score @s health matches 1.. at @s run kill @e[tag=ID_6_shulker] 
execute as @a[team=dead,scores={player_ID=6}] at @s run kill @e[tag=ID_6_shulker]

# id 7
execute as @a[team=runners,scores={player_ID=7}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_7_shulker"]}
execute as @a[team=runners,scores={player_ID=7}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_7_shulker] @s 
execute as @a[team=runners,scores={player_ID=7}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_7_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=7}] if score @s health matches 1.. at @s run kill @e[tag=ID_7_shulker] 
execute as @a[team=dead,scores={player_ID=7}] at @s run kill @e[tag=ID_7_shulker]

# id 8
execute as @a[team=runners,scores={player_ID=8}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_8_shulker"]}
execute as @a[team=runners,scores={player_ID=8}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_8_shulker] @s 
execute as @a[team=runners,scores={player_ID=8}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_8_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=8}] if score @s health matches 1.. at @s run kill @e[tag=ID_8_shulker] 
execute as @a[team=dead,scores={player_ID=8}] at @s run kill @e[tag=ID_8_shulker]

# id 9
execute as @a[team=runners,scores={player_ID=9}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_9_shulker"]}
execute as @a[team=runners,scores={player_ID=9}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_9_shulker] @s 
execute as @a[team=runners,scores={player_ID=9}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_9_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=9}] if score @s health matches 1.. at @s run kill @e[tag=ID_9_shulker] 
execute as @a[team=dead,scores={player_ID=9}] at @s run kill @e[tag=ID_9_shulker]

# id 10
execute as @a[team=runners,scores={player_ID=10}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_10_shulker"]}
execute as @a[team=runners,scores={player_ID=10}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_10_shulker] @s 
execute as @a[team=runners,scores={player_ID=10}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_10_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=10}] if score @s health matches 1.. at @s run kill @e[tag=ID_10_shulker] 
execute as @a[team=dead,scores={player_ID=10}] at @s run kill @e[tag=ID_10_shulker]

# id 11
execute as @a[team=runners,scores={player_ID=11}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_11_shulker"]}
execute as @a[team=runners,scores={player_ID=11}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_11_shulker] @s 
execute as @a[team=runners,scores={player_ID=11}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_11_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=11}] if score @s health matches 1.. at @s run kill @e[tag=ID_11_shulker] 
execute as @a[team=dead,scores={player_ID=11}] at @s run kill @e[tag=ID_11_shulker]

# id 12
execute as @a[team=runners,scores={player_ID=12}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_12_shulker"]}
execute as @a[team=runners,scores={player_ID=12}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_12_shulker] @s 
execute as @a[team=runners,scores={player_ID=12}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_12_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=12}] if score @s health matches 1.. at @s run kill @e[tag=ID_12_shulker] 
execute as @a[team=dead,scores={player_ID=12}] at @s run kill @e[tag=ID_12_shulker]

# id 13
execute as @a[team=runners,scores={player_ID=13}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_13_shulker"]}
execute as @a[team=runners,scores={player_ID=13}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_13_shulker] @s 
execute as @a[team=runners,scores={player_ID=13}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_13_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=13}] if score @s health matches 1.. at @s run kill @e[tag=ID_13_shulker] 
execute as @a[team=dead,scores={player_ID=13}] at @s run kill @e[tag=ID_13_shulker]

# id 14
execute as @a[team=runners,scores={player_ID=14}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_14_shulker"]}
execute as @a[team=runners,scores={player_ID=14}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_14_shulker] @s 
execute as @a[team=runners,scores={player_ID=14}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_14_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=14}] if score @s health matches 1.. at @s run kill @e[tag=ID_14_shulker] 
execute as @a[team=dead,scores={player_ID=14}] at @s run kill @e[tag=ID_14_shulker]

# id 15
execute as @a[team=runners,scores={player_ID=15}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_15_shulker"]}
execute as @a[team=runners,scores={player_ID=15}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_15_shulker] @s 
execute as @a[team=runners,scores={player_ID=15}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_15_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=15}] if score @s health matches 1.. at @s run kill @e[tag=ID_15_shulker] 
execute as @a[team=dead,scores={player_ID=15}] at @s run kill @e[tag=ID_15_shulker]

# id 16
execute as @a[team=runners,scores={player_ID=16}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_16_shulker"]}
execute as @a[team=runners,scores={player_ID=16}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_16_shulker] @s 
execute as @a[team=runners,scores={player_ID=16}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_16_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=16}] if score @s health matches 1.. at @s run kill @e[tag=ID_16_shulker] 
execute as @a[team=dead,scores={player_ID=16}] at @s run kill @e[tag=ID_16_shulker]

# id 17
execute as @a[team=runners,scores={player_ID=17}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_17_shulker"]}
execute as @a[team=runners,scores={player_ID=17}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_17_shulker] @s 
execute as @a[team=runners,scores={player_ID=17}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_17_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=17}] if score @s health matches 1.. at @s run kill @e[tag=ID_17_shulker] 
execute as @a[team=dead,scores={player_ID=17}] at @s run kill @e[tag=ID_17_shulker]

# id 18
execute as @a[team=runners,scores={player_ID=18}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_18_shulker"]}
execute as @a[team=runners,scores={player_ID=18}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_18_shulker] @s 
execute as @a[team=runners,scores={player_ID=18}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_18_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=18}] if score @s health matches 1.. at @s run kill @e[tag=ID_18_shulker] 
execute as @a[team=dead,scores={player_ID=18}] at @s run kill @e[tag=ID_18_shulker]

# id 19
execute as @a[team=runners,scores={player_ID=19}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_19_shulker"]}
execute as @a[team=runners,scores={player_ID=19}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_19_shulker] @s 
execute as @a[team=runners,scores={player_ID=19}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_19_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=19}] if score @s health matches 1.. at @s run kill @e[tag=ID_19_shulker] 
execute as @a[team=dead,scores={player_ID=19}] at @s run kill @e[tag=ID_19_shulker]

# id 20
execute as @a[team=runners,scores={player_ID=20}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_20_shulker"]}
execute as @a[team=runners,scores={player_ID=20}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_20_shulker] @s 
execute as @a[team=runners,scores={player_ID=20}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_20_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=20}] if score @s health matches 1.. at @s run kill @e[tag=ID_20_shulker] 
execute as @a[team=dead,scores={player_ID=20}] at @s run kill @e[tag=ID_20_shulker]

# id 21
execute as @a[team=runners,scores={player_ID=21}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_21_shulker"]}
execute as @a[team=runners,scores={player_ID=21}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_21_shulker] @s 
execute as @a[team=runners,scores={player_ID=21}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_21_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=21}] if score @s health matches 1.. at @s run kill @e[tag=ID_21_shulker] 
execute as @a[team=dead,scores={player_ID=21}] at @s run kill @e[tag=ID_21_shulker]

# id 22
execute as @a[team=runners,scores={player_ID=22}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_22_shulker"]}
execute as @a[team=runners,scores={player_ID=22}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_22_shulker] @s 
execute as @a[team=runners,scores={player_ID=22}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_22_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=22}] if score @s health matches 1.. at @s run kill @e[tag=ID_22_shulker] 
execute as @a[team=dead,scores={player_ID=22}] at @s run kill @e[tag=ID_22_shulker]

# id 23
execute as @a[team=runners,scores={player_ID=23}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_23_shulker"]}
execute as @a[team=runners,scores={player_ID=23}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_23_shulker] @s 
execute as @a[team=runners,scores={player_ID=23}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_23_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=23}] if score @s health matches 1.. at @s run kill @e[tag=ID_23_shulker] 
execute as @a[team=dead,scores={player_ID=23}] at @s run kill @e[tag=ID_23_shulker]

# id 24
execute as @a[team=runners,scores={player_ID=24}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_24_shulker"]}
execute as @a[team=runners,scores={player_ID=24}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_24_shulker] @s 
execute as @a[team=runners,scores={player_ID=24}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_24_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=24}] if score @s health matches 1.. at @s run kill @e[tag=ID_24_shulker] 
execute as @a[team=dead,scores={player_ID=24}] at @s run kill @e[tag=ID_24_shulker]

# id 25
execute as @a[team=runners,scores={player_ID=25}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_25_shulker"]}
execute as @a[team=runners,scores={player_ID=25}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_25_shulker] @s 
execute as @a[team=runners,scores={player_ID=25}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_25_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=25}] if score @s health matches 1.. at @s run kill @e[tag=ID_25_shulker] 
execute as @a[team=dead,scores={player_ID=25}] at @s run kill @e[tag=ID_25_shulker]

# id 26
execute as @a[team=runners,scores={player_ID=26}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_26_shulker"]}
execute as @a[team=runners,scores={player_ID=26}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_26_shulker] @s 
execute as @a[team=runners,scores={player_ID=26}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_26_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=26}] if score @s health matches 1.. at @s run kill @e[tag=ID_26_shulker] 
execute as @a[team=dead,scores={player_ID=26}] at @s run kill @e[tag=ID_26_shulker]

# id 27
execute as @a[team=runners,scores={player_ID=27}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_27_shulker"]}
execute as @a[team=runners,scores={player_ID=27}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_27_shulker] @s 
execute as @a[team=runners,scores={player_ID=27}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_27_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=27}] if score @s health matches 1.. at @s run kill @e[tag=ID_27_shulker] 
execute as @a[team=dead,scores={player_ID=27}] at @s run kill @e[tag=ID_27_shulker]

# id 28
execute as @a[team=runners,scores={player_ID=28}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_28_shulker"]}
execute as @a[team=runners,scores={player_ID=28}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_28_shulker] @s 
execute as @a[team=runners,scores={player_ID=28}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_28_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=28}] if score @s health matches 1.. at @s run kill @e[tag=ID_28_shulker] 
execute as @a[team=dead,scores={player_ID=28}] at @s run kill @e[tag=ID_28_shulker]

# id 29
execute as @a[team=runners,scores={player_ID=29}] if score @s health matches ..0 at @s if score @s downed matches 1 run summon shulker ~ ~ ~ {Invulnerable:1b,NoAI:1b,Silent:1b,Tags:["ID_29_shulker"]}
execute as @a[team=runners,scores={player_ID=29}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_29_shulker] @s 
execute as @a[team=runners,scores={player_ID=29}] if score @s health matches ..0 at @s run tp @e[type=shulker,tag=ID_29_shulker] ~ ~1 ~
execute as @a[team=runners,scores={player_ID=29}] if score @s health matches 1.. at @s run kill @e[tag=ID_29_shulker] 
execute as @a[team=dead,scores={player_ID=29}] at @s run kill @e[tag=ID_29_shulker]




# a message to alive players, teaching them how to heal
# check if an alive player is standing next to a dead one
execute if score revive_tutorial call_of_corrupted matches 0 run tellraw @a[team=runners] ["revive fallen player by ",{"text":"sneaking","color":"blue"}," next to them"]
# make sure they only get the message once
execute if score revive_tutorial call_of_corrupted matches 0 run scoreboard players set revive_tutorial call_of_corrupted 1