# Migrating the Hexathlon Datapacks: 26.1.2 → 26.3

This guide lists every change needed to run the packs in this repository on **Minecraft Java 26.3** (checked against **26.3-rc3**, data pack format `121.0`). For each change it explains what broke, which files are affected, and exactly how to fix it.

> This is separate from [MIGRATING.md](MIGRATING.md). That file covers moving old minigames onto the MAIN callback architecture and does not apply here.

## Contents

1. [Summary](#1-summary)
2. [Loot conditions and loot functions: `condition`/`function` → `type`](#2-loot-conditions-and-loot-functions-conditionfunction--type)
3. [Loot tables: `conditions` → `condition`, `functions` → `modifier`](#3-loot-tables-conditions--condition-functions--modifier)
4. [Predicate and item modifier files can't be arrays anymore](#4-predicate-and-item-modifier-files-cant-be-arrays-anymore)
5. [Entity predicates use namespaced keys](#5-entity-predicates-use-namespaced-keys)
6. [Advancement triggers need an explicit condition](#6-advancement-triggers-need-an-explicit-condition)
7. [Inline predicates and modifiers in `.mcfunction` files](#7-inline-predicates-and-modifiers-in-mcfunction-files)
8. [Block state NBT: `Name`/`Properties` → `id`/`properties`](#8-block-state-nbt-nameproperties--idproperties)
9. [`pack.mcmeta` for titlewriter](#9-packmcmeta-for-titlewriter)
10. [Docs to update](#10-docs-to-update)
11. [Things that don't need changes](#11-things-that-dont-need-changes)
12. [Testing after the migration](#12-testing-after-the-migration)
13. [Per-file checklist](#13-per-file-checklist)
14. [Sources](#14-sources)

---

## 1. Summary

Nearly all breakage is in **JSON files**: predicates, item modifiers, loot tables, advancements and enchantments. Two snapshots caused it:

- **26.2 Snapshot 3** turned entity predicates into a map with namespaced keys, like data components.
- **26.3 Snapshot 4** rewrote the loot, predicate and item modifier format.

`.mcfunction` commands are mostly fine. Only **10 lines** need changes, and 8 of them are inline predicates that hit the same JSON changes.

**What happens if you skip this:** Minecraft logs an error and **skips each broken JSON file**. The rest of the pack still loads. So advancements never fire, `if predicate qq:...` is always false, and the UHC ore drops fall back to vanilla. Nothing crashes, which makes the problems easy to miss. Broken inline predicates in functions are worse: those functions fail to load at all.

| Pack | JSON files | `.mcfunction` lines |
|---|---|---|
| `MAIN` | 0 | 2 |
| `minigame-template` | 1 | 0 |
| `one-in-the-quiver` | 22 | 2 |
| `exact` | 6 | 2 |
| `uhc_done_quick` | 11 | 0 |
| `tnttag` | 1 (optional) | 3 |
| `mingle` | 1 | 0 |
| `turfwars` | 1 | 0 |
| `spleef-tag` | 0 | 0 |
| `titlewriter-1.2` | 1 (`pack.mcmeta`) | 1 |

> **About MAIN:** [CLAUDE.md](CLAUDE.md) says minigame authors should never modify MAIN. MAIN still needs the 2-line fix in [section 7](#7-inline-predicates-and-modifiers-in-mcfunction-files), so whoever maintains MAIN should apply it.

---

## 2. Loot conditions and loot functions: `condition`/`function` → `type`

**Changed in:** 26.3 Snapshot 4

The field that says what kind of condition or function an object is has been renamed to `type`. This applies anywhere a loot condition or loot function appears:

- `predicate/*.json` files
- `item_modifier/*.json` files
- loot tables
- enchantment `requirements`
- inline predicates and modifiers in commands (see [section 7](#7-inline-predicates-and-modifiers-in-mcfunction-files))

**How to change:**

| Old | New |
|---|---|
| `"condition": "minecraft:entity_properties"` | `"type": "minecraft:entity_properties"` |
| `"function": "minecraft:set_count"` | `"type": "minecraft:set_count"` |

```json
// BEFORE: mingle/data/mingle/item_modifier/refill.json
{
    "function": "set_count",
    "count": 64
}
```
```json
// AFTER
{
    "type": "set_count",
    "count": 64
}
```

> ⚠️ **Don't rename every `"function"` key.** These `function` fields are **not** loot functions and must stay as they are:
> - `"rewards": { "function": "..." }` in advancements
> - `{ "type": "minecraft:run_function", "function": "..." }` in enchantment effects
>
> Only rename `function` on objects that *are* loot functions (item modifier entries and loot table modifiers).

The condition types themselves (`all_of`, `any_of`, `entity_properties`, `match_tool`, `killed_by_player`, `random_chance`) still exist. `all_of` and `any_of` still use `terms`.

---

## 3. Loot tables: `conditions` → `condition`, `functions` → `modifier`

**Changed in:** 26.3 Snapshot 4
**Affects:** all 10 loot tables in `uhc_done_quick`

On loot pools, entries, and loot functions:

| Old | New | Notes |
|---|---|---|
| `"conditions": [ {...} ]` | `"condition": {...}` | Takes **one** condition, not a list. If you have several, wrap them in `minecraft:all_of`. Drop empty lists (`[]`). |
| `"functions": [ {...}, {...} ]` | `"modifier": [ {...}, {...} ]` | A list is still allowed. If there's only one, you can use the bare object. |

> ⚠️ An advancement criterion's `"conditions": { ... }` block (the object after `"trigger"`) is **unchanged**. This rename only applies inside loot tables and loot functions.

**Example**, from `uhc_done_quick/data/minecraft/loot_table/blocks/coal_ore.json`. The other 8 ore tables have the same shape:

```json
// BEFORE (the "children" array only)
{
    "type": "minecraft:item",
    "name": "coal_ore",
    "conditions": [
        {
            "condition": "minecraft:match_tool",
            "predicate": { "predicates": { "minecraft:enchantments": [ { "enchantments": "minecraft:silk_touch", "levels": { "min": 1 } } ] } }
        }
    ]
},
{
    "type": "minecraft:item",
    "name": "coal",
    "functions": [
        { "function": "minecraft:apply_bonus", "enchantment": "minecraft:fortune", "formula": "minecraft:ore_drops" },
        { "function": "minecraft:explosion_decay" }
    ]
}
```
```json
// AFTER
{
    "type": "minecraft:item",
    "name": "coal_ore",
    "condition": {
        "type": "minecraft:match_tool",
        "predicate": { "predicates": { "minecraft:enchantments": [ { "enchantments": "minecraft:silk_touch", "levels": { "min": 1 } } ] } }
    }
},
{
    "type": "minecraft:item",
    "name": "coal",
    "modifier": [
        { "type": "minecraft:apply_bonus", "enchantment": "minecraft:fortune", "formula": "minecraft:ore_drops" },
        { "type": "minecraft:explosion_decay" }
    ]
}
```

> 💡 **Optional shortcut:** vanilla 26.3 ships a predicate for the silk-touch check. You can replace the whole `match_tool` object with a reference to it:
> ```json
> "condition": "minecraft:tool/can_silk_touch"
> ```

**`uhc_done_quick/data/uhc/loot_table/entities/player.json`** (the golden head) changes the same way:

```json
// BEFORE (end of the entry)
"functions": [
    { "function": "set_components", "components": { ... } }
],
"conditions": [
    { "condition": "minecraft:killed_by_player" }
]
```
```json
// AFTER
"modifier": { "type": "set_components", "components": { ... } },
"condition": { "type": "minecraft:killed_by_player" }
```

The contents of `components` stay exactly as they are.

`rolls: 1` and `bonus_rolls: 0` still work as plain numbers. `uhc_done_quick/data/minecraft/loot_table/entities/player.json` only has a `loot_table` entry, so it needs no changes.

---

## 4. Predicate and item modifier files can't be arrays anymore

**Changed in:** 26.3 Snapshot 4

A `predicate/*.json` file must now contain **one** condition object, and an `item_modifier/*.json` file must contain **one** function object. A top-level `[ ... ]` is no longer valid.

**How to change:**

- **One element:** remove the surrounding `[ ]`.
- **Several predicate conditions:** wrap them in `{"type": "minecraft:all_of", "terms": [...]}`.
- **Several item modifier functions:** wrap them in `{"type": "minecraft:sequence", "functions": [...]}`.

**Affected files:**

**`exact/data/exact/item_modifier/can_place_anywhere.json`**. Unwrap it, rename `function`, and drop the empty `conditions`:
```json
{
    "type": "minecraft:set_components",
    "components": {
        "minecraft:can_place_on": {},
        "minecraft:tooltip_display": {
            "hidden_components": [
                "can_place_on"
            ]
        }
    }
}
```

**`one-in-the-quiver/data/qq/item_modifier/charge.json`**:
```json
{
    "type": "minecraft:set_components",
    "components": {
        "minecraft:charged_projectiles": [
            {
                "id": "minecraft:arrow"
            }
        ],
        "minecraft:intangible_projectile": {}
    }
}
```

**`one-in-the-quiver/data/qq/predicate/is_infinity_arrow.json`**. This also needs the changes from [section 5](#5-entity-predicates-use-namespaced-keys):
```json
{
    "type": "minecraft:any_of",
    "terms": [
        {
            "type": "minecraft:entity_properties",
            "entity": "this",
            "predicate": {
                "minecraft:entity_type": "minecraft:arrow",
                "minecraft:nbt": "{weapon:{components:{\"minecraft:enchantments\": {levels:{\"qq:infinity\": 1}}}}}"
            }
        },
        {
            "type": "minecraft:entity_properties",
            "entity": "this",
            "predicate": {
                "minecraft:entity_type": "minecraft:arrow",
                "minecraft:nbt": "{weapon:{components:{\"minecraft:enchantments\": {levels:{\"minecraft:infinity\": 1}}}}}"
            }
        }
    ]
}
```

---

## 5. Entity predicates use namespaced keys

**Changed in:** 26.2 Snapshot 3 (`type_specific/slime` became `type_specific/cube_mob` in 26.2 Snapshot 4)

An entity predicate (the `"predicate"` object inside `entity_properties`, or `damage.source_entity`) is now a **map of namespaced sub-predicate keys**, similar to data components. Each old field becomes a `minecraft:` key, and `type` is renamed.

**Key mapping:**

| Old key | New key |
|---|---|
| `type` | `minecraft:entity_type` |
| `flags` | `minecraft:flags` |
| `equipment` | `minecraft:equipment` |
| `nbt` | `minecraft:nbt` |
| `effects` | `minecraft:effects` |
| `location` | `minecraft:location` |
| `passenger` / `vehicle` / `targeted_entity` | `minecraft:passenger` / `minecraft:vehicle` / `minecraft:targeted_entity` (their contents follow the same rules) |
| `stepping_on`, `movement`, `slots`, `team`, `distance`, `periodic_tick`, `components`, `predicates` | Add a `minecraft:` prefix |
| `type_specific: { "type": "minecraft:player", ... }` | `"minecraft:type_specific/player": { ... }`. Drop the inner `type`. |

**Only the top-level keys change.** Everything inside them stays the same: `is_sneaking`, `mainhand`, `items`, `input`, `position`, and so on. 26.2 also added a new `minecraft:entity_tags` sub-predicate that checks `/tag` tags.

**Examples:**

```json
// BEFORE: qq/predicate/is_sneaking.json
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "flags": {
      "is_sneaking": true
    }
  }
}
```
```json
// AFTER
{
  "type": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "minecraft:flags": {
      "is_sneaking": true
    }
  }
}
```

```json
// BEFORE: qq/predicate/jump.json
"predicate": {
    "type_specific": {
        "type": "minecraft:player",
        "input": { "jump": true }
    }
}
```
```json
// AFTER
"predicate": {
    "minecraft:type_specific/player": {
        "input": { "jump": true }
    }
}
```

```json
// BEFORE: qq/predicate/boat_has_rider.json
"predicate": {
    "type": "#minecraft:boat",
    "passenger": {
        "type": "minecraft:player"
    }
}
```
```json
// AFTER
"predicate": {
    "minecraft:entity_type": "#minecraft:boat",
    "minecraft:passenger": {
        "minecraft:entity_type": "minecraft:player"
    }
}
```

```json
// BEFORE: qq/predicate/rapid_fire_mainhand.json (same for _offhand, reload_mainhand, reload_offhand)
"predicate": {
    "type": "minecraft:player",
    "equipment": {
        "mainhand": { "items": [ "minecraft:crossbow" ], "components": {}, "predicates": { ... } }
    }
}
```
```json
// AFTER
"predicate": {
    "minecraft:entity_type": "minecraft:player",
    "minecraft:equipment": {
        "mainhand": { "items": [ "minecraft:crossbow" ], "components": {}, "predicates": { ... } }
    }
}
```

**Enchantments.** The `requirements` block is a loot condition, so it needs [section 2](#2-loot-conditions-and-loot-functions-conditionfunction--type) *and* this section:

```json
// BEFORE: qq/enchantment/one_hit.json
"requirements": {
    "condition": "minecraft:entity_properties",
    "entity": "direct_attacker",
    "predicate": {
        "type": [ "minecraft:arrow", "minecraft:spectral_arrow", "minecraft:trident", "minecraft:firework_rocket" ]
    }
}
```
```json
// AFTER
"requirements": {
    "type": "minecraft:entity_properties",
    "entity": "direct_attacker",
    "predicate": {
        "minecraft:entity_type": [ "minecraft:arrow", "minecraft:spectral_arrow", "minecraft:trident", "minecraft:firework_rocket" ]
    }
}
```

- `qq/enchantment/restore.json`: rename both `"condition"` keys (the `all_of` and its inner `entity_properties`) to `"type"`, and change `"type": "minecraft:arrow"` inside `predicate` to `"minecraft:entity_type": "minecraft:arrow"`.
- `qq/enchantment/infinity.json`: rename `"condition": "minecraft:match_tool"` to `"type": "minecraft:match_tool"`. Its `predicate` is an *item* predicate, so it doesn't change.
- `rapid_fire.json` and `ray.json` only use `run_function` and need no changes.

---

## 6. Advancement triggers need an explicit condition

**Changed in:** 26.3 Snapshot 4

Trigger fields that take an entity (`player`, `entity`, `cause`, `source`, and similar) used to accept a bare entity predicate or a list of conditions. Now they accept **one loot condition** (or a predicate ID string). You have to write out the `entity_properties` wrapper, and the entity predicate inside it follows [section 5](#5-entity-predicates-use-namespaced-keys).

**Example (kill trigger)**, used by `minigame-template`, `uhc_done_quick` and `exact`:

```json
// BEFORE: minigame-template/data/gamename/advancement/player_kill.json
"conditions": {
    "entity": {
        "type": "minecraft:player"
    }
}
```
```json
// AFTER
"conditions": {
    "entity": {
        "type": "minecraft:entity_properties",
        "entity": "this",
        "predicate": {
            "minecraft:entity_type": "minecraft:player"
        }
    }
}
```

Apply the same change to:

| File | Entity type |
|---|---|
| `minigame-template/data/gamename/advancement/player_kill.json` | `minecraft:player` |
| `uhc_done_quick/data/uhc/advancement/kill.json` | `minecraft:player` |
| `exact/data/exact/advancement/10.json` | `minecraft:player` |
| `exact/data/exact/advancement/6.json` | `minecraft:zombie` |
| `exact/data/exact/advancement/3.json` | `minecraft:sheep` (keep the existing `item` block as is) |

**`exact/data/exact/advancement/15.json`** uses the list form, which is gone. Replace the list with the single condition inside it:
```json
// BEFORE
"cause": [
    {
        "condition": "minecraft:entity_properties",
        "entity": "this",
        "predicate": { "type": "minecraft:wind_charge" }
    }
]
```
```json
// AFTER
"cause": {
    "type": "minecraft:entity_properties",
    "entity": "this",
    "predicate": { "minecraft:entity_type": "minecraft:wind_charge" }
}
```

**`one-in-the-quiver/data/qq/advancement/key_space_just_down.json`** and **`key_space_just_up.json`** (for `_up`, use `"jump": false`):
```json
"conditions": {
    "player": {
        "type": "minecraft:entity_properties",
        "entity": "this",
        "predicate": {
            "minecraft:type_specific/player": {
                "input": {
                    "jump": true
                }
            }
        }
    }
}
```

> 💡 Since these fields now accept predicate IDs, `"player": "qq:jump"` would also work, reusing `qq/predicate/jump.json`. The explicit form above is shown because it doesn't depend on another file.

**`tnttag/data/tnttag/advancement/punch.json`** (optional). `damage.source_entity` is a plain entity predicate, not a condition, so it doesn't need the wrapper. It already uses `entity_type`, the 26.3 key. That was invalid on 26.1.2, so **this advancement starts working after the upgrade**. For consistency, you can namespace it:
```json
"source_entity": {
    "minecraft:entity_type": "minecraft:player"
}
```

**No changes needed:** `exact/advancement/1, 2, 4, 5, 7, 8, 9, 11, 12, 13, 14, 16`, `minigame-template/.../consume_item.json`, `qq/advancement/on_kill.json`, `use_crossbow.json`, `use_place_spawnpoint.json`, `using_shield.json`, and `turfwars/.../on_kill.json`. These have no conditions or only use `item` predicates.

> ℹ️ 26.3 also requires a `background` on *visible root* advancements (ones with `display` and no `parent`). None of our advancements have `display`, so this doesn't affect us.

---

## 7. Inline predicates and modifiers in `.mcfunction` files

Inline SNBT predicates and modifiers follow the same rules as JSON: `condition:` becomes `type:`, `function:` becomes `type:`, and entity predicate keys get the `minecraft:` prefix. **Quote namespaced keys in SNBT** (`"minecraft:location"`) because they contain a colon.

### MAIN — void-fall teleport (2 lines)

[MAIN/data/main/function/superstate/0/tick.mcfunction:15](MAIN/data/main/function/superstate/0/tick.mcfunction#L15) and [MAIN/data/main/function/superstate/1/tick.mcfunction:32](MAIN/data/main/function/superstate/1/tick.mcfunction#L32). The line is identical in both files:

```mcfunction
# BEFORE
execute as @a[tag=!admin] if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:0}}}}} run tp @s 0 64 50000
# AFTER
execute as @a[tag=!admin] if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{max:0}}}}} run tp @s 0 64 50000
```

### tnttag (3 lines)

[tnttag/data/tnttag/function/_tick.mcfunction](tnttag/data/tnttag/function/_tick.mcfunction):

```mcfunction
# BEFORE (line 15)
execute as @a[tag=!admin,team=tnttag.has_tnt] unless predicate {condition:"entity_properties",entity:"this",predicate:{equipment:{mainhand:{items:"tnt"}}}} run clear @s tnt
# AFTER
execute as @a[tag=!admin,team=tnttag.has_tnt] unless predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:equipment":{mainhand:{items:"tnt"}}}} run clear @s tnt

# BEFORE (line 19)
execute as @a[tag=!admin,team=tnttag.has_diamond] unless predicate {condition:"entity_properties",entity:"this",predicate:{equipment:{mainhand:{items:"diamond_block"}}}} run clear @s diamond_block
# AFTER
execute as @a[tag=!admin,team=tnttag.has_diamond] unless predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:equipment":{mainhand:{items:"diamond_block"}}}} run clear @s diamond_block

# BEFORE (line 32)
execute at @a[team=tnttag.has_tnt] if predicate {condition:"random_chance",chance:0.3} run particle lava ~ ~1.6 ~ 0 0 0 0.1 1 normal
# AFTER
execute at @a[team=tnttag.has_tnt] if predicate {type:"random_chance",chance:0.3} run particle lava ~ ~1.6 ~ 0 0 0 0.1 1 normal
```

### exact (2 lines)

[exact/data/exact/function/state/ingame_task/tick.mcfunction](exact/data/exact/function/state/ingame_task/tick.mcfunction):

```mcfunction
# BEFORE (line 22)
execute if score ?round exact.state matches 7 as @a[tag=!exact.win,tag=!admin] if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{min:123}}}}} run advancement grant @s only exact:7
# AFTER
execute if score ?round exact.state matches 7 as @a[tag=!exact.win,tag=!admin] if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{min:123}}}}} run advancement grant @s only exact:7

# BEFORE (line 36)
execute as @a if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:-5}}}}} run tp @s @n[tag=exact.tp.arena]
# AFTER
execute as @a if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{max:-5}}}}} run tp @s @n[tag=exact.tp.arena]
```

### titlewriter-1.2 (1 line)

[titlewriter-1.2/data/tl/function/title_private/username.mcfunction:3](titlewriter-1.2/data/tl/function/title_private/username.mcfunction#L3):

```mcfunction
# BEFORE
item modify block 0 0 0 container.0 {function:"fill_player_head","entity":"this"}
# AFTER
item modify block 0 0 0 container.0 {type:"fill_player_head",entity:"this"}
```

---

## 8. Block state NBT: `Name`/`Properties` → `id`/`properties`

**Changed in:** 26.3 Snapshot 7

Block states stored in NBT now use `id` and `properties`. A block's **default** state can also be written as just its ID string.

**Affected:** [one-in-the-quiver/data/qq/function/utility/projectile/tick_trident.mcfunction:8-9](one-in-the-quiver/data/qq/function/utility/projectile/tick_trident.mcfunction#L8). These lines check whether a landed trident hit a target block.

```mcfunction
# BEFORE (lines 8-9)
execute if predicate qq:in_ground unless data entity @s {inBlockState:{Name:"minecraft:target"}} run tag @s add missed
execute if predicate qq:in_ground if data entity @s {inBlockState:{Name:"minecraft:target"}} run data merge entity @s {DealtDamage:1b}
```

A target block isn't always in its default state: its `power` property changes when it's hit. So the stored `inBlockState` might be the short string `"minecraft:target"` or the full `{id:"minecraft:target",properties:{power:"..."}}`. The old check matched any power level, so the new check has to match both forms. Replace lines 8-9 with:

```mcfunction
# AFTER (replaces lines 8-9)
execute if predicate qq:in_ground if data entity @s {inBlockState:"minecraft:target"} run tag @s add on_target
execute if predicate qq:in_ground if data entity @s {inBlockState:{id:"minecraft:target"}} run tag @s add on_target
execute if predicate qq:in_ground unless entity @s[tag=on_target] run tag @s add missed
execute if predicate qq:in_ground if entity @s[tag=on_target] run data merge entity @s {DealtDamage:1b}
```

The trident is killed at the end of the flow, so the `on_target` tag never needs to be removed.

> 🔎 **Check in-game:** throw a trident into a target block, then run `data get entity @n[type=trident] inBlockState`. The output shows which form the game writes.

**Structure templates:** `spleef-tag/data/spleef/structure/color*.nbt` and `uhc_done_quick/data/uhc/structure/battlebus*.nbt` use the old palette format. They record a `DataVersion` (4671), so the game should upgrade them automatically when loading. You don't need to re-save them, but make sure `place template` still builds them correctly ([section 12](#12-testing-after-the-migration)).

---

## 9. `pack.mcmeta` for titlewriter

[titlewriter-1.2/pack.mcmeta](titlewriter-1.2/pack.mcmeta) only declares `"pack_format": 41` (1.20.5-era), so 26.3 flags it as made for an older version. Use the same range as the other packs:

```json
{
    "pack": {
        "description": "TITLELERP",
        "min_format": 94,
        "max_format": 9999
    }
}
```

The other packs already declare `"min_format": 94, "max_format": 9999`. That range includes 26.3's format `121.0`, so they need no changes.

---

## 10. Docs to update

[CLAUDE.md](CLAUDE.md) (around line 604, in "9. Advancement Triggers") still shows the old kill-trigger shape:

```json
"conditions": {
  "entity": { "type": "minecraft:player" }
}
```

Replace it with the 26.3 form from [section 6](#6-advancement-triggers-need-an-explicit-condition). Otherwise, new minigames generated from those instructions will ship broken advancements.

---

## 11. Things that don't need changes

These were checked against the 26.3-rc3 registries and command tree:

- **All IDs.** Every gamerule, attribute, mob effect, particle, entity type, `#minecraft:` tag, data component, enchantment and loot function/condition type used in this repo still exists in 26.3.
- **Advancement criterion structure.** `trigger` + `conditions` + `rewards.function` is unchanged.
- **Item predicates** (`items`, `count`, `components`, `predicates`) and `match_tool` predicate contents.
- **Data component syntax** in `give`/`item replace` (`enchantments=`, `item_model=`, `can_place_on=`, and so on).
- **Entity NBT** used in `summon` and `data`: `Fuse`, `Color`, `IsChickenJockey`, `IsBaby`, `PickupDelay`, `Glowing`, `DealtDamage`, `inGround`, `acceleration_power`, `teleport_duration`, display `transformation`.
- **Text components** in `tellraw`, `title`, `bossbar` and book `click_event`/`hover_event`.
- **Resource pack** (`resourcepacks/hexathlon`): fonts, item definitions and models are unaffected, and no model uses the removed `shade` field.
- **`cutscene stop @s`** ([MAIN/data/main/function/private/stop_cutscene.mcfunction](MAIN/data/main/function/private/stop_cutscene.mcfunction)) isn't a vanilla command. It comes from the `metacraft-cutscenes` server mod. That mod needs its own 26.3 build; the datapack doesn't change.

**Behavior changes to know about** (no code changes needed):

- **`/item` slot arguments** are now parsed as *slot sources*. Classic slot names (`weapon.mainhand`, `hotbar.8`, `container.0`, `weapon.*`) are still accepted.
- **`/item replace` with multiple slots** fills only as many slots as there are source items. All our uses target one slot, so nothing changes.
- **`/team join`, `/team leave`, `/advancement grant` and `/advancement revoke`** now return exact counts. Nothing in the repo stores those results.
- **Scoreboard in the tab list:** a player's score is no longer shown if they don't have a score for that objective.

---

## 12. Testing after the migration

1. Start a 26.3 server with all packs, or run `/reload`.
2. Search `latest.log` for errors about our namespaces (`qq:`, `exact:`, `uhc:`, `tnttag:`, `mingle:`, `tf:`, `main:`, `gamename:`, `tl:`). Before the fixes, you'll see "Couldn't parse" / "Failed to load" errors for every file listed above. After the fixes, there should be none.
3. Run `/datapack list` and confirm every pack is enabled, with no "incompatible" marker on titlewriter.
4. Test the most important behaviors:

| Test | What should happen |
|---|---|
| Kill a player in each game with a kill advancement (uhc, template-based games, exact round 10) | Reward function runs |
| qq: sneak, jump on a jump pad, hold a crossbow with Rapid Fire | `qq:is_sneaking`, `qq:jump` and `qq:rapid_fire_*` predicates work |
| qq: throw a trident into a target block and into a normal block | Target: comes back as a hit. Normal block: marked `missed` |
| uhc: mine coal/iron/gold ore with and without Silk Touch | Custom drops, and the ore itself with Silk Touch |
| uhc: kill a player | Golden head drops |
| mingle / turfwars: use the offhand refill | Stack refilled to 64 |
| tnttag: drop the TNT or diamond from the main hand | It gets cleared; lava particles appear |
| MAIN: fall below Y=0 in the lobby | Teleported back to 0 64 50000 |
| spleef / uhc: start a round | `place template` builds the arena or battle bus correctly |
| exact round 15: get launched 8+ blocks by a wind charge | Advancement triggers |

---

## 13. Per-file checklist

Section numbers point to the change(s) each file needs.

### MAIN
- [x] `data/main/function/superstate/0/tick.mcfunction` line 15 — §7
- [x] `data/main/function/superstate/1/tick.mcfunction` line 32 — §7

### minigame-template
- [x] `data/gamename/advancement/player_kill.json` — §6

### one-in-the-quiver
- [x] `data/qq/advancement/key_space_just_down.json` — §6
- [x] `data/qq/advancement/key_space_just_up.json` — §6
- [x] `data/qq/enchantment/infinity.json` — §2
- [x] `data/qq/enchantment/one_hit.json` — §2, §5
- [x] `data/qq/enchantment/restore.json` — §2, §5
- [x] `data/qq/item_modifier/charge.json` — §2, §4
- [x] `data/qq/predicate/boat_has_rider.json` — §2, §5 (`type`, `passenger`)
- [x] `data/qq/predicate/dealt_damage.json` — §2, §5 (`nbt`)
- [x] `data/qq/predicate/holding_spawnpoint_placer.json` — §2, §5 (`equipment`)
- [x] `data/qq/predicate/in_ground.json` — §2, §5 (`nbt`)
- [x] `data/qq/predicate/is_flyball.json` — §2, §5 (`nbt`)
- [x] `data/qq/predicate/is_infinity_arrow.json` — §2, §4, §5 (`type`, `nbt`)
- [x] `data/qq/predicate/is_invisible.json` — §2, §5 (`effects`)
- [x] `data/qq/predicate/is_ray_arrow.json` — §2, §5 (`type`, `nbt`)
- [x] `data/qq/predicate/is_sneaking.json` — §2, §5 (`flags`)
- [x] `data/qq/predicate/jump.json` — §2, §5 (`type_specific/player`)
- [x] `data/qq/predicate/on_ground.json` — §2, §5 (`flags`)
- [x] `data/qq/predicate/rapid_fire_mainhand.json` — §2, §5 (`type`, `equipment`)
- [x] `data/qq/predicate/rapid_fire_offhand.json` — §2, §5 (`type`, `equipment`)
- [x] `data/qq/predicate/reload_mainhand.json` — §2, §5 (`type`, `equipment`)
- [x] `data/qq/predicate/reload_offhand.json` — §2, §5 (`type`, `equipment`)
- [x] `data/qq/function/utility/projectile/tick_trident.mcfunction` lines 8–9 — §8

### exact
- [x] `data/exact/advancement/3.json` — §6
- [x] `data/exact/advancement/6.json` — §6
- [x] `data/exact/advancement/10.json` — §6
- [x] `data/exact/advancement/15.json` — §6
- [x] `data/exact/item_modifier/can_place_anywhere.json` — §2, §4
- [x] `data/exact/predicate/is_sneaking.json` — §2, §5 (`flags`)
- [x] `data/exact/function/state/ingame_task/tick.mcfunction` lines 22, 36 — §7

### uhc_done_quick
- [x] `data/minecraft/loot_table/blocks/ancient_debris.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/coal_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/copper_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/deepslate_coal_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/deepslate_copper_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/deepslate_gold_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/deepslate_iron_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/gold_ore.json` — §2, §3
- [x] `data/minecraft/loot_table/blocks/iron_ore.json` — §2, §3
- [x] `data/uhc/loot_table/entities/player.json` — §2, §3
- [x] `data/uhc/advancement/kill.json` — §6

### tnttag
- [x] `data/tnttag/function/_tick.mcfunction` lines 15, 19, 32 — §7
- [x] `data/tnttag/advancement/punch.json` — §6 (optional namespacing)

### mingle
- [x] `data/mingle/item_modifier/refill.json` — §2

### turfwars
- [x] `data/tf/item_modifier/refill.json` — §2

### titlewriter-1.2
- [x] `pack.mcmeta` — §9
- [x] `data/tl/function/title_private/username.mcfunction` line 3 — §7

### Docs
- [x] `CLAUDE.md` advancement example — §10

---

## 14. Sources

- Technical changelogs for 26.2 Snapshot 1 → 26.2 Pre-release 4 and 26.3 Snapshot 1 → 26.3 Pre-release 3: <https://misode.github.io/changelog> (data: <https://github.com/misode/technical-changes>)
- Vanilla 26.3-rc3 data and registries (pack format `121.0`): <https://github.com/misode/mcmeta> (`data`, `summary` branches). The "after" examples were checked against vanilla files such as `advancement/adventure/kill_a_mob.json`, `advancement/adventure/spyglass_at_parrot.json`, `advancement/husbandry/ride_a_boat_with_a_goat.json` and `loot_table/entities/cod.json`.
- Versioned schemas: <https://github.com/SpyglassMC/vanilla-mcdoc> (`java/data/loot/*.mcdoc`, `java/data/predicate.mcdoc`, `java/data/advancement/*.mcdoc`, `java/util/block_state.mcdoc`)
- Release candidate info: <https://minecraft.wiki/w/Java_Edition_26.3-rc3>
