---
description: This guide will show you how to install the custom tattoo replacer.
---

# How to import a custom tattoo replacer back into the game

**This guide was originally written by Halk and imported with their permission. You can find the original** [**here**](https://docs.google.com/document/d/18cTWSgzm0qlCnd0u4-FonRzS2hQXthgjNhjZil3wmAs/edit)**.**

{% hint style="info" %}
This is _just_ to import a custom tattoo into the game, in order to actually make your tattoo, you can use and follow the [Night City Tattoos](https://www.nexusmods.com/cyberpunk2077/mods/1155) guide on Nexus as it’s still pretty relevant and handy on how to make your first replacers.
{% endhint %}

This will help you from Step 6 and forward from NCT’s guide.

## **With WolvenKit**

1. After your tattoo is where you want it, and you’ve turned off all the other layers, **flip your file vertically** - do not just _rotate_, you gotta use the **Flip Canvas Vertical** option. Save your file as a **.png** on a **transparent background**.\
   From:\
   ![](<../../../.gitbook/assets/0 (1) (1).png>)\
   To:\
   ![](<../../../.gitbook/assets/1 (3).png>)
2. Open WKit and [create a new project](https://wiki.redmodding.org/wolvenkit/getting-started/creating-a-mod#starting-a-project), name it as you want your mod’s .archive to look like in the mod folder. Or not, I’m not your dad. **Do not save your WKit projects in the Cyberpunk folder.**
3. Your **Project Explorer** tab will look different, this is just how I like to organize my tattoo making by putting all my files in the same place. (Anything you put in the **RAW** folder will not make it to the game mod!)\
   \
   I’m replacing a Masc V body tattoo, so I need the **original .xbm file** of it to make my import. **This is where the “Help with file Names” document from NCT’s guide comes handy.**\
   \
   I’m replacing the Tattoo 1 in the Character Creator. The guide tells me that the name of its file is tattoo\_body\_\_customisation\_01. Since it’s for Masc V, I need the \_d01 variant.\
   \
   ![](<../../../.gitbook/assets/2 (2).png>)\
   \
   As you can see, I already have the file I need extracted and ready to use down there. Assuming you don’t, head over to the **Asset Browser** and look for the file you need. Again, refer to the document in NCT’s guide. **Double click** to add it to your project.\
   \
   Your Project Explorer tab will now look like this!

![](<../../../.gitbook/assets/3 (3).png>) ![](<../../../.gitbook/assets/4 (4).png>)

4. After you have the **.xbm** you need, replicate the **EXACT SAME PATHING** in the **Raw** folder. Put your **edited .png** there and **rename** it to **match the .xbm** of the tattoo you’re replacing. As such, for me, it’ll look like this:\
   \
   ![](<../../../.gitbook/assets/5 (2).png>)\

5. Head over to the **Import/Export Tool** window and make sure you’re in the **Import** tab. Find the **.png** you just renamed, select it, then click **“Process Selected”**.\
   \
   ![](<../../../.gitbook/assets/6 (3).png>)\
   \
   If everything went right, you will get a toast message from WKit informing you of that, and the Log tab will also say that the process was done. Still, you can double click on the **.xbm** of the **Archive** in the **File Explorer,** then head over to **Texture Preview** and check if your tattoo imported correctly. If it did, it’ll be **flipped back to the original orientation of the NCT guide you first worked on before flipping on Step 1**.\
   \
   ![](<../../../.gitbook/assets/7 (2).png>)\

6. Once everything is correctly set up, just click **Install** on the upper menu so it packs and installs your replacement to the game, then test it! _(I am not sure if you need to do anything else to use it as a REDmod, but I don’t use REDmod so I won’t guarantee it works if you just use “Install as REDmod”.)_

![](<../../../.gitbook/assets/8 (1) (1).png>) ![](<../../../.gitbook/assets/9 (1) (1).png>)
