playsound entity.villager.no master @a ~ ~ ~ 1 0.9

# this is for the merchants coin bad outcome
# the higher the rng value when this function is trigger the more severe the punishment


execute if score @s merchant_rng matches 0..8 run effect give @s slowness 3 1
execute if score @s merchant_rng matches 0..8 run particle smoke ~ ~1 ~ 0.3 0.5 0.3 0.02 15 normal
execute if score @s merchant_rng matches 0..8 run tellraw @s [{"text":"☁ ","color":"gray"},{"text":"Minor Slowness","color":"dark_gray"}]

execute if score @s merchant_rng matches 8..14 run effect give @s slowness 3 2
execute if score @s merchant_rng matches 8..14 run particle smoke ~ ~1 ~ 0.4 0.5 0.4 0.03 20 normal
execute if score @s merchant_rng matches 8..14 run tellraw @s [{"text":"☁ ","color":"gray"},{"text":"Slowness II","color":"dark_gray","bold":true}]

execute if score @s merchant_rng matches 14..20 run effect give @s slowness 3 3
execute if score @s merchant_rng matches 14..20 run particle large_smoke ~ ~1 ~ 0.5 0.5 0.5 0.05 25 normal
execute if score @s merchant_rng matches 14..20 run tellraw @s [{"text":"☁ ","color":"dark_gray"},{"text":"Heavy Slowness","color":"dark_gray","bold":true}]


# do something worse
execute if score @s merchant_rng matches 21..29 run scoreboard players set @s health 1
execute if score @s merchant_rng matches 21..29 run particle damage_indicator ~ ~1.5 ~ 0.5 0.5 0.5 0 20 normal
execute if score @s merchant_rng matches 21..29 run particle block{block_state:"redstone_block"} ~ ~0.5 ~ 0.4 0.2 0.4 0 25 normal
execute if score @s merchant_rng matches 21..29 run playsound entity.player.hurt master @s ~ ~ ~ 1 0.8
execute if score @s merchant_rng matches 21..29 run tellraw @s [{"text":"💀 ","color":"dark_red"},{"text":"CRITICAL DAMAGE!","color":"red","bold":true}]

# bad stuff
execute if score @s merchant_rng matches 30..50 run effect give @s blindness 5 1 true
execute if score @s merchant_rng matches 30..50 run particle squid_ink ~ ~1.5 ~ 0.3 0.3 0.3 0.1 30 normal
execute if score @s merchant_rng matches 30..50 run tellraw @s [{"text":"● ","color":"black"},{"text":"Blinded!","color":"dark_gray","bold":true}]

execute if score @s merchant_rng matches 51..59 run effect give @s glowing 30 2 true
execute if score @s merchant_rng matches 51..59 run particle flame ~ ~1 ~ 1 0.8 1 0.02 300 normal
execute if score @s merchant_rng matches 51..59 run particle smoke ~ ~1 ~ 1 0.8 1 0.05 200 normal
execute if score @s merchant_rng matches 51..59 run tellraw @s [{"text":"👁 ","color":"yellow"},{"text":"You're now EXPOSED!","color":"gold","bold":true}]


# more
execute if score @s merchant_rng matches 60..65 run effect give @s slowness 30 2 true
execute if score @s merchant_rng matches 60..65 if score @s corruption matches ..75 run scoreboard players add @s corruption 24
execute if score @s merchant_rng matches 60..65 run particle soul ~ ~1 ~ 0.5 0.8 0.5 0.05 50 normal
execute if score @s merchant_rng matches 60..65 run particle dust{color:[0.2,0.0,0.3],scale:1.5} ~ ~1 ~ 0.5 0.8 0.5 0 30 normal
execute if score @s merchant_rng matches 60..65 run tellraw @s [{"text":"☠ ","color":"dark_purple"},{"text":"Corrupted & Slowed!","color":"dark_red","bold":true}]



# more stuff
execute if score @s merchant_rng matches 66..73 run particle portal ~ ~1 ~ 0.5 1 0.5 1 80 normal
execute if score @s merchant_rng matches 66..73 run tp @s @r[team=corrupted]
execute if score @s merchant_rng matches 66..73 run particle reverse_portal ~ ~1 ~ 0.5 1 0.5 1 80 normal
execute if score @s merchant_rng matches 66..73 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 0.7
execute if score @s merchant_rng matches 66..73 run tellraw @s [{"text":"⚡ ","color":"red"},{"text":"Banished to the corrupted!","color":"dark_red","bold":true}]
execute if score @s merchant_rng matches 66..73 run particle large_smoke ~ ~1 ~ 0.5 1 0.5 0.1 50 normal

# arrow related stuff
execute if score @s merchant_rng matches 74..80 run scoreboard players set @s merchant_arrow_count 0
execute if score @s merchant_rng matches 74..80 run clear @s
execute if score @s merchant_rng matches 74..80 run particle poof ~ ~1 ~ 0.5 0.5 0.5 0.05 50 normal
execute if score @s merchant_rng matches 74..80 run playsound entity.item.break master @s ~ ~ ~ 1 0.8
execute if score @s merchant_rng matches 74..80 run tellraw @s [{"text":"✖ ","color":"dark_red"},{"text":"All items STOLEN!","color":"red","bold":true}]
# crossbow related stuff
execute if score @s merchant_rng matches 81..90 run item replace entity @s hotbar.0 with crossbow[custom_name=[{"text":"weak crossbow","italic":false}]]
execute if score @s merchant_rng matches 81..90 run scoreboard players set @s merchant_arrow_count 0
execute if score @s merchant_rng matches 81..90 run particle item{item:"crossbow"} ~ ~1 ~ 0.3 0.5 0.3 0.1 30 normal
execute if score @s merchant_rng matches 81..90 run particle smoke ~ ~1 ~ 0.5 0.5 0.5 0.05 25 normal
execute if score @s merchant_rng matches 81..90 run playsound block.anvil.land master @a ~ ~ ~ 1 0.5
execute if score @s merchant_rng matches 81..90 run tellraw @s [{"text":"⚔ ","color":"dark_red"},{"text":"Your crossbow has been NERFED!","color":"red","bold":true}]

# CRIPPLING DEBUFFS
execute if score @s merchant_rng matches 91..99 run effect give @s slowness 20 3 true
execute if score @s merchant_rng matches 91..99 run effect give @s blindness 20 2 true
execute if score @s merchant_rng matches 91..99 run particle soul_fire_flame ~ ~1 ~ 0.5 1 0.5 0.1 60 normal
execute if score @s merchant_rng matches 91..99 run particle dust{color:[0.1,0.0,0.1],scale:2} ~ ~1 ~ 0.8 1 0.8 0 50 normal
execute if score @s merchant_rng matches 91..99 run particle squid_ink ~ ~1.5 ~ 0.5 0.5 0.5 0.15 50 normal
execute if score @s merchant_rng matches 91..99 run playsound entity.wither.spawn master @a ~ ~ ~ 0.5 1.5
execute if score @s merchant_rng matches 91..99 run tellraw @a [{"text":"★★★ ","color":"dark_purple","bold":true},{"selector":"@s"},{"text":" is ","color":"white"},{"text":"CURSED!","color":"dark_purple","bold":true},{"text":" ★★★","color":"dark_red","bold":true}]



# acheave the bad coin advancement
execute if score @s merchant_rng matches 0..99 run advancement grant @s only ctnv:corrupt_tag/merchant_bad_coin