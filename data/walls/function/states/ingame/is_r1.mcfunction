execute if score ?state WALLS.game = state.r1.initial WALLS.config run return 1
execute if score ?state WALLS.game = state.r1.wall_drop WALLS.config run return 1
execute if score ?state WALLS.game = state.r1.deathmatch WALLS.config run return 1
return fail
