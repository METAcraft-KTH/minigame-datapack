# Race Minigame - Quick Reference

## Admin Setup Commands

### Get Marker Placement Items
```
/function race:util/spawn_egg/checkpoint_egg
/function race:util/spawn_egg/respawn_egg
/function race:util/spawn_egg/elytra_egg
/function race:util/spawn_egg/remove_elytra_egg
/function race:util/spawn_egg/blocks_egg
/function race:util/spawn_egg/remove_blocks_egg
/function race:util/spawn_egg/trident_egg
/function race:util/spawn_egg/remove_trident_egg
```

### Place Markers
```
# At checkpoint location:
/function race:util/checkpoint/create_checkpoint

# At respawn point location:
/function race:util/checkpoint/create_respawn

# At utility station locations:
/function race:util/checkpoint/create_elytra_station
/function race:util/checkpoint/create_remove_elytra_station
/function race:util/checkpoint/create_blocks_station
/function race:util/checkpoint/create_remove_blocks_station
/function race:util/checkpoint/create_trident_station
/function race:util/checkpoint/create_remove_trident_station
```

## Core Game Functions

```
# Initialize game (called by MAIN)
/function race:on/gamestart

# Main game loop (called by MAIN every tick during superstate 3)
/function race:on/gametick

# End game and award stats
/function race:state/break/enter
```

## Utility Functions

```
# Give items to a player
/function race:util/utility/get_elytra
/function race:util/utility/remove_elytra
/function race:util/utility/get_blocks
/function race:util/utility/remove_blocks
/function race:util/utility/get_trident
/function race:util/utility/lose_trident
```

## Testing/Debugging

```
# Monitor checkpoint detection
/function race:util/checkpoint/monitor_all

# Check current marker data
/data get entity @e[type=marker,tag=race.checkpoint]
/data get entity @e[type=marker,tag=race.respawn]
/data get entity @e[type=marker,tag=race.utility]

# Reset a player's progress
/scoreboard players set @s race.checkpoint -1
/scoreboard players set @s race.lap 0

# Manually trigger checkpoint completion
/function race:util/checkpoint/complete_lap
/function race:util/checkpoint/finish_race
```

## Game Configuration

Below are the main timing values that can be adjusted:

| Variable | Location | Value | Purpose |
|---|---|---|---|
| Ready phase duration | `state/ready/tick.mcfunction` | 400 ticks | 20 seconds countdown |
| Play phase duration | `state/play/tick.mcfunction` | 8400 ticks | 7 minutes (420 seconds) |
| Checkpoint detection range | `util/checkpoint/check_player.mcfunction` | 2 blocks | How close player must be to checkpoint |
| Laps to complete | `util/checkpoint/complete_lap.mcfunction` | 3 | Number of full laps required |
| Checkpoints per lap | `util/checkpoint/complete_lap.mcfunction` | 11 checkpoint counter | Checkpoint ID when lap completes |

## Scoreboard Reference

| Objective | Description | Setter | Example Value |
|---|---|---|---|
| `race.state` | State variables and counters | Game code | Varies |
| `race.timer` | Phase and game timers | Game code | 0-8400 |
| `race.checkpoint` | Player's current checkpoint (0-based) | Game code | 0-10 |
| `race.lap` | Player's current lap | Game code | 0-3 |
| `race.stats.lap` | Final lap count for leaderboard | Game code | 1-3 |
| `race.stats.time` | Finish time in ticks | Game code | 0-8400 |

### Fake Player Naming

- `?phase` - Current phase (0=ready, 1=play, 2=break)
- `?phase_timer` - Timer within current phase
- `?match_timer` - Total match time elapsed
- `#checkpoint_count` - Incremental checkpoint ID counter
- `#respawn_count` - Incremental respawn ID counter
- `#finished_count` - Number of players who finished
- `#temp` - Temporary calculations

## Tag Reference

| Tag | Meaning |
|---|---|
| `race.playing` | Player is actively racing |
| `race.finished` | Player has completed 3 laps |
| `race.checkpoint` | Marker is a checkpoint |
| `race.respawn` | Marker is a respawn point |
| `race.utility` | Marker is a utility station |
| `race.utility.elytra` | Elytra grant station |
| `race.utility.remove_elytra` | Elytra removal station |
| `race.utility.blocks` | Block grant station |
| `race.utility.remove_blocks` | Block removal station |
| `race.utility.trident` | Trident grant station |
| `race.utility.remove_trident` | Trident removal station |
| `race.marker` | Any race marker (for cleanup) |
