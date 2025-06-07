advancement revoke @s only koth:on_kill
execute unless score ?state koth.game = state.ingame_cp koth.config run return 0
execute unless score game.id GLOBAL = id koth.config run return 0

function score:add_points {points:10}
execute if entity @s[team=koth.blue] as @a[team=koth.blue] run function score:add_points {points:5}
execute if entity @s[team=koth.blue] as @a[team=koth.blue] run function score:add_points {points:5}
