advancement revoke @s only qq:use_crossbow
execute unless score ?superstate main.state matches 3 run return 0
execute unless score ?state qq.game = state.ingame qq.config run return 0

