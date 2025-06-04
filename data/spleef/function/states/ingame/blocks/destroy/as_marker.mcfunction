# do not destroy block if block matches
execute if score ?color.keep spleef.game matches 1 if block ~ ~ ~ red_glazed_terracotta run return 0
execute if score ?color.keep spleef.game matches 2 if block ~ ~ ~ blue_glazed_terracotta run return 0
execute if score ?color.keep spleef.game matches 3 if block ~ ~ ~ green_glazed_terracotta run return 0
execute if score ?color.keep spleef.game matches 4 if block ~ ~ ~ pink_glazed_terracotta run return 0
execute if score ?color.keep spleef.game matches 5 if block ~ ~ ~ yellow_glazed_terracotta run return 0
execute if score ?color.keep spleef.game matches 6 if block ~ ~ ~ purple_glazed_terracotta run return 0

setblock ~ ~ ~ air