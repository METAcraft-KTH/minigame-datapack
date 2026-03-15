# Installation
When cloning, make sure that the `.git` folder (of this repository) is directly under the `/datapacks` folder!

Disable `template-datapack` before running.

# Development

Clone from `template-datapack`. When replacing `GAMENAME` you need to limit the find+replace script to just that folder.

# How to use titlewriter
```
/function tl:title {"text":"abcd","tick":10,"location":"actionbar/title","sound":"block.note_block.bit master @s ~ ~ ~ 1 2 1"}
```

```
To use this datapack, you'll have to run a function file "tl:title" with a set of parameters inside `{..}`. These are the following:
- text : Self-explanatory, it's the text.
    |_______ can be either pure string, or literal SNBT (lists supported!)
                                              |____ if literal SNBT is used, set args to {is_literal:TRUE}.
- tick : this is the animation delay between every letter in ticks.
- location : this field defines whether title is shown.
    |_______ can be either title or actionbar.
- sound : this is the sound that is played.
    |_______ example: "minecraft.sound master @s ~ ~ ~ 1 1 1"
- args : Optional Arguments for different behavior
    |_______ is_bold: TRUE/FALSE; Turns all text to Bold
    |_______ is_italic: TRUE/FALSE; Turns all text to italic.
    |_______ font: string; Change the font of the text.
    |_______ is_literal: TRUE/unset; 
                |_____ This Flag disregards the flags above. 
                |_____ If mentioned/set to true, text interprets SNBT similar to /tellraw or default /title. 
                |_____ Can be used to animate Words, Complex SNBT or Text with Gradient. 
```

# How to use spleefmusic
```
function spleefmusic:sans/play
function spleefmusic:sans/pause
function spleefmusic:sans/stop

execute as @a at @s run function spleefmusic:sans/play
```
MEGALOVANIA (Smash Ultimate Ver.) by TobyFox (cover by ShinkoNet)