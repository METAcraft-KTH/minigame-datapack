# Race Minigame

An obstacle course minigame where players must complete 3 laps of a challenging course while racing against the clock.

## Game Overview

- **Duration**: 20 seconds pregame countdown + 7 minutes of racing
- **Win Condition**: Complete 3 laps (fastest time wins)
- **Player Capacity**: Unlimited
- **Difficulty**: Highly configurable via marker placement

## Game Phases

### Pregame (20 seconds)
- 20-second countdown with actionbar display
- All players are in spectator mode
- Map should be fully prepared during intro

### Race (7 minutes)
- Players start in adventure mode at the first checkpoint
- Must cross checkpoints in numerical order
- Checkpoint system includes respawn mechanics
- Utility stations grant power-ups or restrictions:
  - Elytra (to fly)
  - Building blocks (to scaffolding)
  - Riptide trident (for mobility)
  - Removal stations for each item

### Game End
- Automatically triggered when:
  - All players complete 3 laps, OR
  - 7-minute timer expires
- Stats displayed: laps completed and finish time

## Marker System

The race course is configured using **Marker entities** placed at strategic locations. Admins use spawn eggs to identify marker types, then run functions to actually place them.

### Marker Types

1. **Checkpoints** - Sequential points players must hit (in order)
2. **Respawn Points** - Where players respawn if they skip checkpoints
3. **Elytra Station** - Gives elytra to the player
4. **Remove Elytra Station** - Removes elytra
5. **Blocks Station** - Gives 64 oak wood blocks
6. **Remove Blocks Station** - Removes all blocks from player
7. **Trident Station** - Gives Riptide trident
8. **Remove Trident Station** - Removes trident

## Setup Instructions

### 1. Get Marker Spawn Eggs

As an admin, run these commands to receive items with instructions:

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

### 2. Place Markers

For each checkpoint location:
1. Position yourself at the location where you want to place the marker
2. Run: `/function race:util/checkpoint/create_checkpoint`
3. Repeat for all checkpoints in order (1, 2, 3, etc.)

For respawn points:
1. Position yourself at the respawn location
2. Run: `/function race:util/checkpoint/create_respawn`

For utility stations:
1. Position yourself at the station location
2. Run the appropriate function:
   - `/function race:util/checkpoint/create_elytra_station`
   - `/function race:util/checkpoint/create_remove_elytra_station`
   - `/function race:util/checkpoint/create_blocks_station`
   - `/function race:util/checkpoint/create_remove_blocks_station`
   - `/function race:util/checkpoint/create_trident_station`
   - `/function race:util/checkpoint/create_remove_trident_station`

### 3. Configure Lap Requirements

Currently, the game is set to detect lap completion after passing 11 checkpoints (0 → 10 in the checkpoint counter). To adjust this:

Edit [state/play/tick.mcfunction](data/race/function/state/play/tick.mcfunction) and the checkpoint system to match your course layout.

## Scoreboard Objectives

- `race.state` - Game state variables and counters
- `race.timer` - Timer tracking
- `race.checkpoint` - Current checkpoint for each player (progress tracker)
- `race.lap` - Current lap number for each player
- `race.stats.lap` - Final lap count (for leaderboard)
- `race.stats.time` - Finish time (for leaderboard)

## Advanced Configuration

### Customizing Utilities

Edit `util/utility/*.mcfunction` to change what items are given (elytra, blocks, etc.) and their enchantments/quantities.

### Checkpoint Detection Range

In `util/checkpoint/check_player.mcfunction`, the checkpoint distance is set to 2 blocks:
```
execute at @e[type=minecraft:marker,tag=race.checkpoint,distance=..2,limit=1]
```
Change `2` to increase/decrease detection range.

### Top-Off Rewards

To automatically award points when players finish, edit `award/finish.mcfunction` with your point logic.

## Gameplay Tips

- **Course Design**: Mix utility stations strategically - don't make them all in one location
- **Respawn Strategy**: Place respawn points at safe, accessible locations that force players to backtrack
- **Difficulty Pacing**: Place harder sections later in the lap
- **Testing**: Use `/function race:util/checkpoint/monitor_all` to test checkpoint detection in realtime

## Troubleshooting

### Players not advancing to next checkpoint
- Verify checkpoint markers are placed sequentially (1, 2, 3...)
- Check that players are within 2 blocks of the checkpoint
- Use `/data get entity @e[type=marker,tag=race.checkpoint]` to debug marker data

### Players stuck in spectator mode
- Check that `race.checkpoint` score is set correctly (should be 0 or higher)
- Verify `race.playing` tag is applied
- Check logs for function errors

### Stats not updating
- Ensure `race.stats.time` and `race.stats.lap` are set before game end
- Verify `race.stats.*` scoreboards exist (created in `_load.mcfunction`)

## File Structure

```
race/
  pack.mcmeta                                    # Pack metadata
  data/
    minecraft/tags/function/load.json            # Load tag
    race/
      function/
        _load.mcfunction                         # Initialization
        on/
          gamestart.mcfunction                   # Game start handler
          gametick.mcfunction                    # Main tick dispatch
          introstart.mcfunction                  # Intro handler
          player/
            death.mcfunction                     # Death handler
            latejoin.mcfunction                  # Late join handler
            rejoin.mcfunction                    # Rejoin handler
        state/
          ready/                                 # Ready phase
          play/                                  # Play phase
          break/                                 # End game phase
        util/
          checkpoint/                            # Checkpoint logic
          utility/                               # Item utilities
          spawn_egg/                             # Marker setup tools
        award/
          finish.mcfunction                      # Award placeholder
```

## Customization Example

To make the game 10 minutes long instead of 7:
1. Edit `state/play/enter.mcfunction` - change timer values
2. Edit `state/play/tick.mcfunction` - update the time calculation (currently 8400 ticks)

To change the number of laps:
1. Edit `util/checkpoint/complete_lap.mcfunction`
2. Change the `race.lap matches 3` condition to desired lap count

To add more utility types:
1. Create a new function in `util/utility/`
2. Create corresponding spawn egg and marker creation functions
3. Update the checkpoint detection to handle the new marker type
