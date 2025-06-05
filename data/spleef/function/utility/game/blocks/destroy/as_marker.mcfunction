# do not destroy block if block matches
execute if score ?color.keep spleef.game matches 1 if block ~ ~ ~ red_terracotta run return 0
execute if score ?color.keep spleef.game matches 2 if block ~ ~ ~ yellow_terracotta run return 0
execute if score ?color.keep spleef.game matches 3 if block ~ ~ ~ orange_terracotta run return 0
execute if score ?color.keep spleef.game matches 4 if block ~ ~ ~ purple_terracotta run return 0
execute if score ?color.keep spleef.game matches 5 if block ~ ~ ~ green_terracotta run return 0
execute if score ?color.keep spleef.game matches 6 if block ~ ~ ~ blue_terracotta run return 0

setblock ~ ~ ~ air