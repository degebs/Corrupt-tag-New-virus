

#██████╗ ██████╗ ███████╗ ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗██████╗  ██████╗ ██╗    ██╗███╗   ██╗     ██╗
#██╔══██╗██╔══██╗██╔════╝██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝██╔══██╗██╔═══██╗██║    ██║████╗  ██║    ███║
#██████╔╝██████╔╝█████╗  ██║  ███╗███████║██╔████╔██║█████╗      ██║     ██║   ██║██║   ██║██╔██╗ ██║   ██║   ██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║    ╚██║
#██╔═══╝ ██╔══██╗██╔══╝  ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║     ██║   ██║██║   ██║██║╚██╗██║   ██║   ██║  ██║██║   ██║██║███╗██║██║╚██╗██║     ██║
#██║     ██║  ██║███████╗╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║   ██║   ██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║     ██║
#╚═╝     ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝     ╚═╝
#                                                                       


#=================================================================================================
scoreboard players reset count reload_spam
# this is here so that the prompt to use the party leader change command does not spam the chat

#check if there are any map beacons and if not retreat!
execute if score map_beacon_count debug matches 0 run tellraw @a ["",{"text":"CRITICAL ERROR: NO MAP BEACONS FOUND","color":"dark_red"}]
#=======================================================================
#if there are no maps when the item drops PANIC AND RESET THE WHOLE GAME
execute if score map_beacon_count debug matches 0 run reload

# if no map is chosen then we can use the command that selects a random map
execute if score @a[team=party_lead,limit=1] map_selection matches 0 run scoreboard players reset @e[type=turtle] map_selection
execute if score @a[team=party_lead,limit=1] map_selection matches 0 run scoreboard players set @e[type=minecraft:turtle,sort=random,limit=1] map_selection 1
execute if score @a[team=party_lead,limit=1] map_selection matches 0 run tellraw @a ["",{"text":"no map selected. choosing at random","color":"dark_purple"}]



# if the panic does not occur and the countdown is allowed to continue get rid of the party leader team and clear everyones inventory
team remove party_lead
execute if score countdown time matches 30 run clear @a
#clear everyones inventory



#=======================================================================
# we need to check if any players leave during this state and if they do preform another panic
execute unless score players_waiting players_online = Online players_online run tellraw @a ["",{"text":"CRITICAL ERROR: PLAYER COUNT HAS CHANGED DURING COUNTDOWN","color":"dark_red"}]
execute unless score players_waiting players_online = Online players_online run reload
# this is done because all players from this point forward are "alive" and the number of players counted at this point shall be used to calulate
# the endgame threshhold condition. And the winning condition.

#=======================================================================
#create a score for the actuall coundown

#if the tick score reaches 14 decrease the countdown score by 1
execute if score tick time matches 14 run scoreboard players remove countdown time 1
#when it reaches 0 we need to set the game state to 2 then teleport all players to the SELECTED map beacon.
execute if score countdown time matches 0 if score tick time matches 5 run scoreboard players set game state 2

#=======================================================================
#use title commands to display the countdown

execute if score countdown time matches 10 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"10 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 10 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 1
execute if score countdown time matches 9 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"9 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 9 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.95
execute if score countdown time matches 8 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"8 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 8 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.9
execute if score countdown time matches 7 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"7 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 7 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.85
execute if score countdown time matches 6 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"6 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 6 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.8
execute if score countdown time matches 5 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"5 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 5 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.75
execute if score countdown time matches 4 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"4 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 4 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.7
execute if score countdown time matches 3 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"3 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 3 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.65
execute if score countdown time matches 2 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"2 seconds","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 2 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.6
execute if score countdown time matches 1 run title @a actionbar [{"text":"game starts in ","color":"white"},{"text":"1 second","color":"dark_purple"}]
execute at @a run execute if score countdown time matches 1 if score tick time matches 5 run playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 0.55
execute if score countdown time matches 0 run title @a actionbar [{"text":"game starts ","color":"white"},{"text":"right NOW","color":"dark_purple"}]
execute if score countdown time matches 0 run clear @a

scoreboard players set endgame state 0

#=======================================================================
# it is here where the game counts all players that shall be "alive" or "gaming" when the game starts
# this must be done so that the game can calculate the endgame, and who can win.

# when a player dies or leaves this value will go down. the other values in the "players_online" scoreboard cant really do this.
# "online" is used to keep track of how many people are in the server and not nessasarily playing the game
# "players_waiting" is the value that is used to check if a player left during the countdown.
# "party_leader_online" is used to check if the party leader is still in the game, and is not needed after the countdown

execute if score countdown time matches 5 run scoreboard players operation gamers players_online = Online players_online

#=======================================================================
# it is here at this point that we must let all players choose there normal classses and corrupted classes.
# using the scores "class" and "evil_class" each class has is own id
execute if score countdown time matches 29 if score tick time matches 13 run tellraw @a ["choose your ",{"text":"runner ","color":"dark_aqua"},"class and ",{"text":"corrupted ","color":"light_purple"},"class           \nif you dont choose with your inventory, you will be given a random class"]
#execute if score countdown time matches 28 if score tick time matches 1 run give @a written_book[written_book_content={pages:[[[{"text":"uncorrupted classes","color":"#000099"},{"text":"\n\n"},{"text":"medic","color":"blue","click_event":{"action":"run_command","command":"/trigger class set 1"},"hover_event":{"action":"show_text","value":["",{"text":"item","color":"dark_aqua"},"\n- healing item\n- ",{"text":"healing item can heal teamates","color":"yellow"},"\n",{"text":"weapon","color":"dark_aqua"},"\n- ",{"text":"knock back hoe","color":"yellow"},"\n",{"text":"movement","color":"dark_aqua"},"\n- just boost when using heal item\n-",{"text":" only works in endgame","color":"red"},"\n "]}},{"text":"\n","color":"blue"},{"text":"Archer","color":"blue","click_event":{"action":"run_command","command":"/trigger class set 2"},"hover_event":{"action":"show_text","value":["",{"text":"item","color":"dark_aqua"},"\n- arrows (6 maximum)\n",{"text":"weapon","color":"dark_aqua"},"\n- ",{"text":"knock back bow","color":"yellow"},"\n",{"text":"movement","color":"dark_aqua"},"\n- permanent speed buff\n "]}},{"text":"\n","color":"blue"},{"text":"bulk","color":"blue","click_event":{"action":"run_command","command":"/trigger class set 3"},"hover_event":{"action":"show_text","value":["",{"text":"item","color":"dark_aqua"},"\n- a jump boost item\n-",{"text":" a totem of undying","color":"yellow"},"\n",{"text":"weapon","color":"dark_aqua"},"\n- ",{"text":"big knockback sword","color":"yellow"},"\n",{"text":"movement","color":"dark_aqua"},"\n- ",{"text":"slowness when item used","color":"red"},"\n- ",{"text":"faster nautral regen","color":"yellow"},"\n "]}},{"text":"\n","color":"blue"},{"text":"assassin","color":"blue","click_event":{"action":"run_command","command":"/trigger class set 4"},"hover_event":{"action":"show_text","value":["",{"text":"item","color":"dark_aqua"},"\n-",{"text":" ink sack that give a huge speed boost and blinds the corrupted when used","color":"yellow"},"\n",{"text":"weapon","color":"dark_aqua"},"\n- daggar\n",{"text":"movement","color":"dark_aqua"},"\n- permanent speed boost ",{"text":"only in endgame","color":"red"},"\n- ",{"text":"invisablility while crouching","color":"yellow"},"\n "]}},{"text":"\n","color":"blue"},{"text":"stun man","color":"blue","click_event":{"action":"run_command","command":"/trigger class set 5"},"hover_event":{"action":"show_text","value":["",{"text":"item","color":"dark_aqua"},"\n-",{"text":" stun landmine","color":"yellow"},"\n",{"text":"weapon","color":"dark_aqua"},"\n- eletric trident (stunns corrupted)\n",{"text":"movement","color":"dark_aqua"},"\n- permanent jump boost ",{"text":"only in endgame","color":"red"},"\n\n "]}},{"text":"\n","color":"blue"},{"text":"fisherman","color":"blue","click_event":{"action":"run_command","command":"/trigger class set 6"},"hover_event":{"action":"show_text","value":["",{"text":"item","color":"dark_aqua"},"\n-",{"text":" fishing-net trap ","color":"yellow"},"\n",{"text":"weapon","color":"dark_aqua"},"\n- fishing rod\n",{"text":"movement","color":"dark_aqua"},"\n- ",{"text":"permanent speed boost","color":"yellow"},"\n\n "]}}]],[[{"text":"corrupted classes","color":"dark_purple"},{"text":"\n\n"},{"text":"The Corrupted","color":"light_purple","click_event":{"action":"run_command","command":"/trigger evil_class set 1"},"hover_event":{"action":"show_text","value":["",{"text":"15% corruption","color":"dark_purple"},"\n- ",{"text":"gain an item to see the location of all the runners","color":"yellow"},"\n",{"text":"50% corruption","color":"dark_purple"},"\n- ",{"text":"gain a speed boost item","color":"yellow"},"\n- permenent jump boost\n",{"text":"90% corruption","color":"dark_purple"},"\n- ",{"text":"gain an item to teleport to a random player","color":"yellow"},"\n- significant jump boost"]}},{"text":"\n","color":"light_purple"},{"text":"The Predator","color":"light_purple","click_event":{"action":"run_command","command":"/trigger evil_class set 2"},"hover_event":{"action":"show_text","value":["",{"text":"15% corruption","color":"dark_purple"},"\n- ",{"text":"passive speed boost when close to runners","color":"yellow"},"\n",{"text":"50% corruption","color":"dark_purple"},"\n- ",{"text":"gain a temporary invisability item","color":"yellow"},"\n- permenent jump boost\n",{"text":"90% corruption","color":"dark_purple"},"\n- ",{"text":"gain an item to remotely stun all runners (and reveal them)","color":"yellow"},"\n- permamnent speed boost"]}},{"text":"\n","color":"light_purple"},{"text":"The Apparition","color":"light_purple","click_event":{"action":"run_command","command":"/trigger evil_class set 3"},"hover_event":{"action":"show_text","value":["",{"text":"15% corruption","color":"dark_purple"},"\n- ",{"text":"gain permanent invisablility","color":"yellow"},"\n- ",{"text":"slowness when close to runners","color":"red"},"\n",{"text":"50% corruption","color":"dark_purple"},"\n- ",{"text":"gain an item to see the location of all the runners","color":"yellow"},"\n- speed boost in darkness\n",{"text":"90% corruption","color":"dark_purple"},"\n- ",{"text":"gain a recharging enderperal item","color":"yellow"},"\n- permamnent speed boost"]}},{"text":"\n","color":"light_purple"},{"text":"The Hunter","color":"light_purple","click_event":{"action":"run_command","command":"/trigger evil_class set 4"},"hover_event":{"action":"show_text","value":["",{"text":"15% corruption","color":"dark_purple"},"\n- ",{"text":"gain the ability to place traps","color":"yellow"},"\n- ",{"text":"gain an item to see the location of all the runners","color":"yellow"},"\n",{"text":"50% corruption","color":"dark_purple"},"\n- ",{"text":"signicantly better traps","color":"yellow"},"\n- jump boost\n",{"text":"90% corruption","color":"dark_purple"},"\n- ",{"text":"gain a SUPREME trap","color":"yellow"},"\n- permamnent speed boost"]}},{"text":"\n","color":"light_purple"},{"text":"The Knight","color":"light_purple","click_event":{"action":"run_command","command":"/trigger evil_class set 5"},"hover_event":{"action":"show_text","value":["",{"text":"15% corruption","color":"dark_purple"},"\n- permanent damage boost\n- ",{"text":"full stun and knock-back immunity","color":"yellow"},"\n",{"text":"50% corruption","color":"dark_purple"},"\n- ",{"text":"gain an item to see the location of all the runners","color":"yellow"},"\n- speed boost item\n",{"text":"90% corruption","color":"dark_purple"},"\n- ",{"text":"gets an item that temporarily halts corruption","color":"yellow"},"\n- permanent speed boost\n- permanent jump boost"]}},{"text":"\n","color":"light_purple"},{"text":"the Dark Star","color":"light_purple","click_event":{"action":"run_command","command":"/trigger evil_class set 6"},"hover_event":{"action":"show_text","value":["",{"text":"15% corruption","color":"dark_purple"},"\n- permanent jump boost\n- ",{"text":"gain an item that blinds runners","color":"yellow"},"\n",{"text":"50% corruption","color":"dark_purple"},"\n- speed boost item\n",{"text":"90% corruption","color":"dark_purple"},"\n- ",{"text":"a massive nuke that will detonate the entire map","color":"yellow"}]}}]]],title:"choose your classes",author:"degebs"}]
# the code for the book is very long so it can be found here https://www.gamergeeks.net/apps/minecraft/give-command-generator/written-books#s=RdtyNFInAHg6urs8
# let everyone change their class

# the book is now obsolete

scoreboard players enable @a class
scoreboard players enable @a evil_class

# the un-corrupted classes are
# 1 = medic
# 2 = archer
# 3 = bulk
# 4 = assassin
# 5 = stun man
# 6 = fisherman

# the corrupted classes are
# 1 = The Corrupted
# 2 = The Predator
# 3 = The Apparition
# 4 = The Hunter
# 5 = The Knight
# 6 = the Dark Star

#----------------check if no class was chosen--------------------------


execute as @a if score @s class matches 0 run scoreboard players operation @s class = rng class
execute as @a if score @s evil_class matches 0 run scoreboard players operation @s evil_class = rng evil_class

#================================================================================================
# team setup stuff

team modify runners collisionRule pushOtherTeams
team modify runners color yellow
team modify runners deathMessageVisibility never
team modify runners friendlyFire false

team modify corrupted color dark_purple
team modify corrupted deathMessageVisibility never
team modify corrupted friendlyFire false
# this one right heres a fun change, now the "boopity boop spots" are 1000% more terrifying to hide in. might make this a setting soon.
team modify corrupted nametagVisibility never
# change from "always" to never



#=================================================================================================
#when a map is chosen the players will eventuall spawn on the map beacon, this is not very nice looking as all players are inside eachother.
# to fix this all players must spawn in a circle around the spawn beacon.
execute if score tick time matches 2 as @e[type=turtle,scores={map_selection=1}] at @s run scoreboard players set @e[type=armor_stand,sort=nearest,limit=1] spawning_circle 1
# now that the correct armorstand is selected we can discuss what this armorstand will actually do.
# every map beacon comes with an armorstand that constantly rotates. what we can do is place secondary armorstands at a radius away from the map beacon
# at diffrent points in armorstands rotation.
# this might be the source of the lag

execute if score tick time matches 3 run execute as @e[type=armor_stand,scores={spawning_circle=1}] at @s rotated ~5 ~ run summon armor_stand ^ ^ ^4 {Rotation:[0.0f,0.0f],Tags:["spawn_point"],Invisible:1b}
execute if score tick time matches 3 run scoreboard players add @e[tag=spawn_point] spawn_circle_count 1

# reuse the 360 rotation code.
# Store the "360" score into temporary storage
execute if score tick time matches 2 store result storage minecraft:temp angle int 1 run scoreboard players get 360 time

# Apply the stored value to the armor stand's yaw rotation
execute if score tick time matches 2 as @e[type=armor_stand,tag=map] store result entity @s Rotation[0] float 1 run data get storage minecraft:temp angle
# this has "if score tick time matches 2" so that the tick rate of the sever does not plummet
#=================================================================================================
# ---------------update the universal time function- keep it from going past 15
# this is an exteme solution to the lag timer problem.
# literally just make the ticks faster

#scoreboard players add tick time 1
execute if score tick time matches 15 run scoreboard players set tick time 0
# never make me do this shit again!
# i literally have to make 1 second equal to 0.75 of a second!!!
# that is how we solve the lag issue. i hate it so much god damn
# i litterly have to use time travel bullshit just to make this feel like its not going SUPREMELY SLOW


#=================================================================================================

# add everyone here right now to the bouncer list
scoreboard players set @a bouncer_list 1

# make the bossbar yellow
bossbar set minecraft:game_time color yellow


#=================================================================================================
# class selection
# before we used a book because i had no idea how to check of people clicked items in inventory slots, but after making all the classes...
# now i do. and its a far superior way of doing this

# tick the cooldown by 1
execute as @a[scores={class_selection_cooldown=1..}] run scoreboard players remove @s class_selection_cooldown 1

# all the class selection logic has been moved to a new function so that it can be deactivated before everyones inevtory is cleared.
# if we dont do this the act of clearing the inventory for the game will be seen as choosing classes and thats bad
execute if score countdown time matches 1.. run function ctnv:one_time_function/class_selection



#======================================================================================================================
# set up corrupted domain expantion. if it is not enabled here. then it wont work during the game
execute unless score enable corrupted_domain_enable matches 1 run function ctnv:corrupted_supercharge_ability/corrupted_domain_expantion_setup























# the secret super-corrupted classes are
# 7 = 4 dimentional being form another universe
# 8 = false god
# 9 = that mf in creative mode
# 10 = the one always right behind you
# 11 = shapeshifter

#                                              ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                             
#                                      ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓                                      
#                                  ▓▓▓▓▓▓▓▓▓▓▓▒▓▓▒▓▒▓▓▓▓▓▓▓▓▓▓▓▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓                                  
#                              ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▒▓▓       ▓▓▒▓▒▒▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▓▓                              
#                           ▓▓▓▓▓▓▓▓▓▓▓▓▓▓     ▓▓▓▓▓▓▓          ▓▒▒▒▓▓     ▓▓▓▓▒▒▒▒▒▒▒▒▓▓                           
#                        ▓▓▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▒▓             ▓▒▒▒▓▓         ▓▓▒▒▒▒▒▒▒▒▓▓                        
#                      ▓▓▓▓▓▓▓▓▓▓▓            ▓▓▓▓▒▓             ▓▓▒▒▓▓            ▓▓▓▒▒▒▒▒▒▒▓                      
#                    ▓▓▓▓▓▓▓▓▓▓                ▓▓▓▓▓▓           ▓▓▒▒▒▓▓               ▓▓▓▒▒▒▒▒▒▓▓                   
#                  ▓▓▓▓▓▓▓▓▓                   ▓▓▓▓▓▓▓         ▓▓▒▓▒▓▓                   ▓▓▒▒▒▒▒▒▓▓                 
#                ▓▓▓▓▓▓▓▓                       ▓▓▒▓▓▓▓▓     ▓▓▓▒▒▓▒▓                       ▓▒▒▒▒▒▒▓                
#              ▓▓▓▓▓▓▓▓▓                        ▓▓▓▓▓▒▓▓▓▓▓▓▓▒▒▓▒▒▓▓▓                        ▓▓▒▒▒▒▒▒▓              
#             ▓▓▓▓▓▓▓▓                     ▓▓▓▓▓▓▓▓▓▒▓▓▒▒▓▓▒▓▒▒▓▓▒▒▒▒▒▓▓▓▓                     ▓▓▒▒▒▒▒▓▓            
#           ▓▓▓▓▓▓▓▓                    ▓▓▓▓▓▓▓▓▒▓▓▒▓▓▓▓▓▓▓▓▓▓▓▒▓▓▒▒▓▒▒▒▒▒▒▓▓                    ▓▓▒▒▒▒▒▓           
#          ▓▓▓▓▓▓▓                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓             ▓▓▓▓▓▓▒▒▒▒▒▒▒▓▓▓                  ▓▒▒▒▒▒▓          
#         ▓▓▓▓▓▓▓                 ▓▓▓▓▓▓▓▓▓▓▓                           ▓▓▓▒▒▒▒▒▒▓▓                 ▓▒▒▒▒▒▓         
#       ▓▓▓▓▓▓▓▓                ▓▓▓▓▓▓▓▓▓                                   ▓▓▒▒▒▒▒▒▓                ▓▓▒▒▒▒▓▓       
#       ▓▓▓▓▓▓                ▓▓▓▓▓▓▓▓▓                                       ▓▓▒▒▒▒▒▒▓                ▓▒▒▒▒▓       
#     ▓▓▓▓▓▓▓               ▓▓▓▓▓▓▓▓▓                                           ▓▓▓▒▒▒▒▓▓               ▓▒▒▒▒▓▓     
#     ▓▓▓▓▓▓               ▓▓▓▓▓▓▓▓                                               ▓▓▒▒▒▒▒▓               ▓▒▒▒▒▓     
#    ▓▓▓▓▓▓              ▓▓▓▓▓▓▓▓                                                   ▓▓▒▒▒▒▓▓              ▓▒▒▒▒▓    
#   ▓▓▓▓▓▓▓              ▓▓▓▓▓▓▓                                                     ▓▓▒▒▒▒▓▓             ▓▓▒▒▒▒▓   
#   ▓▓▓▓▓▓             ▓▓▓▓▓▓▓                                                         ▓▒▒▒▒▓▓             ▓▓▒▒▒▓▓  
#  ▓▓▓▓▓▓              ▓▓▓▓▓▓                                                           ▓▒▒▒▒▓▓             ▓▒▒▒▒▓  
# ▓▓▓▓▓▓▓             ▓▓▓▓▓▓                                                             ▓▒▒▒▒▓             ▓▓▒▒▒▓▓ 
# ▓▓▓▓▓▓             ▓▓▓▓▓▓                                                               ▓▒▒▒▒▓             ▓▒▒▒▒▓ 
# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓                                                                ▓▒▒▒▓▓  ▓▓▓▒▓▒▒▓▓▓▓▓▒▒▒▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                                                 ▓▓▒▒▒▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                                                 ▓▓▓▒▒▒▒▒▒▒▒▓▓▓▓▓▒▒▒▒▒▒▒▓▓
#▓▓▓▓▒▓▓▓▓      ▓▓▓▓▓▓▓▒▓                                                                   ▓▒▓▓▒▓▒▓▓       ▓▒▒▓▒▒▒▓
#▓▓▓▓▓▓▓          ▓▓▒▓▓▓▓                                                                   ▓▒▒▒▓▓▓          ▓▓▓▒▒▒▓
#▓▓▓▓▓▓            ▓▓▓▓▓▓                                                                   ▓▓▒▒▒▓▓           ▓▓▒▓▓▓
#▓▓▓▒▓▓            ▓▓▓▓▓▓                                                                   ▓▓▓▓▒▓            ▓▓▒▒▓▓
#▓▓▓▓▓▓            ▓▓▓▓▓▓                                                                   ▓▓▓▓▓▓▓           ▓▓▒▒▓▓
#▓▓▓▓▓▓▓          ▓▓▓▓▓▓▓                                                                   ▓▓▒▒▓▓▓          ▓▓▓▓▒▓▓
#▓▓▓▓▓▓▓▓▓      ▓▓▓▓▓▓▓▓▓                                                                   ▓▓▓▒▒▓▓▓▓       ▓▓▒▓▓▒▓▓
#▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓                                                                 ▓▓▓▓▒▓▓▒▒▓▓▓▓▓▓▓▒▓▓▒▒▓▓▓▓
#▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                                                 ▓▓▓▒▓▓▓▓▓▓▓▒▓▓▓▒▓▓▓▓▒▓▓▓▓
# ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓                                                                ▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓
# ▓▓▓▓▓▓             ▓▓▓▓▓▓                                                               ▓▓▒▓▓▓             ▓▓▓▓▒▓ 
#  ▓▓▓▓▓▓             ▓▓▓▓▓▓                                                             ▓▓▓▒▓▓             ▓▓▓▓▓▓▓ 
#  ▓▓▓▓▓▓              ▓▓▓▓▓▓                                                           ▓▓▓▓▓▓▓             ▓▓▓▒▓▓  
#   ▓▓▓▓▓▓             ▓▓▓▓▓▓▓                                                         ▓▓▓▒▓▓▓             ▓▓▓▓▒▓▓  
#   ▓▓▓▓▓▓▓              ▓▓▓▓▓▓▓                                                     ▓▓▓▓▓▓▓▓             ▓▓▓▓▓▓▓   
#    ▓▓▓▓▓▓▓              ▓▓▓▓▓▓▓                                                   ▓▓▓▓▓▓▓▓              ▓▓▓▓▓▓    
#     ▓▓▓▓▓▓               ▓▓▓▓▓▓▓▓                                               ▓▓▓▓▓▓▓▓               ▓▓▓▓▓▓     
#     ▓▓▓▓▓▓▓               ▓▓▓▓▓▓▓▓▓                                           ▓▓▓▓▓▓▓▓▓               ▓▓▓▓▓▓▓     
#       ▓▓▓▓▓▓                ▓▓▓▓▓▓▓▓▓                                       ▓▓▓▓▓▓▓▓▓                ▓▓▓▓▓▓       
#       ▓▓▓▓▓▓▓▓                ▓▓▓▓▓▓▓▓▓                                   ▓▓▓▓▓▓▓▓▓                ▓▓▓▓▓▓▓▓       
#         ▓▓▓▓▓▓▓                 ▓▓▓▓▓▓▓▓▓▓▓▓                         ▓▓▓▓▓▓▓▓▓▓▓▓                 ▓▓▓▓▓▓▓         
#          ▓▓▓▓▓▓▓                   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓             ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                  ▓▓▓▓▓▓▓          
#           ▓▓▓▓▓▓▓▓                    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                    ▓▓▓▓▓▓▓▓           
#             ▓▓▓▓▓▓▓▓                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                     ▓▓▓▓▓▓▓▓             
#              ▓▓▓▓▓▓▓▓▓                         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                         ▓▓▓▓▓▓▓▓▓              
#                ▓▓▓▓▓▓▓▓▓                      ▓▓▓▒▓▓▓▓     ▓▓▓▒▓▓▓▓                       ▓▓▓▓▓▓▓▓                
#                  ▓▓▓▓▓▓▓▓▓                   ▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓                   ▓▓▓▓▓▓▓▓▓▓                 
#                    ▓▓▓▓▓▓▓▓▓▓                ▓▓▓▓▓▓            ▓▓▓▓▓▓               ▓▓▓▓▓▓▓▓▓▓                    
#                      ▓▓▓▓▓▓▓▓▓▓▓            ▓▓▓▓▓▓             ▓▓▓▓▓▓            ▓▓▓▓▓▓▓▓▓▓▓                      
#                        ▓▓▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▓▓             ▓▓▓▓▓▓         ▓▓▓▓▓▓▓▓▓▓▓▓                        
#                           ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓          ▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                           
#                               ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                              
#                                  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                  
#                                       ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▓▓▓▓▓▓▓▓▓                                       
#                                              ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓                                              

# 12 = there is order here.
# 13 = degebs


# i will he honest. these extra classes were a joke never to be added