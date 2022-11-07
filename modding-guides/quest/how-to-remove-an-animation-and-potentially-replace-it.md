---
description: >-
  Guide made by Forsentio - Quest Team member working on WolvenKit at RED
  Modding Tools.
---

# How to Remove an Animation (and Potentially Replace It)

## Summary:

\
We will demonstrate the step-by-step process which allows you to remove _(and potentially change or replace)_ an animation in game.

## Requirements:

* [CP77Tools](https://github.com/WolvenKit/CP77Tools/releases) (thanks for rfuzzo).
* [010Editor](https://www.sweetscape.com/download/010editor/).
* [CP77\_CR2.bt](https://www.mediafire.com/file/9ecmepixohcx1nv/CP77\_CR2W\_v0.46.zip/file) (thanks to alphaZomega).
* Notepad (Recommanded since you need to copy some info)
* A basic understanding of Cyberpunk 2077 modding.

## The Steps:

\
**1**. Unbundle and uncook **basegame\_3\_nightcity.archive, basegame\_4\_gamedata.archive** using CP77Tools\
**2**. Find the animation you want to remove (in our case we want to remove the **idle animation** that plays when the player is **standing in front of a mirror**)

\
The game works by using **.scene** files for certain interaction; you should take a look into those and search for the **sectionNode** that plays the animation you want to remove after you opened it in the 010 Editor, by using alphaZomega's template. The scene file we are using is located in "_**base\quest\minor\_quests\mq000\scenes\mq000\_01\_apartment.scene**_"

\
**3**. Once the **sectionNode is found,** open **Struct Data**, then s**cnSceneResource**, then **scnSceneEvent array**, then s**cnPlaySkAnimEvent**, then s**cnEventBlendWorkspotSetup**; inside of it you will find a **workspotId**, which you must take note of.

**SIDE NOTE:** Most of the game relies on Workspots used as interactable points both by the AI and the Player. In this case, the Workspot we are changing is used for the various interactions in V's appartment. The Workspot's location is "_**base\worksposts\quest\main\_quests\prologue\q001\q001\_01\_wakeup\q001\_01\_wakeup\_\_look\_mirror.workspot**_"

\
**4**. Return to **scnSceneResource** and open **scnWorkspotInstance.** Search for the one that has the same number right next to **workspotInstanceId**; open it and take note of the **dataId**\
**5**. Return to **scnSceneResource** and then open the **scnWorkspotData** and open each of theme until you find the one that has the same **dataId.** Open it and take **note of the path right after the workspotResource**\
**7**. Open the **.workspot** file and then go to **Struct Data**, then **workWorkspotResource**, then **workWorkspotTree**, then **handle:worldEntry**, then **workSequence**, then **worklEntry**: there you will find a different named **work\[...]Anim**; search for the one that has the same name as the animation you want to remove and **take note of the number right before the name**\
**8**. Go into the **CNAME array** and **zero out the name**\
**9**. **Save, pack** and place in the **Mod** folder
