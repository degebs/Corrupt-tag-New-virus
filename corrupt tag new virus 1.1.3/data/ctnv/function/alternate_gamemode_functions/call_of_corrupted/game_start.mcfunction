# here is the logic that runs ONLY when the game starts. or when a round ends

#anyone with the score "current_corrupted" shall have there team to "corrupted"
execute as @a[scores={current_corrupted=1}] run team join corrupted @s
# this is just for the very begining

# disable corruption below the runners name. its irrelavent
scoreboard objectives setdisplay below_name

# wave counter
scoreboard players add wave call_of_corrupted 1
title @a title [{"text":"WAVE: ","color":"red"},{"score":{"objective":"call_of_corrupted","name":"wave"}}]

# points (for the hud to not break)
scoreboard players add @a[team=!corrupted] points 0

# make the corrupted extra dimentional
scoreboard players set atherial_corrupted call_of_corrupted 1
# explain what be etherial means
tellraw @a[team=corrupted] [{"text":"you are now atherial... you cannot ineract with anything.\n you must summon waves of corrupted to kill the runners. \n Dont get close to the runners until you aquire a physical form","color":"light_purple"}]

# the points are visable in the tab menu
scoreboard objectives setdisplay list points
scoreboard objectives setdisplay below_name points

# give some time before the mobs start spawning
scoreboard players set time spawn 1000

#======================================================================================================================================================
#set all runners health to the max
tp @a[team=dead] @a[team=runners,limit=1]
scoreboard players operation @a[team=!corrupted] health = setting ST____max_health
scoreboard players set @a bouncer_list 1
execute as @a[team=dead] run team join runners
gamemode adventure @a
kill @e[type=shulker,tag=!wall]
# walls will presist between rounds

# if the game mode is call of corrupted set the arrow count to 99
# this code is stolen from the setup
execute if score setting ST____game_mode matches 4 run scoreboard players set @a acher_arrow_count 99

#======================================================================================================================================================
# if a runner class respans or spawns initially. give them a kit. a kit based on there items from the other game modes
# items are not on a cooldown. they are finite

#medic
execute as @a[team=runners] if score @s class matches 1 unless data entity @s {Inventory:[{id:"minecraft:poppy"}]} run give @s poppy[custom_name=[{"text":"healing rose","italic":false,"color":"dark_green"}],lore=[[{"text":"qrop to heal. finite supply","italic":false}]],rarity=uncommon] 3
execute as @a[team=runners] if score @s class matches 1 unless data entity @s {Inventory:[{id:"minecraft:diamond_hoe"}]} run give @s diamond_hoe[custom_name=[{"text":"medical hoe","italic":false}],rarity=uncommon,enchantments={knockback:2},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]

#archer
execute as @a[team=runners] if score @s class matches 2 unless data entity @s {Inventory:[{id:"minecraft:bow"}]} run give @s bow[custom_name=[{"text":"trusty bow","italic":false}],enchantments={punch:2}]
execute as @a[team=runners] if score @s class matches 2 unless data entity @s {Inventory:[{id:"minecraft:heart_of_the_sea"}]} run give @s heart_of_the_sea[custom_name=[{"text":"speed buff","italic":false}],lore=[[{"text":"drop for a speed buff","italic":false}]],rarity=rare]

# bulk
execute as @a[team=runners] if score @s class matches 3 unless data entity @s {Inventory:[{id:"minecraft:iron_sword"}]} run give @s iron_sword[custom_name=[{"text":"bulky sword","italic":false}],rarity=uncommon,enchantments={knockback:2},attribute_modifiers=[{type:attack_damage,amount:0,slot:mainhand,operation:add_multiplied_total,id:"1747783863410"}]]
execute as @a[team=runners] if score @s class matches 3 unless data entity @s {Inventory:[{id:"minecraft:cyan_candle"}]} run give @s cyan_candle[custom_name=[{"text":"jump candle","italic":false,"color":"dark_green"}],lore=[[{"text":"qrop to jump","italic":false}]],rarity=uncommon] 3
execute as @a[team=runners] if score @s class matches 3 unless data entity @s {Inventory:[{id:"minecraft:totem_of_undying"}]} run give @s totem_of_undying

# assassin
execute as @a[team=runners] if score @s class matches 4 unless data entity @s {Inventory:[{id:"minecraft:stone_sword"}]} run give @s stone_sword[custom_name=[{"text":"shifty daggar","italic":false}],enchantments={knockback:1}]
execute as @a[team=runners] if score @s class matches 4 unless data entity @s {Inventory:[{id:"minecraft:ink_sac"}]} run give @s ink_sac[custom_name=[{"text":"speed ink","italic":false,"color":"dark_green"}],lore=[[{"text":"drop to jump","italic":false}]],rarity=uncommon] 3
execute as @a[team=runners] if score @s class matches 4 unless data entity @s {Inventory:[{id:"minecraft:clock"}]} run give @s clock[custom_name=[{"text":"invisibility watch","italic":false}],lore=[[{"text":"drop to become invisable","italic":false}]],rarity=rare]


# stunman
execute as @a[team=runners] if score @s class matches 5 unless data entity @s {Inventory:[{id:"minecraft:trident"}]} run give @s trident[custom_name=[{"text":"electric trident","italic":false}],rarity=rare,enchantments={loyalty:1,unbreaking:255}]
execute as @a[team=runners] if score @s class matches 5 unless data entity @s {Inventory:[{id:"minecraft:prismarine_brick_slab"}]} run give @s prismarine_brick_slab[custom_name=[{"text":"trap","italic":false,"color":"blue"}],lore=[[{"text":"drop to place a trap","italic":false}]]] 3


# fisherman
execute as @a[team=runners] if score @s class matches 6 unless data entity @s {Inventory:[{id:"minecraft:fishing_rod"}]} run give @s fishing_rod[custom_name=[{"text":"yee old fishing rod","italic":false}],enchantments={knockback:1,unbreaking:255}]
execute as @a[team=runners] if score @s class matches 6 unless data entity @s {Inventory:[{id:"minecraft:cobweb"}]} run give @s cobweb[custom_name=[{"text":"fishing net","italic":false,"color":"blue"}],lore=[[{"text":"drop to place a trap","italic":false}]]] 3
execute as @a[team=runners] if score @s class matches 6 unless data entity @s {Inventory:[{id:"minecraft:heart_of_the_sea"}]} run give @s heart_of_the_sea[custom_name=[{"text":"speed buff","italic":false}],lore=[[{"text":"drop for a speed buff","italic":false}]],rarity=rare]
