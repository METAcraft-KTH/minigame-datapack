function qq:load
scoreboard players set ?state qq.game 0
scoreboard players set ?timer qq.game 0
scoreboard players set mode qq.config 0
scoreboard players operation game.id GLOBAL = id qq.config