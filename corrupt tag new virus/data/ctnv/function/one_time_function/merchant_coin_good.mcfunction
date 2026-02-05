playsound entity.villager.celebrate master @a ~ ~ ~ 1 1

# this is for the merchants coin good outcome
# the higher the rng value when this function is trigger the better the reward

# first 3 are simple
execute if score @s merchant_rng matches 0..8 run effect give @s speed 3 1 true
execute if score @s merchant_rng matches 0..8 run particle happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 10 normal
execute if score @s merchant_rng matches 0..8 run tellraw @s [{"text":"✦ ","color":"green"},{"text":"Minor Speed Boost!","color":"aqua"}]

execute if score @s merchant_rng matches 8..14 run effect give @s speed 3 2 true
execute if score @s merchant_rng matches 8..14 run particle happy_villager ~ ~1 ~ 0.4 0.5 0.4 0 15 normal
execute if score @s merchant_rng matches 8..14 run tellraw @s [{"text":"✦ ","color":"green"},{"text":"Speed Boost II!","color":"aqua","bold":true}]

execute if score @s merchant_rng matches 15..20 run effect give @s speed 3 3 true
execute if score @s merchant_rng matches 15..20 run particle happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 20 normal
execute if score @s merchant_rng matches 15..20 run tellraw @s [{"text":"✦ ","color":"green"},{"text":"Major Speed Boost!","color":"aqua","bold":true}]

# do something better
execute if score @s merchant_rng matches 21..29 run scoreboard players set @s health 20
execute if score @s merchant_rng matches 21..29 run particle heart ~ ~1 ~ 0.5 0.5 0.5 0 15 normal
execute if score @s merchant_rng matches 21..29 run tellraw @s [{"text":"❤ ","color":"red"},{"text":"Full Health Restored!","color":"light_purple","bold":true}]

# jump boost
execute if score @s merchant_rng matches 30..50 run effect give @s jump_boost 3 1 true
execute if score @s merchant_rng matches 30..50 run particle cloud ~ ~ ~ 0.3 0 0.3 0.05 15 normal
execute if score @s merchant_rng matches 30..50 run tellraw @s [{"text":"⬆ ","color":"white"},{"text":"Jump Boost!","color":"green"}]

execute if score @s merchant_rng matches 51..59 run effect give @s jump_boost 6 2 true
execute if score @s merchant_rng matches 51..59 run particle cloud ~ ~ ~ 0.4 0 0.4 0.08 20 normal
execute if score @s merchant_rng matches 51..59 run tellraw @s [{"text":"⬆ ","color":"white"},{"text":"Super Jump Boost!","color":"green","bold":true}]

# more
execute if score @s merchant_rng matches 60..65 run effect give @s speed 30 2 true
execute if score @s merchant_rng matches 60..65 if score @s corruption matches 25.. run scoreboard players remove @s corruption 24
execute if score @s merchant_rng matches 60..65 run particle enchant ~ ~1 ~ 0.5 0.8 0.5 1 30 normal
execute if score @s merchant_rng matches 60..65 run particle happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 25 normal
execute if score @s merchant_rng matches 60..65 run tellraw @s [{"text":"✨ ","color":"yellow"},{"text":"Extended Speed & Cleansing!","color":"gold","bold":true}]

# more stuff
execute if score @s merchant_rng matches 66..70 run particle portal ~ ~1 ~ 0.5 1 0.5 1 100 normal
execute if score @s merchant_rng matches 66..70 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
execute if score @s merchant_rng matches 66..70 run tellraw @s [{"text":"⚡ ","color":"dark_purple"},{"text":"Teleporting to ally...","color":"light_purple","bold":true}]
execute if score @s merchant_rng matches 66..70 run tp @s @r[team=runners]
execute if score @s merchant_rng matches 66..70 run particle portal ~ ~1 ~ 0.5 1 0.5 1 50 normal

# arrow related stuff
execute if score @s merchant_rng matches 71..80 run scoreboard players set @s merchant_arrow_count 5
execute if score @s merchant_rng matches 71..80 run particle flame ~ ~1 ~ 0.3 0.5 0.3 0.02 20 normal
execute if score @s merchant_rng matches 71..80 run tellraw @s [{"text":"🏹 ","color":"red"},{"text":"5 Special Arrows Granted!","color":"yellow","bold":true}]

# crossbow related stuff
execute if score @s merchant_rng matches 81..90 run item replace entity @s hotbar.0 with crossbow[custom_name=[{"text":"Boston the BUFFED crossbow","italic":false}],enchantments={punch:2,multishot:1,quick_charge:5}]
execute if score @s merchant_rng matches 81..90 run particle enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0.5 50 normal
execute if score @s merchant_rng matches 81..90 run particle end_rod ~ ~1 ~ 0.3 0.5 0.3 0.1 25 normal
execute if score @s merchant_rng matches 81..90 run playsound block.anvil.use master @a ~ ~ ~ 1 1.5
execute if score @s merchant_rng matches 81..90 run tellraw @s [{"text":"⚔ ","color":"gold"},{"text":"Your crossbow has been upgraded!","color":"gold","bold":true}]

# OP buffs
execute if score @s merchant_rng matches 91..99 run effect give @s speed 50 3 true
execute if score @s merchant_rng matches 91..99 run effect give @s jump_boost 50 2 true
execute if score @s merchant_rng matches 91..99 run effect give @s invisibility 5 3 true
execute if score @s merchant_rng matches 91..99 run particle dragon_breath ~ ~1 ~ 0.5 1 0.5 0.1 50 normal
execute if score @s merchant_rng matches 91..99 run particle firework ~ ~1 ~ 0.5 0.5 0.5 0.2 30 normal
execute if score @s merchant_rng matches 91..99 run particle enchanted_hit ~ ~1 ~ 0.8 1 0.8 1 60 normal
execute if score @s merchant_rng matches 91..99 run playsound entity.player.levelup master @a ~ ~ ~ 1 2
execute if score @s merchant_rng matches 91..99 run tellraw @s [{"text":"★★★ ","color":"gold","bold":true},{"text":"LEGENDARY BLESSING!","color":"light_purple","bold":true},{"text":" ★★★","color":"gold","bold":true}]

# acheave the good coin advancement
execute if score @s merchant_rng matches 0..99 run advancement grant @s only ctnv:corrupt_tag/merchant_good_coin