# called on the root entity
scoreboard players remove #fireball_count fireball 1

particle explosion_emitter ~ ~ ~ 0.0 0.0 0.0 1 1 force @a
function fireball:ball/kill_this
playsound entity.generic.explode hostile @a ~ ~ ~ 10 1 0.1

# remove ground
fill ~-1 ~-5 ~-1 ~1 ~ ~1 lava replace #fireball:fragile destroy