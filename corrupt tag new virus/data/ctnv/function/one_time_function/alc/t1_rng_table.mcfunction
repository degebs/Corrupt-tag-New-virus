#------------------------------------------------------------------------------
# T1 potion rng table

# 1 to 20 = splash potion of harming
# 21 to 25 = splash potion slowness
# 26 to 35 = splash potion of poison
# 36 to 40 = splash potion of poison better
# 41 to 50 = lingering potion of slowness
# 51 to 60 = lingering potion of slowness and poison
# 61 to 81 = splash potion of glowing and blindness
# 82 to 90 = splash potion of blindnes and harming
# 91 to 100 = lingering potion of blindnes and poison and glowing

# particle for giving the alcemist the goods
particle dust{color:[0.38,0.0,0.58],scale:2} ~ ~1.5 ~ 0 0 0 0.8 6
particle enchant ~ ~1.5 ~ 0 0 0 0.8 6
playsound block.redstone_torch.burnout block @a ~ ~ ~ 1 1 0.2 
playsound block.brewing_stand.brew block @a ~ ~ ~ 1 1 0.2 


#------------------------------------------------------------------------------
# 1 (instant damage – unchanged)
execute if score rng brewinator_rng matches 1..20 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:11534455,custom_effects:[{id:instant_damage,duration:1,amplifier:0}]},custom_name=[{"text":"Anguish extract","italic":false}]]

# 2 (slowness – unchanged)
execute if score rng brewinator_rng matches 21..25 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:2428030,custom_effects:[{id:slowness,duration:100,amplifier:2}]},custom_name=[{"text":"Shin and Calf crystallizer","italic":false}]]

# 3 (poison reduced to 50 ticks for 2 hits)
execute if score rng brewinator_rng matches 26..35 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:0,custom_effects:[{id:poison,duration:30,amplifier:1}]},custom_name=[{"text":"Silicon Powder","italic":false}]]

# 4 (poison reduced to 50 ticks)
execute if score rng brewinator_rng matches 36..40 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:9408406,custom_effects:[{id:poison,duration:30,amplifier:1}]},custom_name=[{"text":"Asbestos silicon Powder","italic":false}]]

# 5 (slowness – unchanged)
execute if score rng brewinator_rng matches 41..50 run give @p[team=corrupted] lingering_potion[potion_contents={custom_color:34048,custom_effects:[{id:slowness,duration:600,amplifier:2}]},custom_name=[{"text":"dehydration concentration","italic":false}]]

# 6 (poison reduced to 50 ticks, slowness unchanged)
execute if score rng brewinator_rng matches 51..60 run give @p[team=corrupted] lingering_potion[potion_contents={custom_color:16743423,custom_effects:[{id:slowness,duration:100,amplifier:2},{id:poison,duration:30,amplifier:1}]},custom_name=[{"text":"disintegration concentration","italic":false}]]

# 7 (glowing 500→1200, blindness 60→1200)
execute if score rng brewinator_rng matches 61..81 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:16747463,custom_effects:[{id:glowing,duration:1200,amplifier:1},{id:blindness,duration:200,amplifier:1}]},custom_name=[{"text":"Antimony mixed with Agony ","italic":false}]]

# 8 (blindness 600→1200)
execute if score rng brewinator_rng matches 82..90 run give @p[team=corrupted] splash_potion[potion_contents={custom_color:65535,custom_effects:[{id:blindness,duration:1200,amplifier:1},{id:instant_damage,duration:1,amplifier:0}]},custom_name=[{"text":"Arsenic Mercury mix ","italic":false}]]

# 9 (blindness 600→1200, glowing 200→1200, poison reduced to 50 ticks)
execute if score rng brewinator_rng matches 91..100 run give @p[team=corrupted] lingering_potion[potion_contents={custom_color:14548951,custom_effects:[{id:blindness,duration:250,amplifier:1},{id:poison,duration:30,amplifier:2},{id:glowing,duration:1200,amplifier:1}]},custom_name=[{"text":"Ketchup and Mustard gas","italic":false}]]