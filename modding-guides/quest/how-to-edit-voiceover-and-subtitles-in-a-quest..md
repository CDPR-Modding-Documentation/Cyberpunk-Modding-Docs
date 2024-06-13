---
description: >-
  Guide made by Forsentio - Quest Team member working on WolvenKit at RED
  Modding Tools.
---

# How to Edit Voiceover and Subtitles In a Quest.

## Requirements:

* [CP77 Tools](https://github.com/WolvenKit/CP77Tools/releases)
* [010 Editor](https://www.sweetscape.com/download/010editor/)
* [CP77\_CR2W.bt](https://www.mediafire.com/file/9ecmepixohcx1nv/CP77\_CR2W\_v0.46.zip/file) (Thanks to **alphaZomega** for his great work)
* Some basic knowledge of what are you doing (Seriously)

First and foremost you need to have the raw files of the game extracted If not, use the latest release of **CP77 Tools** and extract the archive. You also need to extract and unbundle the **lang\_eng\_text** archive for this tutorial.

Now that you have the raw files, head to the "quest" folder (found here: \[...]\basegame\_4\_gamedata\base\quest) then chose a quest from one of the sub folders:

* main\_quests (the main story quest, internally labled as **qxxx**)
* minor\_quests (minor activites such as psycho sighting... etc, internally labeled **mqxxx**)
* side\_quests (the side gigs such as Judy's quest, River's story... etc, internally labled as **sqxxx**)

For this guide, we're going to use the one named **MQ041**, also known as _**"War Pigs"**_, avaialable only for the Corpo lifepath.\
You should find it here: \[...]\basegame\_4\_gamedata\base\quest\minor\_quests

We want to make the main character say a different line then the one he is supposed to. For example replacing "_Hey, yeah, sure. Damn, you ol' bastard, been a while since..._" with "_**Fuuuck!**_" when the holocall starts.

You should have also unbundled and uncooked the lang\_eng\_text archive.

Okey, now that everything is clear, let's start.\
**1.** Open the scenes folder inside MQ041, and then open the file named **mq041\_corpo\_01\_deadmans\_switch.scene** in 010Editor with _**alphaZomega's**_ CP77\_CR2W.bt template already installed.

**2.** Go to **struct Data,** open **scnSceneResource**, then **scnscreenplayStore**; inside you're going to find an array named **scnscreenplayDialogLine**\
**3.** We're going to associate each entry with the line we see on screen; to do so we need the **locstringIds** and another file you can get from the **lang\_eng\_text** archive\
**4.** Next, open the **lang\_eng\_text** archive and search for **mq041** here: \[...]\lang\_en\_text\base\localization\en-us\subtitles\quest\
**5.** Once found the quest folder open the .json named **mq041\_corpo\_01\_deadmans\_switch**\
**6.** Open struct Data, then **JsonResource**, **handle:iSerializable, localizationPersistenceSubtitleEntry** and finally **array:localizationPersistenceSubtitleEntry**\
**7.** Here in the value column you're going to see lots of stringId; remember the **locstringIds** from point **3**? Good! They're the same\
**8.** We now know that stringId = **1822802647440039936** is responsible for "_Hey, yeah, sure. Damn, you ol' bastard, been a while since..._", and that stringId = **1874801294016040960** is the same as "_Fuuuck!_"\
**9.** Let's go back to the the **array** mentioned in point **3**; first thing we do is swap the two the **locstringIds**\
**10.** Once that is done we need to swap the names we see on the left; in this case **m\_194BE559A84E2000** with **m\_1A04A1D80244D000**; we can do that by simply going in the **CName** array and replacing their entries.\
**11.** Once that is done be sure to **save, pack** and put the archive in your **Mod** folder

\[PLACEHOLDER FOR A VIDEO]
