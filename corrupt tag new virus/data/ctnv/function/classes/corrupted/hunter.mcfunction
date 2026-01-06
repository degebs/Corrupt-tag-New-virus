# █████╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗███████╗██████╗ 
#██╔══██╗██╔══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔════╝██╔══██╗
#███████║██████╔╝   ██║   ██║█████╗  ██║██║     █████╗  ██████╔╝
#██╔══██║██╔══██╗   ██║   ██║██╔══╝  ██║██║     ██╔══╝  ██╔══██╗
#██║  ██║██║  ██║   ██║   ██║██║     ██║╚██████╗███████╗██║  ██║
#╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚══════╝╚═╝  ╚═╝
                                                               
                                                    
# the hunder has the most items out of any class.
# his whole playstyle is all about traps

# give him his armor
item replace entity @s armor.chest with leather_chestplate[trim={pattern:vex,material:emerald},dyed_color=4210246,enchantments={binding_curse:1}]
item replace entity @s armor.head with leather_helmet[trim={pattern:vex,material:emerald},dyed_color=4210246,enchantments={binding_curse:1}]
item replace entity @s armor.legs with netherite_leggings[trim={pattern:raiser,material:emerald},enchantments={binding_curse:1}]
item replace entity @s armor.feet with leather_boots[trim={pattern:ward,material:emerald},enchantments={binding_curse:1}]

# start with his weapon
# make sure he cannot move it or drop it
execute unless entity @s[nbt={Inventory:[{id:"minecraft:breeze_rod",Slot:0b}]}] run clear @s breeze_rod

execute unless entity @s[nbt={Inventory:[{id:"minecraft:breeze_rod",Slot:0b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:breeze_rod"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:breeze_rod",Slot:0b}]}] run item replace entity @s hotbar.0 with breeze_rod[custom_name=[{"text":"corrupted prick","italic":false}],rarity=epic]


# make sure that everyone who is a hunter corrupted gets in the cooldown scoreboard
scoreboard players add @s hunter_corrupted_t1_cooldown 0
scoreboard players add @s hunter_corrupted_t1_trap 0
scoreboard players add @s hunter_corrupted_t2_trap 0
scoreboard players add @s hunter_corrupted_t3_trap 0
#==========================================================================================================================================================
#                            15% corruption!
#==========================================================================================================================================================
# message
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 15% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 15 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
# to prevent the imidiate use of the trap item, a command will set the cooldown to 15 before letting the player use it
execute if score @s corruption matches ..15 run scoreboard players set @s hunter_corrupted_t1_trap 15

# here he will get 2 items. a reveal all players glowstone (identical to corrupted and apparition) and a trap item

# if the player drops the glowstone item, start a 600 tick timer. then decrese by 1 until it can be used again (30 seconds)
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] if score @s hunter_corrupted_t1_cooldown matches 0 run scoreboard players set @s hunter_corrupted_t1_cooldown 600

execute if score @s corruption matches 15.. if score @s hunter_corrupted_t1_cooldown matches 1.. run scoreboard players remove @s hunter_corrupted_t1_cooldown 1
# give the corrupted his vission of all runners
execute if score @s corruption matches 15.. if score @s[scores={hunter_corrupted_t1_cooldown=599}] hunter_corrupted_t1_cooldown matches 599 run effect give @a[team=runners] glowing 15 1

# sound effect
execute if score @s[scores={hunter_corrupted_t1_cooldown=599}] hunter_corrupted_t1_cooldown matches 599 run playsound block.beacon.activate player @s ~ ~ ~ 1 1 0.5


# check to see if the glowstone has been dropped.
# give the corrupted the glowstone dust. make sure he cant manipulate it
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:glowstone_dust"}}]
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{id:"minecraft:glowstone_dust",Slot:2b}]}] if score @s hunter_corrupted_t1_cooldown matches 0 run item replace entity @s hotbar.2 with glowstone_dust[custom_name=[{"text":"reveal players","italic":false,"color":"yellow"}],lore=[[{"text":"drop to reveal players","italic":false}]]]

# do a cooldown timer with drey dye
execute if score @s[scores={hunter_corrupted_t1_cooldown=599}] hunter_corrupted_t1_cooldown matches 599 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 30
execute if score @s[scores={hunter_corrupted_t1_cooldown=580}] hunter_corrupted_t1_cooldown matches 580 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 29
execute if score @s[scores={hunter_corrupted_t1_cooldown=560}] hunter_corrupted_t1_cooldown matches 560 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 28
execute if score @s[scores={hunter_corrupted_t1_cooldown=540}] hunter_corrupted_t1_cooldown matches 540 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 27
execute if score @s[scores={hunter_corrupted_t1_cooldown=520}] hunter_corrupted_t1_cooldown matches 520 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 26
execute if score @s[scores={hunter_corrupted_t1_cooldown=500}] hunter_corrupted_t1_cooldown matches 500 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 25
execute if score @s[scores={hunter_corrupted_t1_cooldown=480}] hunter_corrupted_t1_cooldown matches 480 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 24
execute if score @s[scores={hunter_corrupted_t1_cooldown=460}] hunter_corrupted_t1_cooldown matches 460 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 23
execute if score @s[scores={hunter_corrupted_t1_cooldown=440}] hunter_corrupted_t1_cooldown matches 440 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 22
execute if score @s[scores={hunter_corrupted_t1_cooldown=420}] hunter_corrupted_t1_cooldown matches 420 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 21
execute if score @s[scores={hunter_corrupted_t1_cooldown=400}] hunter_corrupted_t1_cooldown matches 400 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 20
execute if score @s[scores={hunter_corrupted_t1_cooldown=380}] hunter_corrupted_t1_cooldown matches 380 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 19
execute if score @s[scores={hunter_corrupted_t1_cooldown=360}] hunter_corrupted_t1_cooldown matches 360 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 18
execute if score @s[scores={hunter_corrupted_t1_cooldown=340}] hunter_corrupted_t1_cooldown matches 340 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 17
execute if score @s[scores={hunter_corrupted_t1_cooldown=320}] hunter_corrupted_t1_cooldown matches 320 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 16
execute if score @s[scores={hunter_corrupted_t1_cooldown=300}] hunter_corrupted_t1_cooldown matches 300 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 15
execute if score @s[scores={hunter_corrupted_t1_cooldown=280}] hunter_corrupted_t1_cooldown matches 280 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 14
execute if score @s[scores={hunter_corrupted_t1_cooldown=260}] hunter_corrupted_t1_cooldown matches 260 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 13
execute if score @s[scores={hunter_corrupted_t1_cooldown=240}] hunter_corrupted_t1_cooldown matches 240 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 12
execute if score @s[scores={hunter_corrupted_t1_cooldown=220}] hunter_corrupted_t1_cooldown matches 220 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 11
execute if score @s[scores={hunter_corrupted_t1_cooldown=200}] hunter_corrupted_t1_cooldown matches 200 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 10
execute if score @s[scores={hunter_corrupted_t1_cooldown=180}] hunter_corrupted_t1_cooldown matches 180 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 9
execute if score @s[scores={hunter_corrupted_t1_cooldown=160}] hunter_corrupted_t1_cooldown matches 160 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 8
execute if score @s[scores={hunter_corrupted_t1_cooldown=140}] hunter_corrupted_t1_cooldown matches 140 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 7
execute if score @s[scores={hunter_corrupted_t1_cooldown=120}] hunter_corrupted_t1_cooldown matches 120 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 6
execute if score @s[scores={hunter_corrupted_t1_cooldown=100}] hunter_corrupted_t1_cooldown matches 100 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 5
execute if score @s[scores={hunter_corrupted_t1_cooldown=80}] hunter_corrupted_t1_cooldown matches 80 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 4
execute if score @s[scores={hunter_corrupted_t1_cooldown=60}] hunter_corrupted_t1_cooldown matches 60 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 3
execute if score @s[scores={hunter_corrupted_t1_cooldown=40}] hunter_corrupted_t1_cooldown matches 40 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 2
execute if score @s[scores={hunter_corrupted_t1_cooldown=20}] hunter_corrupted_t1_cooldown matches 20 run item replace entity @s hotbar.2 with gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]] 1
# get rid of the gray dye when the cooldown is done
execute if score @s hunter_corrupted_t1_cooldown matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"reveal runners cooldown","italic":false}]]


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tier 1 trap

# When the player drops the trap, start a cooldown (20s = 400 ticks), and remove the item
execute if score @s corruption matches 15.. unless entity @s[nbt={Inventory:[{Slot:3b,id:"minecraft:tripwire_hook"}]}] if score @s hunter_corrupted_t1_trap matches 0 run scoreboard players set @s hunter_corrupted_t1_trap 400

# give the hunter a trap item, make sure he cannot drop it
# Give the hunter a trap item in hotbar slot 3 if they don't already have it and are at least 15% corrupt
execute if score @s corruption matches 15.. unless data entity @s Inventory[{Slot:3b,id:"minecraft:tripwire_hook"}] run kill @e[type=item,nbt={Item:{id:"minecraft:tripwire_hook"}}]
execute if score @s corruption matches 15.. unless data entity @s Inventory[{Slot:3b,id:"minecraft:tripwire_hook"}] if score @s hunter_corrupted_t1_trap matches 0 run item replace entity @s hotbar.3 with tripwire_hook[custom_name=[{"text":"corrupted trap","italic":false,"color":"dark_purple"}],lore=[[{"text":"drop to place a trap","italic":false}]]]


# Decrease cooldown if active
execute if score @s hunter_corrupted_t1_trap matches 1.. run scoreboard players remove @s hunter_corrupted_t1_trap 1

# when the trap is dropped, play a sound
execute if score @s[scores={hunter_corrupted_t1_trap=399}] hunter_corrupted_t1_trap matches 399 run playsound block.tripwire.click_on player @s ~ ~ ~ 1 0.7 0.5

# summon the block display that is the trap
# dont forget to kill any existing item displays of the trap 
#execute if score @s[scores={hunter_corrupted_t1_trap=399}] hunter_corrupted_t1_trap matches 399 run kill @e[tag=corrupted_t1_trap]

# summon the trap item display at the player's location
execute at @s if score @s[scores={hunter_corrupted_t1_trap=399}] hunter_corrupted_t1_trap matches 399 run summon minecraft:item_display ~ ~0.1 ~ {Tags:["corrupted_t1_trap"],Passengers: [{fall_distance: 0.0d, id: "minecraft:item_display", Tags:["corrupted_t1_trap"], item: {count: 1, id: "minecraft:purpur_pillar", components: {"minecraft:custom_name": '{"text":"corrupted_t1_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.25f, 0.083333336f, 0.25f], translation: [0.0f, 0.125f, 0.0f]}}], fall_distance: 0.0d, item: {count: 1, id: "minecraft:budding_amethyst", components: {"minecraft:custom_name": '{"text":"corrupted_t1_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.4375f, 0.14583333f, 0.4375f], translation: [0.0f, 0.0f, 0.0f]}}
#the trap itself will be handled using the trap management function


# Replace trap item with gray dye to show cooldown

execute if score @s[scores={hunter_corrupted_t1_trap=399}] hunter_corrupted_t1_trap matches 399 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 20
execute if score @s[scores={hunter_corrupted_t1_trap=380}] hunter_corrupted_t1_trap matches 380 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 19
execute if score @s[scores={hunter_corrupted_t1_trap=360}] hunter_corrupted_t1_trap matches 360 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 18
execute if score @s[scores={hunter_corrupted_t1_trap=340}] hunter_corrupted_t1_trap matches 340 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 17
execute if score @s[scores={hunter_corrupted_t1_trap=320}] hunter_corrupted_t1_trap matches 320 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 16
execute if score @s[scores={hunter_corrupted_t1_trap=300}] hunter_corrupted_t1_trap matches 300 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 15
execute if score @s[scores={hunter_corrupted_t1_trap=280}] hunter_corrupted_t1_trap matches 280 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 14
execute if score @s[scores={hunter_corrupted_t1_trap=260}] hunter_corrupted_t1_trap matches 260 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 13
execute if score @s[scores={hunter_corrupted_t1_trap=240}] hunter_corrupted_t1_trap matches 240 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 12
execute if score @s[scores={hunter_corrupted_t1_trap=220}] hunter_corrupted_t1_trap matches 220 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 11
execute if score @s[scores={hunter_corrupted_t1_trap=200}] hunter_corrupted_t1_trap matches 200 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 10
execute if score @s[scores={hunter_corrupted_t1_trap=180}] hunter_corrupted_t1_trap matches 180 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 9
execute if score @s[scores={hunter_corrupted_t1_trap=160}] hunter_corrupted_t1_trap matches 160 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 8
execute if score @s[scores={hunter_corrupted_t1_trap=140}] hunter_corrupted_t1_trap matches 140 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 7
execute if score @s[scores={hunter_corrupted_t1_trap=120}] hunter_corrupted_t1_trap matches 120 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 6
execute if score @s[scores={hunter_corrupted_t1_trap=100}] hunter_corrupted_t1_trap matches 100 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 5
execute if score @s[scores={hunter_corrupted_t1_trap=80}] hunter_corrupted_t1_trap matches 80 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 4
execute if score @s[scores={hunter_corrupted_t1_trap=60}] hunter_corrupted_t1_trap matches 60 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 3
execute if score @s[scores={hunter_corrupted_t1_trap=40}] hunter_corrupted_t1_trap matches 40 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 2
execute if score @s[scores={hunter_corrupted_t1_trap=20}] hunter_corrupted_t1_trap matches 20 run item replace entity @s hotbar.3 with gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]] 1

# Remove gray dye when cooldown is done
execute if score @s hunter_corrupted_t1_trap matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"trap cooldown","italic":false}]]

# When cooldown is over, give the trap back if missing
execute if score @s corruption matches 15.. if score @s hunter_corrupted_t1_trap matches 0 unless entity @s[nbt={Inventory:[{id:"minecraft:tripwire_hook",Slot:3b}]}] run item replace entity @s hotbar.3 with tripwire_hook[custom_name=[{"text":"corrupted trap","italic":false,"color":"dark_purple"}],lore=[[{"text":"drop to place a trap","italic":false}]]]


#==========================================================================================================================================================
#                            50% corruption!
#==========================================================================================================================================================

execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s [{"text":"you are 50% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 50 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
# to prevent the imidiate use of the trap item, a command will set the cooldown to 15 before letting the player use it
execute if score @s corruption matches ..50 run scoreboard players set @s hunter_corrupted_t2_trap 15



# give the corrupted jump boost
execute if score @s corruption matches 50.. run effect give @s jump_boost 1 1 true

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tier 2 trap
# When the player drops the trap, start a cooldown (20s = 400 ticks), and remove the item
execute if score @s corruption matches 50.. unless entity @s[nbt={Inventory:[{Slot:5b,id:"minecraft:trial_key"}]}] if score @s hunter_corrupted_t2_trap matches 0 run scoreboard players set @s hunter_corrupted_t2_trap 400

# give the hunter a trap item, make sure he cannot drop it
# Give the hunter a trap item in hotbar slot 5 if they don't already have it and are at least 50% corrupt
execute if score @s corruption matches 50.. unless data entity @s Inventory[{Slot:5b,id:"minecraft:trial_key"}] run kill @e[type=item,nbt={Item:{id:"minecraft:trial_key"}}]
execute if score @s corruption matches 50.. unless data entity @s Inventory[{Slot:5b,id:"minecraft:trial_key"}] if score @s hunter_corrupted_t2_trap matches 0 run item replace entity @s hotbar.5 with trial_key[custom_name=[{"text":"superior corrupted trap","italic":false,"color":"dark_purple"}],lore=[[{"text":"drop to place a trap","italic":false}]]]


# Decrease cooldown if active
execute if score @s hunter_corrupted_t2_trap matches 1.. run scoreboard players remove @s hunter_corrupted_t2_trap 1

# when the trap is dropped, play a sound
execute if score @s[scores={hunter_corrupted_t2_trap=399}] hunter_corrupted_t2_trap matches 399 run playsound block.tripwire.detach player @s ~ ~ ~ 1 0.6 0.5
execute if score @s[scores={hunter_corrupted_t2_trap=395}] hunter_corrupted_t2_trap matches 395 run playsound block.lodestone.place player @s ~ ~ ~ 1 1 1

# summon the block display that is the trap
# dont forget to kill any existing item displays of the trap 
#execute if score @s[scores={hunter_corrupted_t2_trap=399}] hunter_corrupted_t2_trap matches 399 run kill @e[tag=corrupted_t2_trap]

# summon the trap item display at the player's location
execute at @s if score @s[scores={hunter_corrupted_t2_trap=399}] hunter_corrupted_t2_trap matches 399 run summon minecraft:item_display ~ ~0.1 ~ {Tags:["corrupted_t2_trap"],Passengers: [{fall_distance: 0.0d, id: "minecraft:item_display", Tags:["corrupted_t2_trap"], item: {count: 1, id: "minecraft:crying_obsidian", components: {"minecraft:custom_name": '{"text":"corrupted_t2_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.3541667f, 0.0625f, 0.3541667f], translation: [0.0f, 0.0f, 0.0f]}}], billboard: "vertical", fall_distance: 0.0d, item: {count: 1, id: "minecraft:end_rod", components: {"minecraft:custom_name": '{"text":"corrupted_t2_trap"}'}}, transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [0.3541667f, 0.75f, 0.3541667f], translation: [0.0f, 0.0f, 0.0f]}}
#the trap itself will be handled using the trap management function


# Replace trap item with gray dye to show cooldown

execute if score @s[scores={hunter_corrupted_t2_trap=399}] hunter_corrupted_t2_trap matches 399 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 20
execute if score @s[scores={hunter_corrupted_t2_trap=380}] hunter_corrupted_t2_trap matches 380 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 19
execute if score @s[scores={hunter_corrupted_t2_trap=360}] hunter_corrupted_t2_trap matches 360 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 18
execute if score @s[scores={hunter_corrupted_t2_trap=340}] hunter_corrupted_t2_trap matches 340 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 17
execute if score @s[scores={hunter_corrupted_t2_trap=320}] hunter_corrupted_t2_trap matches 320 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 16
execute if score @s[scores={hunter_corrupted_t2_trap=300}] hunter_corrupted_t2_trap matches 300 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 15
execute if score @s[scores={hunter_corrupted_t2_trap=280}] hunter_corrupted_t2_trap matches 280 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 14
execute if score @s[scores={hunter_corrupted_t2_trap=260}] hunter_corrupted_t2_trap matches 260 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 13
execute if score @s[scores={hunter_corrupted_t2_trap=240}] hunter_corrupted_t2_trap matches 240 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 12
execute if score @s[scores={hunter_corrupted_t2_trap=220}] hunter_corrupted_t2_trap matches 220 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 11
execute if score @s[scores={hunter_corrupted_t2_trap=200}] hunter_corrupted_t2_trap matches 200 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 10
execute if score @s[scores={hunter_corrupted_t2_trap=180}] hunter_corrupted_t2_trap matches 180 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 9
execute if score @s[scores={hunter_corrupted_t2_trap=160}] hunter_corrupted_t2_trap matches 160 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 8
execute if score @s[scores={hunter_corrupted_t2_trap=140}] hunter_corrupted_t2_trap matches 140 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 7
execute if score @s[scores={hunter_corrupted_t2_trap=120}] hunter_corrupted_t2_trap matches 120 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 6
execute if score @s[scores={hunter_corrupted_t2_trap=100}] hunter_corrupted_t2_trap matches 100 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 5
execute if score @s[scores={hunter_corrupted_t2_trap=80}] hunter_corrupted_t2_trap matches 80 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 4
execute if score @s[scores={hunter_corrupted_t2_trap=60}] hunter_corrupted_t2_trap matches 60 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 3
execute if score @s[scores={hunter_corrupted_t2_trap=40}] hunter_corrupted_t2_trap matches 40 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 2
execute if score @s[scores={hunter_corrupted_t2_trap=20}] hunter_corrupted_t2_trap matches 20 run item replace entity @s hotbar.5 with gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]] 1

# Remove gray dye when cooldown is done
execute if score @s hunter_corrupted_t2_trap matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"superior trap cooldown","italic":false}]]

# When cooldown is over, give the trap back if missing
execute if score @s corruption matches 50.. if score @s hunter_corrupted_t2_trap matches 0 unless entity @s[nbt={Inventory:[{id:"minecraft:trial_key",Slot:5b}]}] run item replace entity @s hotbar.5 with trial_key[custom_name=[{"text":"superior corrupted trap","italic":false,"color":"dark_purple"}],lore=[[{"text":"drop to place a trap","italic":false}]]]


#==========================================================================================================================================================
#                            90% corruption!
#==========================================================================================================================================================

execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run tellraw @s[scores={evil_class=3}] [{"text":"you are 90% ","color":"red"},{"text":"corrupt","color":"light_purple"}]
execute if score @s corruption matches 90 if score corruption_tick corruption matches 1 if score tick time matches 5 run playsound entity.wither.hurt player @s ~ ~ ~ 1 1 1
# to prevent the imidiate use of the trap item, a command will set the cooldown to 15 before letting the player use it
execute if score @s corruption matches ..90 run scoreboard players set @s hunter_corrupted_t3_trap 15


# give the corrupted speed boost
execute if score @s corruption matches 90.. run effect give @s speed 1 2 true
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# tier 3 trap
# When the player drops the trap, start a cooldown (20s = 400 ticks), and remove the item
execute if score @s corruption matches 90.. unless entity @s[nbt={Inventory:[{Slot:6b,id:"minecraft:ominous_trial_key"}]}] if score @s hunter_corrupted_t3_trap matches 0 run scoreboard players set @s hunter_corrupted_t3_trap 400

# give the hunter a trap item, make sure he cannot drop it
# Give the hunter a trap item in hotbar slot 6 if they don't already have it and are at least 90% corrupt
execute if score @s corruption matches 90.. unless data entity @s Inventory[{Slot:6b,id:"minecraft:ominous_trial_key"}] run kill @e[type=item,nbt={Item:{id:"minecraft:ominous_trial_key"}}]
execute if score @s corruption matches 90.. unless data entity @s Inventory[{Slot:6b,id:"minecraft:ominous_trial_key"}] if score @s hunter_corrupted_t3_trap matches 0 run item replace entity @s hotbar.6 with ominous_trial_key[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false,"color":"dark_purple"}],lore=[[{"text":"drop to place a trap","italic":false}]]]


# Decrease cooldown if active
execute if score @s hunter_corrupted_t3_trap matches 1.. run scoreboard players remove @s hunter_corrupted_t3_trap 1

# when the trap is dropped, play a sound
execute if score @s[scores={hunter_corrupted_t3_trap=399}] hunter_corrupted_t3_trap matches 399 run playsound minecraft:block.brewing_stand.brew player @s ~ ~ ~ 1 0.6 0.5
execute if score @s[scores={hunter_corrupted_t3_trap=395}] hunter_corrupted_t3_trap matches 395 run playsound block.lodestone.place player @s ~ ~ ~ 1 0.5 1
execute if score @s[scores={hunter_corrupted_t3_trap=395}] hunter_corrupted_t3_trap matches 395 run playsound block.ender_chest.open player @s ~ ~ ~ 1 0.8 1


# summon the block display that is the trap
# dont forget to kill any existing item displays of the trap 
#execute if score @s[scores={hunter_corrupted_t3_trap=399}] hunter_corrupted_t3_trap matches 399 run kill @e[tag=corrupted_t3_trap]

# summon the trap item display at the player's location
execute at @s if score @s[scores={hunter_corrupted_t3_trap=399}] hunter_corrupted_t3_trap matches 399 run summon minecraft:phantom ~ ~2 ~ {Tags:["corrupted_t3_trap"],Silent:1b,Team:corrupted,attributes:[{id:attack_damage,base:1f},{id:follow_range,base:2048f},{id:scale,base:0.1f}],Passengers:[{fall_distance:0.0d,id:"minecraft:item_display",Tags:["corrupted_t3_trap"],Silent:1b,item:{count:1,id:"minecraft:budding_amethyst"},transformation:{left_rotation:[0.0f,-0.38268352f,0.0f,0.92387956f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,0.062499985f,1.0f],translation:[0.0f,0.0f,0.0f]},Passengers:[{fall_distance:0.0d,id:"minecraft:item_display",Tags:["corrupted_t3_trap"],Silent:1b,item:{count:1,id:"minecraft:heavy_core"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],translation:[0.0f,0.1875f,0.0f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["corrupted_t3_trap"],Silent:1b,item:{count:1,id:"minecraft:budding_amethyst"},transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,0.0625f,1.0f],translation:[0.0f,0.019190762f,0.0f]}},{billboard:"center",fall_distance:0.0d,id:"minecraft:item_display",Tags:["corrupted_t3_trap"],Silent:1b,item:{count:1,id:"minecraft:reinforced_deepslate"},transformation:{left_rotation:[0.0024642693f,0.17058408f,-0.008069329f,0.9853071f],right_rotation:[0.0011490949f,0.17063959f,-0.004000244f,-0.9853248f],scale:[0.24677181f,0.9370211f,0.31247684f],translation:[0.0f,0.125f,0.0f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["corrupted_t3_trap"],Silent:1b,item:{count:1,id:"minecraft:netherite_shovel"},transformation:{left_rotation:[0.0f,0.0f,1.0f,0.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.99999994f,0.99999994f,1.0f],translation:[0.5f,-0.3125f,0.0f]}},{fall_distance:0.0d,id:"minecraft:item_display",Tags:["corrupted_t3_trap"],Silent:1b,item:{count:1,id:"minecraft:netherite_shovel"},transformation:{left_rotation:[0.0f,0.0f,0.7071068f,0.7071068f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.99999994f,0.99999994f,1.0f],translation:[-0.625f,-0.3125f,0.0f]}},{id:"minecraft:guardian",Tags:["corrupted_t3_trap"],Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Team:corrupted,attributes:[{id:attack_damage,base:0f},{id:follow_range,base:2048f},{id:scale,base:0.1f}],Passengers:[{id:"minecraft:guardian",Tags:["corrupted_t3_trap"],Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Team:corrupted,attributes:[{id:attack_damage,base:0f},{id:follow_range,base:2048f},{id:scale,base:0.1f}],Passengers:[{id:"minecraft:guardian",Tags:["corrupted_t3_trap"],Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Team:corrupted,attributes:[{id:attack_damage,base:0f},{id:follow_range,base:2048f},{id:scale,base:0.1f}],Passengers:[{id:"minecraft:guardian",Tags:["corrupted_t3_trap"],Invulnerable:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Team:corrupted,attributes:[{id:attack_damage,base:0f},{id:follow_range,base:2048f},{id:scale,base:0.1f}]}]}]}]}]}]}

# multiple giardians to hit multiple targets
#the trap itself will be handled using the trap management function


# Replace trap item with gray dye to show cooldown

execute if score @s[scores={hunter_corrupted_t3_trap=399}] hunter_corrupted_t3_trap matches 399 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 20
execute if score @s[scores={hunter_corrupted_t3_trap=380}] hunter_corrupted_t3_trap matches 380 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 19
execute if score @s[scores={hunter_corrupted_t3_trap=360}] hunter_corrupted_t3_trap matches 360 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 18
execute if score @s[scores={hunter_corrupted_t3_trap=340}] hunter_corrupted_t3_trap matches 340 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 17
execute if score @s[scores={hunter_corrupted_t3_trap=320}] hunter_corrupted_t3_trap matches 320 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 16
execute if score @s[scores={hunter_corrupted_t3_trap=300}] hunter_corrupted_t3_trap matches 300 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 15
execute if score @s[scores={hunter_corrupted_t3_trap=280}] hunter_corrupted_t3_trap matches 280 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 14
execute if score @s[scores={hunter_corrupted_t3_trap=260}] hunter_corrupted_t3_trap matches 260 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 13
execute if score @s[scores={hunter_corrupted_t3_trap=240}] hunter_corrupted_t3_trap matches 240 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 12
execute if score @s[scores={hunter_corrupted_t3_trap=220}] hunter_corrupted_t3_trap matches 220 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 11
execute if score @s[scores={hunter_corrupted_t3_trap=200}] hunter_corrupted_t3_trap matches 200 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 10
execute if score @s[scores={hunter_corrupted_t3_trap=180}] hunter_corrupted_t3_trap matches 180 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 9
execute if score @s[scores={hunter_corrupted_t3_trap=160}] hunter_corrupted_t3_trap matches 160 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 8
execute if score @s[scores={hunter_corrupted_t3_trap=140}] hunter_corrupted_t3_trap matches 140 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 7
execute if score @s[scores={hunter_corrupted_t3_trap=120}] hunter_corrupted_t3_trap matches 120 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 6
execute if score @s[scores={hunter_corrupted_t3_trap=100}] hunter_corrupted_t3_trap matches 100 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 5
execute if score @s[scores={hunter_corrupted_t3_trap=80}] hunter_corrupted_t3_trap matches 80 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 4
execute if score @s[scores={hunter_corrupted_t3_trap=60}] hunter_corrupted_t3_trap matches 60 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 3
execute if score @s[scores={hunter_corrupted_t3_trap=40}] hunter_corrupted_t3_trap matches 40 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 2
execute if score @s[scores={hunter_corrupted_t3_trap=20}] hunter_corrupted_t3_trap matches 20 run item replace entity @s hotbar.6 with gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]] 1

# Remove gray dye when cooldown is done
execute if score @s hunter_corrupted_t3_trap matches 0 if score tick time matches 1 run clear @s gray_dye[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false}]]

# When cooldown is over, give the trap back if missing
execute if score @s corruption matches 90.. if score @s hunter_corrupted_t3_trap matches 0 unless entity @s[nbt={Inventory:[{id:"minecraft:ominous_trial_key",Slot:6b}]}] run item replace entity @s hotbar.6 with ominous_trial_key[custom_name=[{"text":"Hunter Corrupter Hawk","italic":false,"color":"dark_purple"}],lore=[[{"text":"drop to place a trap","italic":false}]]]
