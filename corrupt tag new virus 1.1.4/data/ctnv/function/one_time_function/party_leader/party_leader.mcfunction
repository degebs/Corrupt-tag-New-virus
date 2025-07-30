
#██████╗  █████╗ ██████╗ ████████╗██╗   ██╗    ██╗     ███████╗ █████╗ ██████╗ ███████╗██████╗ 
#██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝╚██╗ ██╔╝    ██║     ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
#██████╔╝███████║██████╔╝   ██║    ╚████╔╝     ██║     █████╗  ███████║██║  ██║█████╗  ██████╔╝
#██╔═══╝ ██╔══██║██╔══██╗   ██║     ╚██╔╝      ██║     ██╔══╝  ██╔══██║██║  ██║██╔══╝  ██╔══██╗
#██║     ██║  ██║██║  ██║   ██║      ██║       ███████╗███████╗██║  ██║██████╔╝███████╗██║  ██║
#╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝      ╚═╝       ╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
                                                                                              



# here a random player is given all the power of the party leader
scoreboard players set drop_detect_function_Delay time 5

execute if score overide_party_leader state matches 0 run team join party_lead @r
# i am tired of constalty refreshing the datapack to become the party leader. so i created a new function that overides the party leader selection

# clear there inventory before they get the dye
clear @a[team=party_lead]
scoreboard players reset @a map_selection

give @a[team=party_lead] lime_dye[custom_name=[{"text":"drop to start game","italic":false}],enchantment_glint_override=true,rarity=epic]
title @a[team=party_lead] title ["",{"text":"party leader","color":"dark_aqua"}]
title @a[team=party_lead] subtitle ["",{"text":"you are the party leader","color":"dark_aqua"}]
tellraw @a ["",{"selector":"@a[team=party_lead]"}," is now the party leader"]

#------------------------------------------------------
#------------------------------------------------------
#give everyone (including party leader the tool needed to pick class and corrupted class
give @a[team=party_lead] end_crystal[custom_name=[{"text":"drop to choose map","italic":false}],rarity=epic,enchantment_glint_override=true]
execute at @a run playsound block.note_block.bell player @a ~ ~ ~ 1
scoreboard players enable @a[team=party_lead] map_selection

#------------------------------------------------------
# give the party leader the settings book
#give @a[team=party_lead] written_book[written_book_content={pages:[[[{"text":"Time of day","color":"gold"},"\n",{"text":"Day","color":"aqua","click_event":{"action":"run_command","command":"/trigger ST____time_of_day set 0"},"hover_event":{"action":"show_text","value":"set the time do day"}}," ",{"text":"Night","color":"gray","click_event":{"action":"run_command","command":"/trigger ST____time_of_day set 1"},"hover_event":{"action":"show_text","value":"set the time to night"}},"\n\n",{"text":"Corruption rate","color":"dark_purple","hover_event":{"action":"show_text","value":"how fast does the corruption accumulate "}},"\n",{"text":"1","color":"dark_purple","click_event":{"action":"run_command","command":"/trigger ST____corruption_rate set 1"},"hover_event":{"action":"show_text","value":"1 corruption % per 1 second"}},{"text":" ","color":"gray","click_event":{"action":"run_command","command":"/trigger ST____corruption_rate set 1"},"hover_event":{"action":"show_text","value":"1 corruption % per 1 second"}},{"text":"2 3 4 5 6 7 8","color":"dark_purple","click_event":{"action":"run_command","command":"/trigger ST____corruption_rate set 1"},"hover_event":{"action":"show_text","value":"1 corruption % per 1 second"}},"\n\n",{"text":"Corruption stun","color":"light_purple","hover_event":{"action":"show_text","value":"a player who gets corrupted starts in a stunned state. how long is it?"}},"\n",{"text":"1 2 3 4 5","color":"dark_purple","click_event":{"action":"run_command","command":"/trigger ST____initial_corruption_stun set 1"},"hover_event":{"action":"show_text","value":"1 second stun"}},"\n\n",{"text":"Max health","color":"red","hover_event":{"action":"show_text","value":"how many hearts do the runners get?"}},"\n",{"text":"1","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 1"},"hover_event":{"action":"show_text","value":"one"}},{"text":" ","color":"dark_red"},{"text":"2","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 2"},"hover_event":{"action":"show_text","value":"two"}},{"text":" ","color":"dark_red"},{"text":"3","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 3"},"hover_event":{"action":"show_text","value":"three"}},{"text":" ","color":"dark_red"},{"text":"4","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 4"},"hover_event":{"action":"show_text","value":"four"}},{"text":" ","color":"dark_red"},{"text":"5","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 5"},"hover_event":{"action":"show_text","value":"five"}},{"text":" ","color":"dark_red"},{"text":"6","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 6"},"hover_event":{"action":"show_text","value":"six"}},{"text":" ","color":"dark_red"},{"text":"7","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 7"},"hover_event":{"action":"show_text","value":"seven"}},{"text":" ","color":"dark_red"},{"text":"8","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 8"},"hover_event":{"action":"show_text","value":"eight"}},{"text":" ","color":"dark_red"},{"text":"9","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 9"},"hover_event":{"action":"show_text","value":"nine"}},{"text":" ","color":"dark_red"},{"text":"10","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____max_health set 10"},"hover_event":{"action":"show_text","value":"ten"}},"\n\n",{"text":"Regeneration","color":"dark_aqua","hover_event":{"action":"show_text","value":"do hearts slowly regenerate over time?"}},"\n",{"text":"on","color":"dark_green","click_event":{"action":"run_command","command":"/trigger ST____nautral_regen set 0"},"hover_event":{"action":"show_text","value":"on"}},{"text":" off","color":"dark_red","click_event":{"action":"run_command","command":"/trigger ST____nautral_regen set 0"},"hover_event":{"action":"show_text","value":"on"}}]],[[{"text":"max traps","color":"red","hover_event":{"action":"show_text","value":"the maximum amount of traps you can place"}},"\n",{"text":"0","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 0"},"hover_event":{"action":"show_text","value":"no traps"}},{"text":" ","color":"dark_blue"},{"text":"1","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 1"},"hover_event":{"action":"show_text","value":"1 trap"}},{"text":" ","color":"dark_blue"},{"text":"2","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 2"},"hover_event":{"action":"show_text","value":"2 traps"}},{"text":" ","color":"dark_blue"},{"text":"3","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 3"},"hover_event":{"action":"show_text","value":"3 traps"}},{"text":" ","color":"dark_blue"},{"text":"4","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 4"},"hover_event":{"action":"show_text","value":"4 traps"}},{"text":" ","color":"dark_blue"},{"text":"5","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 5"},"hover_event":{"action":"show_text","value":"5 traps"}},{"text":" ","color":"dark_blue"},{"text":"6","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 6"},"hover_event":{"action":"show_text","value":"6 traps"}},{"text":" ","color":"dark_blue"},{"text":"7","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 7"},"hover_event":{"action":"show_text","value":"7 traps"}},{"text":" ","color":"dark_blue"},{"text":"8","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 8"},"hover_event":{"action":"show_text","value":"8 traps"}},{"text":" ","color":"dark_blue"},{"text":"9","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____max_traps 9"},"hover_event":{"action":"show_text","value":"9 traps (why)"}},"\n\n",{"text":"Target tubby detection","color":"dark_red","hover_event":{"action":"show_text","value":"when a corrupted player goes after 1 specific runner over and over again. he is considered a \"target tubby\" this behavior is cringe and should be punished. how harsh are these punishments? "}},"\n",{"text":"off","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____target_tubby_detection 0"},"hover_event":{"action":"show_text","value":"no target tubby detection"}}," ",{"text":"minor","color":"blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____target_tubby_detection 1"},"hover_event":{"action":"show_text","value":"small penalty for targeting"}}," ",{"text":"major","color":"dark_blue","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____target_tubby_detection 2"},"hover_event":{"action":"show_text","value":"significant penalty for targeting"}}," ",{"text":"MAX","color":"red","click_event":{"action":"run_command","command":"/scoreboard players set @s ST____target_tubby_detection 3"},"hover_event":{"action":"show_text","value":"genuinely unfair punishment for targeting"}},"\n\n",{"text":"Game mode","color":"aqua"},"\n",{"text":"comming soon","color":"red"}]]],title:Settings,author:"degebs and the giggle touch foundation"}]
# this books is very long, to edit it go to https://www.gamergeeks.net/apps/minecraft/give-command-generator/written-books#s=pMwmzDrf1kxtF9TZ
# apparantly this book is to big to save on the website... oh well

#---------------------clear the settings /trigger scoreboard-------------------------
#chanses are that if this function is called then the game is being reset, or a new party leader is being selected
# and due to the way that the /trigger command works, multiple plater names can be in the scoreboard. this is bad
# so we need to clear the scoreboard of all players



# there is a nasty glitch where multiple playernames could be inside the scoreboards for the settings.  the only way to fix this is to purge them then re add them
scoreboard objectives remove ST____time_of_day 
scoreboard objectives remove ST____nautral_regen 
scoreboard objectives remove ST____corruption_rate 
scoreboard objectives remove ST____max_health 
scoreboard objectives remove ST____game_mode 
scoreboard objectives remove ST____initial_corruption_stun 
scoreboard objectives remove ST____max_traps
scoreboard objectives remove ST____target_tubby_detection
scoreboard objectives remove ST____super_speed
scoreboard objectives remove ST____COC_difuculty
scoreboard objectives remove ST____enable_runner_classes
scoreboard objectives remove ST____locator_bar

scoreboard objectives add ST____time_of_day trigger
scoreboard objectives add ST____nautral_regen trigger
scoreboard objectives add ST____corruption_rate trigger
scoreboard objectives add ST____max_health trigger
scoreboard objectives add ST____game_mode trigger
scoreboard objectives add ST____initial_corruption_stun trigger
scoreboard objectives add ST____max_traps trigger
scoreboard objectives add ST____target_tubby_detection trigger
scoreboard objectives add ST____super_speed trigger
scoreboard objectives add ST____COC_difuculty trigger
scoreboard objectives add ST____enable_runner_classes trigger
scoreboard objectives add ST____locator_bar trigger

# this block of code is directly coppied from the load function to fix a glitch, its not the cleanest. but nothing is with this god forsaken programing language
scoreboard players reset @a ST____corruption_rate
scoreboard players reset @a ST____game_mode
scoreboard players reset @a ST____initial_corruption_stun
scoreboard players reset @a ST____max_health
scoreboard players reset @a ST____nautral_regen
scoreboard players reset @a ST____time_of_day
scoreboard players reset @a ST____max_traps
scoreboard players reset @a ST____target_tubby_detection
scoreboard players reset @a ST____super_speed
scoreboard players reset @a ST____COC_difuculty
scoreboard players reset @a ST____enable_runner_classes
scoreboard players reset @a ST____locator_bar

# this is done to keep the scoreboard clean and tidy.

# set the default values for the settings, having all the vales set to 0 would not be a great default value
scoreboard players set @a[team=party_lead] ST____corruption_rate 3
scoreboard players set @a[team=party_lead] ST____max_health 3
scoreboard players set @a[team=party_lead] ST____initial_corruption_stun 3
scoreboard players set @a[team=party_lead] ST____max_traps 2
scoreboard players set @a[team=party_lead] ST____super_speed 1
scoreboard players set @a[team=party_lead] ST____enable_runner_classes 1


