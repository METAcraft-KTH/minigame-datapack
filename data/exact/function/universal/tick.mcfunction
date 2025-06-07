## this function will run every tick regardless of game.id

# reset scale. placed here in case ppl log out
execute if score ?round.number exact.game matches 7.. as @a[tag=!admin] run attribute @s scale modifier remove exact:babyman
execute if score ?round.number exact.game matches 10.. as @a[tag=!admin] run attribute @s scale modifier remove exact:bigman