256x256 symmetrical slice of a normal survival world. A bedrock wall runs from north to south and splits the map into east and west. IT on west, Data on east.

Map center is X=30000 Z=60000. Coordinates in the specification below should be hardcoded relative to map center, e.g. `positioned 30000 64 60000 positioned ~128 ~ ~128`.

* Each team has 2 immobile glowing wardens, one in each corner of the map. They can attack but not move (riding on an air block display perhaps). They do not attack teammates (by being in the same team as the side they're on)
* The wardens' health is combined and tracked in a team-colored boss bar (max 600, style is notched 6)
* IT spawn is on the west center edge, Data spawn is on the east center edge.
* All players spawn with eff 3 stone tools, team-colored prot 2 leather set, and 8 prismarine crystals. Keep inventory is on, no additional items are given on respawn after these initial items
* Respawn is 10 seconds 
* Earn 5 crystals per enemy kill. (If no killer is credited by the game (not sure how to detect this, maybe with playerKillCount objective?), 5 crystals are dropped at place of death)
    * if there WAS a killer credited by the game, victim receives 1 crystal
* An iron golem spawns in mid every 3 minutes. Killing it gives the killer 15 crystals, and all their teammates get 2 crystals. (if no killer, 15 crystals are dropped at place of death)

Place 3 invulnerable immobile villagers around the spawn area with the following trades. Crystals are just normal prismarine crystals with no additional NBT.

* Miner  
  * 1 crystal → 8 oak logs  
  * 1 crystal → 32 cobblestone  
  * 1 crystal → 24 stone  
  * 1 crystal → 2 iron ingots  
  * 1 crystal → 6 lapis  
  * 1 crystal → 16 xp  
  * 2 crystals → 1 diamond  
* Trapper  
  * 1 crystal → 3 TNTs  
  * 1 crystal → 16 redstone  
  * 1 crystal → 8 quartz  
  * 1 crystal → 4 slime blocks  
  * 1 crystal → 16 string  
  * 1 crystal → 4 arrows  
  * 2 crystal → 4 dripstone  
* Trickster  
  * 6 → 1 ender pearl  
  * 8 → Cow spawner  
  * 16 → Zombie spawner  
    * Will spawn in any light level and always have a helmet  
    * Will not attack teammates (same `Team` as the side you bought the spawner from)
  * 18 → Skeleton spawner  
    * same stats as zombie spawner
  * 7 → 1 insta-explode one-time use trident (when the trident is in the ground, the trident is killed and a Fuse:0 TNT is spawned)
  * 13 → Knockback 3 gold sword 
  * 7 → 1 Insta-respawn coupon (if a player dies and a coupon is detected in their inventory, they respawn instantly.)


The walls drop after 10 minutes and continues until one team's wardens are all dead. If 20 minutes have passed since game start, both wardens are inflicted with poison 2 forever.