# when the party leader drops the selection arrows it will select its appropiate map
execute if entity @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] as @e[team=party_lead] run trigger map_selection add -1
execute if entity @e[type=item,nbt={Item:{id:"minecraft:spectral_arrow"}}] as @e[team=party_lead] run trigger map_selection add 1



# does a bunch of very importnat boilerplate quality of life stuff to the items to make sure that the items functions as ui emements
kill @e[type=item,nbt={Item:{id:"minecraft:arrow"}}] 
kill @e[type=item,nbt={Item:{id:"minecraft:spectral_arrow"}}]

clear @a[team=party_lead] arrow
clear @a[team=party_lead] spectral_arrow

scoreboard players set delay map_selection 5

give @a[team=party_lead] arrow[custom_name=[{"text":"down","italic":false,"color":"dark_red"}],rarity=uncommon,enchantment_glint_override=true]
give @a[team=party_lead] spectral_arrow[custom_name=[{"text":"up","italic":false,"color":"dark_green"}],rarity=uncommon,enchantment_glint_override=true]

# detect if the selector overflows or underflows.
execute if score @a[team=party_lead,limit=1] map_selection > map_beacon_count debug run scoreboard players set @a[team=party_lead] map_selection 1
execute if score @a[team=party_lead,limit=1] map_selection matches ..0 run scoreboard players operation @a[team=party_lead] map_selection = map_beacon_count debug


# actually select the map
execute as @e[type=turtle] if score @s map_list = @a[team= party_lead,limit=1] map_selection run scoreboard players set @s map_selection 1
execute as @e[type=turtle] if score @s map_list = @a[team= party_lead,limit=1] map_selection run title @a[team=party_lead] title [" "]
execute as @e[type=turtle] if score @s map_list = @a[team= party_lead,limit=1] map_selection run title @a[team=party_lead] subtitle ["-> ",{"color":"gold","selector":"@s"}]
execute as @e[type=turtle] unless score @s map_list = @a[team= party_lead,limit=1] map_selection run scoreboard players reset @s map_selection

# if the map beacons map id as defined in map_list maches whatever the players score is here it shall be selected. if not
# then it will deselcect itself