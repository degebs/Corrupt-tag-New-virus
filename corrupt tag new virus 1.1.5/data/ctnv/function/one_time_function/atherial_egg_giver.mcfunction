# here we give the atherial corrupted the spawn eggs to spawn extra waves

# here are all the spawn eggs in question and there associated spawn eggs

# WAVE_rat = silverfish_spawn_egg
# WAVE_zombie = zombie_spawn_egg
# WAVE_skeleton = skeleton_spawn_egg
# WAVE_zombie_elite = husk_spawn_egg
# WAVE_skeleton_elite = wither_skeleton_spawn_egg
# WAVE_phantom = phantom_spawn_egg
# WAVE_phantom_elite = allay_spawn_egg
# WAVE_phantom_laser = guardian_spawn_egg
# WAVE_stray = stray_spawn_egg
# WAVE_stray_elite = ghast_spawn_egg
# WAVE_creeper = creeper_spawn_egg
# WAVE_mini_creeper = bogged_spawn_egg
# WAVE_pillager = pillager_spawn_egg
# WAVE_vindicator = vindicator_spawn_egg
# WAVE_pilager_raid = ravager_spawn_egg
# WAVE_imidiate_manefestation = warden_spawn_egg

# there are 16

# common
# the ones are common
# zombie and crap
execute if score rng spawn matches 0..10 run give @a[team=corrupted] zombie_spawn_egg[custom_name=[{"text":"Zombie Horde","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a horde of zombies.","italic":false}]]]
execute if score rng spawn matches 10..20 run give @a[team=corrupted] skeleton_spawn_egg[custom_name=[{"text":"Skeleton Horde","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a horde of skeletons.","italic":false}]]]
execute if score rng spawn matches 20..30 run give @a[team=corrupted] stray_spawn_egg[custom_name=[{"text":"Stray Horde","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a horde of strays.","italic":false}]]]
execute if score rng spawn matches 30..40 run give @a[team=corrupted] silverfish_spawn_egg[custom_name=[{"text":"Rat Plague","italic":false,"color":"red"}],lore=[[{"text":"Drop to summon a rat plague.","italic":false}]]]
execute if score rng spawn matches 40..50 run give @a[team=corrupted] creeper_spawn_egg[custom_name=[{"text":"Creeper Horde","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a bunch of creepers.","italic":false}]]]

# more uncommon ones
execute if score rng spawn matches 50..53 run give @a[team=corrupted] bogged_spawn_egg[custom_name=[{"text":"Mini Creepers","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a bunch of mini creepers.","italic":false}]]]
execute if score rng spawn matches 53..56 run give @a[team=corrupted] husk_spawn_egg[custom_name=[{"text":"Zombie Elites","italic":false,"color":"dark_green"}],lore=[[{"text":"Drop to summon a bunch of powerful zombies.","italic":false}]]]
execute if score rng spawn matches 60..64 run give @a[team=corrupted] wither_skeleton_spawn_egg[custom_name=[{"text":"Skeleton Elites","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of powerful skeletons.","italic":false}]]]
execute if score rng spawn matches 64..68 run give @a[team=corrupted] ghast_spawn_egg[custom_name=[{"text":"Stray Elites","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of powerful strays.","italic":false}]]]
execute if score rng spawn matches 68..70 run give @a[team=corrupted] phantom_spawn_egg[custom_name=[{"text":"Phantom Menace","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a phantom.","italic":false}]]]

# rare ones
execute if score rng spawn matches 70..72 run give @a[team=corrupted] allay_spawn_egg[custom_name=[{"text":"Phantom Elite","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a phantom elite.","italic":false}]]]
execute if score rng spawn matches 72..74 run give @a[team=corrupted] guardian_spawn_egg[custom_name=[{"text":"Phantom Laser","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a phantom laser.","italic":false}]]]
execute if score rng spawn matches 74..76 run give @a[team=corrupted] pillager_spawn_egg[custom_name=[{"text":"Pillager Wave","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of pillagers.","italic":false}]]]
execute if score rng spawn matches 76..78 run give @a[team=corrupted] vindicator_spawn_egg[custom_name=[{"text":"Vindicator Wave","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a bunch of vindicators.","italic":false}]]]
execute if score rng spawn matches 78..80 run give @a[team=corrupted] ravager_spawn_egg[custom_name=[{"text":"Pillager Raid","italic":false,"color":"white"}],lore=[[{"text":"Drop to summon a full pillager raid.","italic":false}]]]
# immediate manifestation
execute if score rng spawn matches 88..90 run give @a[team=corrupted] warden_spawn_egg[custom_name=[{"text":"Immediately Manifest","italic":false,"color":"white"}],lore=[[{"text":"Drop to immediately physically manifest.","italic":false}]]]
# wall
execute if score rng spawn matches 91..100 run give @a[team=corrupted] wandering_trader_spawn_egg[custom_name=[{"text":"Summon Wall","italic":false,"color":"gold"}],lore=[[{"text":"Drop to summon a mysterious wall.","italic":false}]]]


# there is a 18% chanse of nothing happening
# alter the rng value to make it more unpredictable
scoreboard players add rng spawn 7
# these eggs need proper names