# particle for giving the alcemist the goods
particle dust{color:[0.38,0.0,0.58],scale:2} ~ ~1.5 ~ 0 0 0 0.8 6
particle flame ~ ~1.5 ~ 0 0 0 0.05 6
playsound entity.wither.hurt block @a ~ ~ ~ 1 0.2 0.2 
playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1 0.2 



#------------------------------------------------------------------------------
# T3 potion rng table
#1 to 10 potion of speed and jump boost
#11 to 20 potion of super speed and jump boost
#21 to 30 splash potion of absurdly long darkness and nausea
#31 to 40 splash potion of SUPER slowness and damage
#41 to 59 splash potion of SUPER slowness and poison
#60 to 70 thing that makes you invisable (and takes off the armor) (apparition extract)
#71 to 75 corruption blocker
#86 to 99 potion of night vision and speed

#1
execute if score rng brewinator_rng matches 1..10 run give @p[team=corrupted] potion[potion_contents={custom_color:16777215,custom_effects:[{id:speed,duration:1000,amplifier:2},{id:jump_boost,duration:1000,amplifier:2}]},custom_name=[{"text":"Corruptanyl","italic":false}],rarity=rare]
#2
execute if score rng brewinator_rng matches 11..20 run give @p[team=corrupted] potion[potion_contents={custom_color:13172517,custom_effects:[{id:speed,duration:1000,amplifier:2},{id:jump_boost,duration:1000,amplifier:2}]},custom_name=[{"text":"Purified Corruptanyl","italic":false}],rarity=rare]
#3
execute if score rng brewinator_rng matches 21..30 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:2625574,custom_effects:[{id:darkness,duration:1200,amplifier:1},{id:nausea,duration:1200,amplifier:1}]},custom_name=[{"text":"Spitefull Silver solution ","italic":false}],rarity=rare]
#4
execute if score rng brewinator_rng matches 31..40 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:16711680,custom_effects:[{id:slowness,duration:1200,amplifier:3},{id:instant_damage,duration:1,amplifier:0}]},custom_name=[{"text":"Fear infused Floride","italic":false}],rarity=rare]
#5
execute if score rng brewinator_rng matches 41..59 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:0,custom_effects:[{id:slowness,duration:400,amplifier:3},{id:poison,duration:30,amplifier:1},{id:trial_omen,duration:300,amplifier:1}]},custom_name=[{"text":"CHEMICAL X","italic":false}],rarity=rare]
#6
execute if score rng brewinator_rng matches 60..70 run give @p[team=corrupted] heart_of_the_sea[custom_name=[{"text":"apparition extract","italic":false},],rarity=rare]
#7
execute if score rng brewinator_rng matches 71..75 run give @p[team=corrupted] magma_cream[custom_name=[{"text":"Corruption Brocker","italic":false}],rarity=rare]
#8
execute if score rng brewinator_rng matches 76..85 run give @p[team=corrupted] potion[potion_contents={custom_color:3949738,custom_effects:[{id:night_vision,duration:1200,amplifier:1},{id:speed,duration:1200,amplifier:1}]},custom_name=[{"text":"Tris(pentafluoroethyl)trifluorophosphate","italic":false}],rarity=rare]