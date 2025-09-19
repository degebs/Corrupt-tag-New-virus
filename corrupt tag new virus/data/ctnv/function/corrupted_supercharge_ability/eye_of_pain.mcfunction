# the spinny bit shound spin forever
execute store result storage minecraft:temp angle int 1 run scoreboard players get 360 time
execute as @e[tag=spinny_bit] store result entity @s Rotation[0] float 1 run data get storage minecraft:temp angle

execute as @e[tag=secondary_spinny_bit] store result entity @s Rotation[0] float -1 run data get storage minecraft:temp angle


#particles for the spiny bit
execute at @e[tag=spinny_bit] run particle dust{color:[0.62,0.0,0.57],scale:2} ~ ~ ~ 1 0 1 0 10 force @a

# give the corrupted player darkness so they cant see anything outside the domain
effect give @a[team=corrupted] minecraft:darkness 3 3 true


# the eye will give the corrupted 4 choices out of a pool of 8
scoreboard players add eye_of_pain_choices corrupted_domain_enable 1

# rng
execute if score eye_of_pain_choices corrupted_domain_enable matches ..20 run scoreboard players add rng corrupted_domain_enable 1
execute if score rng corrupted_domain_enable matches 9.. run scoreboard players set rng corrupted_domain_enable 1

# for testing the rng will always be 1
#scoreboard players set rng corrupted_domain_enable 1
# ok thank you testing command. but you have outlived your usefulness

execute as @e[tag=eye_of_pain] at @s if score eye_of_pain_choices corrupted_domain_enable matches 60 run tp @s ~ ~0.2 ~
#=================================================================================
# begin the eye of pain dialogue
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 run title @p[team=corrupted] title {"text":" ","color":"dark_purple","bold":true}


execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 1 run title @p[team=corrupted] subtitle {"text":"BRING TERROR","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 2 run title @p[team=corrupted] subtitle {"text":"BEHOLD THE EYE OF PAIN","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 3 run title @p[team=corrupted] subtitle {"text":"I SENCE YOUR PRESENCE","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 4 run title @p[team=corrupted] subtitle {"text":"TAKE YOUR WISH","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 5 run title @p[team=corrupted] subtitle {"text":"TIME TO CHOOSE","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 6 run title @p[team=corrupted] subtitle {"text":"IT IS YOU WHO AWAKENS ME","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 7 run title @p[team=corrupted] subtitle {"text":"WHO DARES TO AWAKEN ME","color":"dark_purple","bold":true}
execute if score eye_of_pain_choices corrupted_domain_enable matches 20 if score rng corrupted_domain_enable matches 8 run title @p[team=corrupted] subtitle {"text":"I have many choices for you","color":"dark_purple","bold":true}
#=================================================================================
# summon the 4 choices to be given to the corrupted player


# these are the things in the spawning pool that the eye of pain can give

#1. summon reddit hive mind (a large idol that constantly summons zombies. it can be killed by runners)
#2. summon "the maker" (a cameo to me, the dev... most op one yet)
#3. summon "corrupt armageddion" (an evil cloud that will make it rain tridents and lightning)
#4. summon corruption blocker blob (a blob that surrounds the corrupted and prevents his corruption percentage from increasing)
#5. summon "rain of spiders" (it rains spiders)
#6. summon "the souls of the damed" (a large idol that constantly summons very large vexes)
#7. summon "the orbital strike" (a random runner is selected to be struck from the sky)
#8. summon "the bringer of the dimentional merge" (teleports everyone to a different map)


# now the issue is that i have 8 choices and 4 slots to put them in. and all i have is an rng value
# what i am about to to has not been aprroved by the vadican.
# each rng value will determine what 4 abilitys get chosen
# the reasion i am doing it this way is becuase its less predictable for whoever finds this secret feature
# +++++++++++++++++++story time+++++++++++++++++++++++++++++++++=
# origionally there would be 8 sets for the eye of pain to choose from. however, this previous method SUCKS ASS,
# there is too much crap going on and nothing makes sence. there were a TON of duplicates entrys that would overlap. and i DO NOT want do debug that shit
#so i cut it out, instead i will make the eye of pain flip a coin
execute if score rng corrupted_domain_enable matches 5.. run scoreboard players set rng corrupted_domain_enable 8
execute if score rng corrupted_domain_enable matches ..4 run scoreboard players set rng corrupted_domain_enable 1

#------------------------------------------------------------------------------
# set 1

# reddit hive mind
execute at @p[team=corrupted] if score eye_of_pain_choices corrupted_domain_enable matches 40 if score rng corrupted_domain_enable matches 1 run summon minecraft:block_display ~ ~2.4 ~1.2 {Tags:["eye_of_pain","option_1"],Passengers: [{id: "minecraft:item_display", item: {components: {"minecraft:profile": {id: [I; 1901931646, -870237222, -1380806879, 604817291], properties: [{name: "textures", value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjdjNDRkYTQxM2U5ZTg1ZDExOWY3ODg1MjlhMjQ5Njk4MjdmMTJjODQ0OTkyNWFiMTViYzVhY2IwZDJhZGQ2ZCJ9fX0="}]}}, count: 1, id: "minecraft:player_head"}, transformation: {left_rotation: [-0.70710677f, 0.0f, 0.0f, 0.70710677f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 0.99999994f, 0.99999994f], translation: [0.0f, 0.25f, -0.25f]}}], block_state: {Name: "minecraft:air"}}


# the maker
execute at @p[team=corrupted] if score eye_of_pain_choices corrupted_domain_enable matches 45 if score rng corrupted_domain_enable matches 1 run summon minecraft:block_display ~ ~2.4 ~-1.2 {Tags:["eye_of_pain","option_2"],Passengers: [{id: "minecraft:item_display", item: {components: {"minecraft:profile": {id: [I;1468264963,-1398231663,238511338,782481432], properties: [{name: "textures", value: "ewogICJ0aW1lc3RhbXAiIDogMTc1ODI0NTQzNzAwNywKICAicHJvZmlsZUlkIiA6ICI5NzYzNDQwYWMzOGY0N2YyOGQ1OTE5NmJjZDgwNjg5ZSIsCiAgInByb2ZpbGVOYW1lIiA6ICJkZWdlYnMiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYmRmMTg4MTU4MGM2NzY2YzhjYzk3NmY5MTRiOTA1Njc3Y2MwMGUxMWQ1MmM4NWE2NDBmYzg3YzAxMWNjMDE2MyIKICAgIH0KICB9Cn0="}]}}, count: 1, id: "minecraft:player_head"}, transformation: {left_rotation: [-0.70710677f, 0.0f, 0.0f, 0.70710677f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 0.99999994f, 0.99999994f], translation: [0.0f, 0.25f, -0.25f]}}], block_state: {Name: "minecraft:air"}}

# corrupt armageddion
execute at @p[team=corrupted] if score eye_of_pain_choices corrupted_domain_enable matches 50 if score rng corrupted_domain_enable matches 1 run summon minecraft:block_display ~1.2 ~2.4 ~ {Tags:["eye_of_pain","option_3"],Passengers: [{id: "minecraft:item_display", item: {components: {"minecraft:profile": {id: [I;-1669287782,-1438403061,1857090480,1792851548], properties: [{name: "textures", value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODA4ZWIyOGE2Y2Y4ZGMyMDgyMTliNmY1MTY5MzEzMzRhNjg3ZWNhNWI5MzU0MTNjZmI1NTEyN2JlNGY4OWZiMyJ9fX0="}]}}, count: 1, id: "minecraft:player_head"}, transformation: {left_rotation: [-0.70710677f, 0.0f, 0.0f, 0.70710677f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 0.99999994f, 0.99999994f], translation: [0.0f, 0.25f, -0.25f]}}], block_state: {Name: "minecraft:air"}}

# corruption blocker blob
execute at @p[team=corrupted] if score eye_of_pain_choices corrupted_domain_enable matches 55 if score rng corrupted_domain_enable matches 1 run summon minecraft:block_display ~-1.2 ~2.4 ~ {Tags:["eye_of_pain","option_4"],Passengers: [{id: "minecraft:item_display", item: {components: {"minecraft:profile": {id: [I;-1300145505,-1217627080,-1325821334,2098759669], properties: [{name: "textures", value: "eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDkzMzlkZmNlYWE1ZDk5YTU1NzFlYzQ3NDNiMDA0ZDgyN2IyMjllYWYwMGViNzAzY2VkMDNhODYwMjlmM2FkIn19fQ=="}]}}, count: 1, id: "minecraft:player_head"},transformation: {left_rotation: [-0.70710677f, 0.0f, 0.0f, 0.70710677f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.0f, 0.99999994f, 0.99999994f], translation: [0.0f, 0.25f, -0.25f]}}], block_state: {Name: "minecraft:air"}}

#++++++++++++++++++++=
#list in chat
execute if score eye_of_pain_choices corrupted_domain_enable matches 60 if score rng corrupted_domain_enable matches 1 run tellraw @p[team=corrupted] [{"text":"=====deititys available=====","color":"red","bold":true},{"text":"\n1. reddit hive mind\n2. the maker\n3. corrupt armageddon\n4. corruption blocker blob","color":"dark_purple","bold":false}]
# easyer to pick out what you want

# actually sececting the ability by walking directly under it

#option 1
execute as @e[tag=option_1] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set deitity_id corrupted_supercharge 1
execute as @e[tag=option_1] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set the_eye_of_pain corrupted_domain_enable 0
 #option2
 execute as @e[tag=option_2] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set deitity_id corrupted_supercharge 2


 execute as @e[tag=option_2] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set the_eye_of_pain corrupted_domain_enable 0
#option 3
execute as @e[tag=option_3] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set deitity_id corrupted_supercharge 3

execute as @e[tag=option_3] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set the_eye_of_pain corrupted_domain_enable 0
#option 4
execute as @e[tag=option_4] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set deitity_id corrupted_supercharge 4

execute as @e[tag=option_4] at @s if entity @p[team=corrupted,distance=..2.2] if score rng corrupted_domain_enable matches 1 if score eye_of_pain_choices corrupted_domain_enable matches 60.. run scoreboard players set the_eye_of_pain corrupted_domain_enable 0

#------------------------------------------------------------------------------
# set 2

#rain of spiders
#the souls of the damed
#the orbital strike
#the bringer of the dimentional merge
