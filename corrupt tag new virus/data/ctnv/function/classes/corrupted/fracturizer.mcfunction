#░██████████                                  ░██                        ░██                               
#░██                                          ░██                                                          
#░██        ░██░████  ░██████    ░███████  ░████████ ░██    ░██ ░██░████ ░██░█████████  ░███████  ░██░████ 
#░█████████ ░███           ░██  ░██    ░██    ░██    ░██    ░██ ░███     ░██     ░███  ░██    ░██ ░███     
#░██        ░██       ░███████  ░██           ░██    ░██    ░██ ░██      ░██   ░███    ░█████████ ░██      
#░██        ░██      ░██   ░██  ░██    ░██    ░██    ░██   ░███ ░██      ░██ ░███      ░██        ░██      
#░██        ░██       ░█████░██  ░███████      ░████  ░█████░██ ░██      ░██░█████████  ░███████  ░██      
                                                                                                          
# the most unusal in terms of appearence and many other things




# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:potato",Slot:0b}]}] run clear @s potato

execute unless entity @s[nbt={Inventory:[{id:"minecraft:potato",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:potato"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:potato",Slot:0b}]}] run item replace entity @s hotbar.0 with potato[custom_name=[{"text":"Corrupted axe","italic":false,"obfuscated":true}],attribute_modifiers=[{type:attack_damage,amount:0,operation:add_multiplied_base,id:"1747801002186"}]]


#=============================================================================================================
# armor sets
#=============================================================================================================
# the fracturizer armor is random and constantly changing
scoreboard players add @s fracturizer_armor 1

#make it more random (reset threshold increased to allow values up to 306)
execute if score @s fracturizer_armor matches 300.. run scoreboard players reset @s fracturizer_armor
execute if score @s fracturizer_armor_rng matches 1.. if score @s fracturizer_armor matches 200.. run scoreboard players reset @s fracturizer_armor
execute if score @s fracturizer_armor_rng matches 1.. run scoreboard players add @s fracturizer_armor 15
execute if score @s fracturizer_armor_rng matches 1.. run scoreboard players reset @s fracturizer_armor_rng

# the actual armor sets (original up to 200/202/204/206)
execute if score @s fracturizer_armor matches 1 run item replace entity @s armor.head with dragon_head[enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 20 run item replace entity @s armor.head with wither_skeleton_skull[enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 40 run item replace entity @s armor.head with netherite_helmet[trim={pattern:tide,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 60 run item replace entity @s armor.head with copper_helmet[trim={pattern:eye,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 80 run item replace entity @s armor.head with zombie_head[trim={pattern:tide,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 100 run item replace entity @s armor.head with leather_helmet[trim={pattern:flow,material:iron},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 120 run item replace entity @s armor.head with netherite_helmet[trim={pattern:sentry,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 140 run item replace entity @s armor.head with golden_helmet[trim={pattern:snout,material:iron},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 160 run item replace entity @s armor.head with piglin_head[enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 180 run item replace entity @s armor.head with chainmail_helmet[trim={pattern:silence,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 200 run item replace entity @s armor.head with iron_helmet[trim={pattern:dune,material:gold},enchantments={binding_curse:1}]

execute if score @s fracturizer_armor matches 2 run item replace entity @s armor.chest with iron_chestplate[trim={pattern:flow,material:gold},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 22 run item replace entity @s armor.chest with diamond_chestplate[trim={pattern:shaper,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 42 run item replace entity @s armor.chest with netherite_chestplate[trim={pattern:eye,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 62 run item replace entity @s armor.chest with netherite_chestplate[trim={pattern:coast,material:copper},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 82 run item replace entity @s armor.chest with golden_chestplate[trim={pattern:flow,material:diamond},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 102 run item replace entity @s armor.chest with leather_chestplate[trim={pattern:silence,material:iron},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 122 run item replace entity @s armor.chest with chainmail_chestplate[trim={pattern:dune,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 142 run item replace entity @s armor.chest with copper_chestplate[trim={pattern:snout,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 162 run item replace entity @s armor.chest with iron_chestplate[trim={pattern:tide,material:copper},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 182 run item replace entity @s armor.chest with netherite_chestplate[trim={pattern:flow,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 202 run item replace entity @s armor.chest with diamond_chestplate[trim={pattern:coast,material:gold},enchantments={binding_curse:1}]

execute if score @s fracturizer_armor matches 4 run item replace entity @s armor.legs with iron_leggings[trim={pattern:wayfinder,material:netherite},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 24 run item replace entity @s armor.legs with golden_leggings[trim={pattern:wild,material:lapis},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 44 run item replace entity @s armor.legs with diamond_leggings[trim={pattern:coast,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 64 run item replace entity @s armor.legs with netherite_leggings[trim={pattern:eye,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 84 run item replace entity @s armor.legs with chainmail_leggings[trim={pattern:dune,material:gold},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 104 run item replace entity @s armor.legs with golden_leggings[trim={pattern:tide,material:copper},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 124 run item replace entity @s armor.legs with iron_leggings[trim={pattern:silence,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 144 run item replace entity @s armor.legs with leather_leggings[trim={pattern:snout,material:iron},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 164 run item replace entity @s armor.legs with netherite_leggings[trim={pattern:flow,material:diamond},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 184 run item replace entity @s armor.legs with chainmail_leggings[trim={pattern:wayfinder,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 204 run item replace entity @s armor.legs with diamond_leggings[trim={pattern:wild,material:copper},enchantments={binding_curse:1}]

execute if score @s fracturizer_armor matches 6 run item replace entity @s armor.feet with netherite_boots[trim={pattern:wayfinder,material:diamond},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 26 run item replace entity @s armor.feet with chainmail_boots[trim={pattern:spire,material:gold},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 46 run item replace entity @s armor.feet with diamond_boots[trim={pattern:flow,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 66 run item replace entity @s armor.feet with golden_boots[trim={pattern:eye,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 86 run item replace entity @s armor.feet with leather_boots[trim={pattern:tide,material:iron},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 106 run item replace entity @s armor.feet with netherite_boots[trim={pattern:coast,material:copper},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 126 run item replace entity @s armor.feet with iron_boots[trim={pattern:dune,material:gold},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 146 run item replace entity @s armor.feet with golden_boots[trim={pattern:silence,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 166 run item replace entity @s armor.feet with diamond_boots[trim={pattern:wayfinder,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 186 run item replace entity @s armor.feet with chainmail_boots[trim={pattern:shaper,material:copper},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 206 run item replace entity @s armor.feet with leather_boots[trim={pattern:flow,material:diamond},enchantments={binding_curse:1}]

# --- continued pattern: head (+20 steps from 200) ---
execute if score @s fracturizer_armor matches 220 run item replace entity @s armor.head with glowstone[trim={pattern:rib,material:netherite},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 240 run item replace entity @s armor.head with skeleton_skull[enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 260 run item replace entity @s armor.head with diamond_helmet[trim={pattern:vex,material:emerald},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 280 run item replace entity @s armor.head with chainmail_helmet[trim={pattern:bolt,material:quartz},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 300 run item replace entity @s armor.head with creeper_head[enchantments={binding_curse:1}]

# --- continued pattern: chest (+20 steps from 202) ---
execute if score @s fracturizer_armor matches 222 run item replace entity @s armor.chest with iron_chestplate[trim={pattern:wild,material:lapis},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 242 run item replace entity @s armor.chest with golden_chestplate[trim={pattern:shaper,material:netherite},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 262 run item replace entity @s armor.chest with leather_chestplate[trim={pattern:spire,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 282 run item replace entity @s armor.chest with netherite_chestplate[trim={pattern:snout,material:diamond},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 302 run item replace entity @s armor.chest with copper_chestplate[trim={pattern:wayfinder,material:redstone},enchantments={binding_curse:1}]

# --- continued pattern: legs (+20 steps from 204) ---
execute if score @s fracturizer_armor matches 224 run item replace entity @s armor.legs with diamond_leggings[trim={pattern:silence,material:gold},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 244 run item replace entity @s armor.legs with chainmail_leggings[trim={pattern:tide,material:emerald},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 264 run item replace entity @s armor.legs with netherite_leggings[trim={pattern:dune,material:quartz},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 284 run item replace entity @s armor.legs with iron_leggings[trim={pattern:eye,material:diamond},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 304 run item replace entity @s armor.legs with golden_leggings[trim={pattern:flow,material:copper},enchantments={binding_curse:1}]

# --- continued pattern: feet (+20 steps from 206) ---
execute if score @s fracturizer_armor matches 226 run item replace entity @s armor.feet with leather_boots[trim={pattern:rib,material:gold},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 246 run item replace entity @s armor.feet with copper_boots[trim={pattern:bolt,material:lapis},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 266 run item replace entity @s armor.feet with iron_boots[trim={pattern:vex,material:amethyst},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 286 run item replace entity @s armor.feet with diamond_boots[trim={pattern:snout,material:redstone},enchantments={binding_curse:1}]
execute if score @s fracturizer_armor matches 306 run item replace entity @s armor.feet with chainmail_boots[trim={pattern:coast,material:netherite},enchantments={binding_curse:1}]

#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

# literally just steal the triskster player swap function
execute if score @s corruption matches 15.. as @s run function ctnv:one_time_function/fracturizer/evil_trickster_swap

execute if score @s corruption matches 15.. as @s run kill @e[type=item,nbt={Item:{id:"minecraft:barrier"}}]


#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
#time bomb
scoreboard players add @s fracturizer_time_bomb 0

execute if score @s corruption matches 50..99 if score @s fracturizer_time_bomb matches 0 if score @s fracturizer_time_bomb matches 0 run item replace entity @s hotbar.4 with tnt[custom_name=[{"text":"TIME BOMB","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
execute if score @s corruption matches 50..99 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:4b}]}] if score @s fracturizer_time_bomb matches 0 run clear @s tnt
execute if score @s corruption matches 50..99 unless entity @s[nbt={Inventory:[{id:"minecraft:tnt",Slot:4b}]}] if score @s fracturizer_time_bomb matches 0 run item replace entity @s hotbar.4 with tnt[custom_name=[{"text":"TIME BOMB","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]

# sound effect
execute as @a[scores={fracturizer_time_bomb_detect=1}] run playsound entity.tnt.primed player @a ~ ~ ~ 1 1.5 1
execute as @a[scores={fracturizer_time_bomb_detect=1}] run clear @s tnt

# speed bost
execute as @a[scores={fracturizer_time_bomb_detect=1}] run effect give @s speed 5 3 true

execute if score @s fracturizer_time_bomb matches 1.. run scoreboard players remove @s fracturizer_time_bomb 1

#2. dectect if dropepd sculk shrieker
execute as @a[scores={fracturizer_time_bomb_detect=1}] run scoreboard players set @s fracturizer_time_bomb 600
execute as @a[scores={fracturizer_time_bomb_detect=1}] at @s run summon minecraft:block_display ~ ~0.5 ~ {Tags: ["time_bomb","time_bomb_thinker"], Passengers: [{id: "minecraft:item_display", Tags: ["time_bomb"], item: {count: 1, id: "minecraft:budding_amethyst"}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.6875f, 1.1875f, 0.6875f], translation: [0.0f, 0.0f, 0.0f]}}, {Tags: ["time_bomb"], Passengers: [{block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", Tags: ["time_bomb"], transformation: {left_rotation: [-0.35355335f, 0.8535535f, -0.14644653f, 0.35355335f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375002f, 2.4375014f, 2.4375007f], translation: [0.35696393f, -8.9059483E-7f, 2.0805361f]}}, {block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", Tags: ["time_bomb"], transformation: {left_rotation: [-0.49999988f, 0.70710677f, 0.5000002f, 4.4703476E-8f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375007f, 2.4375017f, 2.437501f], translation: [2.0805368f, -1.1173373E-6f, 0.35696304f]}}, {Tags: ["time_bomb"], Passengers: [{block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", Tags: ["time_bomb"], transformation: {left_rotation: [-2.614304E-8f, 2.7546163E-16f, -1.053671E-8f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375014f, 2.4375012f, 2.4375014f], translation: [-1.2187508f, -1.2187506f, -1.2187507f]}}, {block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", Tags: ["time_bomb"], transformation: {left_rotation: [-0.7071068f, 7.450581E-9f, -7.450581E-9f, 0.7071068f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375021f, 2.4375012f, 2.437501f], translation: [-1.2187508f, -1.2187506f, 1.2187507f]}}], block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", transformation: {left_rotation: [-0.5f, 0.5f, 0.5f, 0.5f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375007f, 2.4374993f, 2.4374995f], translation: [1.2187506f, -1.2187506f, 1.2187507f]}}, {Tags: ["time_bomb"], Passengers: [{block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", Tags: ["time_bomb"], transformation: {left_rotation: [-0.1464466f, 0.35355332f, -0.35355324f, 0.85355353f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375014f, 2.437502f, 2.437502f], translation: [-2.0805368f, -6.983485E-7f, 0.35696363f]}}, {block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", Tags: ["time_bomb"], transformation: {left_rotation: [0.70710695f, -0.4999999f, 0.0f, -0.49999988f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.437501f, 2.4375012f, 2.4375017f], translation: [-0.35696366f, -6.257053E-7f, 2.080537f]}}], block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", transformation: {left_rotation: [-0.1464466f, 0.8535535f, 0.35355327f, 0.35355335f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375f, 2.4374995f, 2.4375f], translation: [0.86178696f, -1.7235734f, 0.86178684f]}}], block_state: {Name: "minecraft:purple_stained_glass_pane", Properties: {east: "false", north: "false", south: "false", waterlogged: "false", west: "false"}}, id: "minecraft:block_display", transformation: {left_rotation: [0.14644666f, 0.85355335f, 0.3535534f, -0.35355344f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [2.4375005f, 2.4375f, 2.437501f], translation: [0.86178637f, -1.7235734f, -0.861787f]}}], block_state: {Name: "minecraft:tnt", Properties: {unstable: "false"}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 0.5625f, 1.0f], translation: [-0.5f, -0.28125f, -0.5f]}}
execute as @a[scores={fracturizer_time_bomb_detect=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:tnt"}}]
execute as @a[scores={fracturizer_time_bomb_detect=1}] run scoreboard players reset @s fracturizer_time_bomb_detect

# cooldown

# do a cooldown timer with drey dye
execute if score @s[scores={fracturizer_time_bomb=599}] fracturizer_time_bomb matches 599 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 30
execute if score @s[scores={fracturizer_time_bomb=580}] fracturizer_time_bomb matches 580 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 29
execute if score @s[scores={fracturizer_time_bomb=560}] fracturizer_time_bomb matches 560 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 28
execute if score @s[scores={fracturizer_time_bomb=540}] fracturizer_time_bomb matches 540 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 27
execute if score @s[scores={fracturizer_time_bomb=520}] fracturizer_time_bomb matches 520 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 26
execute if score @s[scores={fracturizer_time_bomb=500}] fracturizer_time_bomb matches 500 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 25
execute if score @s[scores={fracturizer_time_bomb=480}] fracturizer_time_bomb matches 480 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 24
execute if score @s[scores={fracturizer_time_bomb=460}] fracturizer_time_bomb matches 460 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 23
execute if score @s[scores={fracturizer_time_bomb=440}] fracturizer_time_bomb matches 440 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 22
execute if score @s[scores={fracturizer_time_bomb=420}] fracturizer_time_bomb matches 420 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 21
execute if score @s[scores={fracturizer_time_bomb=400}] fracturizer_time_bomb matches 400 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 20
execute if score @s[scores={fracturizer_time_bomb=380}] fracturizer_time_bomb matches 380 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 19
execute if score @s[scores={fracturizer_time_bomb=360}] fracturizer_time_bomb matches 360 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 18
execute if score @s[scores={fracturizer_time_bomb=340}] fracturizer_time_bomb matches 340 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 17
execute if score @s[scores={fracturizer_time_bomb=320}] fracturizer_time_bomb matches 320 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 16
execute if score @s[scores={fracturizer_time_bomb=300}] fracturizer_time_bomb matches 300 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 15
execute if score @s[scores={fracturizer_time_bomb=280}] fracturizer_time_bomb matches 280 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 14
execute if score @s[scores={fracturizer_time_bomb=260}] fracturizer_time_bomb matches 260 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 13
execute if score @s[scores={fracturizer_time_bomb=240}] fracturizer_time_bomb matches 240 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 12
execute if score @s[scores={fracturizer_time_bomb=220}] fracturizer_time_bomb matches 220 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 11
execute if score @s[scores={fracturizer_time_bomb=200}] fracturizer_time_bomb matches 200 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 10
execute if score @s[scores={fracturizer_time_bomb=180}] fracturizer_time_bomb matches 180 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 9
execute if score @s[scores={fracturizer_time_bomb=160}] fracturizer_time_bomb matches 160 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 8
execute if score @s[scores={fracturizer_time_bomb=140}] fracturizer_time_bomb matches 140 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 7
execute if score @s[scores={fracturizer_time_bomb=120}] fracturizer_time_bomb matches 120 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 6
execute if score @s[scores={fracturizer_time_bomb=100}] fracturizer_time_bomb matches 100 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 5
execute if score @s[scores={fracturizer_time_bomb=80}] fracturizer_time_bomb matches 80 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 4
execute if score @s[scores={fracturizer_time_bomb=60}] fracturizer_time_bomb matches 60 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 3
execute if score @s[scores={fracturizer_time_bomb=40}] fracturizer_time_bomb matches 40 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 2
execute if score @s[scores={fracturizer_time_bomb=20}] fracturizer_time_bomb matches 20 run item replace entity @s hotbar.4 with gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s fracturizer_time_bomb matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"Time Bomb cooldown","italic":false}]]


#==========================================================================================================================================================
#                           90% corruption!
#==========================================================================================================================================================
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 90% ","color":"red"},{"text":"corrupt!","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1

scoreboard players add @s fracturizer_wall_cooldown 0

#1. give respawn anchor
execute if score @s corruption matches 90..99 if score @s fracturizer_wall_cooldown matches 0 run item replace entity @s hotbar.6 with crying_obsidian[custom_name=[{"text":"The Wall","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]
execute if score @s corruption matches 90..99 unless entity @s[nbt={Inventory:[{id:"minecraft:crying_obsidian",Slot:6b}]}] if score @s fracturizer_wall_cooldown matches 0 run clear @s crying_obsidian
execute if score @s corruption matches 90..99 unless entity @s[nbt={Inventory:[{id:"minecraft:crying_obsidian",Slot:6b}]}] if score @s fracturizer_wall_cooldown matches 0 run item replace entity @s hotbar.6 with crying_obsidian[custom_name=[{"text":"The Wall","italic":false,"color":"dark_purple"}],enchantments={binding_curse:1}]

# sound effect
execute as @a[scores={fracturizer_wall_detect=1}] run playsound entity.ender_dragon.ambient player @a ~ ~ ~ 1 1 1
execute as @a[scores={fracturizer_wall_detect=1}] at @s run playsound item.goat_horn.sound.4 player @a ~ ~ ~ 1 0.2 1

#2. detect if dropped respawn anchor
execute as @a[scores={fracturizer_wall_detect=1}] run scoreboard players set @a fracturizer_wall_cooldown 1
execute as @a[scores={fracturizer_wall_detect=1}] run kill @e[type=item,nbt={Item:{id:"minecraft:crying_obsidian"}}]
#spawn The Wall
execute as @a[scores={fracturizer_wall_detect=1}] at @s run function ctnv:one_time_function/fracturizer/fracturizer_wall

execute as @a[scores={fracturizer_wall_detect=1}] run scoreboard players set @s fracturizer_wall_detect 0

# Visual cooldown display – now showing numbers 60 down to 1 (60 seconds)
execute if score @s fracturizer_wall_cooldown matches 1 run item replace entity @s hotbar.6 with coal_block[custom_name=[{"text":"The wall has been placed!","italic":false}]] 1

execute if score @s fracturizer_wall_cooldown matches 0 if score tick time matches 1 run clear @s coal_block[custom_name=[{"text":"The wall has been placed!","italic":false}]]
kill @e[type=item,nbt={Item:{id:"minecraft:coal_block"}}]

# make sure he cannot ecape death by dropping his t3 witch sets his corruption to 90%
execute if score @s corruption matches 100.. run clear @s