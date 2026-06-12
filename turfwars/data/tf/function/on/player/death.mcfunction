# ============================================================
# tf:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# ============================================================

tp @s[team=tf.red] 31075 72 59995 90 0
tp @s[team=tf.blue] 30924 72 59995 -90 0
gamemode adventure @s
effect give @s blindness 3 0 true
effect give @s slowness 3 4 true

clear @s
give @s netherite_sword[unbreakable={}]
give @s bow[enchantments={infinity:1},unbreakable={}]
give @s arrow 1
give @s[team=tf.red] red_wool[can_place_on={blocks:["red_wool","red_terracotta"]}] 20
give @s[team=tf.blue] blue_wool[can_place_on={blocks:["blue_wool","blue_terracotta"]}] 20
give @s[team=tf.red] shears[enchantments={efficiency:5},can_break={blocks:["red_wool"]}]
give @s[team=tf.blue] shears[enchantments={efficiency:5},can_place_on={blocks:["blue_wool"]}]
item replace entity @s[team=tf.red] armor.head with red_wool[enchantments={binding_curse:1}]
item replace entity @s[team=tf.blue] armor.head with blue_wool[enchantments={binding_curse:1}]

#gamemode spectator @s
#tag @s remove tf.in_cp
#tag @s remove tf.player.correct
#tag @s add tf.loser
#tellraw @s {"text":"You died and are out for this minigame.","color":"red"}
