# ============================================================
# Called by: main:team/tick
# Executor:  Player without a team selector
# 
# Gives the player the team selector item.
# 
# ============================================================

give @s carrot_on_a_stick[custom_data={main_team_selector:1b},item_model="minecraft:book",item_name={text:"Pick your team",color:"gold"},lore=[{text:"Right-click to choose a team",color:"gray",italic:false}]]
