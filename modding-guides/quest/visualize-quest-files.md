---
description: First steps into find quest archives.
---

# Visualize Quest files

Missions or quests are organized into separate files that contain nodes or references to other "files" called Questphases and Scenes.

Apartments provide a good learning opportunity because they consist of a questphase side, which forms the core of the entire game, and a scene file side, which includes choices, animations, buffs obtained from sleeping, timeskips resulting from sleeping, or audio in the shower.

**Questphases** can be thought of as graphs that may contain a few #noderefs, which are used to load prefabs for the phase. The questphases are connected together using handlerefs, which handle IDs in their socket setups.

## Visualize .questphase files

In order to visualize the quest on wolvenkit we need to find or locate a Questphase file that represents the progression of quests:

The following graph is a visualization of the Questphase file:

```
/dlc\dlc6_apart\loc_dlc6_apart_hey_gle\quest\phases\dlc6_apart_hey_gle.questphase
```

<figure><img src="../../../.gitbook/assets/image (212).png" alt=""><figcaption><p>Node editor</p></figcaption></figure>

### To visualize Questphase in Wolvenkit we need to:&#x20;

* Identify and locate a .questphase file on the Asset browser.&#x20;
* Click on "Add it to the project" or "open without adding to the project" (image A)
* When you open the .questphase file you'll see first a "resource" window with all the questphase dependencies/archives and info. (Image B)
* Switch to Graph editor on the tabs (image C)



<figure><img src="../../../.gitbook/assets/WKit - F.jpg" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Type=Up.png" alt=""><figcaption></figcaption></figure>

#### Resources

In this [gitbook there is a list of questphase](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/questphase.txt)[ ⇗ files](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/questphase.txt)
