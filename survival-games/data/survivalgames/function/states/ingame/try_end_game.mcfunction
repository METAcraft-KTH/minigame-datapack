#range Range
$execute store result score #playercount SURVIVALGAMES.tmp if entity @a[distance=..$(range),gamemode=adventure]
$execute if score #playercount SURVIVALGAMES.tmp matches ..1 run function survivalgames:states/postgame/announce_winners {range: $(range)}
$execute if score #playercount SURVIVALGAMES.tmp matches ..1 run function survivalgames:grant_points_gameover {range: $(range)}
$execute if score #playercount SURVIVALGAMES.tmp matches ..1 run gamemode spectator @a[distance=..$(range)]
