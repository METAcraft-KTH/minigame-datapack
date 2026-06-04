# ============================================================
# Arguments: None
# Returns:   Nothing
# Executor:  The player to be reset
#
# Resets all player stats to our "baseline".
# Any custom stats should be set by the caller
# after this is called.
#
# This function does NOT reset teams and tags.
# 
# ============================================================

clear @s
gamemode adventure @s
xp set @s 0 levels
xp set @s 0 points
advancement revoke @s everything

effect clear @s
recipe take @s *

attribute @s air_drag_modifier base reset
attribute @s armor base reset
attribute @s armor_toughness base reset
attribute @s attack_damage base reset
attribute @s attack_knockback base reset
attribute @s attack_speed base reset
attribute @s below_name_distance base reset
attribute @s block_break_speed base reset
attribute @s block_interaction_range base reset
attribute @s bounciness base reset
attribute @s burning_time base reset
attribute @s camera_distance base reset
attribute @s entity_interaction_range base reset
attribute @s explosion_knockback_resistance base reset
attribute @s fall_damage_multiplier base reset
attribute @s flying_speed base reset
attribute @s follow_range base reset
attribute @s friction_modifier base reset
attribute @s gravity base reset
attribute @s knockback_resistance base reset
attribute @s luck base reset
attribute @s max_absorption base reset
attribute @s max_health base reset
attribute @s mining_efficiency base reset
attribute @s movement_efficiency base reset
attribute @s movement_speed base reset
attribute @s name_tag_distance base reset
attribute @s oxygen_bonus base reset
attribute @s safe_fall_distance base reset
attribute @s scale base reset
attribute @s sneaking_speed base reset
attribute @s spawn_reinforcements base reset
attribute @s step_height base reset
attribute @s submerged_mining_speed base reset
attribute @s sweeping_damage_ratio base reset
attribute @s tempt_range base reset
attribute @s water_movement_efficiency base reset
attribute @s waypoint_receive_range base reset
attribute @s waypoint_transmit_range base reset