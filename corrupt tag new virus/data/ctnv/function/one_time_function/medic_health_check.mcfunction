#===========================================================================================================================================
#medic has a custom sidebar that shows the health,name, and distance of the nearest runner to them, this function is what updates that sidebar
#===========================================================================================================================================
execute at @s if score @s corruption matches 0..9 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██████████","color":"white"}]

execute at @s if score @s corruption matches 20..29 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ██","color":"dark_purple"},{"text":"████████","color":"white"}]

execute at @s if score @s corruption matches 30..39 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ███","color":"dark_purple"},{"text":"███████","color":"white"}]

execute at @s if score @s corruption matches 40..49 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ████","color":"dark_purple"},{"text":"██████","color":"white"}]

execute at @s if score @s corruption matches 50..59 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" █████","color":"dark_purple"},{"text":"█████","color":"white"}]

execute at @s if score @s corruption matches 60..69 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓█████","color":"dark_purple"},{"text":"████","color":"white"}]

execute at @s if score @s corruption matches 70..79 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓█████","color":"dark_purple"},{"text":"███","color":"white"}]

execute at @s if score @s corruption matches 80..89 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓█████","color":"dark_purple"},{"text":"██","color":"white"}]

execute at @s if score @s corruption matches 90..99 run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▓▓▓▓█████","color":"dark_purple"},{"text":"█","color":"white"}]

execute at @s if score @s corruption matches 100.. run title @s actionbar ["",{"text":"Corrupted: ","color":"red"},{"selector":"@a[team=corrupted,limit=1]"},{"text":" ","color":"gray"},{"text":"+/Runner:","color":"dark_green"},{"selector":"@p[distance=0.1..,team=runners]","color":"yellow"},{"text":" Health:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_health"},"color":"yellow"},{"text":" Distance:","color":"dark_green"},{"score":{"name":"@s","objective":"medic_nearest_runner_distance"},"color":"yellow"},{"text":"\\+","color":"dark_green"},{"text":"  ","color":"gray"},{"score":{"name":"@s","objective":"corruption"}},{"text":"% corrupt","color":"dark_purple"},{"text":" ▒▓▓▓▓█████","color":"dark_purple"}]

#==============================================================================================================================================================
# find the health of the nearest runner
# then save it to the scoreboard @s medic_nearest_runner_health
scoreboard players reset @s medic_nearest_runner_health
execute as @s at @s store result score @s medic_nearest_runner_health run data get entity @p[distance=0.1..,team=runners,sort=nearest,limit=1] Health 0.5

#==============================================================================================================================================================
# find the distance to the nearest runner
# then save it to the scoreboard @s medic_nearest_runner_distance

# find the distance to the nearest runner
# then save it to the scoreboard @s medic_nearest_runner_distance

#this is ugly but works
execute as @s at @s if entity @p[distance=199.1..200,team=runners] run scoreboard players set @s medic_nearest_runner_distance 200
execute as @s at @s if entity @p[distance=198.1..199,team=runners] run scoreboard players set @s medic_nearest_runner_distance 199
execute as @s at @s if entity @p[distance=197.1..198,team=runners] run scoreboard players set @s medic_nearest_runner_distance 198
execute as @s at @s if entity @p[distance=196.1..197,team=runners] run scoreboard players set @s medic_nearest_runner_distance 197
execute as @s at @s if entity @p[distance=195.1..196,team=runners] run scoreboard players set @s medic_nearest_runner_distance 196
execute as @s at @s if entity @p[distance=194.1..195,team=runners] run scoreboard players set @s medic_nearest_runner_distance 195
execute as @s at @s if entity @p[distance=193.1..194,team=runners] run scoreboard players set @s medic_nearest_runner_distance 194
execute as @s at @s if entity @p[distance=192.1..193,team=runners] run scoreboard players set @s medic_nearest_runner_distance 193
execute as @s at @s if entity @p[distance=191.1..192,team=runners] run scoreboard players set @s medic_nearest_runner_distance 192
execute as @s at @s if entity @p[distance=190.1..191,team=runners] run scoreboard players set @s medic_nearest_runner_distance 191
execute as @s at @s if entity @p[distance=189.1..190,team=runners] run scoreboard players set @s medic_nearest_runner_distance 190
execute as @s at @s if entity @p[distance=188.1..189,team=runners] run scoreboard players set @s medic_nearest_runner_distance 189
execute as @s at @s if entity @p[distance=187.1..188,team=runners] run scoreboard players set @s medic_nearest_runner_distance 188
execute as @s at @s if entity @p[distance=186.1..187,team=runners] run scoreboard players set @s medic_nearest_runner_distance 187
execute as @s at @s if entity @p[distance=185.1..186,team=runners] run scoreboard players set @s medic_nearest_runner_distance 186
execute as @s at @s if entity @p[distance=184.1..185,team=runners] run scoreboard players set @s medic_nearest_runner_distance 185
execute as @s at @s if entity @p[distance=183.1..184,team=runners] run scoreboard players set @s medic_nearest_runner_distance 184
execute as @s at @s if entity @p[distance=182.1..183,team=runners] run scoreboard players set @s medic_nearest_runner_distance 183
execute as @s at @s if entity @p[distance=181.1..182,team=runners] run scoreboard players set @s medic_nearest_runner_distance 182
execute as @s at @s if entity @p[distance=180.1..181,team=runners] run scoreboard players set @s medic_nearest_runner_distance 181
execute as @s at @s if entity @p[distance=179.1..180,team=runners] run scoreboard players set @s medic_nearest_runner_distance 180
execute as @s at @s if entity @p[distance=178.1..179,team=runners] run scoreboard players set @s medic_nearest_runner_distance 179
execute as @s at @s if entity @p[distance=177.1..178,team=runners] run scoreboard players set @s medic_nearest_runner_distance 178
execute as @s at @s if entity @p[distance=176.1..177,team=runners] run scoreboard players set @s medic_nearest_runner_distance 177
execute as @s at @s if entity @p[distance=175.1..176,team=runners] run scoreboard players set @s medic_nearest_runner_distance 176
execute as @s at @s if entity @p[distance=174.1..175,team=runners] run scoreboard players set @s medic_nearest_runner_distance 175
execute as @s at @s if entity @p[distance=173.1..174,team=runners] run scoreboard players set @s medic_nearest_runner_distance 174
execute as @s at @s if entity @p[distance=172.1..173,team=runners] run scoreboard players set @s medic_nearest_runner_distance 173
execute as @s at @s if entity @p[distance=171.1..172,team=runners] run scoreboard players set @s medic_nearest_runner_distance 172
execute as @s at @s if entity @p[distance=170.1..171,team=runners] run scoreboard players set @s medic_nearest_runner_distance 171
execute as @s at @s if entity @p[distance=169.1..170,team=runners] run scoreboard players set @s medic_nearest_runner_distance 170
execute as @s at @s if entity @p[distance=168.1..169,team=runners] run scoreboard players set @s medic_nearest_runner_distance 169
execute as @s at @s if entity @p[distance=167.1..168,team=runners] run scoreboard players set @s medic_nearest_runner_distance 168
execute as @s at @s if entity @p[distance=166.1..167,team=runners] run scoreboard players set @s medic_nearest_runner_distance 167
execute as @s at @s if entity @p[distance=165.1..166,team=runners] run scoreboard players set @s medic_nearest_runner_distance 166
execute as @s at @s if entity @p[distance=164.1..165,team=runners] run scoreboard players set @s medic_nearest_runner_distance 165
execute as @s at @s if entity @p[distance=163.1..164,team=runners] run scoreboard players set @s medic_nearest_runner_distance 164
execute as @s at @s if entity @p[distance=162.1..163,team=runners] run scoreboard players set @s medic_nearest_runner_distance 163
execute as @s at @s if entity @p[distance=161.1..162,team=runners] run scoreboard players set @s medic_nearest_runner_distance 162
execute as @s at @s if entity @p[distance=160.1..161,team=runners] run scoreboard players set @s medic_nearest_runner_distance 161
execute as @s at @s if entity @p[distance=159.1..160,team=runners] run scoreboard players set @s medic_nearest_runner_distance 160
execute as @s at @s if entity @p[distance=158.1..159,team=runners] run scoreboard players set @s medic_nearest_runner_distance 159
execute as @s at @s if entity @p[distance=157.1..158,team=runners] run scoreboard players set @s medic_nearest_runner_distance 158
execute as @s at @s if entity @p[distance=156.1..157,team=runners] run scoreboard players set @s medic_nearest_runner_distance 157
execute as @s at @s if entity @p[distance=155.1..156,team=runners] run scoreboard players set @s medic_nearest_runner_distance 156
execute as @s at @s if entity @p[distance=154.1..155,team=runners] run scoreboard players set @s medic_nearest_runner_distance 155
execute as @s at @s if entity @p[distance=153.1..154,team=runners] run scoreboard players set @s medic_nearest_runner_distance 154
execute as @s at @s if entity @p[distance=152.1..153,team=runners] run scoreboard players set @s medic_nearest_runner_distance 153
execute as @s at @s if entity @p[distance=151.1..152,team=runners] run scoreboard players set @s medic_nearest_runner_distance 152
execute as @s at @s if entity @p[distance=150.1..151,team=runners] run scoreboard players set @s medic_nearest_runner_distance 151
execute as @s at @s if entity @p[distance=149.1..150,team=runners] run scoreboard players set @s medic_nearest_runner_distance 150
execute as @s at @s if entity @p[distance=148.1..149,team=runners] run scoreboard players set @s medic_nearest_runner_distance 149
execute as @s at @s if entity @p[distance=147.1..148,team=runners] run scoreboard players set @s medic_nearest_runner_distance 148
execute as @s at @s if entity @p[distance=146.1..147,team=runners] run scoreboard players set @s medic_nearest_runner_distance 147
execute as @s at @s if entity @p[distance=145.1..146,team=runners] run scoreboard players set @s medic_nearest_runner_distance 146
execute as @s at @s if entity @p[distance=144.1..145,team=runners] run scoreboard players set @s medic_nearest_runner_distance 145
execute as @s at @s if entity @p[distance=143.1..144,team=runners] run scoreboard players set @s medic_nearest_runner_distance 144
execute as @s at @s if entity @p[distance=142.1..143,team=runners] run scoreboard players set @s medic_nearest_runner_distance 143
execute as @s at @s if entity @p[distance=141.1..142,team=runners] run scoreboard players set @s medic_nearest_runner_distance 142
execute as @s at @s if entity @p[distance=140.1..141,team=runners] run scoreboard players set @s medic_nearest_runner_distance 141
execute as @s at @s if entity @p[distance=139.1..140,team=runners] run scoreboard players set @s medic_nearest_runner_distance 140
execute as @s at @s if entity @p[distance=138.1..139,team=runners] run scoreboard players set @s medic_nearest_runner_distance 139
execute as @s at @s if entity @p[distance=137.1..138,team=runners] run scoreboard players set @s medic_nearest_runner_distance 138
execute as @s at @s if entity @p[distance=136.1..137,team=runners] run scoreboard players set @s medic_nearest_runner_distance 137
execute as @s at @s if entity @p[distance=135.1..136,team=runners] run scoreboard players set @s medic_nearest_runner_distance 136
execute as @s at @s if entity @p[distance=134.1..135,team=runners] run scoreboard players set @s medic_nearest_runner_distance 135
execute as @s at @s if entity @p[distance=133.1..134,team=runners] run scoreboard players set @s medic_nearest_runner_distance 134
execute as @s at @s if entity @p[distance=132.1..133,team=runners] run scoreboard players set @s medic_nearest_runner_distance 133
execute as @s at @s if entity @p[distance=131.1..132,team=runners] run scoreboard players set @s medic_nearest_runner_distance 132
execute as @s at @s if entity @p[distance=130.1..131,team=runners] run scoreboard players set @s medic_nearest_runner_distance 131
execute as @s at @s if entity @p[distance=129.1..130,team=runners] run scoreboard players set @s medic_nearest_runner_distance 130
execute as @s at @s if entity @p[distance=128.1..129,team=runners] run scoreboard players set @s medic_nearest_runner_distance 129
execute as @s at @s if entity @p[distance=127.1..128,team=runners] run scoreboard players set @s medic_nearest_runner_distance 128
execute as @s at @s if entity @p[distance=126.1..127,team=runners] run scoreboard players set @s medic_nearest_runner_distance 127
execute as @s at @s if entity @p[distance=125.1..126,team=runners] run scoreboard players set @s medic_nearest_runner_distance 126
execute as @s at @s if entity @p[distance=124.1..125,team=runners] run scoreboard players set @s medic_nearest_runner_distance 125
execute as @s at @s if entity @p[distance=123.1..124,team=runners] run scoreboard players set @s medic_nearest_runner_distance 124
execute as @s at @s if entity @p[distance=122.1..123,team=runners] run scoreboard players set @s medic_nearest_runner_distance 123
execute as @s at @s if entity @p[distance=121.1..122,team=runners] run scoreboard players set @s medic_nearest_runner_distance 122
execute as @s at @s if entity @p[distance=120.1..121,team=runners] run scoreboard players set @s medic_nearest_runner_distance 121
execute as @s at @s if entity @p[distance=119.1..120,team=runners] run scoreboard players set @s medic_nearest_runner_distance 120
execute as @s at @s if entity @p[distance=118.1..119,team=runners] run scoreboard players set @s medic_nearest_runner_distance 119
execute as @s at @s if entity @p[distance=117.1..118,team=runners] run scoreboard players set @s medic_nearest_runner_distance 118
execute as @s at @s if entity @p[distance=116.1..117,team=runners] run scoreboard players set @s medic_nearest_runner_distance 117
execute as @s at @s if entity @p[distance=115.1..116,team=runners] run scoreboard players set @s medic_nearest_runner_distance 116
execute as @s at @s if entity @p[distance=114.1..115,team=runners] run scoreboard players set @s medic_nearest_runner_distance 115
execute as @s at @s if entity @p[distance=113.1..114,team=runners] run scoreboard players set @s medic_nearest_runner_distance 114
execute as @s at @s if entity @p[distance=112.1..113,team=runners] run scoreboard players set @s medic_nearest_runner_distance 113
execute as @s at @s if entity @p[distance=111.1..112,team=runners] run scoreboard players set @s medic_nearest_runner_distance 112
execute as @s at @s if entity @p[distance=110.1..111,team=runners] run scoreboard players set @s medic_nearest_runner_distance 111
execute as @s at @s if entity @p[distance=109.1..110,team=runners] run scoreboard players set @s medic_nearest_runner_distance 110
execute as @s at @s if entity @p[distance=108.1..109,team=runners] run scoreboard players set @s medic_nearest_runner_distance 109
execute as @s at @s if entity @p[distance=107.1..108,team=runners] run scoreboard players set @s medic_nearest_runner_distance 108
execute as @s at @s if entity @p[distance=106.1..107,team=runners] run scoreboard players set @s medic_nearest_runner_distance 107
execute as @s at @s if entity @p[distance=105.1..106,team=runners] run scoreboard players set @s medic_nearest_runner_distance 106
execute as @s at @s if entity @p[distance=104.1..105,team=runners] run scoreboard players set @s medic_nearest_runner_distance 105
execute as @s at @s if entity @p[distance=103.1..104,team=runners] run scoreboard players set @s medic_nearest_runner_distance 104
execute as @s at @s if entity @p[distance=102.1..103,team=runners] run scoreboard players set @s medic_nearest_runner_distance 103
execute as @s at @s if entity @p[distance=101.1..102,team=runners] run scoreboard players set @s medic_nearest_runner_distance 102
execute as @s at @s if entity @p[distance=100.1..101,team=runners] run scoreboard players set @s medic_nearest_runner_distance 101
execute as @s at @s if entity @p[distance=99.1..100,team=runners] run scoreboard players set @s medic_nearest_runner_distance 100
execute as @s at @s if entity @p[distance=98.1..99,team=runners] run scoreboard players set @s medic_nearest_runner_distance 99
execute as @s at @s if entity @p[distance=97.1..98,team=runners] run scoreboard players set @s medic_nearest_runner_distance 98
execute as @s at @s if entity @p[distance=96.1..97,team=runners] run scoreboard players set @s medic_nearest_runner_distance 97
execute as @s at @s if entity @p[distance=95.1..96,team=runners] run scoreboard players set @s medic_nearest_runner_distance 96
execute as @s at @s if entity @p[distance=94.1..95,team=runners] run scoreboard players set @s medic_nearest_runner_distance 95
execute as @s at @s if entity @p[distance=93.1..94,team=runners] run scoreboard players set @s medic_nearest_runner_distance 94
execute as @s at @s if entity @p[distance=92.1..93,team=runners] run scoreboard players set @s medic_nearest_runner_distance 93
execute as @s at @s if entity @p[distance=91.1..92,team=runners] run scoreboard players set @s medic_nearest_runner_distance 92
execute as @s at @s if entity @p[distance=90.1..91,team=runners] run scoreboard players set @s medic_nearest_runner_distance 91
execute as @s at @s if entity @p[distance=89.1..90,team=runners] run scoreboard players set @s medic_nearest_runner_distance 90
execute as @s at @s if entity @p[distance=88.1..89,team=runners] run scoreboard players set @s medic_nearest_runner_distance 89
execute as @s at @s if entity @p[distance=87.1..88,team=runners] run scoreboard players set @s medic_nearest_runner_distance 88
execute as @s at @s if entity @p[distance=86.1..87,team=runners] run scoreboard players set @s medic_nearest_runner_distance 87
execute as @s at @s if entity @p[distance=85.1..86,team=runners] run scoreboard players set @s medic_nearest_runner_distance 86
execute as @s at @s if entity @p[distance=84.1..85,team=runners] run scoreboard players set @s medic_nearest_runner_distance 85
execute as @s at @s if entity @p[distance=83.1..84,team=runners] run scoreboard players set @s medic_nearest_runner_distance 84
execute as @s at @s if entity @p[distance=82.1..83,team=runners] run scoreboard players set @s medic_nearest_runner_distance 83
execute as @s at @s if entity @p[distance=81.1..82,team=runners] run scoreboard players set @s medic_nearest_runner_distance 82
execute as @s at @s if entity @p[distance=80.1..81,team=runners] run scoreboard players set @s medic_nearest_runner_distance 81
execute as @s at @s if entity @p[distance=79.1..80,team=runners] run scoreboard players set @s medic_nearest_runner_distance 80
execute as @s at @s if entity @p[distance=78.1..79,team=runners] run scoreboard players set @s medic_nearest_runner_distance 79
execute as @s at @s if entity @p[distance=77.1..78,team=runners] run scoreboard players set @s medic_nearest_runner_distance 78
execute as @s at @s if entity @p[distance=76.1..77,team=runners] run scoreboard players set @s medic_nearest_runner_distance 77
execute as @s at @s if entity @p[distance=75.1..76,team=runners] run scoreboard players set @s medic_nearest_runner_distance 76
execute as @s at @s if entity @p[distance=74.1..75,team=runners] run scoreboard players set @s medic_nearest_runner_distance 75
execute as @s at @s if entity @p[distance=73.1..74,team=runners] run scoreboard players set @s medic_nearest_runner_distance 74
execute as @s at @s if entity @p[distance=72.1..73,team=runners] run scoreboard players set @s medic_nearest_runner_distance 73
execute as @s at @s if entity @p[distance=71.1..72,team=runners] run scoreboard players set @s medic_nearest_runner_distance 72
execute as @s at @s if entity @p[distance=70.1..71,team=runners] run scoreboard players set @s medic_nearest_runner_distance 71
execute as @s at @s if entity @p[distance=69.1..70,team=runners] run scoreboard players set @s medic_nearest_runner_distance 70
execute as @s at @s if entity @p[distance=68.1..69,team=runners] run scoreboard players set @s medic_nearest_runner_distance 69
execute as @s at @s if entity @p[distance=67.1..68,team=runners] run scoreboard players set @s medic_nearest_runner_distance 68
execute as @s at @s if entity @p[distance=66.1..67,team=runners] run scoreboard players set @s medic_nearest_runner_distance 67
execute as @s at @s if entity @p[distance=65.1..66,team=runners] run scoreboard players set @s medic_nearest_runner_distance 66
execute as @s at @s if entity @p[distance=64.1..65,team=runners] run scoreboard players set @s medic_nearest_runner_distance 65
execute as @s at @s if entity @p[distance=63.1..64,team=runners] run scoreboard players set @s medic_nearest_runner_distance 64
execute as @s at @s if entity @p[distance=62.1..63,team=runners] run scoreboard players set @s medic_nearest_runner_distance 63
execute as @s at @s if entity @p[distance=61.1..62,team=runners] run scoreboard players set @s medic_nearest_runner_distance 62
execute as @s at @s if entity @p[distance=60.1..61,team=runners] run scoreboard players set @s medic_nearest_runner_distance 61
execute as @s at @s if entity @p[distance=59.1..60,team=runners] run scoreboard players set @s medic_nearest_runner_distance 60
execute as @s at @s if entity @p[distance=58.1..59,team=runners] run scoreboard players set @s medic_nearest_runner_distance 59
execute as @s at @s if entity @p[distance=57.1..58,team=runners] run scoreboard players set @s medic_nearest_runner_distance 58
execute as @s at @s if entity @p[distance=56.1..57,team=runners] run scoreboard players set @s medic_nearest_runner_distance 57
execute as @s at @s if entity @p[distance=55.1..56,team=runners] run scoreboard players set @s medic_nearest_runner_distance 56
execute as @s at @s if entity @p[distance=54.1..55,team=runners] run scoreboard players set @s medic_nearest_runner_distance 55
execute as @s at @s if entity @p[distance=53.1..54,team=runners] run scoreboard players set @s medic_nearest_runner_distance 54
execute as @s at @s if entity @p[distance=52.1..53,team=runners] run scoreboard players set @s medic_nearest_runner_distance 53
execute as @s at @s if entity @p[distance=51.1..52,team=runners] run scoreboard players set @s medic_nearest_runner_distance 52
execute as @s at @s if entity @p[distance=50.1..51,team=runners] run scoreboard players set @s medic_nearest_runner_distance 51
execute as @s at @s if entity @p[distance=49.1..50,team=runners] run scoreboard players set @s medic_nearest_runner_distance 50
execute as @s at @s if entity @p[distance=48.1..49,team=runners] run scoreboard players set @s medic_nearest_runner_distance 49
execute as @s at @s if entity @p[distance=47.1..48,team=runners] run scoreboard players set @s medic_nearest_runner_distance 48
execute as @s at @s if entity @p[distance=46.1..47,team=runners] run scoreboard players set @s medic_nearest_runner_distance 47
execute as @s at @s if entity @p[distance=45.1..46,team=runners] run scoreboard players set @s medic_nearest_runner_distance 46
execute as @s at @s if entity @p[distance=44.1..45,team=runners] run scoreboard players set @s medic_nearest_runner_distance 45
execute as @s at @s if entity @p[distance=43.1..44,team=runners] run scoreboard players set @s medic_nearest_runner_distance 44
execute as @s at @s if entity @p[distance=42.1..43,team=runners] run scoreboard players set @s medic_nearest_runner_distance 43
execute as @s at @s if entity @p[distance=41.1..42,team=runners] run scoreboard players set @s medic_nearest_runner_distance 42
execute as @s at @s if entity @p[distance=40.1..41,team=runners] run scoreboard players set @s medic_nearest_runner_distance 41
execute as @s at @s if entity @p[distance=39.1..40,team=runners] run scoreboard players set @s medic_nearest_runner_distance 40
execute as @s at @s if entity @p[distance=38.1..39,team=runners] run scoreboard players set @s medic_nearest_runner_distance 39
execute as @s at @s if entity @p[distance=37.1..38,team=runners] run scoreboard players set @s medic_nearest_runner_distance 38
execute as @s at @s if entity @p[distance=36.1..37,team=runners] run scoreboard players set @s medic_nearest_runner_distance 37
execute as @s at @s if entity @p[distance=35.1..36,team=runners] run scoreboard players set @s medic_nearest_runner_distance 36
execute as @s at @s if entity @p[distance=34.1..35,team=runners] run scoreboard players set @s medic_nearest_runner_distance 35
execute as @s at @s if entity @p[distance=33.1..34,team=runners] run scoreboard players set @s medic_nearest_runner_distance 34
execute as @s at @s if entity @p[distance=32.1..33,team=runners] run scoreboard players set @s medic_nearest_runner_distance 33
execute as @s at @s if entity @p[distance=31.1..32,team=runners] run scoreboard players set @s medic_nearest_runner_distance 32
execute as @s at @s if entity @p[distance=30.1..31,team=runners] run scoreboard players set @s medic_nearest_runner_distance 31
execute as @s at @s if entity @p[distance=29.1..30,team=runners] run scoreboard players set @s medic_nearest_runner_distance 30
execute as @s at @s if entity @p[distance=28.1..29,team=runners] run scoreboard players set @s medic_nearest_runner_distance 29
execute as @s at @s if entity @p[distance=27.1..28,team=runners] run scoreboard players set @s medic_nearest_runner_distance 28
execute as @s at @s if entity @p[distance=26.1..27,team=runners] run scoreboard players set @s medic_nearest_runner_distance 27
execute as @s at @s if entity @p[distance=25.1..26,team=runners] run scoreboard players set @s medic_nearest_runner_distance 26
execute as @s at @s if entity @p[distance=24.1..25,team=runners] run scoreboard players set @s medic_nearest_runner_distance 25
execute as @s at @s if entity @p[distance=23.1..24,team=runners] run scoreboard players set @s medic_nearest_runner_distance 24
execute as @s at @s if entity @p[distance=22.1..23,team=runners] run scoreboard players set @s medic_nearest_runner_distance 23
execute as @s at @s if entity @p[distance=21.1..22,team=runners] run scoreboard players set @s medic_nearest_runner_distance 22
execute as @s at @s if entity @p[distance=20.1..21,team=runners] run scoreboard players set @s medic_nearest_runner_distance 21
execute as @s at @s if entity @p[distance=19.1..20,team=runners] run scoreboard players set @s medic_nearest_runner_distance 20
execute as @s at @s if entity @p[distance=18.1..19,team=runners] run scoreboard players set @s medic_nearest_runner_distance 19
execute as @s at @s if entity @p[distance=17.1..18,team=runners] run scoreboard players set @s medic_nearest_runner_distance 18
execute as @s at @s if entity @p[distance=16.1..17,team=runners] run scoreboard players set @s medic_nearest_runner_distance 17
execute as @s at @s if entity @p[distance=15.1..16,team=runners] run scoreboard players set @s medic_nearest_runner_distance 16
execute as @s at @s if entity @p[distance=14.1..15,team=runners] run scoreboard players set @s medic_nearest_runner_distance 15
execute as @s at @s if entity @p[distance=13.1..14,team=runners] run scoreboard players set @s medic_nearest_runner_distance 14
execute as @s at @s if entity @p[distance=12.1..13,team=runners] run scoreboard players set @s medic_nearest_runner_distance 13
execute as @s at @s if entity @p[distance=11.1..12,team=runners] run scoreboard players set @s medic_nearest_runner_distance 12
execute as @s at @s if entity @p[distance=10.1..11,team=runners] run scoreboard players set @s medic_nearest_runner_distance 11
execute as @s at @s if entity @p[distance=9.1..10,team=runners] run scoreboard players set @s medic_nearest_runner_distance 10
execute as @s at @s if entity @p[distance=8.1..9,team=runners] run scoreboard players set @s medic_nearest_runner_distance 9
execute as @s at @s if entity @p[distance=7.1..8,team=runners] run scoreboard players set @s medic_nearest_runner_distance 8
execute as @s at @s if entity @p[distance=6.1..7,team=runners] run scoreboard players set @s medic_nearest_runner_distance 7
execute as @s at @s if entity @p[distance=5.1..6,team=runners] run scoreboard players set @s medic_nearest_runner_distance 6
execute as @s at @s if entity @p[distance=4.1..5,team=runners] run scoreboard players set @s medic_nearest_runner_distance 5
execute as @s at @s if entity @p[distance=3.1..4,team=runners] run scoreboard players set @s medic_nearest_runner_distance 4
execute as @s at @s if entity @p[distance=2.1..3,team=runners] run scoreboard players set @s medic_nearest_runner_distance 3
execute as @s at @s if entity @p[distance=1.1..2,team=runners] run scoreboard players set @s medic_nearest_runner_distance 2
execute as @s at @s if entity @p[distance=0.1..1,team=runners] run scoreboard players set @s medic_nearest_runner_distance 1
