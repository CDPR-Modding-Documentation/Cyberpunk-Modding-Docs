---
description: If your mods are causing trouble, here's what you can do
---

# 🆘 Troubleshooting

## Summary

This page contains[^1] troubleshooting[^2] information for people who are **using** mods rather than making mods. You will find step-by-step guides, grouped by different problems.

{% hint style="info" %}
Did you know?  You can use your browser's search function (Ctrl+F) to quickly find your problem on the page – simply type a word from your error message.
{% endhint %}

## Interactive guide

[Open it in a new window](https://wolvenkit.github.io/gitbook-debug-guide/)

{% @debugguide/debugguide content="# This YAML defines how Debug Guide behaves.
# Define steps and options where the user can go next.
# start is a required step, guide won't work without it:
start:
  title: What platform do you have the game from?
  description: |- # You can use markdown here
    This is ***important*** information if you need help.
  options:
    - label: Steam
      target: uptodate_q_1 # target is the next step
    - label: Epic
      target: uptodate_q_1
    - label: GoG
      target: uptodate_q_1
    - label: Not allowed to say
      target: pirate

uptodate_q_1:
  title: Is your game up-to-date?
  description: |- 
    The good news is, as long as your game is a legal copy, you can mod it. 

    Do you have the **most recent version** of Cyberpunk 2077?
  options:
    - label: Yes
      target: is_your_game_crashing # target is the next step
    - label: No
      target: update_a_1

update_a_1:
  title: You need to update your game.
  description: |- 
    The Cyberpunk 2077 Community Modding Server only supports the most recent version of the game. If you want support, please update!
  options:
    - label: OK!
      target: is_your_game_crashing
    - label: I can't update
      target: pirate

# ================
# core mods updating
# ================

update_core_mods:
  title: Are your **core mods** up-to-date?
  description: |- 
    All the mods listed below must be on the **most recent version** 
    - [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
    - [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
    - [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
    - [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)
    - [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107)
    - [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511)
    
    You also should update these mods if you have them
    - [CyberwareEx](https://www.nexusmods.com/cyberpunk2077/mods/9429)

  options: 
    - label: Yes
      target: is_your_game_crashing
    - label: No
      target: update_dependencies_start

# ================
# Updating Windows and dependencies
# ================

update_dependencies_start:
  title: Let's update everything!
  description: |-
    It's likely that the problem doesn't lie with Cyberpunk, but actually comes from something else. 
    We'll now update everything that could be the problem.
  options: 
    - label: I did that already!
      target: update_core_mods
    - label: I want to reinstall the game now!
      target: mod_remover
    - label: OK!
      target: update_dependencies_01


update_dependencies_01:
  title: Update VisualC Redistributable
  description: |- 
    - Download the latest VisualC Redistributable for 64-bit (x64) from [Microsoft](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)
    - Run the setup
    - If you already have it installed, **repair** your installation
    - Restart your computer (this step is **not optional**)
    
    Does the game start now?

  options: 
    - label: Yes
      target: success
    - label: No
      target: update_dependencies_02

update_dependencies_02:
  title: Repair VisualC Redistributable
  description: |-     
    If you did not reboot your computer, **do it now**. 
    
    You can skip this step if you already repaired an existing install of VisualC.
    - Run the setup again
    - Repair the existing installation
    - Restart your computer (this step is **not optional**)
    
    Does the game start now?
  options: 
    - label: Yes
      target: success
    - label: No
      target: update_dependencies_03
    - label: Actually, I came here from RED4ext...
      target: crashing_red4ext_02

update_dependencies_03:
  title: Install .NET Desktop Runtime
  description: |- 
    Make sure that you have the most recent version of the [.NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.3-windows-x64-installer) installed.
    
    Does the game start now?    

  options: 
    - label: Yes
      target: success
    - label: No
      target: update_dependencies_04

update_dependencies_04:
  title: Update Windows
  description: |- 
    Make sure that your Windows is up-to-date. You don't need to install Windows 11 for this, but make sure that you have all [updates](https://support.microsoft.com/en-us/windows/get-the-latest-windows-update-7d20e88c-0568-483a-37bc-c3885390d212) installed.
    Reboot the computer if Windows wants you to.
    
    Does the game start now?    

  options: 
    - label: Yes
      target: success
    - label: No
      target: update_dependencies_05

update_dependencies_05:
  title: Update your graphics driver
  description: |- 
    Since VisualC and Windows are up-to-date, this only leaves your GPU driver. Download and install the latest version:
    - [Nvidia](https://www.nvidia.com/en-in/drivers/nvidia-update/)
    - [AMD](https://www.amd.com/en/support/download/drivers.html)
    
    Reboot your computer if the setup asks you to.

    Does the game start now?    

  options: 
    - label: Yes
      target: success
    - label: No
      target: update_dependencies_06

update_dependencies_06:
  title: Do a clean install of your graphics driver
  description: |- 
    Maybe your graphics driver has gotten corrupted. Do a clean install. 
    - For NVIDIA, download and run [Display Driver Uninstaller](https://www.guru3d.com/download/display-driver-uninstaller-download/) first
    - For AMD, you can use their [Cleanup Utility](https://www.amd.com/en/resources/support-articles/faqs/GPU-601.html)
    
    Then, reinstall the driver you updated in the previous step.
    Does your game start now?

  options: 
    - label: Yes
      target: success
    - label: No
      target: update_dependencies_06

# ================
# crashing
# ================

is_your_game_crashing:
  title: Is your game crashing?
  options:
    - label: Yes
      target: crashing_q_2
    - label: No
      target: misc_start

crashing_q_2:
  title: When does the game crash?
  description: We can tell what the problem is by 
  options: 
    - label: It doesn't even start
      target: crashing_cybercmd
    - label: Before the menu
      target: crashing_cet_01
    - label: When loading a savegame
      target: crashing_world_start
    - label: At a specific point
      target: crashing_script_mod_start
    - label: At a random point
      target: crashing_random_start


linux_q_2:
  title: Linux mod installs
  description: |- 
    For Linux, there are a few specific steps that you have to follow. Follow [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/modding-on-linux) on our wiki.
    Does the problem go away?
  options:
    - label: Yes
      target: crashing_q_2
    - label: I'm not on Linux
      target: crashing_q_2
    - label: No
      target: is_your_game_crashing



# ================
# crashing: red4ext
# ================

crashing_cybercmd:
  title: Do you have CyberCMD installed?
  description: |-
    If you have the mod **CyberCMD** installed, remove it now.
    It does the same thing as [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380), which you should install instead.

    Can you start the game now?

  options: 
    - label: Yes!
      target: success
    - label: No
      target: crashing_red4ext_01
    - label: I don't have it
      target: crashing_red4ext_01

crashing_red4ext_01:
  title: Red4Ext is not working
  description: |-
    You have a problem with Red4Ext (or one of its dependencies). Let's update them:

    ## Update red4ext and its dependencies
    - [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
    - [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
    - [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
    - [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)

    Does that make the problem go away?

  options: 
    - label: Yes!
      target: success
    - label: No...
      target: update_dependencies_01

crashing_red4ext_02:
  title: Red4Ext is not working
  description: |-
    You have a problem with Red4Ext (or one of its dependencies), and neither updating them nor updating VisualC fixed it.     
    Now it's time to check the log files.
    
    Find the most recent file under:
    `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\red4ext\logs`
    and open it in a text editor. 

    Look out for lines with `[error]`, then try to resolve the problems. 

    If you need help, you can check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting/finding-and-reading-log-files#making-sense-of-them) or [find us on Discord](https://discord.gg/redmodding) in the mod-troubleshooting channel.

  options: 
    - label: OK!
      target: success
    
# ================
# crashing: after loading save
# ================
crashing_world_start:
  title: Can you start a new game?
  description: |-
    Instead of loading an existing save, can you start a new game?
  options: 
    - label: Yes
      target: crashing_weather_mod_q
    - label: No
      target: crashing_archive_mod

crashing_weather_mod_q:
  title: Is it a weather mod?
  description: |-
    Did you recently install any mods that change or influence the **weather**?
  options: 
    - label: Yes
      target: crashing_weather_mod_a
    - label: No
      target: crashing_archive_mod

crashing_weather_mod_a:
  title: 404 - Weather not found
  description: |-
    The game is trying to access a weather that doesn't exist, and is crashing. 
    Reinstall the weather mod from Nexus and follow its uninstall instructions, then remove it again.

    Can you load your save now?
  options: 
    - label: Yes!
      target: success
    - label: No
      target: crashing_archive_mod

crashing_archive_mod:
  title: A broken item
  description: |-
    The game is trying to load a broken **item** and is crashing when trying to spawn it into the world. 
    In the next step, we'll find out which item it is. You need to examine the following folders:
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\archive\pc\mod`
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\mods` (it can be empty)
  options: 
    - label: OK!
      target: bisect_known_folder_start


# ================
# crashing: script
# ================
crashing_script_mod_start:
  title: You have a broken script mod
  description: |-
    At some point during your gameplay, a script mod is trying to do something that makes the game crash. 
    Unfortunately, there won't be any log files to help you, but 

    In the next step, we'll find out which script mod it is. You need to examine the following folders:
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\r6\scripts`
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\bin\x64\plugins\cyber_engine_tweaks\mods` 
    
  options: 
    - label: OK!
      target: bisect_known_folder_start

# ================
# crashing: random
# ================
crashing_random_start:
  title: Do you have Material Texture Override installed?
  description: |-
    Do you have the mod Material Texture Override installed?
    
  options: 
    - label: Yes 
      target: crashing_random_mto
    - label: No 
      target: crashing_random_01

crashing_random_01:  
  title: Do you have Material Texture Override installed?
  description: |-
    Do you have the mod [Material Texture Override](https://www.nexusmods.com/cyberpunk2077/mods/5266) installed?
    
  options: 
    - label: Yes 
      target: crashing_random_mto
    - label: No 
      target: crashing_random_02


crashing_random_02:  
  title: Do you have Material Texture Override installed?
  description: |-
    Do you have the mod [Material Texture Override](https://www.nexusmods.com/cyberpunk2077/mods/5266) installed?
    
  options: 
    - label: Yes 
      target: crashing_random_mto
    - label: No 
      target: crashing_random_02

crashing_random_03:  
  title: We can't narrow down the problem
  description: |-
    It's really difficult to tell what kind of mod is causing the problem. You have two options now:    
  options: 
    - label: Bisect
      target: bisect_start
    - label: Nuke mods and start clean
      target: mod_remover

crashing_random_mto:  
  title: Uninstall MTO
  description: |-
    Material Texture forces the game to regenerate its materials rather than relying on cached files. That's a requirement for any mods that change base game materials, but unfortunately, it can expose bugs that CDPR never fixed.
    It's these bugs that are causing the crashes, not MTO itself.

    Remove Material Texture Override and see if the crash goes away.
  options: 
    - label: It's gone!
      target: success
    - label: It's still there
      target: crashing_random_03




# ================
# crashing: CET
# ================

crashing_cet_01:
  title: You have a problem with a CET mod
  description: |-
    Your problem sits in the following folder:     
    `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\bin\x64\plugins\cyber_engine_tweaks\mods`
    Open Windows Explorer and rename the folder to mods_. Does your game start now?

    If you need help, you can check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting/finding-and-reading-log-files#making-sense-of-them) or [find us on Discord](https://discord.gg/redmodding) in the mod-troubleshooting channel.
  options: 
    - label: Yes!
      target: bisect_cet_00
    - label: No...
      target: crashing_cet_not_bisect


crashing_cet_not_bisect:
  title: You have a different problem with a plugin
  description: |-
    Navigate three levels up until you are in the folder `bin\x64` and rename the entire folder `plugins` to `plugins_`. 
    Does your game start now?
  options: 
    - label: Yes!
      target: crashing_reinstall_cet
    - label: No...
      target: update_dependencies_start


crashing_reinstall_cet:
  title: Reinstall CET
  description: |-
    Do a clean install of Cyber Engine Tweaks: 
    - If you are using a mod manager, make sure to delete the mod there
    - Download the mod from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/107)
    - Install it, and start the game. Does it work?
  options: 
    - label: Yes!
      target: crashing_reinstall_cet_move_mods
    - label: No...
      target: mod_remover

crashing_reinstall_cet_move_mods:
  title: Move the mods from your backup
  description: |-
    Now that CET is starting again, let's get your mods back.
    - From the old folder `plugins_`, move the `mods_` folder to your new CET install under `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\bin\x64\plugins\cyber_engine_tweaks`
    - You can delete plugins_ now
    - Rename the folder `mods_` in CET's directory to `mods` and start the game. Does it work?
  options: 
    - label: Yes!
      target: success
    - label: No...
      target: bisect_cet_00

mod_remover:
  title: Your game is really really fucked
  description: |-
    Don't worry, all is not lost. But instead of individual troubleshooting, it is faster to start from a clean game:    
    - Download [Mod Remover](https://www.nexusmods.com/cyberpunk2077/mods/8597) from Nexus
    - Move the .bat or .exe file to [your game directory](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)
    - If you are using MO2: Register the .bat or .exe as a tool in the mod manager
    - Run the script
    - **Verify your game files**

    Does the game start now?
  options: 
    - label: Yes!
      target: reinstalling_mods_start
    - label: No...
      target: update_dependencies_start
    - label: That's it, I'm done
      target: success_but_no

reinstalling_mods_start:
  title: Reinstalling mods
  description: |-
    **STOP!** Do not just put your mods back!
    If you do that, you will be exactly where you were before running mod remover: with a broken game. 
    
    Install **only** the core mods, and make sure that they are on the most recent version (re-download if necessary):    
    - [Red4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)
    - [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198)
    - [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
    - [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780)
    - [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107)
    - [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511)
    
    Does the game start with only core mods installed?
  options: 
    - label: Yes!
      target: reinstalling_mods_01
    - label: No...
      target: update_dependencies_start

reinstalling_mods_01:
  title: Reinstalling mods, step 2
  description: |-
    Now you can restore folders from your backup, one after the other:
    - Copy a folder in the backup directory, e.g. `archive` (do not delete it)
    - Paste it into the Cyberpunk 2077 game directory
    - Check if the game still starts    
    
    At which folder does your game start crashing again?
  options: 
    - label: None!
      target: success
    - label: archive
      target: reinstalling_mods_archive

reinstalling_mods_archive:
  title: Your problem is an .archive mod
  description: |-
    The folder you will have to check is `archive/pc/mod`. Browse to `archive/pc`, and select it. Then, proceed to the next page.
  options: 
    - label: OK!
      target: bisect_known_folder_start


# ================
# bisect
# ================

bisect_start:
  title: How to quickly find the broken mod
  description: |-
    Bisect is a **binary search** and the fastest way to find your broken mod. You don't know which folder it is, so you'll have to do all 4 of them.
    You can find step-by-step instructions on the [wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#bisect-video-demonstration).
    If you are a visual learner, you will find a short video at the end of the section.

    You have to examine the following folders:
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\archive\pc\mod`
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\r6\scripts`
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\r6\tweaks`
    - `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\bin\x64\plugins\cyber_engine_tweaks\mods`
    
  options: 
    - label: Sounds scary, but I'll do it
      target: bisect_known_folder_start
    - label: I just want to start over clean
      target: mod_remover

bisect_cet_00:
  title: How to quickly find the broken mod
  description: |-
    Create a new empty folder `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\bin\x64\plugins\cyber_engine_tweaks\mods`.
    Open the folder `mods_` and move half of the files and folders to `mods`.
    Does the game still start? 
    
  options: 
    - label: Yes!
      target: bisect_cet_01
    - label: No...
      target: crashing_cet_not_bisect

bisect_cet_01:
  title: Finding the broken CET mod
  description: |-
    The folder you need to examine is `[Cyberpunk 2077](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory)\bin\x64\plugins\cyber_engine_tweaks\mods`.
    Proceed to the next step! (You have already completed item 1, so start at 2)
    
  options: 
    - label: OK
      target: bisect_known_folder_start

bisect_known_folder_start:
  title: Let's get those mods examined
  description: |-
    You have found out which **folder** holds the containing mod. If you don't, you can check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#which-kind-of-mod-is-it).
    1. Re-name it by adding a _ to its name (e.g. `mods` => `mods_`). This is your **backup**.
    2. Create a new empty folder with the old name. This is the **game folder**.
    3. Move **half** of the folder content (files and folders) from the backup to the game folder. 

    Is your problem back?    
  options: 
    - label: No!
      target: bisect_not_these_mods
    - label: Yes...
      target: bisect_mods_found_01

bisect_not_these_mods:
  title: These mods are okay
  description: |-
    Now we know which mods **aren't** the problem. Open your backup (with the _), and once again copy **half of the files and folders** to your game folder.
    
    Is your problem back?  
  options: 
    - label: No...
      target: bisect_mods_found_01
    - label: Yes!
      target: bisect_not_these_mods
    - label: I know which mod it is!
      target: bisect_found_the_mod

bisect_not_these_mods_02:
  title: These mods are okay
  description: |-
    The mods you just copied are not the problem. 
    Go to your backup folder (with the _).
    - If you moved mods back out of the game dir: Copy half of those
    - If you didn't move mods back: Copy half of the total remaining mods
    
    Is your problem back?  
  options: 
    - label: No...
      target: bisect_mods_found_01
    - label: Yes!
      target: bisect_not_these_mods
    - label: I know which mod it is!
      target: bisect_found_the_mod

bisect_mods_found_01:
  title: We're getting closer!
  description: |-
    You just copied a bunch of mods from your backup dir to the game dir, and now your problem is back. 
    That means that the broken mod was part of the batch you just copied.
    Move **half** of those mods into the backup folder again.
    
    Is your problem still there?    
  options: 
    - label: Yes...
      target: bisect_mods_found_02
    - label: No!
      target: bisect_mods_found_02
    - label: I know which mod it is!
      target: bisect_found_the_mod


bisect_mods_found_02:
  title: These weren't it
  description: |-
    You just moved half of a batch back out of the game folder, and your problem is still there -> the batch you copied were okay.
    From the remaining half, take **half** of the mods again, and move them to the backup folder.
    
    Is your problem still there?    
  options: 
    - label: Yes...
      target: bisect_mods_found_02
    - label: No!
      target: bisect_mods_found_03
    - label: I know which mod it is!
      target: bisect_found_the_mod
      
bisect_mods_found_03:
  title: The mod is in those files!
  description: |-
    You just moved a batch of mods out of the game folder into the backup folder (with the _), and your problem went away.
    That means your problem child is one of the mods you just moved.
    Take **half** of them and put them back into the game folder.
    
    Is your problem back?    
  options: 
    - label: Yes...
      target: bisect_mods_found_02
    - label: No!
      target: bisect_mods_found_03
    - label: I know which mod it is!
      target: bisect_found_the_mod
      
  
bisect_found_the_mod:
  title: You found the culprit!
  description: |-
    Congratulations! You found out which mod it is!
    Hit up its Nexus page and check the following:
    - Can you update it? If yes, do so
    - Is there a comment page? If yes, maybe it is no longer compatible with the current patch. 

  options: 
    - label: Cool!
      target: success
    - label: That doesn't help!
      target: broken_mod


broken_mod:
  title: A broken mod
  description: |-
    You have a mod, but it's broken. What do we do now?    
  options: 
    - label: Check its dependencies
      target: misc_dependencies
    - label: Did you update recently?
      target: outdated_mod
    - label: I will play without it :(
      target: success_but_no

outdated_mod:
  title: Is the mod outdated?
  description: |-
    If the mod stopped working after you updated your game, it's possible that it is simply not up-to-date yet. Here are your options:
    - Play without it
    - Wait for the mod author to update it (if you ask, please ask **politely**)
    - Try and fix the mod yourself (this can be hard, but you are welcome on our [discord](http://discord.gg/redmodding) in `#mod-dev-chat`)!
   
    The safest way to find out is to...

  options: 
    - label: read the fucking manual
      target: rtfm
    - label: I will play without it :(
      target: success_but_no


rtfm:
  title: Read the fucking manual
  description: |-
    Open the mod's Nexus page. Do the following things:
    - **Read the mod description**. We get it, reading is hard, but somebody wrote all that text just for you!    
    - Open the comments tab. Is there a sticky comment? Read it.
    - Check the first two comment pages. Are a lot of people reporting the same bug? Is there a solution that you can try?
    - Is there a bug section? Check it out. If there are no bugs, you could file one.
    
  options: 
    - label: There was no solution  ;(
      target: success_but_no
    - label: I'll just play without the mod
      target: success

# ================
# misc
# ================
misc_start:
  title: Are you on Linux?
  description: |- 
    Your game is not crashing, and you have a different issue. 
    The first question is - are you on Linux?
  options:
    - label: Yes
      target: linux_01
    - label: No
      target: misc_q_01

misc_q_01:
  title: Is it an inactive mod?
  description: |- 
    Is your problem that a mod isn't working?
  options:
    - label: yes
      target: misc_mod_not_working
    - label: no
      target: misc_q_02
    - label: I don't know what that is
      target: misc_q_02

misc_q_02:
  title: Do you have any sp0 mods?
  description: |- 
    Do you have any mods by Nexus user `spawn0000` (also known as sp0)?
  options:
    - label: Yes
      target: misc_uninstall_sp0
    - label: Of course not!
      target: unspecified_problem

misc_uninstall_sp0:
  title: Uninstall sp0 mods
  description: |- 
    The modder uses outdated technologies and is infamous for causing compatibility issues. He is the only person who can change that, but he is not interested. 
    Your best option at this point is to uninstall his mods and find a better body. You can find a list on [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/npcs/custom-tattoos-and-scars/converting-between-tattoo-frameworks#which-texture-frameworks-exist) (scroll down a little)
    
    Does that make your problem go away?
  options:
    - label: Yes
      target: success
    - label: No
      target: unspecified_problem
    - label: I don't want to uninstall my cement tits!
      target: success_but_no

misc_mod_not_working:
  title: An inactive mod
  description: |- 
    You're not on Linux and one of your mods isn't working. Are you using the mod manager **mo2**?
  options:
    - label: yes
      target: mo2_01
    - label: no
      target: misc_dependencies

misc_dependencies:
  title: Install the mod's dependencies
  description: |- 
    You need to install all of the mod's dependencies, but here's the catch: you need to install **their** dependencies as well. 
    Check [this wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting/requirements-explained) for more intel.
    
    Does the problem go away?
  options:
    - label: yes
      target: success
    - label: no
      target: broken_mod

# ======= mod managers =======
mo2_01:
  title: You're using mo2
  description: |- 
    When modding with mo2, you need to install the following mods **manually**:
    - [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107)
    - [RED4Ext](https://www.nexusmods.com/cyberpunk2077/mods/2380)

    Does that make your problem go away?
  options:
    - label: Yes
      target: success
    - label: no
      target: mo2_02
      
mo2_02:
  title: The problem persists
  description: |- 
    Since mo2 was originally intended for Bethesda games, we don't know terribly much about it. 
    You can find everything that we *do* know on our [wiki page](https://discord.com/channels/717692382849663036/788090406416023582/1326240275458424853). If that doesn't help, you can hit up [their Discord](https://discord.gg/ewUVAqyrQX).
  options:
    - label: OK :/
      target: success_but_no    
      


# ========== linux ==========
linux_01:
  title: You are modding on Linux
  description: |- 
    If you are on Linux, there are a few specific steps that you have to follow - see [this guide](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/users-modding-cyberpunk-2077/modding-on-linux) on our wiki.
    Does the problem go away?
  options:
    - label: Yes
      target: success
    - label: No
      target: linux_02

linux_02:
  title: The Linux guide didn't help you
  description: |- 
    Double-check the troubleshooting section. If the steps listed there don't help you, then it's likely that we can't either.
    You're nonetheless welcome to ask for help on our [discord](http://discord.gg/redmodding) in the `#mod-troubleshooting` channel, but you're probably better-off if you find a Linux-specific community.    
  options:
    - label: OK
      target: success

# ================
# success
# ================
success:
  title: Progress!
  description: |-
    Awesome! You solved a problem! Does your game start now?
    
  options: 
    - label: Yes!
      target: sponsors
    - label: No
      target: q_bisect_in_progress
    - label: I'll just reinstall my game
      target: mod_remover

q_bisect_in_progress:
  title: Are you bisecting?
  description: |-
    Are you currently bisecting your mods?
  options: 
    - label: Yes
      target: bisect_mods_found_01
    - label: No
      target: start

success_but_no:
  title: Sorry!
  description: |-
    It seems we're at the end of our options, choom. Sorry! Feel free to ask for help on our [discord](http://discord.gg/redmodding) in the `#mod-troubleshooting` channel, though.    
  options: 
    - label: OK!
      target: sponsors

unspecified_problem:
  title: The problem is in another castle
  description: |-
    It seems that you have a problem that the interactive troubleshooter does not cover yet. 
    Please check our [troubleshooting wiki page](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting). 
    You can use your browser's search function (Ctrl+F), or check for your problem in the table of contents or the list at the start of the page.
  options: 
    - label: Fuck this, I'm reinstalling the game
      target: mod_remover
    - label: OK!
      target: sponsors

sponsors:
  title: Check out our sponsors
  description: |-
    The Cyberpunk 2077 modding community wishes you a good trip to Night City! There are many great things you can do:

    - Shoot gonks! Check the vending machines of our sponsor **Budget Arms** for some cheap iron!
    - Kiss joytoys! Head to Jig Jig Street, live your best life, and scan the QR code at Wakako's pachinko parlor to enter a free giveaway!
    - Get run over by cars: Just stand on a road somewhere and go flying. Whee! Quality medical care at Viktor's Vector in Watson!

    Disclaimer: Johnny Silverhand has many suggestions as well. We suggest to ignore his advice, and won't be liable for any damage of property or persons if you don't.

pirate:
  title: We won't help you 
  hide_back: true
  description: |-
    You can read the full reasons [here](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-users/user-guide-troubleshooting#you-pirated-the-game). 
    Feel free to peruse the troubleshooting guide, but we won't help you until you buy your game.

    You can get it here: 

    # GOG.com (CD Projekt) 
    Buying Cyberpunk 2077 from Good Old Games (GOG.com) directly supports CD Projekt RED, as it is their own platform!
    - [Base Game](https://www.gog.com/en/game/cyberpunk_2077)
    - [Phantom Liberty](https://www.gog.com/en/game/cyberpunk_2077_phantom_liberty)
    - [Ultimate Edition](https://www.gog.com/en/game/cyberpunk_2077_ultimate_edition)

    Steam (Valve)
    Buying Cyberpunk 2077 from the Steam store supports modding on Steam Deck.
    - [Base Game](https://store.steampowered.com/app/1091500/Cyberpunk_2077/)
    - [Phantom Liberty](https://store.steampowered.com/app/2138330/Cyberpunk_2077_Phantom_Liberty)
    - [Ultimate Edition](https://store.steampowered.com/bundle/32470/Cyberpunk_2077_Ultimate_Edition/)

    Epic Games Store (Epic Games)
    - [Base Game](https://store.epicgames.com/p/cyberpunk-2077)
    - [Phantom Liberty](https://store.epicgames.com/p/cyberpunk-2077--phantom-liberty)
    - [Ultimate Edition](https://store.epicgames.com/en-US/p/cyberpunk-2077--ultimate-edition)
       
  options: 
    - label: OK, I bought the game!
      target: start
    - label: I can't afford the game!
      target: sucks_to_be_poor
    - label: Fuck you, no!
      target: fuck_off


sucks_to_be_poor:
  title: Sorry, choomba
  description: |-
    We get it, it sucks to be poor, but pirated games do not mod well. If you don't care for an explanation, we can't help you any further. 
       
  options: 
    - label: OK  ;(
      target: sponsors

fuck_off:
  title: We appreciate your business
  description: |-
    The Cyberpunk 2077 Modding Community Support Team (which consists exclusively of unpaid volunteers) is glad that the interactive troubleshooter could identify your problem.  
    Please do not ask for help on Discord, as piracy violates the TOS and we'd like to keep our server.  
        
  options: 
    - label: OK
      target: sponsors" %}

## Navigation

{% hint style="danger" %}
Before you start debugging, make sure that&#x20;

* your **graphics driver** is up-to-date
* your [**Windows**](https://support.microsoft.com/en-us/windows/get-the-latest-windows-update-7d20e88c-0568-483a-37bc-c3885390d212) is up-to-date (no, _really_) and that you are at least on Windows 10
* you have the most recent version of [.NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.3-windows-x64-installer) installed
* you have [Visual C++ Redistributable 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) installed ([direct download](https://aka.ms/vs/17/release/vc_redist.x64.exe), Microsoft)
* your game is running from an SSD (Solid State Disk) rather than a HDD
{% endhint %}

{% hint style="warning" %}
Before you start debugging, **update your mods** and make sure that **all dependencies** have the latest version, in particular the [core mods](../../for-mod-creators-theory/core-mods-explained/) ([Redscript](https://github.com/jac3km4/redscript/releases/), [Red4ext](https://github.com/WopsS/RED4ext/releases), [Cyber Engine Tweaks](https://github.com/yamashi/CyberEngineTweaks/releases), [ArchiveXL](https://github.com/psiberx/cp2077-archive-xl/releases/) and [TweakXL](https://github.com/psiberx/cp2077-tweak-xl/releases/)).

If you are on RED4Ext >= 1.13, make sure to **uninstall** cybercmd!

\
Find a download-ready collection for Vortex [here](https://next.nexusmods.com/cyberpunk2077/collections/r1flnc?tab=Mods).
{% endhint %}

This section aims to give you a quick overview. If your exact problem isn't listed here, please **look through the different sections** below and try anything that looks promising.

* [I don't wanna debug, I just want mods!](./#i-really-just-want-to-get-this-working-what-do-i-do)
* [There was a game update and now your mods aren't working](users-troubleshooting-after-a-game-update.md)
* [Your game is crashing](./#your-game-is-crashing)
  * [During a quest in a car chase](./#during-car-chases)
  * [it's not even starting](./#crash-on-startup)
    * [Corrupt or missing script files](./#corrupt-or-missing-script-files)
    * [Corrupted archives](./#corrupted-archives)
    * [before the menu](./#crash-before-menu)
    * [when loading a save / starting a game](./#crash-on-loading-a-save)
    * [randomly during gameplay](./#crash-during-the-game)
* [Redscript Compilation Failed (Popup message)](./#redscript-compilation-failed)
* [Your quests are broken or you get LocKey# messages](./#your-quests-are-not-working-you-get-lockey-messages)
* [You're on Linux](../users-modding-cyberpunk-2077/modding-on-linux.md)
* [You have trouble with your pirated game](./#you-pirated-the-game)
* [Photomode screenshots are borked](./#photomode-screenshots-are-blank)
* [Press \[none\] to continue / can't skip loading screen](./#press-none-to-continue-cant-skip-loading-screen)
* [You have audio issues](./#audio-problems)
* [You have trouble with CET (Cyber Engine Tweaks)](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-_ua1-887967055/getting-started/installing/troubleshooting)
  * [CET is not starting](./#cet-isnt-starting)
  * [You forgot your CET keybind](./#you-forgot-your-cet-keybind)
* [XML Document parsed with errors](./#xml-document-parsed-with-errors)
* [You're naked](./#im-naked)
* [Your eyes are black](./#v-has-black-eyes)
* [You installed a mod, but it's not doing anything](./#mod-s-arent-loading-triggering)&#x20;
* A mod is causing problems, and you have no idea which:
  * [Known problem children](./#finding-the-broken-mod-known-problem-children)
  * [Well-known outdated mods](./#well-known-outdated-mods)
  * Searching: [Bisect](./#finding-the-broken-mod-bisecting)
  * Searching: [Log files](finding-and-reading-log-files.md)
* [Something with files or ACCESS\_VIOLATION](./#something-something-files)
* [Deleting user settings](./#deleting-user-settings)
* [This is a waste of time, I'm reinstalling](./#the-nuclear-option-a-clean-install)
  * [Modding a clean install ](./#a-fresh-install-starting-from-scratch)

{% hint style="success" %}
To enable REDmods, check [#activating-mods](../users-modding-cyberpunk-2077/redmod/usage.md#activating-mods "mention") (you need to [install REDMod](../users-modding-cyberpunk-2077/redmod/#installation) first)
{% endhint %}

## Your game is crashing

### Randomly, and you have an Intel i7 or i9

Check [this forum post](https://forums.cdprojektred.com/index.php?threads/possible-reasons-for-crashing-on-intel-i7-i9-z790-motherboard-set-ups.11129974/). If that doesn't help, read on.

### During car chases

If your game is crashing during certain car chase missions, try removing [Eye Exposure Adaption](https://www.nexusmods.com/cyberpunk2077/mods/2375).

<figure><img src="../../.gitbook/assets/troubleshooting_headers_doesnt_even_start.png" alt=""><figcaption></figcaption></figure>

If you can't play because the game is crashing, this section will help you find the right troubleshooting steps in the rest of the guide.

* If you're done with this shit and would rather reinstall, see [#the-nuclear-option-a-clean-install](./#the-nuclear-option-a-clean-install "mention")

### Crash on startup

If you're trying to start your game, but it never even launches, this is the right section for you. Otherwise:

* If the game crashes before you make it to the menu, see [#crash-before-menu](./#crash-before-menu "mention")
* If the game crashes when you're trying to load a save, see [#crash-on-loading-a-save](./#crash-on-loading-a-save "mention")

#### Cyberpunk has flatlined

Check the section [#cyberpunk-has-flatlined](./#cyberpunk-has-flatlined "mention") below.

#### ValidateScripts.cpp:42

Empty your cache, check the info box under[#redscript-red4ext](./#redscript-red4ext "mention").

#### Red4ext.SDK: Failed to resolve address for hash 0x1817231d

You need to **update the game** and RED4ext

#### Red4ext: A dynamic link library (DLL) initialization routine failed

You need to install the **VisualC Redistributables**. Check the red box under [#navigation](./#navigation "mention") for a download link.

#### Something about files or permissions

If you think that your error is file-related, you can check the section "[Something something files](./#something-something-files)" or use your browser's search function (`Ctrl+F`) to search this page for your error.

#### Some other error

Your problem lies with either red4ext or redscript. You can find what to do under [#redscript-red4ext](./#redscript-red4ext "mention")

### Crash before menu

If you're starting the game, but never make it to the in-game menu, this is the right section for you. \
Otherwise:

* If the game never even starts, see [#crash-on-startup](./#crash-on-startup "mention")
* If the game crashes when you're trying to load a save, see [#crash-on-loading-a-save](./#crash-on-loading-a-save "mention")

#### 2.0 / PL: Missing tweakdb.bin or inaccessible memory

```
Cyberpunk 2077 encountered an error caused by a corrupted or missing TweakDB file and will now be forced to close
```

If you run into the error above, or if the game complains about attempting to read inaccessible memory, do this:&#x20;

1. Go to your [Cyberpunk game directory](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/) and find the folder`r6\cache`.&#x20;
2. Find the file`tweakDB.bin` and copy it (`Ctrl+C`)
3. `In r6\cache`, browse to the folder `modded` (create it if it doesn't exist)&#x20;
4. paste `tweakDB.bin` here (`Ctrl+V`)
5. If asked to overwrite, select `Yes`
6. If you have Phantom Liberty, repeat the process with `tweakdb_ep1.bin`

#### If that doesn't fix it

Your problem most likely related to **Cyber Engine Tweaks**. To find out how to troubleshoot it, check the "[disable CET](./#step-2-disable-cet)" section.&#x20;

### Cyberpunk has flatlined

See [#crash-before-menu](./#crash-before-menu "mention")

### Crash on loading a save

If you can make it to the menu but crash out when you're loading a save or starting a new game, this is the right section for you. \
Otherwise:

* If the game never even starts, see [commands](../users-modding-cyberpunk-2077/redmod/commands/ "mention")
* If the game crashes before you make it to the menu, see [#crash-before-menu](./#crash-before-menu "mention")
* If you can start a new game without crashing, see [#corrupt-ish-saves](./#corrupt-ish-saves "mention")

Most likely, you have an issue with an .archive mod. Here's what you can do:

1. To rule out that it's a save game problem (those are extremely rare), start a new game.
2. Go to the [bisect](./#go-bisect) section and start with the first two entries on the list&#x20;

If that doesn't solve your problem, or if the issue is save-game related, feel free to browse around some more.

### Corrupt(ish) saves

{% hint style="info" %}
You only need to read this if you can start a new game without mods, but crash on loading a previous save game. For any other problem, please see the corresponding section(s).
{% endhint %}

Some mods store data in save files. Removing those mods **may** (but doesn't have to) lead to your save game crashing until you install them again.&#x20;

At the current time (09/2023, before PL), that has been confirmed to affect those mods:

* [Immersive Rippers](https://www.nexusmods.com/cyberpunk2077/mods/7064?tab=posts) - see the expandable list below for uninstall instructions, or check the mod's pinned post on Nexus

<details>

<summary>Uninstalling Immersive Rippers </summary>

`Error reason: Unhandled exception Expression: EXCEPTION_ACCESS_VIOLATION (0xC0000005) Message: The thread attempted to read inaccessible data at 0x10. File: <Unknown>(0)`

1. Run [mod remover](https://www.nexusmods.com/cyberpunk2077/mods/8597?tab=description) (Usage instructions are on the modpage itself)
2. Downgrade your game to [1.63\_hotfix\_1](../users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md)
3. Install [Immersive Rippers](https://www.nexusmods.com/cyberpunk2077/mods/7064?tab=files\&file_id=47612) and all of its dependencies and all of **their** dependencies
4. Load into your previously-crashing save&#x20;
5. Move at least 100m away from the closest ripper&#x20;
6. Copy the following commands and run them in the CET-Console:

```
Game.GetQuestsSystem():SetFactStr("bls_ina_se1_ripperdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("cct_dtn_ripdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("hey_spr_ripperdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("pac_wwd_ripdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("std_arr_ripperdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("std_rcr_ripperdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("wat_kab_ripperdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("wat_kab_ripperdoc_03_default_on", 0);
Game.GetQuestsSystem():SetFactStr("wat_nid_ripperdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("wbr_hil_ripdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("wbr_jpn_ripdoc_01_default_on", 0);
Game.GetQuestsSystem():SetFactStr("wbr_jpn_ripdoc_02_default_on", 0);
```

7. Save your game in a new slot and close it
8. Remove Immersive Rippers .archive file("Cyberpunk 2077\archive\pc\mod\ImmersiveRippers.archive")
9. Load into your new save and and run the following CET-Commands to restore the rippers' default behaviour:&#x20;

```
Game.GetQuestsSystem():SetFactStr("bls_ina_se1_ripperdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("cct_dtn_ripdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("hey_spr_ripperdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("pac_wwd_ripdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("std_arr_ripperdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("std_rcr_ripperdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("wat_kab_ripperdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("wat_kab_ripperdoc_03_default_on", 1);
Game.GetQuestsSystem():SetFactStr("wat_nid_ripperdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("wbr_hil_ripdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("wbr_jpn_ripdoc_01_default_on", 1);
Game.GetQuestsSystem():SetFactStr("wbr_jpn_ripdoc_02_default_on", 1);
```

10. Save your game again and remove all mods used in version 1.63
11. OPTIONAL: Load the save in vanilla 1.63, it should work there too.
12. Download the newest version of Cyberpunk2077! \
    The clean created save should work for vanilla and modded instances of the game.

</details>

{% hint style="success" %}
If you are experiencing this issue with a mod that is not on this list, please check [Broken mods: How to help](broken-mods-how-to-help.md)
{% endhint %}

### Crash during the game

This section tells you how to deal with crashes during gameplay.

#### When editing the inventory

Kiroshi Crowd Scanner and Tooltip Fixer do not play together ([source](https://discord.com/channels/717692382849663036/788213273530335233/1152601434299301989), discord). Uninstall one of them.

#### Somewhere in Japantown

Somewhere in Japantown is a mesh with a broken material. [Material and Texture Override](https://www.nexusmods.com/cyberpunk2077/mods/5266) removes the cache, and thus forces the game to re-create this material, and causes the game to crash.

Many mods list MTO as a dependency, but it's usually optional and you only need it to force-apply changes to original game materials.

**If you can make it crash reliably**

You're lucky, because it means that you can systematically troubleshoot. Go to the [bisect](./#finding-the-broken-mod-bisecting) section; start with .archive mods, but if that doesn't fix it, do the other folders as well.

**If you can't**

… that puts you in the same boat as the rest of us: most veteran players live with occasional crashes, especially while tabbing out and back in under certain circumstances.

That being said, if the crashes exceed what you're willing to live with, you'll have to find out a way to improve it, but your options are thin on the ground. Depending on how long it takes for the crash to occur, you might try

* resetting your game [to a clean state](./#is-there-a-shortcut) (if the error persists, it's not mods)
* [temporarily disabling](./#step-1-temporarily-disable-all-your-mods) certain types of mod to home in on the cause (see the [bisect section](./#go-bisect) for an overviev)

Best of luck!

## Corrupt or missing script files

> Cyberpunk 2077 encountered an error caused by a corrupt or missing script file and will now be forced to close. Please verify...

You have an error with [#redscript-red4ext](./#redscript-red4ext "mention"). Please see the next section.

## redscript / RED4ext

<figure><img src="../../.gitbook/assets/troubleshooting_headers_redscript_red4ext.png" alt=""><figcaption></figcaption></figure>

When your game doesn't even start up, either of these frameworks isn't working properly.&#x20;

{% hint style="info" %}
The first step whenever you run into this error is deleting the folder `r6/cache` and verifying your game files. If that doesn't help, keep reading.
{% endhint %}

Below, you can find a list of the most common error messages with steps to resolve them.

{% hint style="warning" %}
If you are using RED4ext, uninstall cybercmd.
{% endhint %}

If you're sure that you don't have cybercmd, it's time for more detailed troubleshooting:

1. If you are on Linux, make sure to double-check the [launch options](../users-modding-cyberpunk-2077/modding-on-linux.md), as Steam sometimes resets these between updates
2. If your game stops crashing when you disable red4ext, that points to an error with a [dependent mod](#user-content-fn-3)[^3].  Make sure that your error is related to red4ext before you proceed!
3. Find the folder `Cyberpunk 2077/red4ext/log` and check for a file named `red4ext.log`.\
   Does it exist?
   * No: RED4Ext is not installed correctly. Make sure that you fix this before troubleshooting further.
   * Yes:  look inside, it will tell you which mods aren't compatible with the current game patch and may be the cause of this issue&#x20;
4. if that doesn't help, go to [#3.-reset-redscript](./#3.-reset-redscript "mention") in the corresponding section (you will need to verify your game files).&#x20;

If that doesn't solve your problem, you can&#x20;

* [troubleshoot](./#0.-make-sure-that-you-dont-have-multiple-versions-of-codeware-installed) or [reset](./#3.-reset-redscript) redscript
* the faster variant: [temporarily disable all mods](./#step-1-temporarily-disable-all-your-mods) and reinstall the core frameworks

### Corrupted archives

> Cyberpunk 2077 encountered an error caused by corrupted or missing archives and and will now be forced to close. Please verify...

One of the .archive files in your folder is broken. To find out which one, try the [bisect](./#finding-the-broken-mod-bisecting) approach, starting with the first two folders.

## The game isn't starting: other reasons

<figure><img src="../../.gitbook/assets/troubleshooting_headers_startup_cockblock.png" alt=""><figcaption></figcaption></figure>

There are various non-mod-related reasons why the game couldn't be starting. If you have followed these steps and they haven't gotten you anywhere, check the errors in this section:

* [Too many mods](./#too-many-mods)
* [Message: Failed to initialize scripts data!](./#failed-to-initialize-script-data)
* [Steam file verification loop](./#steam-verify-file-integrity-loop)

Other than that, there are general troubleshooting steps, because **missing Windows stuff can make Cyberpunk go brr**. Make sure that&#x20;

* your graphics driver is up-to-date
* you have the most recent version of [.NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-7.0.3-windows-x64-installer) installed
* you have [Visual C++ Redistributable 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) installed ([direct download](https://aka.ms/vs/17/release/vc_redist.x64.exe), Microsoft)

Also, try starting the game **without Reshade** to rule it out as a source of crashes (this happened after the DLSS patch) and **temporarily disable your antivirus**.

If none of that helps, find us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting.

### Too many mods

There is such a thing as too many mods which are making the game crash. This number seems pretty random, but generally doesn't start below \~460.&#x20;

To fix this, you need to disable analysis in the settings:&#x20;

<figure><img src="../../.gitbook/assets/image (149).png" alt=""><figcaption></figcaption></figure>

### Failed to initialize script data

This is not a Cyberpunk error!

```
Message: Failed to initialize scripts data!
File: E:\R6.Release\dev\src\common\engine\src\baseEngineInit.cpp(1019)
```

Check your NVidia Control Panel panel. If power saving options are enabled, turn them off:

<figure><img src="../../.gitbook/assets/nvidia_control_panel_power_saving.png" alt=""><figcaption></figcaption></figure>

If you don't, check for other power config options in your operating system.

### Steam: verify file integrity loop

The error below is partial to Steam:

```
Cyberpunk 2077 encountered an error caused by corrupted or incomplete game data
```

There are three potential fixes:&#x20;

* [Run as admin](./#run-as-admin)
* [Run without antivirus](./#run-without-antivirus)

Workaround suggested by CDPR:&#x20;

* Set Power Limit (TJ max) for CPU to 150W
* Reduce Long and Short Duration Package Power Limit to 150 W (Intel default is 253)
* Set the maximum CPU Core Temperature to 98°
* Reduce the P-Core ratio of the processor
* Deactivate Turbo Boost of the CPU
* Disable CPU Hyper-Threading

Or check Reddit:

* [Downclock your processor](https://www.reddit.com/r/cyberpunkgame/comments/16pluqw/comment/k2f1wwh/?utm_source=share\&utm_medium=web2x\&context=3) (via reddit, do so **at own risk**)

#### Run as admin

Before trying to implement any of the other solutions, configure the `REDprelauncher.exe` in the [Cyberpunk root directory](#user-content-fn-4)[^4] to always run as administrator.&#x20;

* Right-click on the file and select `Properties`
* Switch to the `Compatibility` tab
* Check the box `Run this program as an administrator`

<figure><img src="../../.gitbook/assets/troubleshooting_redprelauncher_runas_admin.png" alt=""><figcaption></figcaption></figure>

#### Run without antivirus

The second reason might be that your antivirus fucks with your game files in a way that the game can't cope with.

Try the following steps:

* Turn off your antivirus and your firewall - anything that counts as "System Protection".
  * Yes, that includes Windows Defender
  * Yes, all of it. That includes your computer's bodyguard if it has one.
* Now, start the game.
* If the error persists, verify game files through your client (you won't catch any viruses doing that)
* Start the game again

If it works now, you need to find out how to keep your antivirus away from your game directory. If it doesn't, then you can turn the stuff back on now.

## You pirated the game

<figure><img src="https://images.unsplash.com/photo-1627569015058-3f298889045f?ixlib=rb-4.0.3&#x26;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&#x26;auto=format&#x26;fit=crop&#x26;w=2670&#x26;q=80" alt=""><figcaption><p>Creative Commons, Credit: <a href="https://unsplash.com/photos/WV9yGVpEAz8">Tom Briskey</a></p></figcaption></figure>

There's a chance of >95% that we have already found the source of your problems — **pirated copies just don't mod well**. That's the first reason why things won't work.

The second reason is that CDPR needs to earn money to pay people to make games for us. If you can at all afford it, **please buy the game**. It's a good deal: how much are you willing to spend for a movie ticket? How long does a movie keep you entertained?

You are, of course, welcome to peruse the troubleshooting guide. It might even help you. But know that pirated copies will never be explicitly supported.

## Finding the broken mod: known problem children

<figure><img src="../../.gitbook/assets/troubleshooting_headers_problem_children.png" alt=""><figcaption></figcaption></figure>

### Stuff that isn't mods

It doesn't **have** to be either of these. But if it is, you'll never find it with the rest of the list. Rule it out by deactivating them while you're debugging.

* **Antivirus**
* **ReShade**

{% hint style="info" %}
If you can start a new game without mods, but can't load an existing save, see[#corrupt-ish-saves](./#corrupt-ish-saves "mention").
{% endhint %}

### Frameworks / Core Mods

These mods are not problem children – quite the opposite. But if they are outdated, either your game or your mods won't work. Make sure that you [have them all up-to-date](./#step-7-install-the-core-frameworks) with the most recent game version.

### Script mods

Some mods go far beyond the ordinary, adding whole new features to the game (why no flying cars, CDPR?). Unfortunately, that means they're more prone to breaking than others. Here's a non-comprehensive list.

{% hint style="warning" %}
Being on this list does not mean that a mod is "bad" or that you shouldn't use it – they break much for the same reason as the frameworks do, and are fixed in the same way (the modder has to update). Until that happens, you will have to **disable** them.
{% endhint %}

#### [In-World Navigation](https://www.nexusmods.com/cyberpunk2077/mods/4583)

Displays in-world holographic arrows that direct you towards your quest objectives. Is very likely to break upon patches.

#### [Vehicle Combat](https://www.nexusmods.com/cyberpunk2077/mods/3815)

Adds car chases and a bunch of related features. While CP2077 needs more car chases and explosions, this usually breaks and will require an update.

#### [Mod Settings](https://www.nexusmods.com/cyberpunk2077/mods/4885)&#x20;

Adds mod settings to the in-game menu – Redscript version. This needs to be updated after **every** game patch.

#### [Native Settings UI](https://www.nexusmods.com/cyberpunk2077/mods/3518)

Adds mod settings to the in-game menu – CET version. The mod itself will be fine, but it's dependent on [Cyber Engine Tweaks](https://www.nexusmods.com/cyberpunk2077/mods/107) being up-to-date.

### Well-known outdated mods

The below mods will no longer work on versions beyond 2.0/2.1 and in some cases can completely break your save. If you have any of these, _remove them_.

[Let There Be Flight](https://www.nexusmods.com/cyberpunk2077/mods/5208) &#x20;

Adds flying cars to Cyberpunk. While this is awesome, it will **absolutely** break whenever CDPR changes anything, and requires updating. It has been broken for a long time as of patch 2.02 and later and will not work.

#### [CTD Helper](https://www.nexusmods.com/cyberpunk2077/mods/5205)&#x20;

Replaces the default crash logs with actual usable logs instead. This needs to be updated after **every** game patch. It has been broken for a long time as of patch 2.02 and later and will not work.

#### [Respector](https://www.nexusmods.com/cyberpunk2077/mods/1263)

Effectively an in-game save editor that can give you a lot of items and even create a new game plus method. This mod has stopped working since 2.0 and while it will be updated in the future, in the mean time mods like [Simple Menu (CET)](https://www.nexusmods.com/cyberpunk2077/mods/818) and [Pseudo New Game Plus](https://www.nexusmods.com/cyberpunk2077/mods/5144) can be used.

#### [NPCs Gone Wild](https://www.nexusmods.com/cyberpunk2077/mods/1436) (NSFW)

Makes multiple NPCs nude. In all versions since 2.0, this causes missing characters, missing body parts, exploding limbs, and other issues. Do not use the mod, there is a [Naked NPCs collection ](https://next.nexusmods.com/cyberpunk2077/collections/sao1yq)by modder marnhorn that does the same thing and will work on current game versions.

#### <mark style="color:blue;">**Phone Messages Overhaul**</mark>**&#x20;(PMO) and&#x20;**<mark style="color:blue;">**8ug8ear Romance**</mark>**&#x20;(standalone)**

These mods change the game journal that controls all quests to add more romance options. This method only works on the patch it's made for and therefore they will not work on version 2.1 and later.\
Other mods that do the same thing, but in a compatible way, are [Panam Romance Enhanced](https://www.nexusmods.com/cyberpunk2077/mods/4626) and Judy Romance Enhanced, which use ArchiveXL (the safe method).

#### [Biosculpted Exotics](https://www.nexusmods.com/cyberpunk2077/mods/9797)

This mod adds furry, animal-like NPCs to the game and optionally replaces main characters. While lore accurate to a point, the mod is made in the same way as PMO and therefore breaks quests in 2.1 and later.

#### [Eye Adaptation Auto Exposure Fix - Vanilla Native Weather Option - Complete Overhaul - No More Blinding Lighting and Slower Bloom Gamma Changes - Optional SHARPENING OFF and VIGNETTE OFF](https://www.nexusmods.com/cyberpunk2077/mods/2375)

This mod hasn't been updated since v1.63, and the game has made significant breaking changes that cause this mod to crash to desktop (CTD).

### spawn0

Most famous for edits of the female body that defy gravity and wreak havoc on V's spinal disks, this modder has been around since the early days, and the same is true for their mods.&#x20;

However, modding has come a long way since then, and spawn0 never followed. For that reason, their mods are known to have compatibility issues with pretty much everything in the general vicinity.&#x20;

On the bright side, their mods ~~won't crash your game and~~ are downwards compatible until the dawn of time. With Phantom Liberty, sp0 mods have been known to cause crashes to desktop near the dam.

## Finding the broken mod (log files)

<figure><img src="../../.gitbook/assets/troubleshooting_headers_log_files.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Bad news: The game's logs are usually less helpful than the Swiss navy. \
Good news: Mods are doing a far better job. \
Bad news again: You have to find the right log file in the game directory.\
Good news again: There's intel how (see below)

jackhumbert's mod [ctdhelper](https://www.nexusmods.com/cyberpunk2077/mods/5205) will give you additional information. There is a chance that it shows you something helpful. Make sure the ctdhelper is updated before using it, though.
{% endhint %}

If you don't want to download and run script files from the internet, you can go and [#step-1-temporarily-disable-all-your-mods](./#step-1-temporarily-disable-all-your-mods "mention") by hand. Otherwise:

1. Download [this script](https://raw.githubusercontent.com/DoctorPresto/Cyberpunk-Helper-Scripts/main/FindAllErrors.bat) (**right-click -> save as**)\
   &#xNAN;_&#x4C;ink goes to Presto's_ [_github repository_](https://github.com/DoctorPresto/Cyberpunk-Helper-Scripts/blob/main/FindAllErrors.bat)
2. Now, do either of the following things:&#x20;
   1. Move it to your Cyberpunk install folder and double-click it
   2. Drag-and drop your Cyberpunk folder on the file that you downloaded
3. After running, the script will have created a folder `_LOGS` in your [Cyberpunk game directory](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/), which contains a file listing all the log files for you.

The list will give you useful information along with a list of files to check. Once you've found the broken mod, you can go [here](./#dealing-with-a-broken-mod) for instructions on how to troubleshoot further – they also tell you when you should ask for help!

## Finding the broken mod (bisecting)

<figure><img src="../../.gitbook/assets/troubleshooting_headers_bisect.png" alt=""><figcaption></figcaption></figure>

You have hundreds of mods, and one of them is broken. How do you find out which one it is without wasting the entire day?&#x20;

{% hint style="success" %}
Don't worry! As long as you have less than 2048 mods, bisection lets you find the problem child with only 10 rounds. (Otherwise, it's 11)
{% endhint %}

Some mods install themselves to multiple directories, but **that doesn't matter**. Due to the fact how mod loading works, you can find the error like this.

{% hint style="warning" %}
If you are using Vortex, you should enable and disable mods through Vortex rather than directly on disk. The principle below still works, you're just selecting the halves inside Vortex instead of moving them between directories.\
\
If you do opt to work directly on disk, **do not save changes to files if Vortex prompts for it**.
{% endhint %}

### Which kind of mod is it?

{% hint style="info" %}
If you already know which folder contains the broken mod, [skip to the next section](./#go-bisect).

You can find a video of the process [below](./#bisect-video-demonstration).
{% endhint %}

To find out the **type** of broken mod, take each `Directory` from the following list and complete the steps in the next paragraph after the table.

<table><thead><tr><th width="249">Kind of mod</th><th width="202">Directory</th><th>explanation</th></tr></thead><tbody><tr><td>.archive</td><td>\<code>mods</code></td><td>Redmod directory: contains .archive mods (in subfolders)</td></tr><tr><td>.archive</td><td>\<code>archive\pc\mod</code></td><td>Legacy directory: contains .archive mods</td></tr><tr><td>.lua (cyber engine tweaks)</td><td>\<code>bin\x64\plugins</code></td><td>Cyber Engine Tweaks</td></tr><tr><td>redscript</td><td><code>\r6\scripts</code></td><td>redscript mods</td></tr><tr><td>red4ext</td><td><code>\r6\tweaks</code></td><td>red4ext tweaks</td></tr></tbody></table>

1. Rename the game data folder ([**game folder**](#user-content-fn-5)[^5] for short – e.g. `archive/pc/mod`) to a [**backup folder**](#user-content-fn-6)[^6] by appending an underscore (e.g. /`mod_`). \
   &#xNAN;_&#x4F;nly do this with the last subfolder in the path, the result should be `\archive\pc\mod_`, not `archive_\pc_\mod_\.`_
2. The folder is now hidden from the game. Since it doesn't know, it will try to look inside anyway - create a new empty folder with the original name for that  (e.g. `/archive/pc/mod).`&#x20;
3. Start the game. You will now run into one of these two scenarios:
   * **Your problem is gone:** Jackpot. This is the correct folder for [the next section](./#go-bisect): [#go-bisect](./#go-bisect "mention")\
     Before you go there, you can restore all the other folders you moved, deleting the empty directories.
   * **Your problem is still there**: This folder is innocent. Proceed with the next `directory` from the table above.

{% hint style="info" %}
You can put the innocent folders back if you want: due to the way mods are loading, there won't be side-effects.
{% endhint %}

### Go bisect

Congratulations, you have found which folder causes the problem — you're more than halfway there. All that's left is to find the broken mod. Here's how.

{% hint style="info" %}
The process is the same every time, no matter if you are moving files or folders.
{% endhint %}

{% hint style="info" %}
If you don't vibe with text, there's a [#bisect-video-demonstration](./#bisect-video-demonstration "mention") below.
{% endhint %}

1. Switch on **half** of the mods from your [**backup folder**](#user-content-fn-7)[^7] by moving them back to the [**game folder**](#user-content-fn-8)[^8].
2. Remember (roughly) which batch you moved (e.g. "everything after `E"` or "the first half")
3. Start the game. You will now run into one of two scenarios:
   * **The error is still there:** Progress! Go to Step 5.
   * **The error is gone:** Progress too! Go to step 4
4. **The error is gone:** You have identified which mods **aren't** the problem! Good! Do the following:
   1. In your [**backup folder**](#user-content-fn-9)[^9], find the last batch of mods that you touched
   2. **Half** of these go into the [**game folder**](#user-content-fn-10)[^10]
   3. Go back to step 2 – you should now definitely see the problem again.
5. **The error is still there:** You have narrowed it down, let's narrow it down further. \
   Do the following:
   1. In your [**game folder**](#user-content-fn-11)[^11]**,** find the last batch of mods that you touched
   2. **Half** of these go back into the [**backup folder**](#user-content-fn-12)[^12]
   3. Go back to step 2 for the next round – the problem might be there or not.
6. Repeat this process until you know which mod is causing the crash. Then, you can either try to update it, or do a full uninstall

#### Bisect: Video demonstration

{% embed url="https://youtu.be/c1BkM6NFfkI" %}

## Audio problems

If your CPU is too busy, the game will try to save resources by dropping audio, starting with dialogue audio. Disabling spatial audio from the main menu might help:

<figure><img src="../../.gitbook/assets/image (108).png" alt=""><figcaption></figcaption></figure>

### It's not connected to CPU load

Missing footsteps had in the past been connected to a bug in Let [There Be Flight](./#let-there-be-flight), so it is worth debugging your script mods. However, if you're on the most recent version (check the github for previews), you might just have to [bisect](./#finding-the-broken-mod-bisecting) your mods at random.

## Mod(s) aren't loading/triggering

<figure><img src="../../.gitbook/assets/troubleshooting_headers_not_working.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If the mod in question is Cyber Engine Tweaks (CET), check the [corresponding troubleshooting page](https://wiki.redmodding.org/cyber-engine-tweaks/getting-started/installing/troubleshooting).
{% endhint %}

Normally, a mod should **just work**, as long as all of their requirements are working. If you aren't certain what that means, you can check [requirements-explained.md](requirements-explained.md "mention") for detes, or  follow the checklist below (  [#getting-a-mod-to-work](./#getting-a-mod-to-work "mention")).

* Make sure that you have [enabled mods](../users-modding-cyberpunk-2077/redmod/#installation) in your launcher.
* If items or hairs aren't changing, you need to install [cookedapps nulled](https://www.nexusmods.com/cyberpunk2077/mods/8127) (why?)[^13]
* If materials aren't updating, you need to install [material override](https://www.nexusmods.com/cyberpunk2077/mods/5266) (why?)[^14]
* If you already have all of that, [check the next section](./#only-parts-of-my-mods-are-working).

{% hint style="info" %}
If you've been using Mod Organizer 2 to install your mods, chances are high that it's been doing it incorrectly, at least for some of the more important mods. You'll need to do additional steps detailed [here](https://github.com/JustThatKing/MO2077/blob/main/readme.md) in order to get MO2 working with Cyberpunk.
{% endhint %}

### Getting a mod to work

1. Check that you've **enabled mods** (see [Deploying Mods and Starting Game](../users-modding-cyberpunk-2077/redmod/#installation)).&#x20;
2. Check the [requirements](requirements-explained.md) on the mod's nexus page. Make sure that you have installed them all and that they are up-to-date.
   * If the requirements list Cyber Engine Tweaks, check its log file under `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\cyber_engine_tweaks.log`
   * For a more detailed guide, see [requirements-explained.md](requirements-explained.md "mention")
3. Make sure that all of your [core frameworks](./#step-7-install-the-core-frameworks) are up-to-date and starting up correctly (here's how you can [check their log files](finding-and-reading-log-files.md#a-list-of-framework-logfiles))
4. Check the other log files in the game directory ([here's a guide how](finding-and-reading-log-files.md))
5. **Optional**: reach out to us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting

## Deleting user settings

{% hint style="info" %}
You almost never need to do this.
{% endhint %}

However, if you want to remove anything that Cyberpunk might have stored on your disk, you need to find and delete the following folders (as per [CDPR's own troubleshooting guide](https://support.cdprojektred.com/en/cyberpunk/pc/sp-technical/issue/2233/how-do-i-clean-install-my-game):&#x20;

* `%userprofile%\Saved Games\CD Projekt Red\Cyberpunk 2077`
* `%userprofile%\AppData\Local\REDEngine`
* `%userprofile%\AppData\Local\CD Projekt Red`

You can quickly navigate to the folders by pasting the path into your Windows Explorer's path bar, or pressing Windows+R, pasting the path there, and&#x20;

## The nuclear option: a clean install

<figure><img src="../../.gitbook/assets/troubleshooting_headers_nuclear.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
This is the last resort and you do **not** need to do this — run [Mod Remover](https://www.nexusmods.com/cyberpunk2077/mods/8597/) for the same result in less time. However, if you're still set on reinstalling, the instructions below will help you completing that in minimal time.
{% endhint %}

### Back it up, baby!

{% hint style="danger" %}
Unless you back them up, your mods will be **lost**. If you don't want that, make backups of the following folders:

* [`/mods`](#user-content-fn-15)[^15]
* [`/archive/pc/mod`](#user-content-fn-16)[^16]
* [`/bin/x64/plugins/cyber_engine_tweaks`](#user-content-fn-17)[^17]
* [`/r6/scripts`](#user-content-fn-18)[^18]
* [`/r6/tweaks`](#user-content-fn-19)[^19]

The [script](./#is-there-a-shortcut) linked above will do that for you.
{% endhint %}

### Quick (download <4GB)

{% hint style="danger" %}
Unless you [back up your mods and scripts](./#back-it-up-baby), all your settings and manually installed mods will be lost.
{% endhint %}

{% hint style="warning" %}
The instructions below tell you which folders **not** to delete. Delete everything else.
{% endhint %}

1. Go to the Cyberpunk 2077 install directory
2. Delete everything **except for** the folder `archive`
3. Inside `archive`, delete everything **but** the folders `pc`
4. Inside `pc`, delete everything but the folders `content` and `ep1`
5. Verify your files

### Modular / minimal download (download <1GB

{% hint style="danger" %}
Unless you [back up your mods and scripts](./#back-it-up-baby), all your settings and manually installed mods will be lost.
{% endhint %}

{% hint style="success" %}
Will download < 1GB.&#x20;
{% endhint %}

Rename or remove the following folders. If you do not have them, you don't need to do anything.

<pre><code>/<a data-footnote-ref href="#user-content-fn-20">mods</a>
/<a data-footnote-ref href="#user-content-fn-21">plugins</a>
<a data-footnote-ref href="#user-content-fn-22">/engine</a>
/r6
<a data-footnote-ref href="#user-content-fn-23">/red4ext</a>
<a data-footnote-ref href="#user-content-fn-24">/archive/pc/mod</a>
<a data-footnote-ref href="#user-content-fn-25">/bin/x64/plugins</a>
</code></pre>

Afterwards, verify your files.

### Nuke it from the orbit: The thorough version

In case neither of these options is good enough for you, you can find a full reinstall guide on [CDPR's support page](https://support.cdprojektred.com/en/cyberpunk/pc/sp-technical/issue/2233/how-do-i-clean-install-my-game).

## A fresh install: Starting from scratch

<figure><img src="../../.gitbook/assets/troubleshooting_headers_starting_clean.png" alt=""><figcaption></figcaption></figure>

You have completed either of the previous steps. Your game should start now. **If it does not**, you either have leftover files (check [here](./#the-nuclear-option-a-clean-install) for how to get rid of them), or you have a problem that is not related to Cyberpunk. Make sure to follow the hints in the red box [at the very beginning of this guide](./#navigation).

Now it's time to **systematically** install mods. We'll start by [installing the frameworks](./#installing-the-frameworks) and making sure that the game starts up without any framework-dependent mods. Afterwards, you can add back all of your mods, and if the game stops working, find the offender via [bisect](./#finding-the-broken-mod-bisecting).&#x20;

{% hint style="success" %}
Don't worry about your savegames — those are fine, even if they won't load right now. We're just laying the foundation here that you can later build upon.
{% endhint %}

Let's go about it step-by-step.

### Installing the frameworks

{% hint style="info" %}
This step will tell you how to set up your Cyberpunk install with the necessary dependencies so that you can start modding.
{% endhint %}

Check the [framework page](../../for-mod-creators-theory/core-mods-explained/). For each of the frameworks, complete the following steps:

* If you didn't have it in your previous install, skip it.
* Install it (manually or via Vortex, your choice)
* Install **all of its** [**dependencies**](requirements-explained.md)
* Start the game and load a savegame (you can also do this after installing all of them, but if you run into issues, that will make isolating the point of failure more difficult).
* Optional (for CET): Start the game and make sure that it asks you to bind a key. If not, check the [corresponding section of this guide.](./#cet)

{% hint style="warning" %}
If you are using redmod (have any folders inside of `/mods`), you probably have  [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176) installed. That is no longer necessary with RED4ext >= 1.13 and can lead to false positives. Uninstall it!
{% endhint %}

Once you are done, start up your game and load a savegame. If you don't have one or the game still crashes, start a new game.

**This should now work**. If it doesn't, you need to check your [log files](./#check-the-log-files) to see which framework is causing trouble, or find us on [Discord](https://discord.gg/redmodding) in #mod-troubleshooting.

{% hint style="warning" %}
You **need** to complete this step before proceeding: if the core frameworks aren't working **without** mods, they won't work **with** mods – adding anything now will just make debugging more difficult.

Fortunately, this is not rocket science. Be methodical and install them one by one. If you need help, you can find us on [Discord](https://discord.gg/redmodding) (`#mod-troubleshooting`)
{% endhint %}

### Adding (back) your mods

{% hint style="success" %}
If you don't (yet) have any mods, you can head over to Nexus and start installing. Make sure that you include all necessary [dependencies](requirements-explained.md)!
{% endhint %}

{% hint style="warning" %}
This section assumes that&#x20;

* you installed all required [core mods](./#frameworks-core-mods)
* your game is starting
* &#x20;you can (without crashing) do either of these things:
  * load a savegame&#x20;
  * start a new game

If you didn't make it that far, the steps below won't help you and will only obscure your problem. Please head back to [#step-1-temporarily-disable-all-your-mods](./#step-1-temporarily-disable-all-your-mods "mention")and complete the process.&#x20;

\
If you need help, find us on [Discord](https://discord.gg/redmodding) in `#mod-troubleshooting!`&#x20;
{% endhint %}

#### If you're using Vortex

Head directly to the [bisecting](./#finding-the-broken-mod-bisecting) section and pretend you have just removed all your mods.

#### If you made a manual backup:

For each folder that you have [backed up](./#back-it-up-baby) (check link for a list), repeat the following steps:

1. Put it back into its original place in your new/fresh install
2. Start up the game
3. Load a non-modded savegame **or** start a new game

If your crash(es) are back, you can now go to the [bisect](./#go-bisect) section and follow the steps for your folder.&#x20;

## Something something files

<figure><img src="../../.gitbook/assets/troubleshooting_headers_something_files.png" alt=""><figcaption></figcaption></figure>

Your error goes something like this:&#x20;

* ```
  Access is denied
  ```
* ```
  Can't access file 'some/file'
  ```
* ```
  could not move file from 'Path\to\blabla.tmp' to 'Path\to\Cyberpunk 2077\subdir\some.file'
  ```
* ```
  Expression: EXCEPTION_ACCESS_VIOLATION
  ```
* ```
  The thread attempted to read inaccessible data at 0xsomething
  ```
* ```
  An exception occured while creating the logger
  ```
* Cyberpunk is trying to write to a file that doesn't exist

These are caused by **access errors** – Cyberpunk is trying to read or write a file, and for some reason, it can't.&#x20;

Follow the steps in this section one by one, or find us on [Discord ](https://discord.gg/redmodding)in #mod-troubleshooting.

### Make sure that the file path exists

{% hint style="info" %}
Ignore this if you can't spot any file paths in the error message
{% endhint %}

If Cyberpunk is trying to move files to a subdirectory that it can't access, make sure that the directory actually exists (if it doesn't, create it). The most frequent candidate for this is /`r6/cache/modded`.

### Make sure that no previous game instance is running

Sometimes, the game instance doesn't shut down properly and is still running in the background, althoguh you can't see a window. This problem goes away after rebooting.

* Open your task manager (Ctrl+Shift+Esc)
* Switch to the **Details** tab
* Sort by Name and scroll to C
* Check if you can see anything **Cyberpunk** in the list.
* If yes, right-click on it and select **End Task**

{% hint style="info" %}
It is possible that your antivirus is causing this problem. Before you lose your mind, try temporarily disabling it.
{% endhint %}

### Reboot your PC

Always a good idea to do that from time to time – in this case, it could make the error go away.&#x20;

If it doesn't, check the next steps on the list.

### Make sure that all files in the game directory are writable

Sometimes, files in your [Cyberpunk game directory](#user-content-fn-26)[^26] are set to read-only.&#x20;

#### **What kind of monster would do something like that???**

We've had confirmed reports of the following culprits:&#x20;

* Steam
* mo2 mod manager
* various flavours of antivirus

{% hint style="info" %}
You can fix this either via [Windows Explorer](./#via-windows-explorer) or via [system console](./#via-system-console), the results will be the same.
{% endhint %}

#### Via system console:

* Press Windows+R
* type `cmd` and press Return to open the command line
*   run the following command (replace the path with your actual game dir):

    <pre><code>attrib -r "<a data-footnote-ref href="#user-content-fn-27">C:\Path\To\Cyberpunk</a>\*.*" /s
    </code></pre>

#### Via Windows Explorer:&#x20;

* Navigate to the Cyberpunk game directory and right-click on it
* Select **Properties** (the last entry in the drop-down menu)
* Uncheck the "Read-only" box:

{% hint style="info" %}
After unchecking and applying changes, the box will jump back to maybe-checked. That's because Windows can't tell if the folder contains read-only files. However, since you just made sure that it doesn't, you can ignore this.
{% endhint %}

<figure><img src="https://i.stack.imgur.com/ZR59I.jpg" alt=""><figcaption></figcaption></figure>

### File Ownership

Sometimes, file ownership got messed up, and not all files in the folder are accessible by your current Windows account. It is a mystery how this comes to be.

You can fix it via [system console](./#via-commandline) or via [Windows Explorer](./#via-windows-explorer-1); either of those will do. If in doubt, the commandline one is more thorough.

#### Via commandline

{% hint style="warning" %}
In any of the commands below, you need to substitute `C:/Path/to/Cyberpunk2077` with the path to your [game directory](#user-content-fn-28)[^28].
{% endhint %}

* Press Windows+R
* Type cmd and press return
* Run the following command (make sure to insert your real Cyberpunk path):&#x20;
* ```
  takeown /R /A /F "C:/Path/to/Cyberpunk2077" /D N
  ```
* If that didn't help, run the command `whoami` to see your current user name. You will need it for the next step.\
  &#xNAN;_&#x49;t should be identical to your Windows username, but if you have spaces or special characters, Windows might get funny about the spelling._
* Run the following command (putting your actual game dir and the username from `whoami`):\

* ```
  icacls "C:/Path/to/Cyberpunk2077" /grant YourUserName:F /T /C
  ```

#### Via Windows Explorer

We haven't included the full instructions here, but you can check [this guide](../users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md).

### Reboot your PC again

If none of these things has helped, reboot your computer.&#x20;

#### The error should be gone now.

Not to say that your game will work now – but if you still have an error, it's hopefully a different one. Go back to the start of the guide and let's fix that one too!

## Your quests are not working / You get LocKey# messages

This section tells you how to deal with&#x20;

* quests that are not starting&#x20;
* broken text messages&#x20;
* broken journal entries

### Quests not starting although you meet all prerequisites

When two mods hook into the same quest to do their thing, this can break the quest.

#### Known problem children:

* Phone Messages Overhaul
* Judy/Panam Romance Messages Extended

{% hint style="info" %}
These mods can not be used together. PIck either of the entries below!
{% endhint %}

If it wasn't that, check any other mod that hooks into basegame quests, such as romance mods or "quest fixes".&#x20;

{% hint style="warning" %}
You can't 'fix' a quest by changing quest facts. Setting a quest fact after you've passed the sequence where it is checked will do nothing — worst case is you will brick your save.
{% endhint %}

### Shards, text messages or journal quest just say `LocKey#`

#### If you are playing in a language other than English

This can be caused by mods not including translation files for your language. Check if there is a translated version, or change the game language to English.

#### If you are playing in English

Most likely caused by a mod conflict: two mods are trying to change the same text archive or journal entry. You can use the [Archive Conflict Checker Tool](https://www.nexusmods.com/cyberpunk2077/mods/11126) to find conflicting mods, or check the list below.

#### Known problem children:

* Phone Messages Overhaul (you can resolve this by setting this mod to [load first](../users-modding-cyberpunk-2077/load-order.md))&#x20;
* Hot Fuzz
* Biosculpted Exotics
* Database Fixes

If none of the mods have suggestions about load order, swap them around and see if it fixes the issue.

## Redscript Compilation Failed

<figure><img src="../../.gitbook/assets/troubleshooting_headers_compilation_failed.png" alt=""><figcaption></figcaption></figure>

You're running into the following error:

```log
REDScript compilation failed. The game will start, but none of 
the scripts will take effect. This is caused by errors in:
```

<figure><img src="../../.gitbook/assets/troubleshooting_redscript_compilation_failed.png" alt=""><figcaption><p>Your error message</p></figcaption></figure>

{% hint style="info" %}
This workflow is geared at the exact error above. If you have a different one, it's still worth checking this, but you can also head back [to the start of the guide](./#navigation) and find the right section.
{% endhint %}

### 0. Make sure that you don't have multiple versions of [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780) installed

In the past, Codeware wasn't a standalone mod, but was instead [**bundled**](#user-content-fn-29)[^29] inside of other mods. Since that is different now, the leftover versions can cause errors.

1. Search your [Cyberpunk game directory](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/) for `Codeware`.&#x20;
2. If you have exactly one folder, this is not your problem — proceed to [the next step](./#1.-make-sure-that-you-have-the-latest-versions).
3. Delete everything you have found.
4. Reinstall the latest version of [Codeware](https://www.nexusmods.com/cyberpunk2077/mods/7780) from Nexus.
5. Delete the folder `r6/cache`
6. Verify your game

### 1. Make sure that you have the latest versions

{% hint style="danger" %}
Actually check this. Do not rely on memory or common sense – if in doubt, re-download. ~~(This is totally not something that the guide's author learned the hard way)~~
{% endhint %}

1. Check Redscript ([github](https://github.com/jac3km4/redscript/releases/) | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/1511)) and update it
2. Uninstall cybercmd ([github ](https://github.com/jac3km4/cybercmd/releases)| [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/5176)), if you have it.

#### Optional, but recommended:&#x20;

Check that you have the latest versions of all troublesome Redmods.

### 2. Check redscript.log

It is in `r6/log/redscript.log`.&#x20;

See if you can find any errors – warnings may or may not be a problem, see [here](finding-and-reading-log-files.md#warning) for context.

### 3. Reset Redscript

{% hint style="warning" %}
If you rename or delete any directories, make sure to create a new, empty directory.
{% endhint %}

#### Redscript: Disable dependent mods

Vortex: Disable them

Manual: Remove the contents of `r6/scripts/`.&#x20;

{% hint style="info" %}
You can zip the directory from the windows context menu, then delete its contents.
{% endhint %}

#### Resetting the redscript cache

* delete [`r6/cache`](#user-content-fn-30)[^30]
* verify game files
* **Optional:** create a new directory `r6/cache/modded` (this will prevent errors)
* Make sure that `r6/scripts` [is empty](#user-content-fn-31)[^31]
* Make sure that `red4ext/plugins` [is empty](#user-content-fn-32)[^32] (that the red4ext core frameworks aren't getting loaded)

{% hint style="success" %}
Make sure your game starts up without error.
{% endhint %}

### 4. Reinstall your mods

**Hopefully, your problem should be gone now.**&#x20;

It's time to put your mods back and see if you can start the game - see [Starting from Scratch](./#starting-from-scratch).



## XML Document parsed with errors

`XML document parsed with errors: C:\Path\toCyberpunk 2077\r6/config/inputUserMappings.xml`\
`Error description: Error parsing element attribute`

According to InputLoader's [documentation](https://www.nexusmods.com/cyberpunk2077/mods/4575), you can ignore this. Keep searching!\
(You can also try reinstalling InputLoader and hope that the error goes away)

<figure><img src="../../.gitbook/assets/troubleshooting_headers_everything_else.png" alt=""><figcaption></figcaption></figure>

## CET isn't starting

CET needs **at least** VisualC 14.40.33810.0 . You can download it from the official Microsoft website \
([direct link](https://aka.ms/vs/17/release/vc_redist.x64.exe))

## You forgot your CET keybind&#x20;

Delete the file `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\bindings.json.` The game should let you bind a new key at the next startup.

{% hint style="info" %}
You can find more troubleshooting help for Cyber Engine Tweaks in the [corresponding wiki](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-_ua1-887967055/getting-started/installing/troubleshooting): \
[Cyber Engine Tweaks](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MP5jWcLZLbbbzO-_ua1-887967055/ "mention") -> [Troubleshooting](https://app.gitbook.com/s/-MP5jWcLZLbbbzO-_ua1-887967055/getting-started/installing/troubleshooting "mention")
{% endhint %}

## Photomode screenshots are blank

With 1.62, screenshots are now saved to `Documents\CDPR\Cyberpunk\Screenshots` , and the previous location will receive an empty file.

With 1.63, screenshots have now been moved _back_ to `\Pictures\Cyberpunk 2077`

## Press \[none] to continue / can't skip loading screen

That is due to [Input Loader](https://www.nexusmods.com/cyberpunk2077/mods/4575) requiring an update.

## I'm not getting a metro ticket!

If you have passed the start of Act 2 and you aren't getting a text with a metro ticket because of an outdated mod, there is nothing you can do. Even removing the mod won't fix it. Remove the mod, then play from an earlier save.

## \[Kerry/Judy/Panam/River] isn't talking to me!

This is a new one with 2.1 — a reciprocal effect of CDPR's romance interactions with previous romance or phone message overhauls.  The bad news is that the broken state is baked into your savegame and you can't get rid of it by removing your mods. The good news is that modders are already on top of the problem, and simply **updating** should fix your issue.

{% hint style="warning" %}
Make sure to check the instructions and pinned comments on the Nexus for any romance or phone message overhaul mods before running the command below. There's a good chance that you can only use it once for any given save, and you don't want to waste your shot.
{% endhint %}

You can try running the following command (which has solved the issue for some people):

```
 Game.GetQuestsSystem():SetFactStr("judy_default_on",1)
```

Switch "judy" for the affected NPC's name. Then, save and reload.&#x20;

Alternatively, you can use [this mod](https://www.nexusmods.com/cyberpunk2077/mods/4508) for Judy (which is supposed to have helped as well).

{% hint style="info" %}
If that didn't solve your problem, there is a good chance that you're stuck. You can check the Nexus pages and -comments of everything that looks as if it interacted with romance partners or phone messages, but there is a good chance that you missed the point where the interactions should trigger. Check [#im-not-getting-a-metro-ticket](./#im-not-getting-a-metro-ticket "mention") for details.
{% endhint %}

## I'm naked!

Here's how to fix your sudden indecent exposure.

1. Go to the vanilla wardrobe in your apartment
2. Create an outfit (anything will do)
3. Equip the outfit
4. Un-equip the outfit
5. Save and reload

### V has black eyes!

You have an **outdated** or **two different** versions of [Kala's Unique Eyes](https://www.nexusmods.com/cyberpunk2077/mods/1937) installed.&#x20;

Make sure to uninstall all your eye mods, then open your [Cyberpunk game directory](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/)[ ](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/)and use the Windows Search for e.g. `kala`. Make sure to delete all leftover files!

## I have another problem that isn't on this list

Here's the catch-all solution. After this, your game _will_ work (or the problem you have is not Cyberpunk related).

1. (optional, as this might solve it): [Reset the Redscript cache](./#3.-reset-redscript).
2. If your problem doesn't go away, follow the instructions [in the next section](./#i-really-just-want-to-get-this-working-what-do-i-do).

## I really just want to get this working, what do I do?

<figure><img src="../../.gitbook/assets/troubleshooting_headers_tldr.png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
You might want to **deactivate ReShade** before you start debugging. Especially after DLSS, it has been known to cause crashes.
{% endhint %}

**The bad news** is, at this point you have little choice but to reset your Cyberpunk install and re-mod it from scratch. **The good news** is that the process is really streamlined. If you don't run into any hitches, you're <30 minutes away from a working game.

Now, how do we go about this?

### Is there a shortcut?

**Yes!** There is a batch script that will automate steps 1-4 of the list below for you.

If you don't want to download and run script files from the internet, you can go [here](./#step-1-temporarily-disable-all-your-mods) and complete the steps by hand. Otherwise:

1. Download the mod remover script by either
   * downloading it from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8597/) and following the install instructions
   * grabbing it from [github](https://raw.githubusercontent.com/manavortex/cyberpunk2077/master/batch/cyberpunk2077_disable_all_mods.bat) (**right-click -> save as**) and moving it to your [Cyberpunk game directory](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/)\
     &#xNAN;_&#x4C;ink goes to the_ [_github repository_](https://github.com/manavortex/cyberpunk2077/blob/master/batch/cyberpunk2077_disable_all_mods.bat) _of the person who wrote most of this guide_.
2.  **Optional**: If you don't want the script to delete modded files for you (because you just want to disable mods), right-click on the file and select **Edit**, then find and delete line 6:

    ```
    set DELETE_FILES=1
    ```
3. Make sure that the file is in your [Cyberpunk game directory](../users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory/). If you downloaded from Nexus, you should have a `cyberpunk2077_disable_all_mods.bat.`
4. Double-click it
5. Follow the instructions and prompts
6. Verify your game files
7. **Optional:** You can now proceed to [Step 5](./#step-5-repair-game-files) and start modding your game again.

{% hint style="success" %}
Instead of following these instructions, you can also [reinstall the game](./#the-nuclear-option-a-clean-install). Do yourself a favour and check the instructions, as you might be left with residual files otherwise.
{% endhint %}

### Step 1: Temporarily disable all your mods

#### Vortex

* Follow the instructions and prompts

Press the **purge** button — this will remove any and all installed mods.

{% hint style="danger" %}
Do **not** press deploy.&#x20;
{% endhint %}

#### If all your mods were managed via Vortex:

Start Cyberpunk however you want, as long as it's not via Vortex. If it starts now, you're done here and can proceed with [bisecting](./#finding-the-broken-mod-bisecting) – otherwise, go to [Remove RedScript](./#step-4-remove-redscript).

#### If you had a mixed install:&#x20;

Complete the instructions in the section [manual](./#manual) now.

#### Manual

Find the following folders:

```
Cyberpunk 2077\archive\pc\mod
Cyberpunk 2077\mods
```

and rename them to&#x20;

```
Cyberpunk 2077\archive\pc\mod_
Cyberpunk 2077\mods_
```

{% hint style="info" %}
The purpose of renaming them is that the game won't find them anymore, but you still have a back-up of the files inside. Feel free to achieve this goal however.
{% endhint %}

You can optionally create a new, empty folder with the same name.

{% hint style="success" %}
Check if the problem is gone.&#x20;

If it is, put the folders back one after the other and apply the [bisection method](./#finding-the-broken-mod-bisecting).
{% endhint %}

### Step 2: disable CET

Find the folder

```
Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks
```

and move it out of `plugins` (e.g. put it on your desktop).

{% hint style="danger" %}
If you'd rather delete it, make sure that you retain a copy of your `mods` and `plugins` directories, as they contain your mod settings (AMM decorations etc.)
{% endhint %}

{% hint style="success" %}
Check if the problem is gone.&#x20;

If it is, put the folder back and apply the [bisection method](./#finding-the-broken-mod-bisecting) to `cyber_engine_tweaks\mods` and `cyber_engine_tweaks\scripts` until you have found the culprit.
{% endhint %}

### Step 3: Remove scripts and tweaks

First, remove (or rename) the cache:&#x20;

```
 r6/cache/modded
```

{% hint style="success" %}
Verify game files. Check if the problem is gone.
{% endhint %}

If that didn't do the trick, find the following folders:

```
Cyberpunk 2077\red4ext
Cyberpunk 2077\r6\scripts
Cyberpunk 2077\r6\tweaks
Cyberpunk 2077\engine\tools
```

and rename them, you know the drill.

{% hint style="success" %}
Check if the problem is gone.

If it is, put them back one by one until you find the one that breaks it. If that is one of `r6\scripts` or `r6\tweaks`, apply the [bisection method](./#finding-the-broken-mod-bisecting).
{% endhint %}

### Step 4: Remove RedScript

{% hint style="info" %}
You can try [resetting RedScript](./#3.-reset-redscript) first, but at this point, you'll going to have to verify your files anyway.
{% endhint %}

**Delete** the following files and folders. You don't need a backup, as you can reinstall RedScript from [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/1511). If any of them don't exist, that's okay — just means you don't have to delete them.

```
Cyberpunk 2077\bin\x64\d3d11.dll
Cyberpunk 2077\bin\x64\global.ini
Cyberpunk 2077\bin\x64\powrprof.dll
Cyberpunk 2077\bin\x64\winmm.dll
Cyberpunk 2077\bin\x64\version.dll
Cyberpunk 2077\engine\config
Cyberpunk 2077\engine\tools
Cyberpunk 2077\r6\cache
Cyberpunk 2077\r6\config
Cyberpunk 2077\r6\inputs
Cyberpunk 2077\V2077
```

{% hint style="info" %}
@Auska has compiled a handy script for unix people:
{% endhint %}

```
rm ./bin/x64/d3d11.dll
rm ./bin/x64/global.ini
rm ./bin/x64/powrprof.dll
rm ./bin/x64/winmm.dll
rm ./bin/x64/version.dll
rm ./engine/config
rm ./engine/tools/*
rm ./red4ext
rm ./r6/cache
rm ./r6/config
rm ./r6/inputs
rm ./V2077

mv ./r6/cache/final.redscripts.bk ./r6/cache/final.redscripts
```

### Step 5: Repair game files

_Exact procedure as documented by @ArsenicTouch_

#### GOG

Go to Games -> Installed, right-click on your game and select the following menu entry:

![](<../../.gitbook/assets/image (170).png>)

#### Steam

1. Open your library
2. Right-click on "Cyberpunk 2077" and select "Properties"
3. Select "Local Files"
4. Click "Verify integrity of game files…"

#### Epic

1. Open your "Library"
2. On the "Cyberpunk 2077" tile, find the "…"
3. Select "Manage"
4. Click "Verify"

### Step 6: Launch the game

All files you deleted have been re-acquired. **If there are no left-over files from earlier modding attempts,** your game should work now.

{% hint style="warning" %}
If it does not and you have exhausted the reset options as specified in this guide ([troubleshooting](./#i-really-just-want-to-get-this-working-what-do-i-do) and [nuclear](./#the-nuclear-option-a-clean-install) both) and your game **still** does not start, then your problem exists outside of Cyberpunk.  In this case, you can&#x20;

* check your [file permissions](./#something-something-files) (separately for [REDprelauncher.exe](./#steam-verify-file-integrity-loop))
* [update the Windows stuff](./#navigation)
* google your error message and try solutions at random
{% endhint %}

### Step 7: Install the core frameworks

Now that your un-modded game is starting, it's time to [install the core frameworks](./#a-fresh-install-starting-from-scratch). Do this **before** you enable your other mods, as they won't work without their dependencies and can only add problems at this stage.

{% hint style="info" %}
You can now re-enable your mods. Do it in chunks and check that the game keeps working so that you can narrow down where the problem is, in case it isn't gone for good.
{% endhint %}

## Dealing with a broken mod

<figure><img src="../../.gitbook/assets/troubleshooting_headers_troubleshooting_mod.png" alt=""><figcaption></figcaption></figure>

You have followed all the steps and your game is launching, but you now have a mod on your hands that just doesn't work, and you want it to. What do you do now?

{% hint style="info" %}
If you join a [modding discord](https://discord.gg/redmodding) to ask for help, people will walk you through this list, so you might as well do it first. **Nobody will unbundle someone else's mod and just fix it for free unless they want to use it themselves.**
{% endhint %}

### 1. Make sure you have the correct dependencies

Many mods require frameworks or other mods to work. Check the mod's page and description for those, and install them.&#x20;

Repeat the process by installing the dependencies' dependencies, until you have everything necessary.

### 2. Check the mod's description

Often, the description contains detailed installation instructions, known incompatibilities and/or workarounds. Sometimes, mods worked on past versions of Cyberpunk, but the author stopped updating. In that case, proceed to [point 5](./#5.-hands-on-troubleshooting) of this list.

{% hint style="danger" %}
Before you get upset, please keep in mind that modders don't do this for a living (these are called "game developers" and they get paid for it). Somebody made this **in their spare time, for their own use,** and then decided to **share it with you for free**. Do you know the easiest way to avoid toxic users? It's **not publishing your mods**. No reward system, credit points or reputation will ever make up for online abuse.

As a mod author, I can tell you that I will ignore assholes, but gladly spend an extra hour after work to help out someone who politely asks me for help.
{% endhint %}

### 3. Check the mod's comment section

You're unlikely to be the first person to run into this problem. There is a good chance that the comment section on the download page has helpful information. Look for either a pinned post by the mod's author or a user discussion about your problem — these often contain a solution.

### 4. If you are using a mod manager: Try installing it manually

While mod managers are very reliable and get better with every new release, you should rule out that they are the cause of the problem by installing the mod from hand.

If everything else works and installing the mod by hand still breaks compilation, then it is broken. See "[Dealing with a broken mod](./#dealing-with-a-broken-mod)" below. start your game client's file verification.&#x20;

### 5. Contact the mod's author

Describe your problem as clearly as you can, and add all useful data.&#x20;

**Bad bug report:** "Your mod doesn't work lol pls help"

**Good bug report (example)**: "Hi, installing your mod (manually and Vortex) causes a Redscript compilation error on startup (possible screenshot of error popup). xxx.log says \<citation of error message>. All my dependencies are up-to-date, and I've ruled out that it's any other mod. Can you help me out?"

**Good bug report (example 2)**: "Hi, when I try to equip Item \<item name and colour>, it doesn't show up and I only get glitches. I'm using Hyst's boob mod and \<specific version and variant> of your mod. I hope you can help me? Thank you for making this."

{% hint style="danger" %}
As per the last red box, do keep in mind that you're asking a **favour**. The modder doesn't have your problem, and if they do, they know **exactly** how to fix it. The most time-efficient response for them is to ghost you, so any kind of response is either them being nice or getting mad when you or someone involved ignores visible information.
{% endhint %}

### 5. Hands-on troubleshooting

At this point, you have exhausted all easily accessible solutions. If you still want the mod to work, you will have to get involved yourself. A commendable attitude! (Not sarcasm, it really is.)

{% hint style="info" %}
This is the point where you might want to join a [modding discord](https://discord.gg/redmodding), because now you're entering the territory where other modders can actually help you.
{% endhint %}

#### [Check the log files](./#finding-the-broken-mod-log-files)

Usually, there will be a [log file](./#finding-the-broken-mod-log-files) that will point you towards the source of your problem. If there isn't (the game loads and the mod just fails silently), that means that the error is inside the archive and you have to become a modder.

#### Fixing scripts

But sometimes, you're lucky. Sometimes, the error is in a script file. You can tell this by a log entry pointing towards a file in your Cyberpunk folder (e.g. `r6\scripts\my_broken_script.reds`).

Open up that file in a text editor like [Notepad++](https://notepad-plus-plus.org/downloads/) and try to find and fix the problem. Sometimes, the log file has more information. Sometimes, an online syntax check can help you — there isn't one for redscript, but it's fairly close to lua.&#x20;

Sometimes, such mistakes are trivial — a forgotten **,** or incorrect file encoding. Often, they are not.

{% hint style="info" %}
A tip for [nil access error in lua](../../for-mod-creators-theory/references-lists-and-overviews/scripting/scripting-best-practices-pitfalls.md#fixing-preventing-nil-access)
{% endhint %}

#### Ascending from user to modder

If the error isn't in any script files, you will have to **unbundle the .archive**, load it in [WolvenKit](https://github.com/WolvenKit/Wolvenkit/releases), and get your hands dirty. We'll be seeing each other, choomba!



##

[^1]: 

[^2]: 

[^3]: A mod that won't even load without red4ext - .dll files in the subfolders of red4ext/plugins. Disable those first to isolate red4ext as the root of the problem before you proceed.

[^4]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe

[^5]: `archive/pc/mod`

[^6]: e.g. _`\archive\pc\mod_`_

[^7]: e.g. _`\archive\pc\mod_`_

[^8]: `archive/pc/mod`

[^9]: e.g. _`\archive\pc\mod_`_

[^10]: `archive/pc/mod`

[^11]: `archive/pc/mod`

[^12]: e.g. _`\archive\pc\mod_`_

[^13]: A mod that forces Cyberpunk to actually load the modded items instead of using the cache they had to put in for last-gen console support. For a technical explanation, check the wiki page about commonCookData.

[^14]: A mod that forces Cyberpunk to actually load the modded items instead of using the cache they had to put in for last-gen console support. For a technical explanation, check the wiki page about commonCookData.

[^15]: .archive mods in the redmod format

[^16]: .archive mods in the legacy format

[^17]: CET settings, radioExt files, Appearance Menu Mod settings _and user presets_

[^18]: Redscript directory

[^19]: TweakXL directory

[^20]: .archive mods in the redmod format

[^21]: an ancient plugin directory that hasn't been used for several game updates, but that can still cause trouble

[^22]: config and shader caches

[^23]: red4ext frameworks and associated data

[^24]: .archive mods in the legacy format, not redmod

[^25]: LUA plugins such as cyber engine tweaks

[^26]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe

[^27]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe



[^28]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe



[^29]: as in, "a subfolder in the folder of"

[^30]: The script directory for non-Redmods

[^31]: If it isn't, rename the entire directory to scripts\_ and create a new empty folder in its place

[^32]: If it isn't, rename the entire directory to plugins\_ and create a new empty folder in its place
