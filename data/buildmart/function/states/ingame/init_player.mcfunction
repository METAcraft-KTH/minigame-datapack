advancement revoke @s everything
function buildmart:clear_tags
advancement grant @s only buildmart:items/root
function buildmart:states/ingame/helper/prepare_array_iteration with storage buildmart:valid_items
tp @s @n[tag=buildmart.tp.arena]
clear @s
function buildmart:give/tools
execute at @s run spawnpoint @s ~ ~ ~ ~
gamemode adventure @s

recipe give @s *

effect give @s speed infinite 0 true

title @s clear
title @s title {text:"First we mine, then we craft",color:aqua}
title @s subtitle {text: "Has begun! Craft the items shown on the display!",color:green}
tellraw @s {text:"First we mine, then we craft has begun!",color:"aqua"}
tellraw @s {text:"Craft the items shown on the display!",color:green}
tellraw @s {text:"Press ",color:green, extra:[{keybind: "key.advancements",color:aqua},{text: " (or open the advancements menu) to view the items you need to craft at any time!"}]}
tellraw @s {text:"Enter the airship to claim your points.",color:green}
tellraw @s {text:"DO ",color:yellow,extra:[{text:"NOT",color:red, bold:true}, {text:" DROP THE ITEMS, KEEP THEM IN YOUR INVENTORY!!!!!"}]}
