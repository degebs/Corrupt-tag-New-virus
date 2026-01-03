# the first thing we do is check what deity the corrupted player selected

# these are the things in the spawning pool that the eye of pain can give

#1. summon reddit hive mind (a large idol that constantly summons zombies. it can be killed by runners)
#2. summon "the maker" (a cameo to me, the dev... most op one yet)
#3. summon "corrupt armageddion" (an evil cloud that will make it rain tridents and lightning)
#4. summon corruption blocker blob (a blob that surrounds the corrupted and prevents his corruption percentage from increasing)
#5. summon "rain of spiders" (it rains spiders)
#6. summon "the souls of the damned" (a large idol that constantly summons very large vexes)
#7. summon "the orbital strike" (a random runner is selected to be struck from the sky)
#8. summon "the bringer of the dimentional merge" (teleports everyone to a different map)


# STEP 1. summon the dietity
execute if score deitity_id corrupted_supercharge matches 1 run say 1
execute if score deitity_id corrupted_supercharge matches 1 run scoreboard players set hive_mind corrupted_supercharge 1

execute if score deitity_id corrupted_supercharge matches 2 run say 2
execute if score deitity_id corrupted_supercharge matches 2 run scoreboard players set the_maker corrupted_supercharge 1


execute if score deitity_id corrupted_supercharge matches 3 run say 3
execute if score deitity_id corrupted_supercharge matches 3 run scoreboard players set armageddion corrupted_supercharge 1


execute if score deitity_id corrupted_supercharge matches 4 run say 4
execute if score deitity_id corrupted_supercharge matches 4 run scoreboard players set blocker_blob corrupted_supercharge 1


execute if score deitity_id corrupted_supercharge matches 5 run say 5
execute if score deitity_id corrupted_supercharge matches 5 run scoreboard players set rain_of_spiders corrupted_supercharge 1


execute if score deitity_id corrupted_supercharge matches 6 run say 6
execute if score deitity_id corrupted_supercharge matches 6 run scoreboard players set souls_of_the_damned corrupted_supercharge 1


execute if score deitity_id corrupted_supercharge matches 7 run say 7
execute if score deitity_id corrupted_supercharge matches 7 run scoreboard players set orbital_strike corrupted_supercharge 1


execute if score deitity_id corrupted_supercharge matches 8 run say 8
execute if score deitity_id corrupted_supercharge matches 8 run scoreboard players set dimentional_merge corrupted_supercharge 1


# SETP 2. set the "dietity" variable to 0
scoreboard players set deitity_id corrupted_supercharge 0
# i forgot how to spell deity. oh well. they dont got spellcheck on the ide

# STEP 3. shuffle rng
scoreboard players add rng corrupted_domain_enable 4
execute if score rng corrupted_domain_enable matches 9.. run scoreboard players set rng corrupted_domain_enable 1

# STEP 4. update the ammount of dieties out there
scoreboard players add number_of_deititys corrupted_supercharge 1
# STEP 5. turn off the eye of pain
scoreboard players set the_eye_of_pain corrupted_domain_enable 0

# each deitity will add its own score to the scoreboard so that when it comes time to run the logic for the deitys we can only run the logic of the ones that were summoned

# the "deitity id" is used to determine witch one to summon. very usefull when needing to choose