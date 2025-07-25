# the purpouse of this function is to become the party leader.
# it is very annoying to constantly refresh the datapack
scoreboard players set overide_party_leader state 1

team leave @a
team join party_lead @p
function ctnv:one_time_function/party_leader/party_leader


scoreboard players set overide_party_leader state 0

# there is nothing i hate more than having to refresh the game a hundred times only for me to never become the party leader