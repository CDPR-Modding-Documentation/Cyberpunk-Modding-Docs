# Custom Loading Screens

## Summary <a href="#summary" id="summary"></a>

**Created by @Pinkydude**\
**Published Summer 2021**

![](<../../../.gitbook/assets/0 (2)>)

![](<../../../.gitbook/assets/1 (2)>)

What you’ll need :\


* [Noesis](https://richwhitehouse.com/index.php?content=inc\_projects.php\&showproject=91)
* [WolvenKit](https://github.com/WolvenKit/WolvenKit/releases) or the extracted game files
* Photoshop / Art program

![](../../../.gitbook/assets/2)

I’ll assume you already know some basic modding\
(extracting the files with the console or WKit etc)

First of you’ll need to create your mod folder, it should look like this

![](../../../.gitbook/assets/3)

This is where the Loading screen image are stocked, so go in that exact same folder in your Game Extracts!

![](<../../../.gitbook/assets/4 (3)>)

Depending on the resolution you’re using, you’ll have to edit either the **4k** files or the **4k\_1080p** files

I personally need the 4k files ; There is **13 loading screens** in total, and you’ll need the .tga .dds and .xbm files for each one, meaning **39 files** in total in your mod folder

![](<../../../.gitbook/assets/5 (3)>)

Now open Photoshop, and edit the .tga files with your screenshots!

You’ll notice that the loading pics are vertically swapped;\
**be sure to also vertically swap your pics so that it’ll look normal in game**

![](<../../../.gitbook/assets/6 (3)>)

![](<../../../.gitbook/assets/7 (2)>)

Once you’re done editing all **13 .tga files**, you save them

We now open Noesis, and navigate to our mod folder

![](<../../../.gitbook/assets/8 (1)>)

You’ll need to Right Click on your .tga files and select Export, and change the **Main Output Type to .xbm**

![](<../../../.gitbook/assets/9 (1)>)

Click export, you should see a pop up window; simply click OK

![](../../../.gitbook/assets/10)

Once you’re done exporting all your 13 .tga files to .xbm, you can delete the .tga files from the mod folder _(or keep them somewhere else! remember to put them back in the mod folder to export them if you do want to edit them later)_

You should now have 52 files - the originals and your exported .xbm with “out” at the end of the name. Delete the originals and rename your exported .xbm to take out the “out” !

Then you’re left with 26 files, it should look like that :

![](../../../.gitbook/assets/11)

We now open CP77 Tools / Wolvenkit Console ! We need to rebuild the .xbm files

**cp77tools import -p \[PATH] –keep**

**Pack your mod and test it!**

![](../../../.gitbook/assets/12)
