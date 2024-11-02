execute if score ?state WALLS.game = state.r2.initial WALLS.config run return 1
execute if score ?state WALLS.game = state.r2.wall_drop WALLS.config run return 1
execute if score ?state WALLS.game = state.r2.deathmatch WALLS.config run return 1
return fail
