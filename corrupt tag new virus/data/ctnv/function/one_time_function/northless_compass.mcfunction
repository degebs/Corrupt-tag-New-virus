
#=================================================================================================================
# make sure it cannot be moved
execute unless entity @s[nbt={Inventory:[{id:"minecraft:compass",Slot:3b}]}] run clear @s compass

execute unless entity @s[nbt={Inventory:[{id:"minecraft:compass",Slot:3b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:compass"}}]

execute unless entity @s[nbt={Inventory:[{id:"minecraft:compass",Slot:3b}]}] run item replace entity @s hotbar.3 with compass[minecraft:custom_data={tracker:1b},item_name="Northless Compass"]

#=================================================================================================================
# here the compass will point twards the corrupted player. 
#execute as @a[tag=corrupted,limit=1] at @s run setworldspawn ~ ~ ~
# does not work

# highlight with particles
# if the runner is holding the compass, reveal the corrupted with particles
execute as @s[nbt={SelectedItem:{id:"minecraft:compass"}}] at @p[team=corrupted] run particle dust{color:[0.78,0.0,1.0],scale:2} ~ ~ ~ 0 25 0 0.1 200 force @a[team=runners,scores={class=12}]


execute as @s[nbt={SelectedItem:{id:"minecraft:compass"}}] at @s run effect give @p[team=corrupted,distance=..10] glowing 1 0 true