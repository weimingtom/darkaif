  * [Map\_builds](rpg_status#Map_Builds.md)
  * [Player\_Builds](rpg_status#Player_Builds.md)
  * [Monster\_builds](rpg_status#Monster_builds.md)
  * [NPC\_Builds](rpg_status#NPC_Builds.md)
  * [Item\_Builds](rpg_status#Item_Builds.md)

# Map Start up #
```
-default map load
-load objects
--check object mesh is store matches else add in.
-load terrain
-load character
--check object mesh is store matches else add in.
-load monster
--check object mesh is store matches else add in.
-load npc
--check object mesh is store matches else add in.

```
# Map builds #
This is on going build for making the stable map.

```
To do List:
 * load map             [part done]
 * Save map             []
 * Load objects format  [part done]
 * load textures        [part done]
 * Load Terrains        [part done]
 * Collisions           [part done]
 * Gravity              [part done]
 * npcs                 [part done]
   -Quest               []
   -Shop                []
 * monsters             [part done]
 * players              [part done]
 * portal               []
 * zone                 [part done]
```


# Player Builds #
Working and under testing functions.

```
To do List:
-Animation              [WIP]
--skills                []
--actions               [WIP]
-Collision              [part done]
--objects               [part done]
--monsters              [part done]
--map zones             [part done]
--Terrain               [part done]
-Menus                  []
--settings              []
--Skills                []
--Items                 []
--Quest                 []
--stats                 []
```

# Monster builds #
Working on the monster can be hard to do. But simple if you work each function one at the time.

Detail:
  * AI
The AI will do the following actions.
```
Follow               [part done]
Attack               [part done]-need to be refine a bit more.
```

```
 Animations          [part done]
 Item Drop           []
 Respawn             [part done]
 experience points   []
```

# NPC Builds #
I am currently leave this to the last part that deal with items, status, and etc. To deal player interacting with the npc.

TODOLIST:
```
-Items             []
-Stats             []
-Animation         [part done]
-Quest             []
-Events            []
--Stories          []
--Holidays         []
-Menus             [part done]
-Shop              []
```

# Item Builds #