#here we will detect if the party leader dropped the map selector

# using the drop_detect_function_delay score does work, however it is not the best way to do this.
# if the player leader drops the game start dye and there are not enough players, there will be a brief moment where the end crystal cannot despawn
#this will cause the end crystal to exist for far longer than it should, possibly allowing other players to pick it up
#however this is not a problem because if there was another player in the game, the start game dye would trigger the game start.
# i dont want to make a unique variable for each item, it clutters the sidebar and makes it hard to read
# this is a bit of a hacky way to do it, but it works

execute if score drop_detect_function_Delay time matches 0 run give @a[team=party_lead] end_crystal[custom_name=[{"text":"drop to choose map","italic":false}],rarity=epic,enchantment_glint_override=true]
# this seems a bit complex but it is nessesary to make sure that ONLY 1 end crystal exists.
#also it is here where all the map beacons are scnned and the map names are stored to be selected by the party leader


execute if score map_beacon_count debug matches 0 run tellraw @a ["",{"text":"WARNING: NO MAP BEACONS FOUND","color":"gold"}]

# here in order to prevent the end crystal from spammin the chat, the same delay used to make the dye drop is used to make the end crystal drop
execute at @e[type=minecraft:turtle] run data get entity @e[type=minecraft:turtle,limit=1,sort=nearest] CustomName

execute if entity @e[type=item,nbt={Item:{id:"minecraft:end_crystal"}}] if score drop_detect_function_Delay time matches 0 run kill @e[type=item,nbt={Item:{id:"minecraft:end_crystal"}}]

scoreboard players set drop_detect_function_Delay time 2
execute if entity @e[type=item,nbt={Item:{id:"minecraft:end_crystal"}}] run scoreboard players set drop_detect_function_Delay time 2

#==========================================================================================================
#with this method, the playes inventory is spammed with books coresponding to each map beacon. this is why we must clear there inventory
# and give them only what they need.

# there was code here, now its gone. 

#=========================================================================================================
# here is where we check for any map beacons that exist
scoreboard players add @e[type=turtle] map_list 0
#show the list of all available maps. unfortunatly it is imposible to click the names and teleport to them.

execute if score map_beacon_count debug matches 1.. run tellraw @a[team=party_lead] ["",{"text":"======= map selection =======","color":"white"}]
#execute at @e[type=minecraft:turtle] run tellraw @a[team=party_lead] [{"text":"Beacon Name: ","color":"gold"},{"selector":"@e[type=minecraft:turtle,limit=1,sort=nearest]","color":"white"}]
#a workaround it to give the party leader a knolege book with the names of all the maps
# when the player drops a spefific knolege book, select it.

execute as @e[type=minecraft:turtle] run tellraw @a[team=party_lead] {"color":"aqua","entity":"@s","hover_event":{"action":"show_text","value":[{"text":"use the up and down arrows to select a map "}]},"nbt":"CustomName"}
# the only thing left to do is that when the player clicks the map it selects the scoreboard value as define in gamestate_0.
# spefically time dependent map selection and deselection code. 


# every turlte advertises its name to the chat, then it puts its own score into the scoreboard to be selected,
#to make this work each tutle would have to send its own custom command in the chat to select itself, and ONLY itself


#refresh the map beacon identification
#++++++++story time +++++++++++++++++++++++++++++++++++++
# the quest to get to this command was long and painfull. before, the ordered map list did not exist. nor did the indexing feature. there was en entire function dedicated to the creation of a sorted index
# there were many variebles and scoreboards that are now entirely unused and deleted. moral of the story 
# creating an ordered scoreboard form an unordered scoreboard is impossible, use existing infastructure to make things work.

execute as @e[type=turtle] if score @s map_list matches 0 run scoreboard players operation @s map_list = @s ordered_map_list
# on further consideration, this code is entirely redundant as the ordered list is already exactly what is needed, but the process of debloating the code
#for selecting maps is not a priority.
# it is not nessasery to create a whole new list for all the map id's. its just i though it was during RND and its a part of the technical debt now.

#==========================================================================================================



#        execute as @e[scores={map_selection=1}] run tp @a @s
# here is the method behind the maddness, ONLY a selected map /beacon with a value of 2 will teleport the player to the map beacon
 #=========================================================================================================
# give the pary leader the selection arrows, make sure he only has 1 pair
execute unless score map_beacon_count debug matches 0 run scoreboard players set delay map_selection 2
clear @a[team=party_lead] arrow
clear @a[team=party_lead] spectral_arrow
execute unless score map_beacon_count debug matches 0 run give @a[team=party_lead] arrow[custom_name=[{"text":"down","italic":false,"color":"dark_red"}],rarity=uncommon,enchantment_glint_override=true]
execute unless score map_beacon_count debug matches 0 run give @a[team=party_lead] spectral_arrow[custom_name=[{"text":"up","italic":false,"color":"dark_green"}],rarity=uncommon,enchantment_glint_override=true]