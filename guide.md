# guide

This document reproduces the troubleshooting flow from the original interactive guide. All links and targets are preserved. Use this as a reference for steps to diagnose and fix mod-related problems.

***

## start

Title: What platform do you have the game from?\
Description: This is _**important**_ information if you need help.

Options:

* Steam → uptodate\_q\_1
* Epic → uptodate\_q\_1
* GoG → uptodate\_q\_1
* Not allowed to say → pirate

***

## uptodate\_q\_1

Title: Is your game up-to-date?\
Description:\
The good news is, as long as your game is a legal copy, you can mod it.

Do you have the **most recent version** of Cyberpunk 2077?

Options:

* Yes → is\_your\_game\_crashing
* No → update\_a\_1

***

## update\_a\_1

Title: You need to update your game.\
Description:\
The Cyberpunk 2077 Community Modding Server only supports the most recent version of the game. If you want support, please update!

Options:

* OK! → is\_your\_game\_crashing
* I can't update → pirate

***

## update\_core\_mods

Title: Are your **core mods** up-to-date?\
Description:\
All the mods listed below must be on the **most recent version**

* [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
* [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
* [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)
* [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107)
* [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511)

You also should update these mods if you have them

* [CyberwareEx](https://www.nexusmods.com/cyberpunk2077/mods/9429)

Options:

* Yes → is\_your\_game\_crashing
* No → update\_dependencies\_start

***

## update\_dependencies\_start

Title: Let's update everything!\
Description:\
It's likely that the problem doesn't lie with Cyberpunk, but actually comes from something else. We'll now update everything that could be the problem.

Options:

* I did that already! → update\_core\_mods
* I want to reinstall the game now! → mod\_remover
* OK! → update\_visualc

***

## update\_visualc

Title: Update VisualC Redistributable\
Description:

* Download the latest VisualC Redistributable for 64-bit (x64) from [Microsoft](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)
* Run the setup
* If you already have it installed, **repair** your installation
* Restart your computer (this step is **not optional**)

Does the game start now?

Options:

* Yes → success
* No → update\_dependencies\_02

***

## update\_dependencies\_02

Title: Repair VisualC Redistributable\
Description: If you did not reboot your computer, **do it now**.

You can skip this step if you already repaired an existing install of VisualC.

* Run the setup again
* Repair the existing installation
* Restart your computer (this step is **not optional**)

Does the game start now?

Options:

* Yes → success
* No → update\_dependencies\_03
* Actually, I came here from RED4ext... → crashing\_red4ext\_02

***

## update\_dependencies\_03

Title: Install .NET Desktop Runtime\
Description: Make sure that you have the most recent version of the [.NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.3-windows-x64-installer) installed.

Does the game start now?

Options:

* Yes → success
* No → update\_dependencies\_04

***

## update\_dependencies\_04

Title: Update Windows\
Description: Make sure that your Windows is up-to-date. You don't need to install Windows 11 for this, but make sure that you have all [updates](https://support.microsoft.com/en-us/windows/get-the-latest-windows-update-7d20e88c-0568-483a-37bc-c3885390d212) installed. Reboot the computer if Windows wants you to.

Does the game start now?

Options:

* Yes → success
* No → update\_dependencies\_05

***

## update\_dependencies\_05

Title: Update your graphics driver\
Description: Since VisualC and Windows are up-to-date, this only leaves your GPU driver. Download and install the latest version:

* [Nvidia](https://www.nvidia.com/en-in/drivers/nvidia-update/)
* [AMD](https://www.amd.com/en/support/download/drivers.html)

Reboot your computer if the setup asks you to.

Does the game start now?

Options:

* Yes → success
* No → update\_dependencies\_06

***

## update\_dependencies\_06

Title: Do a clean install of your graphics driver\
Description: Maybe your graphics driver has gotten corrupted. Do a clean install.

* For NVIDIA, download and run [Display Driver Uninstaller](https://www.guru3d.com/download/display-driver-uninstaller-download/) first
* For AMD, you can use their [Cleanup Utility](https://www.amd.com/en/resources/support-articles/faqs/GPU-601.html)

Then, reinstall the driver you updated in the previous step.

Does your game start now?

Options:

* Yes → success
* No → uptodate\_q\_1
* For NVIDIA user → update\_dependencies\_NVIDIA

***

## update\_dependencies\_NVIDIA

Title: Try rolling back your driver version\
Description: NVIDIA sometimes introduces issues with their drivers that cause the game to crash. Repeat the instructions from the previous step, but install one of these drivers:

* [NVIDIA GeForce Driver Version 556.45 Hotfix](https://international-gfe.download.nvidia.com/Windows/566.45hf/566.45-desktop-notebook-win10-win11-64bit-international-dch.hf1.exe)
* [NVIDIA GeForce Driver Version 556.36 WHQL](https://us.download.nvidia.com/Windows/566.36/566.36-desktop-win10-win11-64bit-international-dch-whql.exe)

Does your game start now?

Options:

* Yes → success
* No → uptodate\_q\_1

***

## is\_your\_game\_crashing

Title: Is your game crashing?

Options:

* Yes → crashing\_q\_2
* No, and I just want this to work! → mod\_remover
* No → misc\_start

***

## crashing\_q\_2

Title: When does the game crash?\
Description: We can tell what the problem is by checking **when** the game crashes. Which of the following options describes your crash?

Options:

* It doesn't even start → crashing\_cybercmd
* Before the menu → crashing\_cet\_01
* When loading a savegame → crashing\_world\_start
* At a specific point → crashing\_script\_mod\_start
* At a random point → crashing\_random\_start

***

## linux\_q\_2

Title: Linux mod installs\
Description: For Linux, there are a few specific steps that you have to follow. Follow [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/modding-on-linux) on our wiki. Does the problem go away?

Options:

* Yes → crashing\_q\_2
* I'm not on Linux → crashing\_q\_2
* No → is\_your\_game\_crashing

***

## crashing\_cybercmd

Title: Do you have CyberCMD installed?\
Description: If you have the mod **CyberCMD** installed, remove it now. It does the same thing as [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380), which you should install instead.

Can you start the game now?

Options:

* Yes! → success
* No → crashing\_errormsg
* I don't have it → crashing\_errormsg

***

## crashing\_errormsg

Title: Do you see an error message?\
Description: Do you see an error message, and does it contain... (please see options)

Options:

* No error message → crashing\_red4ext\_01
* Not listed → crashing\_red4ext\_01
* "`could not move 'xxx' to '...\\modded\\tweakdb_ep1.bin'`" → delete\_the\_cache
* Red4ext could not be loaded → update\_visualc
* Redscript compilation failed → delete\_the\_cache
* XML document parsed with errors → crashing\_xml\_document\_errors
* something about files → misc\_something\_something\_files

***

## crashing\_xml\_document\_errors

Title: XML document parsed with errors\
Description: Does the error message mention the file `r6/config/inputUserMappings.xml`?

Options:

* Yes → input\_loader\_error

***

## input\_loader\_error

Title: Input Loader\
Description: This error is caused by [Input Loader](https://www.nexusmods.com/cyberpunk2077/mods/4575).

Options:

* OK, what do I do now? → broken\_mod

***

## crashing\_xml\_document\_not\_sure

Title: Unknown mod\
Description: We're not sure which mod is the cause of your error, or if it's a base game problem. Delete the offending file, and verify your game files.

Does the error go away?

Options:

* Yes → success
* No, and I'm done with this shit → mod\_remover
* No → is\_your\_game\_crashing

***

## crashing\_redscript\_compilation\_failed

Title: Redscript compilation failed\
Description: You have **cleared your cache** and **verified files**, but the game is still crashing. Let's try [updating redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511).

Is your problem gone?

Options:

* Yes → success
* No → crashing\_redscript\_compilation\_failed\_02

***

## crashing\_redscript\_compilation\_failed\_02

Title: Redscript compilation failed\
Description: Does the popup include a list of mods that cause the error?

Options:

* Yes → crashing\_redscript\_compilation\_failed\_03
* No → crashing\_redscript\_compilation\_failed\_04

***

## crashing\_redscript\_compilation\_failed\_03

Title: This is caused by errors in...\
Description: The error names a number of mods. Let's check each of them - note them down.

Options:

* OK → broken\_mod
* I already have → crashing\_redscript\_compilation\_failed\_04

***

## crashing\_redscript\_compilation\_failed\_04

Title: You can't get rid of the errors\
Description: You verified everything that could be the problem, but the error doesn't go away. Here's what you can do now:

Options:

* Update the core mods → update\_core\_mods
* Nuke your mods and start over → mod\_remover

***

## delete\_the\_cache

Title: Delete the cache and verify your game files\
Description:

* Go to your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)
* Find the subfolder `r6\cache`
* Delete the **entire folder**.
* Now, verify your game files.

Does the game start now?

Options:

* Yes → success
* No (I have a redscript error) → crashing\_redscript\_compilation\_failed
* No → crashing\_q\_2

***

## crashing\_red4ext\_01

Title: Red4Ext is not working\
Description: You have a problem with Red4Ext (or one of its dependencies). Let's update them:

## Update red4ext and its dependencies

* [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
* [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
* [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)

Does that make the problem go away?

Options:

* Yes! → success
* No... → update\_visualc

***

## crashing\_red4ext\_02

Title: Red4Ext is not working\
Description: You have a problem with Red4Ext (or one of its dependencies), and neither updating them nor updating VisualC fixed it. Now it's time to check the log files.

* Go to your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)
* Go to the subfolder `red4ext\logs`
* Find the most recently changed file, and open it with a text editor such as [Notepad++](https://notepad-plus-plus.org/downloads)
* Look out for lines with `[error]`, then try to resolve the problems.

If you need help, you can check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting/finding-and-reading-log-files#making-sense-of-them) or [find us on Discord](https://discord.gg/redmodding) in the mod-troubleshooting channel.

Options:

* OK! → success

***

## crashing\_world\_start

Title: Can you start a new game?\
Description: Instead of loading an existing save, can you start a new game?

Options:

* Yes → crashing\_weather\_mod\_q
* No → crashing\_archive\_mod

***

## crashing\_weather\_mod\_q

Title: Is it a weather mod?\
Description: Did you recently install any mods that change or influence the **weather**?

Options:

* Yes → crashing\_weather\_mod\_a
* No → crashing\_archive\_mod

***

## crashing\_weather\_mod\_a

Title: 404 - Weather not found\
Description: The game is trying to access a weather that doesn't exist, and is crashing. Reinstall the weather mod from Nexus and follow its uninstall instructions, then remove it again.

Can you load your save now?

Options:

* Yes! → success
* No → crashing\_archive\_mod

***

## crashing\_archive\_mod

Title: A broken item\
Description: The game is trying to load a broken **item** and is crashing when trying to spawn it into the world. In the next step, we'll find out which item it is. You need to examine the following folders inside your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory):

* `\archive\pc\mod`
* `\mods` (it can be empty)

Options:

* OK! → bisect\_known\_folder\_start

***

## crashing\_script\_mod\_start

Title: You have a broken script mod\
Description: At some point during your gameplay, a script mod is trying to do something that makes the game crash. Unfortunately, there won't be any log files to help you.

In the next step, we'll find out which script mod it is. You need to examine the following folders inside your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory):

* `\r6\scripts`
* `\bin\x64\plugins\cyber_engine_tweaks\mods`

Options:

* OK! → bisect\_known\_folder\_start

***

## crashing\_random\_start

Title: Do you have Material Texture Override installed?\
Description: Do you have the mod [Material Texture Override](https://www.nexusmods.com/cyberpunk2077/mods/5266) installed?

Options:

* Yes → crashing\_random\_mto
* No → crashing\_random\_01

***

## crashing\_random\_01

Title: ... in the inventory?\
Description: Do you crash while managing your inventory?

Options:

* Yes → crashing\_random\_crowd\_scanner\_q
* No → crashing\_random\_03

***

## crashing\_random\_03

Title: We can't narrow down the problem\
Description: It's really difficult to tell what kind of mod is causing the problem. You have two options now:

Options:

* Bisect → bisect\_start
* Nuke mods and start clean → mod\_remover

***

## crashing\_random\_mto

Title: Uninstall MTO\
Description: Material Texture forces the game to regenerate its materials rather than relying on cached files. That's a requirement for any mods that change base game materials, but unfortunately, it can expose bugs that CDPR never fixed.

Remove Material Texture Override and see if the crash goes away.

Options:

* It's gone! → success
* It's still there → crashing\_random\_03

***

## crashing\_random\_crowd\_scanner\_q

Title: Do you have these mods installed?\
Description: Do you have these mods installed?

* [Kiroshi Opticals](https://www.nexusmods.com/cyberpunk2077/mods/1654)
* [Tooltips Fixer](https://www.nexusmods.com/cyberpunk2077/mods/8560)

Options:

* Yes → crashing\_random\_crowd\_scanner\_a
* No → crashing\_random\_03

***

## crashing\_random\_crowd\_scanner\_a

Title: Uninstall either or both of those mods\
Description: These two mods do not play nice with each other — try uninstalling one or both.

Does this resolve your problem?

Options:

* Yes! → success
* No → crashing\_random\_03

***

## crashing\_cet\_01

Title: You have a problem with a CET mod\
Description: Your problem sits in the following folder inside your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory): `bin\x64\plugins\cyber_engine_tweaks\mods` Open Windows Explorer and rename the folder to mods\_. Does your game start now?

If you need help, you can check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting/finding-and-reading-log-files#making-sense-of-them) or [find us on Discord](https://discord.gg/redmodding) in the mod-troubleshooting channel.

Options:

* Yes! → bisect\_cet\_00
* No... → crashing\_cet\_not\_bisect

***

## crashing\_cet\_not\_bisect

Title: You have a different problem with a plugin\
Description: Navigate three levels up until you are in the folder `bin\x64` and rename the entire folder `plugins` to `plugins_`. Does your game start now?

Options:

* Yes! → crashing\_reinstall\_cet
* No... → update\_dependencies\_start

***

## crashing\_reinstall\_cet

Title: Reinstall CET\
Description: Do a clean install of Cyber Engine Tweaks:

* If you are using a mod manager, make sure to delete the mod there
* Download the mod from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/107)
* Install it, and start the game. Does it work?

Options:

* Yes! → crashing\_reinstall\_cet\_move\_mods
* No... → mod\_remover

***

## crashing\_reinstall\_cet\_move\_mods

Title: Move the mods from your backup\
Description: Now that CET is starting again, let's get your mods back.

* Go to your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)
* From the old folder `plugins_`, move the `mods_` folder to your new CET install under `\bin\x64\plugins\cyber_engine_tweaks`
* You can delete `plugins_` now
* Rename the folder `mods_` in CET's directory to `mods` and start the game. Does it work?

Options:

* Yes! → success
* No... → bisect\_cet\_00

***

## mod\_remover

Title: Your game is really really fucked\
Description: Don't worry, all is not lost. But instead of individual troubleshooting, it is faster to start from a clean game:

* Download [Mod Remover](https://www.nexusmods.com/cyberpunk2077/mods/8597) from Nexus
* Move the .bat or .exe file to [your game directory](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)
* If you are using MO2: Register the .bat or .exe as a tool in the mod manager
* Run the script
* **Verify your game files**

Does the game start now?

Options:

* Yes! → reinstalling\_mods\_start
* No... → update\_dependencies\_start
* That's it, I'm done → success\_but\_no

***

## reinstalling\_mods\_start

Title: Reinstalling mods\
Description: **STOP!** Do not just put your mods back! If you do that, you will be exactly where you were before running mod remover: with a broken game.

Install **only** the core mods, and make sure that they are on the most recent version (re-download if necessary):

* [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
* [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
* [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
* [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)
* [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107)
* [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511)

Does the game start with only core mods installed?

Options:

* Yes! → reinstalling\_mods\_01
* No... → update\_dependencies\_start

***

## reinstalling\_mods\_01

Title: Reinstalling mods, step 2\
Description: Now you can restore folders from your backup, one after the other:

* Copy a folder in the backup directory, e.g. `archive` (do not delete it)
* Paste it into the Cyberpunk 2077 game directory
* Check if the game still starts

At which folder does your game start crashing again?

Options:

* None! → success
* archive → reinstalling\_mods\_archive

***

## reinstalling\_mods\_archive

Title: Your problem is an .archive mod\
Description: The folder you will have to check is `archive/pc/mod`. Browse to `archive/pc`, and select it. Then, proceed to the next page.

Options:

* OK! → bisect\_known\_folder\_start

***

## bisect\_start

Title: How to quickly find the broken mod\
Description: Bisect is a **binary search** and the fastest way to find your broken mod. You don't know which folder it is, so you'll have to do all 4 of them. You can find step-by-step instructions on the [wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#bisect-video-demonstration). If you are a visual learner, you will find a short video at the end of the section.

You have to examine the following folders inside your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory):

* `archive\pc\mod`
* `r6\scripts`
* `r6\tweaks`
* `bin\x64\plugins\cyber_engine_tweaks\mods`

Options:

* Sounds scary, but I'll do it → bisect\_known\_folder\_start
* I just want to start over clean → mod\_remover

***

## bisect\_cet\_00

Title: How to quickly find the broken mod\
Description:

* Go to your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)
* Create a new empty folder `bin\x64\plugins\cyber_engine_tweaks\mods`
* Open the folder `mods_` and move half of the files and folders to `mods`

Does the game still start?

Options:

* Yes! → bisect\_cet\_01
* No... → crashing\_cet\_not\_bisect

***

## bisect\_cet\_01

Title: Finding the broken CET mod\
Description: Go to your [Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory) The folder you need to examine is `bin\x64\plugins\cyber_engine_tweaks\mods`. Proceed to the next step! (You have already completed item 1, so start at 2)

Options:

* OK → bisect\_known\_folder\_start

***

## bisect\_known\_folder\_start

Title: Let's get those mods examined\
Description: You have found out which **folder** holds the containing mod. If you don't, you can check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#which-kind-of-mod-is-it).

Use the stepper below to perform the bisect (binary search) in the folder you identified.

{% stepper %}
{% step %}
### Step 1 — Backup the folder

Re-name it by adding a \_ to its name (e.g. `mods` => `mods_`). This is your **backup**.
{% endstep %}

{% step %}
### Step 2 — Create a clean game folder

Create a new empty folder with the old name. This is the **game folder**.
{% endstep %}

{% step %}
### Step 3 — Move half the contents

Move **half** of the folder content (files and folders) from the backup to the game folder.

Is your problem back?
{% endstep %}
{% endstepper %}

Options:

* No! → bisect\_not\_these\_mods
* Yes... → bisect\_mods\_found\_01

***

## bisect\_not\_these\_mods

Title: These mods are okay\
Description: Now we know which mods **aren't** the problem. Open your backup (with the \_), and once again copy **half of the files and folders** to your game folder.

Is your problem back?

Options:

* No... → bisect\_mods\_found\_01
* Yes! → bisect\_not\_these\_mods
* I know which mod it is! → bisect\_found\_the\_mod

***

## bisect\_not\_these\_mods\_02

Title: These mods are okay\
Description: The mods you just copied are not the problem. Go to your backup folder (with the \_).

* If you moved mods back out of the game dir: Copy half of those
* If you didn't move mods back: Copy half of the total remaining mods

Is your problem back?

Options:

* No... → bisect\_mods\_found\_01
* Yes! → bisect\_not\_these\_mods
* I know which mod it is! → bisect\_found\_the\_mod

***

## bisect\_mods\_found\_01

Title: We're getting closer!\
Description: You just copied a bunch of mods from your backup dir to the game dir, and now your problem is back. That means that the broken mod was part of the batch you just copied. Move **half** of the folder content you just copied into the backup folder again.

Is your problem still there?

Options:

* Yes... → bisect\_mods\_found\_02
* No! → bisect\_mods\_found\_02
* I know which mod it is! → bisect\_found\_the\_mod

***

## bisect\_mods\_found\_02

Title: These weren't it\
Description: You just moved half of a batch back out of the game folder, and your problem is still there → the batch you copied were okay. From the remaining half, take **half** of the mods again, and move them to the backup folder.

Is your problem still there?

Options:

* Yes... → bisect\_mods\_found\_02
* No! → bisect\_mods\_found\_03
* I know which mod it is! → bisect\_found\_the\_mod

***

## bisect\_mods\_found\_03

Title: The mod is in those files!\
Description: You just moved a batch of mods out of the game folder into the backup folder (with the \_), and your problem went away. That means your problem child is one of the mods you just moved. Take **half** of them and put them back into the game folder.

Is your problem back?

Options:

* Yes... → bisect\_mods\_found\_02
* No! → bisect\_mods\_found\_03
* I know which mod it is! → bisect\_found\_the\_mod

***

## bisect\_found\_the\_mod

Title: You found the culprit!\
Description: Congratulations! You found out which mod it is! Hit up its Nexus page and check the following:

* Can you update it? If yes, do so
* Is there a comment page? If yes, maybe it is no longer compatible with the current patch.

Options:

* Cool! → success
* That doesn't help! → broken\_mod

***

## broken\_mod

Title: A broken mod\
Description: You have a mod, but it's broken. What do we do now?

Options:

* Check its dependencies → misc\_dependencies
* Did you update recently? → outdated\_mod
* I will play without it :( → success\_but\_no

***

## outdated\_mod

Title: Is the mod outdated?\
Description: If the mod stopped working after you updated your game, it's possible that it is simply not up-to-date yet. Here are your options:

* Play without it
* Wait for the mod author to update it (if you ask, please ask **politely**)
* Try and fix the mod yourself (this can be hard, but you are welcome on our [discord](http://discord.gg/redmodding) in `#mod-dev-chat`)!

The safest way to find out is to...

Options:

* read the fucking manual → rtfm
* Actually, I have a redscript error → crashing\_redscript\_compilation\_failed\_03
* I will play without it :( → success\_but\_no

***

## rtfm

Title: Read the fucking manual\
Description: Open the mod's Nexus page. Do the following things:

* **Read the mod description**. We get it, reading is hard, but somebody wrote all that text just for you!
* Open the comments tab. Is there a sticky comment? Read it.
* Check the first two comment pages. Are a lot of people reporting the same bug? Is there a solution that you can try?
* Is there a bug section? Check it out. If there are no bugs, you could file one.

Options:

* There was no solution ;( → success\_but\_no
* I'll just play without the mod → success

***

## misc\_start

Title: Are you on Linux?\
Description: Your game is not crashing, and you have a different issue. The first question is - are you on Linux?

Options:

* Yes → linux\_01
* No → misc\_q\_01

***

## misc\_q\_01

Title: Is it an inactive mod?\
Description: Is your problem that a mod isn't working?

Options:

* yes → misc\_mod\_not\_working
* no → misc\_q\_02
* I don't know what that is → misc\_q\_02

***

## misc\_q\_02

Title: Do you have any sp0 mods?\
Description: Do you have any mods by Nexus user `spawn0000` (also known as sp0)?

Options:

* Yes → misc\_uninstall\_sp0
* Of course not! → misc\_skip\_loading\_screen\_question

***

## misc\_skip\_loading\_screen\_question

Title: Are you stuck in the loading screen?\
Description: Are you stuck in the initial loading screen before the menu?

Options:

* Yes → input\_loader\_error
* No → unspecified\_problem

***

## misc\_uninstall\_sp0

Title: Uninstall sp0 mods\
Description: The modder uses outdated technologies and is infamous for causing compatibility issues. He is the only person who can change that, but he is not interested. Your best option at this point is to uninstall his mods and find a better body. You can find a list on [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/npcs/custom-tattoos-and-scars/converting-between-tattoo-frameworks#which-texture-frameworks-exist) (scroll down a little)

Does that make your problem go away?

Options:

* Yes → success
* No → unspecified\_problem
* I don't want to uninstall my cement tits! → success\_but\_no

***

## misc\_something\_something\_files

Title: You have a problem with file permissions\
Description: Please check the [troubleshooting guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#something-something-files), section "Something something files", and follow the instructions.

Does this make your problem go away?

Options:

* yes → success
* no → crashing\_errormsg

***

## misc\_mod\_not\_working

Title: An inactive mod\
Description: You're not on Linux and one of your mods isn't working. Are you using the mod manager **mo2**?

Options:

* yes → mo2\_01
* no → misc\_dependencies

***

## misc\_dependencies

Title: Install the mod's dependencies\
Description: You need to install all of the mod's dependencies, but here's the catch: you need to install **their** dependencies as well. Check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting/requirements-explained) for more intel.

Does the problem go away?

Options:

* yes → success
* no → broken\_mod

***

## mo2\_01

Title: You're using mo2\
Description: When modding with mo2, you need to install the following mods **manually**:

* [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107)
* [RED4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)

Does that make your problem go away?

Options:

* Yes → success
* no → mo2\_02

***

## mo2\_02

Title: The problem persists\
Description: Since mo2 was originally intended for Bethesda games, we don't know terribly much about it. You can find everything that we _do_ know on our [wiki page](https://discord.com/channels/717692382849663036/788090406416023582/1326240275458424853). If that doesn't help, you can hit up [their Discord](https://discord.gg/ewUVAqyrQX).

Options:

* OK :/ → success\_but\_no

***

## linux\_01

Title: You are modding on Linux\
Description: If you are on Linux, there are a few specific steps that you have to follow - see [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/modding-on-linux) on our wiki. Does the problem go away?

Options:

* Yes → success
* No → linux\_02

***

## linux\_02

Title: The Linux guide didn't help you\
Description: Double-check the troubleshooting section. If the steps listed there don't help you, then it's likely that we can't either. You're nonetheless welcome to ask for help on our [discord](http://discord.gg/redmodding) in the `#mod-troubleshooting` channel, but you're probably better-off if you find a Linux-specific community.

Options:

* OK → success

***

## success

Title: Progress!\
Description: Awesome! You solved a problem! Does your game start now?

Options:

* Yes! → sponsors
* No → q\_bisect\_in\_progress
* I'll just reinstall my game → mod\_remover

***

## q\_bisect\_in\_progress

Title: Are you bisecting?\
Description: Are you currently bisecting your mods?

Options:

* Yes → bisect\_mods\_found\_01
* No → start

***

## success\_but\_no

Title: Sorry!\
Description: It seems we're at the end of our options, choom. Sorry! Feel free to ask for help on our [discord](http://discord.gg/redmodding) in the `#mod-troubleshooting` channel, though.

Options:

* OK! → sponsors

***

## unspecified\_problem

Title: The problem is in another castle\
Description: It seems that you have a problem that the interactive troubleshooter does not cover yet. Please check our [troubleshooting wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting). You can use your browser's search function (Ctrl+F), or check for your problem in the table of contents or the list at the start of the page.

Options:

* Fuck this, I'm reinstalling the game → mod\_remover
* OK! → sponsors

***

## sponsors

Title: Check out our sponsors\
Description: The Cyberpunk 2077 modding community wishes you a good trip to Night City! There are many great things you can do:

* Shoot gonks! Check the vending machines of our sponsor **Budget Arms** for some cheap iron!
* Kiss joytoys! Head to Jig Jig Street, live your best life, and scan the QR code at Wakako's pachinko parlor to enter a free giveaway!
* Get run over by cars: Just stand on a road somewhere and go flying. Whee! Quality medical care at Viktor's Vector in Watson!

Disclaimer: Johnny Silverhand has many suggestions as well. We suggest to ignore his advice, and won't be liable for any damage of property or persons if you don't.

***

## pirate

Title: We won't help you\
Hide back: true\
Description: You can read the full reasons [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#you-pirated-the-game). Feel free to peruse the troubleshooting guide, but we won't help you until you buy your game.

You can get it here:

GOG.com (CD Projekt)\
Buying Cyberpunk 2077 from Good Old Games (GOG.com) directly supports CD Projekt RED, as it is their own platform!

* [Base Game](https://www.gog.com/en/game/cyberpunk_2077)
* [Phantom Liberty](https://www.gog.com/en/game/cyberpunk_2077_phantom_liberty)
* [Ultimate Edition](https://www.gog.com/en/game/cyberpunk_2077_ultimate_edition)

Steam (Valve)

* [Base Game](https://store.steampowered.com/app/1091500/Cyberpunk_2077/)
* [Phantom Liberty](https://store.steampowered.com/app/2138330/Cyberpunk_2077_Phantom_Liberty)
* [Ultimate Edition](https://store.steampowered.com/bundle/32470/Cyberpunk_2077_Ultimate_Edition/)

Epic Games Store (Epic Games)

* [Base Game](https://store.epicgames.com/p/cyberpunk-2077)
* [Phantom Liberty](https://store.epicgames.com/p/cyberpunk-2077--phantom-liberty)
* [Ultimate Edition](https://store.epicgames.com/en-US/p/cyberpunk-2077--ultimate-edition)

Options:

* OK, I bought the game! → start
* I can't afford the game! → sucks\_to\_be\_poor
* Fuck you, no! → fuck\_off

***

## sucks\_to\_be\_poor

Title: Sorry, choomba\
Description: We get it, it sucks to be poor, but pirated games do not mod well. If you don't care for an explanation, we can't help you any further.

Options:

* OK ;( → sponsors

***

## fuck\_off

Title: We appreciate your business\
Description: The Cyberpunk 2077 Modding Community Support Team (which consists exclusively of unpaid volunteers) is glad that the interactive troubleshooter could identify your problem. Please do not ask for help on Discord, as piracy violates the TOS and we'd like to keep our server.

Options:

* OK → sponsors

***

Notes:

* The bisect procedure (binary search) was converted into a stepper for clarity.
* All links and targets are preserved as in the original source.
* If you want this converted into actual interactive GitBook pages or into a single flow with buttons, tell me which format you want (individual pages, one long page, or interactive logic), and I can reformat it accordingly.
