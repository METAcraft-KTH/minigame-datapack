execute if entity @p[tag=!admin,team=] run team join tf.red @r[tag=!admin,team=]
execute if entity @p[tag=!admin,team=] run team join tf.blue @r[tag=!admin,team=]

# recurse until out of players
execute if entity @p[tag=!admin,team=] run function tf:state/pregame/scramble