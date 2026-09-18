Classic KOTH gameplay with bridging!

Namespace is tgttos, actual in game name is WCTBWWGT (we'll cross that bridge when we get there) (don't spell it out in the title)

* All players spawn with bow, 3 arrows, infinite team-colored concrete (always 64 when in mainhand or offhand, per tick item_modifier) (data uses pink, IT uses light_blue), and eff 3 sharp 5 pickaxes  
  * +1 arrow every 5 seconds  
  * Arrows destroy wool within 0.3 blocks of where it lands  
  * Concrete can be placed on ANY block (nowadays it’s just can_place_on={}, see wiki)  
* All players also have permanent regeneration 1  
* Spawn on their own team-colored platforms and have to bridge to faraway islands where the control points are  
* Data spawns at 20025 64 60000, IT spawns at 19975 64 60000  
* Control point 1 is a 5-block radius centered on a marker spawned at 20025 64 60100, control point 2 is at 19975 64 60100  
  * Just below the marker is a white glass, 4 blocks below that is a beacon  
  * There is white wool on the same Y-level as the white glass  
  * Once captured, the wool (10x10 centered on marker) and glass turns team-colored, regardless of what color they were before  
* A control point requires a player standing in range of the marker, and NO enemy player in the range at the same time, for 10 seconds to be captured.  
  * If two players of opposite teams are in range, the capturing is paused.  
  * If A has already made progress on capturing but got kicked off the point by B, B needs to first reverse A’s capture progress at the same speed.  
  * Capture progress is shown in actionbar as percentages, first point 1 then point 2. Data progress uses #e83d84, IT progress uses #cc99ff  
* If a point is captured by A, and B players are standing in it to capture it for themselves, the point is still considered captured by A while B’s capturing is ongoing.  
* Points cannot go back to neutral once initially captured by A or B.  
* Both teams have a 3:00 timer they need to progress in order to win.  
* Both points must be captured for a team to progress their objective (bossbar).  
* Overtime rules - a team must have a 0:00 timer AND own both points to win.