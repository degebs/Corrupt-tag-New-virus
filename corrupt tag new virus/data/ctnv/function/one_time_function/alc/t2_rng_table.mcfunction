# particle for giving the alcemist the goods
particle dust{color:[0.38,0.0,0.58],scale:2} ~ ~1.5 ~ 0 0 0 0.8 6
particle flame ~ ~1.5 ~ 0 0 0 0.05 6
playsound entity.cat.death block @a ~ ~ ~ 1 0.2 0.2 
playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1 0.2 

#------------------------------------------------------------------------------
# T2 potion rng table

# 1 to 5 potion of speed
# 6 to 10 potion of jump boost
# 11 to 20 potion of super speed
# 21 to 30 splash potion of poison and slowness and blindness
# 31 to 40 splash potion of bad omen (gives corruption)
# 41 to 50 splash potion of bad omen and slowness (gives corruption)
# 51 to 60 splash potion of instant damage and very long lasting glowing and nausia
# 61 to 70 lingering potion of poison and and glowing bad omen (gives corruption)
# 71 to 80 lingering potion of bad omen and slowness (gives corruption)
# 81 to 99 lingering potion of instant damage and very long lasting glowing and nausia

#1
execute if score rng brewinator_rng matches 1..5 run give @p[team=corrupted] potion[potion_contents={custom_color:255,custom_effects:[{id:speed,duration:300,amplifier:2}]},custom_name=[{"text":"Dark destitute Dimethyl Sulfoxide","italic":false}]]
#2
execute if score rng brewinator_rng matches 6..10 run give @p[team=corrupted] potion[potion_contents={custom_color:16711680,custom_effects:[{id:jump_boost,duration:200,amplifier:2}]},custom_name=[{"text":"Corrupted Cadmium ","italic":false}]]
#3
execute if score rng brewinator_rng matches 11..20 run give @p[team=corrupted] potion[potion_contents={custom_color:16711935,custom_effects:[{id:speed,duration:150,amplifier:3}]},custom_name=[{"text":"Vengeful Vanadium solution ","italic":false}]]
#4
execute if score rng brewinator_rng matches 21..30 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:9306367,custom_effects:[{id:slowness,duration:200,amplifier:5},{id:blindness,duration:150,amplifier:2}]},custom_name=[{"text":"Liquid Fear","italic":false}]]
#5
execute if score rng brewinator_rng matches 31..40 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:16711815,custom_effects:[{id:bad_omen,duration:400}]},custom_name=[{"text":"Distilled Corruption","italic":false}],lore=[[{"text":"WILL INCREASE CORRUPTION","italic":false}]],rarity=uncommon]
#6
execute if score rng brewinator_rng matches 41..50 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:4522119,custom_effects:[{id:bad_omen,duration:300,amplifier:1},{id:poison,duration:30,amplifier:1}]},custom_name=[{"text":"Acidic Corruption Solution","italic":false}],lore=[[{"text":"WILL INCREASE CORRUPTION","italic":false}]],rarity=uncommon]
#7
execute if score rng brewinator_rng matches 51..60 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:16351261,custom_effects:[{id:nausea,duration:400,amplifier:1},{id:glowing,duration:1500,amplifier:1},{id:instant_damage,duration:1,amplifier:0}]},custom_name=[{"text":"Emancipation Proclamation ","italic":false}],rarity=uncommon]
#8
execute if score rng brewinator_rng matches 61..70 run give @p[team=corrupted] lingering_potion[potion_contents={custom_color:8355971,custom_effects:[{id:bad_omen,duration:100,amplifier:1},{id:glowing,duration:500,amplifier:1},{id:poison,duration:30,amplifier:1}]},custom_name=[{"text":"Malicious mercury ","italic":false}],lore=[[{"text":"WILL INCREASE CORRUPTION","italic":false}]],rarity=uncommon]
#9
execute if score rng brewinator_rng matches 71..80 run give @p[team=corrupted] lingering_potion[potion_contents={custom_color:16711502,custom_effects:[{id:bad_omen,duration:200,amplifier:1},{id:slowness,duration:100,amplifier:3}]},custom_name=[{"text":"Moscovium Muscle malformer ","italic":false}],lore=[[{"text":"WILL INCREASE CORRUPTION","italic":false}]],rarity=uncommon]
#10
execute if score rng brewinator_rng matches 81..99 run give @p[team=corrupted] lingering_potion[potion_contents={custom_color:3949738,custom_effects:[{id:glowing,duration:1500,amplifier:1},{id:nausea,duration:500},{id:instant_damage,duration:1,amplifier:0}]},custom_name=[{"text":"Lithium lime extract","italic":false}],rarity=uncommon]