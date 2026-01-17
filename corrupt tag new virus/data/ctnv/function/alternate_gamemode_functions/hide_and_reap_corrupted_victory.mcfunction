# here we celabrate the victory of the only survivor (assuming only 1 survivor)
# if there is more than one survivor, a diffrent function will be called.
execute if score tick time matches 2 if score victory_timer victory matches 1.. run scoreboard players remove victory_timer victory 1

#kill the corruption 
kill @e[tag=corruption_part]
# disable the timer
scoreboard players set endgame state 0
# text celebrating the survivor

execute if score tick time matches 3 if score victory_timer victory matches 19 as @a[team=!dead] run tellraw @a [{"selector":"@s"}," hunted down everyone at ",{"score":{"objective":"corruption","name":"@s"}},"% corruption"]
execute if score tick time matches 3 if score victory_timer victory matches 17 as @a[team=!dead] run tellraw @a ["you are ",{"text":"beautiful","bold":true}]
#==============================================================================================================
# there is a glitch where players dont respan in the main  lobby when the game ends
execute as @e[tag=lobby] at @s run setworldspawn ~ ~ ~
execute as @e[tag=lobby] at @s run spawnpoint @a ~ ~ ~

# teleport
execute if score tick time matches 3 if score victory_timer victory matches 0 run tp @a @e[tag=lobby,limit=1] 

# and now for the final command... reload the entire simulation, completing the gameplay loop
execute if score tick time matches 3 if score victory_timer victory matches 0 as @a run reload

# fireworks 

execute as @a[team=!dead] at @s run execute if score 360 time matches 165 run summon firework_rocket ~ ~1 ~ {LifeTime:30,FireworksItem:{id:firework_rocket,count:1,components:{fireworks:{flight_duration:1,explosions:[{shape:"large_ball",has_twinkle:0b,has_trail:0b,colors:[11743532,4312372],fade_colors:[2437522,15435844]}]}}}}
execute as @a[team=!dead] at @s run execute if score 360 time matches 15 run summon firework_rocket ~ ~1 ~ {LifeTime:30,FireworksItem:{id:firework_rocket,count:1,components:{fireworks:{flight_duration:1,explosions:[{shape:"star",has_twinkle:1b,has_trail:1b,colors:[11743532,4312372],fade_colors:[14602026,15435844,15790320]}]}}}}
execute as @a[team=!dead] at @s run execute if score 360 time matches 305 run summon firework_rocket ~ ~1 ~ {LifeTime:30,FireworksItem:{id:firework_rocket,count:1,components:{fireworks:{flight_duration:1,explosions:[{shape:"creeper",has_twinkle:1b,has_trail:1b,colors:[3887386],fade_colors:[4312372]}]}}}}

# this code works fine. but the code editor is throwing an error for some reason.
# i just cant get over the fact that these huge red errors are showing up. ruining everything.
#==============================================================================================================
# the calling card manager
# trigger for 1 tick
execute if score tick time matches 5 if score victory_timer victory matches 18 as @a[team=!dead] run function ctnv:one_time_function/calling_cards/calling_card_manager
