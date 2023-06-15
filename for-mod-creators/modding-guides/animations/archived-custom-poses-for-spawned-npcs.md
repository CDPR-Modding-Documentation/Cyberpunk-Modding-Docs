# Archived: Custom poses for spawned NPCs

## Summary <a href="#summary" id="summary"></a>

**Created by @Pinkydude**\
**Published Summer 2021**

{% hint style="danger" %}
As with AMM 2.0,  this guide is rather obsolete, but will be kept archived!
{% endhint %}

![](../../../.gitbook/assets/0)

![](<../../../.gitbook/assets/1 (4)>)

What you’ll need :

* [AMM](https://www.nexusmods.com/cyberpunk2077/mods/790) (or any other mods that spawn characters)\

* [WolvenKIT](https://github.com/WolvenKit/WolvenKit/releases) or the game files extracted\
  _\[basegame\_4\_animation.archive]_\

* The 010 hex editing software with the CP77 template as well as the scripts\
  [(I recommend joining the CP77 Modding server to grab those!)](https://discord.gg/fvNFPhJh8h)\

* The WolvenKIT console (CP77Tools)

![](<../../../.gitbook/assets/2 (2)>)

I’ll assume you already know some basic modding\
(extracting the files with the console or WKit etc)

It’s important to also know that some characters have their own locomotion files (meaning unique pathing etc) Like Panam, Goro etc

I won’t go over every single ones here!

For this tutorial, I’ll make an animation for **Mitch**, who uses the **Man Average Civilian Locomotion** (MAC)

The MAC locomotion **\[man\_average\_civilian\_locomotion.anims]** is located here **\[base\animations\npc\generic\_characters\male\_average\locomotion]**

![](<../../../.gitbook/assets/3 (3)>)

This will be the path of your mod!

To grab an animation, you’ll have to go into the Animations folder, there you’ll see multiple other folders- the \[**main\_quests**] and **\[side\_quests]** have unique animations not used by any other characters outside of that that specific quest!

![](../../../.gitbook/assets/4)

For example, q103 is Ghost Town, the start of Panam’s quest line

I’ll use the animation of Mitch hugging Panam when we meet them at the camp!

Once you find the animation you wish to use, simply copy and paste it in your last folder in your mod project, the \[**locomotion**] folder, and rename the .anims file with the character’s locomotion file’s name, in Mitch’s case its **\[man\_average\_civilian\_locomotion**]

Once pasted and renamed, you can now open the .anims file in 010!

A lot of .anims file actually have multiple animation inside of it to choose from, simply open the \[**struct DATA**] handle to expand the list. Since mine is an unique animation, there’s only one \[**animAnimation**]

![](<../../../.gitbook/assets/5 (2)>)

I’ll now click on the \[CNAMES] handle and use the PASTE script

(I recommend setting a shortkey, you’ll use it a lot for custom poses among other things!)

![](../../../.gitbook/assets/6)

A window should pop up asking for an input : Here, type \[**idle\_stand**]

(this is the name of the idle animation the NPCs use when spawned!)

![](<../../../.gitbook/assets/7 (3)>)

This will add a new CNAME to the list. Now, go back into \[**struct DATA**] and open up the \[**animAnimation**] you wish to grab!

The new CNAME we added will automatically be the last one in the list, not wasting time by checking what number it has, I simply put a really large number to be sure to grab the last name in the list!

Click on the OG name and simply put **500** with the numpad to change the CNAME to \[**idle\_stand**]

![](<../../../.gitbook/assets/8 (2)>)

Save your file and pack your mod! You’re done!

Load a save file, spawn any character using the MAC locomotion and VOILA 💛

![](<../../../.gitbook/assets/9 (2)>)
