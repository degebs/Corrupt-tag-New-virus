# here we update the gamemode display scoreboard objective with the current settings for the normal gamemode. 

# 1. aquire all the relevant settings and put them into the gamemode display objective

# these are the ones where we can just have numbers that represent the settings
scoreboard players operation corruption_rate unified_tag_settings = setting ST____corruption_rate
scoreboard players operation corruption_stun unified_tag_settings = setting ST____initial_corruption_stun
scoreboard players operation max_health unified_tag_settings = setting ST____max_health
scoreboard players operation max_traps unified_tag_settings = setting ST____max_traps
scoreboard players display name corruption_rate unified_tag_settings {"text":"Corruption Rate","color":"dark_purple","bold":true}
scoreboard players display name corruption_stun unified_tag_settings {"text":"Corruption stun","color":"light_purple","bold":true}
scoreboard players display name max_health unified_tag_settings {"text":"Max Health","color":"red","bold":true}
scoreboard players display name max_traps unified_tag_settings {"text":"Max Traps","color":"blue","bold":true}
scoreboard players display numberformat corruption_rate unified_tag_settings styled {"color":"dark_purple","bold":true}
scoreboard players display numberformat corruption_stun unified_tag_settings styled {"color":"light_purple","bold":true}
scoreboard players display numberformat max_health unified_tag_settings styled {"color":"red","bold":true}
scoreboard players display numberformat max_traps unified_tag_settings styled {"color":"blue","bold":true}


# these are boolians so we have to do a little bit of extra work to make them display nicely on the sidebar

# natural regen
execute if score setting ST____nautral_regen matches 0 run scoreboard players set nautral_regen_ON unified_tag_settings 1
execute if score setting ST____nautral_regen matches 0 run scoreboard players reset nautral_regen_OFF unified_tag_settings 
execute if score setting ST____nautral_regen matches 0 run scoreboard players display name nautral_regen_ON unified_tag_settings {"text":"Natural Regen: ","color":"green","bold":true,"extra":[{"text":"[ON]","color":"yellow"}]}
execute if score setting ST____nautral_regen matches 0 run scoreboard players display numberformat nautral_regen_ON unified_tag_settings blank

execute if score setting ST____nautral_regen matches 1 run scoreboard players set nautral_regen_OFF unified_tag_settings 1
execute if score setting ST____nautral_regen matches 1 run scoreboard players reset nautral_regen_ON unified_tag_settings
execute if score setting ST____nautral_regen matches 1 run scoreboard players display name nautral_regen_OFF unified_tag_settings {"text":"Natural Regen: ","color":"green","bold":true,"extra":[{"text":"[OFF]","color":"yellow"}]}
execute if score setting ST____nautral_regen matches 1 run scoreboard players display numberformat nautral_regen_OFF unified_tag_settings blank

# locator bar
execute if score setting ST____locator_bar matches 0 run scoreboard players set locator_bar_OFF unified_tag_settings 1
execute if score setting ST____locator_bar matches 0 run scoreboard players reset locator_bar_ON unified_tag_settings
execute if score setting ST____locator_bar matches 0 run scoreboard players display name locator_bar_OFF unified_tag_settings {"text":"Locator Bar: ","color":"aqua","bold":true,"extra":[{"text":"[OFF]","color":"yellow"}]}
execute if score setting ST____locator_bar matches 0 run scoreboard players display numberformat locator_bar_OFF unified_tag_settings blank

execute if score setting ST____locator_bar matches 1 run scoreboard players set locator_bar_ON unified_tag_settings 1
execute if score setting ST____locator_bar matches 1 run scoreboard players reset locator_bar_OFF unified_tag_settings
execute if score setting ST____locator_bar matches 1 run scoreboard players display name locator_bar_ON unified_tag_settings {"text":"Locator Bar: ","color":"aqua","bold":true,"extra":[{"text":"[ON]","color":"yellow"}]}
execute if score setting ST____locator_bar matches 1 run scoreboard players display numberformat locator_bar_ON unified_tag_settings blank


# time of day
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 0 run scoreboard players set time_of_day_DAY unified_tag_settings 1
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 0 run scoreboard players reset time_of_day_NIGHT unified_tag_settings
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 0 run scoreboard players display name time_of_day_DAY unified_tag_settings {"text":"Time Of Day: ","color":"yellow","bold":true,"extra":[{"text":"[DAY]","color":"yellow"}]}
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 0 run scoreboard players display numberformat time_of_day_DAY unified_tag_settings blank
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 1 run scoreboard players set time_of_day_NIGHT unified_tag_settings 1
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 1 run scoreboard players reset time_of_day_DAY unified_tag_settings
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 1 run scoreboard players display name time_of_day_NIGHT unified_tag_settings {"text":"Time Of Day: ","color":"yellow","bold":true,"extra":[{"text":"[NIGHT]","color":"yellow"}]}
execute if score @a[team=party_lead,limit=1] ST____time_of_day matches 1 run scoreboard players display numberformat time_of_day_NIGHT unified_tag_settings blank
# FOR THIS one there is no "setting" score >:(

# runner name tags
execute if score setting ST____runner_name_tags matches 0 run scoreboard players set runner_name_tags_OFF unified_tag_settings 1
execute if score setting ST____runner_name_tags matches 0 run scoreboard players reset runner_name_tags_ON unified_tag_settings
execute if score setting ST____runner_name_tags matches 0 run scoreboard players display name runner_name_tags_OFF unified_tag_settings {"text":"Runner Name Tags: ","color":"gold","bold":true,"extra":[{"text":"[ON]","color":"yellow"}]}
execute if score setting ST____runner_name_tags matches 0 run scoreboard players display numberformat runner_name_tags_OFF unified_tag_settings blank
execute if score setting ST____runner_name_tags matches 1 run scoreboard players set runner_name_tags_ON unified_tag_settings 1
execute if score setting ST____runner_name_tags matches 1 run scoreboard players reset runner_name_tags_OFF unified_tag_settings
execute if score setting ST____runner_name_tags matches 1 run scoreboard players display name runner_name_tags_ON unified_tag_settings {"text":"Runner Name Tags: ","color":"gold","bold":true,"extra":[{"text":"[OFF]","color":"yellow"}]}
execute if score setting ST____runner_name_tags matches 1 run scoreboard players display numberformat runner_name_tags_ON unified_tag_settings blank

#runner classes
execute if score setting ST____enable_runner_classes matches 0 run scoreboard players set runner_classes_OFF unified_tag_settings 1
execute if score setting ST____enable_runner_classes matches 0 run scoreboard players reset runner_classes_ON unified_tag_settings
execute if score setting ST____enable_runner_classes matches 0 run scoreboard players display name runner_classes_OFF unified_tag_settings {"text":"Runner Classes: ","color":"blue","bold":true,"extra":[{"text":"[OFF]","color":"yellow"}]}
execute if score setting ST____enable_runner_classes matches 0 run scoreboard players display numberformat runner_classes_OFF unified_tag_settings blank
execute if score setting ST____enable_runner_classes matches 1 run scoreboard players set runner_classes_ON unified_tag_settings 1
execute if score setting ST____enable_runner_classes matches 1 run scoreboard players reset runner_classes_OFF unified_tag_settings
execute if score setting ST____enable_runner_classes matches 1 run scoreboard players display name runner_classes_ON unified_tag_settings {"text":"Runner Classes: ","color":"blue","bold":true,"extra":[{"text":"[ON]","color":"yellow"}]}
execute if score setting ST____enable_runner_classes matches 1 run scoreboard players display numberformat runner_classes_ON unified_tag_settings blank