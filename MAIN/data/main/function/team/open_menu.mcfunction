# ============================================================
# Called by: main:team/tick
# Executor:  Player who right-clicked the team selector
# 
# Opens the team selection dialog, unless the player's
# team is already locked in.
# 
# ============================================================

execute if entity @s[tag=main.team_locked] run return run tellraw @s {text:"Your team is locked in, since you've already played a game.",color:"red"}

dialog show @s {\
    type:"minecraft:multi_action",\
    title:{text:"Pick your team",bold:true},\
    body:{\
        type:"minecraft:plain_message",\
        contents:[\
            "You can switch teams until the next game starts. After that, your team is locked in for the rest of the event.\n\n",\
            {text:"Random",color:"yellow"},\
            " puts you on whichever team has fewer players when the game starts.",\
        ],\
    },\
    pause:false,\
    columns:1,\
    actions:[\
        {label:{text:"Data",color:"#e83d84"},action:{type:"run_command",command:"trigger main.team_pick set 1"}},\
        {label:{text:"IT",color:"#cc99ff"},action:{type:"run_command",command:"trigger main.team_pick set 2"}},\
        {label:{text:"Random",color:"yellow"},action:{type:"run_command",command:"trigger main.team_pick set 3"}},\
    ],\
}
