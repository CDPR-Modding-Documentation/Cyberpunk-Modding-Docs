# Archived: Custom bodyhair for NPCs

## Summary <a href="#summary" id="summary"></a>

**Created & Published**: Summer 2021 **by @Pinkydude**

![](<../../../.gitbook/assets/0 (2)>)

![](../../../.gitbook/assets/1)

What you’ll need :\\

* [WolvenKIT](https://github.com/WolvenKit/WolvenKit/releases) or the game files extracted\
  \&#xNAN;_\[basegame\_4\_animation.archive]_\\
* The 010 hex editing software with the CP77 template as well as the scripts\
  [(I recommend joining the CP77 Modding server to grab those!)](https://discord.gg/fvNFPhJh8h)\\
* The WolvenKIT console (CP77Tools)

**🟨 WON’T WORK With AMM’s naked/shirtless custom appearances**

![](<../../../.gitbook/assets/2 (2)>)

I’ll assume you already know some basic modding\
(extracting the files with the console or WKit etc)

You need to grab the mesh you’re going to use as a body / chest and swap on the NPC. I made edit to mine, but I used the “**t0\_000\_ma\_base\_\_full”** body

![](<../../../.gitbook/assets/3 (3)>)

Open the “**buffer 0″** and check the files list, search for the skintone your NPC is using. Mitch is using the “**male\_01\_ca\_pale.mi”** file

You can see I have it custom pathed already, but you can check the other files to see the path

![](<../../../.gitbook/assets/4 (2)>)

Go to the “**base\characters\common\skin\character\_mat\_instance\male\body”** folder and grab the .mi file corresponding to your NPC’s skin tone

Copy and Paste it in a custom folder created at the base of your mod

![](<../../../.gitbook/assets/5 (2)>)

Also create another folder where you will put the custom texture you want your NPC to use (edited or not)

![](../../../.gitbook/assets/6)

Let’s go back to our buffer 0 of our mesh

custom path your skintone, in my case “**male\_01\_ca\_pale.mi”**, to point to your custom folder. In my case **“base\materialinstances\male\_01\_ca\_pale.mi”**

Open that .mi file. That file point to another .mi file, that we also need to copy and paste in the custom folder, and then custom path

![](<../../../.gitbook/assets/7 (1)>)

It calls for another file, that we also have to copy and paste into the custom folder. That .mi file finally calls for the texture files! We custom path those as well

![](../../../.gitbook/assets/8)

Once you have the .mi files all custom pathed, and the texture custom pathed as well (don’t forget to save the edited files of course) you can custom path the one in the mesh buffer as well and save, then rebuild the mesh using the console (so that the edit in the buffer actually have an impact on the mesh!)

Copy that mesh, and create the folders that goes to your NPC’s main outfit, and swap one of the slot. I used Mitch’s jacket to load the body mesh

![](<../../../.gitbook/assets/9 (2)>)

That specific body mesh will now read and load the .mi files and .xbm files from your custom folders in the mod and your NPC should now have a different texture than your V!
