# ============================================================
# Arguments: None
# Returns:   Nothing
#
# Resets all gamerules to our "baseline".
# Any custom gamerules should be set by the caller
# after this is called.
# 
# ============================================================

# --- NOTABLE GAMERULES ---
#   gamerules that you might change
#   in your minigames.
gamerule entity_drops false
gamerule block_drops false
gamerule mob_drops false
gamerule limited_crafting false
gamerule natural_health_regeneration false
gamerule advance_time false
gamerule advance_weather false
gamerule mob_griefing false
gamerule keep_inventory true
gamerule pvp true

# --- NOTABLE, BUT USUALLY NOT MODIFIED, GAMERULES ---
#   it's good to be aware of what these are set to,
#   but you probably wont be changing these much.
#   unless it's important to know how the victim was killed,
#   custom death messages generally look nicer.
gamerule immediate_respawn true
gamerule show_death_messages false
gamerule respawn_radius 0
gamerule locator_bar false

# --- GAMERULES THAT ARE RELEVANT FOR SURVIVAL-BASED MINIGAMES ---
#   you'll likely have to change all of these
#   for games like UHC and Walls.
gamerule random_tick_speed 0
gamerule show_advancement_messages false
gamerule mob_explosion_drop_decay false
gamerule spread_vines false
gamerule fire_spread_radius_around_player 0
#   mobs
gamerule raids false
gamerule spawn_phantoms false
gamerule spawn_mobs false
gamerule spawn_patrols false
gamerule spawn_wandering_traders false
gamerule spawn_wardens false
gamerule spawner_blocks_work false

# --- SLIGHTLY LESS NOTABLE GAMERULES ---
gamerule tnt_explodes true
gamerule drowning_damage true
gamerule fall_damage true
gamerule fire_damage true
gamerule freeze_damage true

# --- I DONT THINK ANYONE CARES ABOUT THESE ---
gamerule block_explosion_drop_decay false
gamerule command_block_output false
gamerule max_block_modifications 32768
gamerule elytra_movement_check true
gamerule player_movement_check true
gamerule ender_pearls_vanish_on_death true
gamerule forgive_dead_players true
gamerule global_sound_events true
gamerule lava_source_conversion false
gamerule log_admin_commands true
gamerule max_command_sequence_length 65536
gamerule max_command_forks 65536
gamerule max_entity_cramming 24
gamerule players_nether_portal_creative_delay 1
gamerule players_nether_portal_default_delay 80
gamerule players_sleeping_percentage 100
gamerule projectiles_can_break_blocks true
gamerule reduced_debug_info false
gamerule send_command_feedback true
gamerule max_snow_accumulation_height 1
gamerule tnt_explosion_drop_decay false
gamerule universal_anger false
gamerule water_source_conversion true
gamerule command_blocks_work true

# --- DO NOT TOUCH THIS ONE ---
#   metacraft-cutscenes will literally explode
#   if this is turned off
gamerule spectators_generate_chunks true