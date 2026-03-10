# Installation
When cloning, make sure that the `.git` folder (of this repository) is directly under the `/datapacks` folder!

Disable `template-datapack` before running.

# Development

Clone from `template-datapack`. When replacing `GAMENAME` you need to limit the find+replace script to just that folder.

# How to use titlewriter
```
/function tl:title {"text":"abcd","tick":10,"location":"actionbar/title","sound":"block.note_block.bit master @s ~ ~ ~ 1 2 1"}
```

To use this datapack, you'll have to run the a function file "tl:title" with a set of parameters inside `{..}`. These are the following:
- text : Self-explanatory, it's the text.
- ~~username : it is the username who's shown the title.~~
- tick : this is the animation delay between every letter in ticks.
- location : this field defines whether title is shown in actionbar/title
- sound : this is the sound that is played.