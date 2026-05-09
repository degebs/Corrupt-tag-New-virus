title @s actionbar [{"text":"‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡‡","bold":true,"italic":true,"strikethrough":true,"underlined":true,"color":"red","shadow_color":-1173697,"obfuscated":true}]



# chemical X will do lots of terrible things
scoreboard players add @s chem_x_time 1

# achevment
advancement grant @s only ctnv:corrupt_tag/chem_x
execute if score @s chem_x_time matches 650.. run advancement grant @s only ctnv:corrupt_tag/chem_x2


# constantly give blindness and then remove it
execute if score tick time matches 9 run effect give @s blindness 10 1
execute if score tick time matches 19 run effect clear @s blindness

execute if score tick time matches 9 run playsound ambient.cave master @s ~ ~ ~ 1 0.8 1

# loud sounds
execute if score @s chem_x_time matches 10 run playsound entity.ghast.scream master @s ~ ~ ~ 1 0.8 1
execute if score @s chem_x_time matches 20 run playsound entity.wither.spawn master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 30 run playsound entity.generic.explode master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 40 run playsound ambient.cave master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 50 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 60 run playsound entity.ender_dragon.growl master @s ~ ~ ~ 1 0.7 1
execute if score @s chem_x_time matches 70 run playsound entity.wither_skeleton.death master @s ~ ~ ~ 1 1.1 1
execute if score @s chem_x_time matches 80 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 0.1 1
execute if score @s chem_x_time matches 90 run playsound entity.ravager.roar master @s ~ ~ ~ 1 0.85 1
execute if score @s chem_x_time matches 100 run playsound entity.vex.charge master @s ~ ~ ~ 1 1.3 1
execute if score @s chem_x_time matches 110 run playsound entity.warden.roar master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 120 run playsound block.end_portal_frame.fill master @s ~ ~ ~ 2 0.75 1
execute if score @s chem_x_time matches 130 run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 0.2 0.9 1
execute if score @s chem_x_time matches 140 run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 1.4 1
execute if score @s chem_x_time matches 150 run playsound entity.evoker_fangs.attack master @s ~ ~ ~ 1 1.0 1
execute if score @s chem_x_time matches 160 run playsound entity.blaze.hurt master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 170 run playsound entity.warden.sonic_boom master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 180 run playsound entity.ghast.scream master @s ~ ~ ~ 1 2 1
execute if score @s chem_x_time matches 190 run playsound entity.wither.spawn master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 200 run playsound entity.generic.explode master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 210 run playsound ambient.cave master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 220 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 230 run playsound entity.ender_dragon.growl master @s ~ ~ ~ 1 0.7 1
execute if score @s chem_x_time matches 240 run playsound entity.wither_skeleton.death master @s ~ ~ ~ 1 1.1 1
execute if score @s chem_x_time matches 250 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 260 run playsound entity.ravager.roar master @s ~ ~ ~ 1 0.85 1
execute if score @s chem_x_time matches 270 run playsound entity.vex.charge master @s ~ ~ ~ 1 1.3 1
execute if score @s chem_x_time matches 280 run playsound entity.warden.roar master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 290 run playsound block.end_portal_frame.fill master @s ~ ~ ~ 1 0.75 1
execute if score @s chem_x_time matches 300 run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 1 0.9 1
execute if score @s chem_x_time matches 310 run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 1.4 1
execute if score @s chem_x_time matches 320 run playsound entity.evoker_fangs.attack master @s ~ ~ ~ 1 1.0 1
execute if score @s chem_x_time matches 330 run playsound entity.blaze.hurt master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 340 run playsound entity.warden.sonic_boom master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 350 run playsound entity.ghast.scream master @s ~ ~ ~ 1 0.8 1
execute if score @s chem_x_time matches 360 run playsound entity.wither.spawn master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 370 run playsound entity.generic.explode master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 380 run playsound ambient.cave master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 390 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 400 run playsound entity.ender_dragon.growl master @s ~ ~ ~ 1 2 1
execute if score @s chem_x_time matches 410 run playsound entity.wither_skeleton.death master @s ~ ~ ~ 1 1.1 1
execute if score @s chem_x_time matches 420 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 430 run playsound entity.ravager.roar master @s ~ ~ ~ 1 0.85 1
execute if score @s chem_x_time matches 440 run playsound entity.vex.charge master @s ~ ~ ~ 1 1.3 1
execute if score @s chem_x_time matches 450 run playsound entity.warden.roar master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 460 run playsound block.end_portal_frame.fill master @s ~ ~ ~ 1 0.75 1
execute if score @s chem_x_time matches 470 run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 1 0.9 1
execute if score @s chem_x_time matches 480 run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 1.4 1
execute if score @s chem_x_time matches 490 run playsound entity.evoker_fangs.attack master @s ~ ~ ~ 1 1.0 1
execute if score @s chem_x_time matches 500 run playsound entity.blaze.hurt master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 510 run playsound entity.warden.sonic_boom master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 520 run playsound entity.ghast.scream master @s ~ ~ ~ 1 0.1 1
execute if score @s chem_x_time matches 530 run playsound entity.wither.spawn master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 540 run playsound entity.generic.explode master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 550 run playsound ambient.cave master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 560 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 570 run playsound entity.ender_dragon.growl master @s ~ ~ ~ 1 0.7 1
execute if score @s chem_x_time matches 580 run playsound entity.wither_skeleton.death master @s ~ ~ ~ 1 1.1 1
execute if score @s chem_x_time matches 590 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 600 run playsound entity.ravager.roar master @s ~ ~ ~ 1 0.85 1
execute if score @s chem_x_time matches 610 run playsound entity.vex.charge master @s ~ ~ ~ 1 1.3 1
execute if score @s chem_x_time matches 620 run playsound entity.warden.roar master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 630 run playsound block.end_portal_frame.fill master @s ~ ~ ~ 1 0.75 1
execute if score @s chem_x_time matches 640 run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 1 0.9 1
execute if score @s chem_x_time matches 650 run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 1.4 1
execute if score @s chem_x_time matches 660 run playsound entity.evoker_fangs.attack master @s ~ ~ ~ 1 1.0 1
execute if score @s chem_x_time matches 670 run playsound entity.blaze.hurt master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 680 run playsound entity.warden.sonic_boom master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 690 run playsound entity.ghast.scream master @s ~ ~ ~ 1 0.8 1
execute if score @s chem_x_time matches 700 run playsound entity.wither.spawn master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 710 run playsound entity.generic.explode master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 720 run playsound ambient.cave master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 730 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 740 run playsound entity.ender_dragon.growl master @s ~ ~ ~ 1 0.7 1
execute if score @s chem_x_time matches 750 run playsound entity.wither_skeleton.death master @s ~ ~ ~ 1 1.1 1
execute if score @s chem_x_time matches 760 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 770 run playsound entity.ravager.roar master @s ~ ~ ~ 1 0.85 1
execute if score @s chem_x_time matches 780 run playsound entity.vex.charge master @s ~ ~ ~ 1 1.3 1
execute if score @s chem_x_time matches 790 run playsound entity.warden.roar master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 800 run playsound block.end_portal_frame.fill master @s ~ ~ ~ 1 0.75 1
execute if score @s chem_x_time matches 810 run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 1 0.9 1
execute if score @s chem_x_time matches 820 run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 1.4 1
execute if score @s chem_x_time matches 830 run playsound entity.evoker_fangs.attack master @s ~ ~ ~ 1 1.0 1
execute if score @s chem_x_time matches 840 run playsound entity.blaze.hurt master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 850 run playsound entity.warden.sonic_boom master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 860 run playsound entity.ghast.scream master @s ~ ~ ~ 1 0.8 1
execute if score @s chem_x_time matches 870 run playsound entity.wither.spawn master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 880 run playsound entity.generic.explode master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 890 run playsound ambient.cave master @s ~ ~ ~ 1 1 1
execute if score @s chem_x_time matches 900 run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 1 1.2 1
execute if score @s chem_x_time matches 910 run playsound entity.ender_dragon.growl master @s ~ ~ ~ 1 0.7 1
execute if score @s chem_x_time matches 920 run playsound entity.wither_skeleton.death master @s ~ ~ ~ 1 1.1 1
execute if score @s chem_x_time matches 930 run playsound entity.elder_guardian.curse master @s ~ ~ ~ 1 0.6 1
execute if score @s chem_x_time matches 940 run playsound entity.ravager.roar master @s ~ ~ ~ 1 0.85 1
execute if score @s chem_x_time matches 950 run playsound entity.vex.charge master @s ~ ~ ~ 1 1.3 1
execute if score @s chem_x_time matches 960 run playsound entity.warden.roar master @s ~ ~ ~ 1 0.5 1
execute if score @s chem_x_time matches 970 run playsound block.end_portal_frame.fill master @s ~ ~ ~ 1 0.75 1
execute if score @s chem_x_time matches 980 run playsound entity.ender_dragon.ambient master @s ~ ~ ~ 1 0.9 1
execute if score @s chem_x_time matches 990 run playsound entity.illusioner.mirror_move master @s ~ ~ ~ 1 1.4 1
execute if score @s chem_x_time matches 1000 run playsound entity.evoker_fangs.attack master @s ~ ~ ~ 1 1.0 1