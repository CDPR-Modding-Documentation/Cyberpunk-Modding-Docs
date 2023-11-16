# ❕ Quests

Apartments are good for learning as they have a questphase side (_which is what the whole game is made of basically_) and a scene file side, which has the choices, animations, buff from sleeping, timeskip from sleeping, audio in the shower.

<mark style="background-color:orange;">**.questphases**</mark> are basically just graphs, with maybe a couple of #noderefs for loading prefabs for the phase and they connect everything up with handlerefs to handle ID's in their socket setups.

## Visualize .questphase files

In order to visualize the quest on wolvenkit we need to localize a Questphase file which contains quests progression:

The following graph is a visualization of the Questphase file:

```
/dlc\dlc6_apart\loc_dlc6_apart_hey_gle\quest\phases\dlc6_apart_hey_gle.questphase
```

<figure><img src="../../../.gitbook/assets/image (89).png" alt=""><figcaption><p>Node editor</p></figcaption></figure>

### To visualize Questphase in Wolvenkit we need to:&#x20;

* Localize a .questphase file.&#x20;
* &#x20;Add it to the project or open without adding to the project (image A)
* When you visualize the .questphase you'll see first a "resource" window with all the questphase dependencies/archives and info. (Image B)
* Switch to Graph editor on the tabs (image C)



<figure><img src="../../../.gitbook/assets/WKit - F.jpg" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Type=Up.png" alt=""><figcaption></figcaption></figure>

#### Resources

In this [gitbook there is a list of questphase](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/questphase.txt)[ ⇗ files](https://github.com/DoctorPresto/Cyberpunk-File-Types/blob/main/questphase.txt)

