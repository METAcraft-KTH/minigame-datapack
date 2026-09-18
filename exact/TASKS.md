# exact - task reference

Source list: `../exactly_as_told.md`. Subtitles and win messages live in
`function/state/ingame_task/tick.mcfunction` and `.../win.mcfunction`.

30 tasks, drawn one per round in a random order. The game runs until
the elimination is settled, so the pool is reshuffled whenever all 30
have been played.

| # | Subtitle | How it is won |
| --- | --- | --- |
| 1 | Jump 9 blocks high!! | `fall_after_explosion`, wind charge, y ≥ 9 |
| 2 | Break the shovel!! | `item_durability_changed`, golden shovel at 0 |
| 3 | Avenge Jack Black!! | `player_killed_entity`, zombie |
| 4 | Drink milk!! | `consume_item`, milk bucket |
| 5 | Sneak 67 times!! | polled in `tick` via `exact:is_sneaking` |
| 6 | Enchant pickaxe!! | `enchanted_item`, diamond pickaxe |
| 7 | Poke someone!! | `spear_mobs` — everybody keeps resistance 5, hearts are the life counter |
| 8 | Arson!! | `item_used_on_block`, flint & steel on hay |
| 9 | Light a TNT block!! | `item_used_on_block`, flint & steel on TNT |
| 10 | Take damage!! | `entity_hurt_player` — fires even with the damage fully resisted |
| 11 | Blind yourself!! | `effects_changed`, blindness (suspicious stew + azure bluet) |
| 12 | Get hit by arrow!! | `entity_hurt_player`, damage type tag `is_projectile` — fall damage forced off |
| 13 | Get breeding!! | `bred_animals` |
| 14 | Fuck bees!! | `bee_nest_destroyed`, bee nest |
| 15 | Buy anything!! | `villager_trade` |
| 16 | Diamond armor, full set!! | polled: `if items entity @s armor.*` |
| 17 | Sit down!! | polled: riding a `minecraft:cushion` entity |
| 18 | Jump into the void!! | polled: y ≤ 49 |
| 19 | Quick maths!! | `exact.quickmath` trigger from the book |
| 20 | Hog rider!! | polled: riding a `minecraft:pig` |
| 21 | Wololo!! | `player_interacted_with_entity`, red dye + sheep |
| 22 | Drink water!! | `consume_item`, potion |
| 23 | Touch grass!! (riptide) | polled in `tick`: standing on grass |
| 24 | Touch grass!! (speed II) | polled in `tick`: standing on grass — **placeholder coords** |
| 25 | Make bread!! | `inventory_changed`, bread |
| 26 | Craft blast furnace!! | `recipe_crafted`, `minecraft:blast_furnace` |
| 27 | Craft crossbow!! | `recipe_crafted`, `minecraft:crossbow` |
| 28 | Craft end crystal!! | `recipe_crafted`, `minecraft:end_crystal` |
| 29 | Craft rabbit stew!! | `inventory_changed`, rabbit stew (recipe has several ids) |
| 30 | Craft white harness!! | `recipe_crafted`, `minecraft:white_harness` |

Tasks 26-30 share the crafting-table platform and the kit in
`function/state/ingame_task/craft_kit.mcfunction`.
