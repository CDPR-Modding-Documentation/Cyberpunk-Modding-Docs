---
description: A list of modding frameworks and links to their documentation
---

# ⚒ Core Mods explained

{% hint style="info" %}
You're probably used to the term **Core Mod** from other games. However, the technical term for these kinds of mod is a`framework`, which is what they're usually referred to by Cyberpunk modders.
{% endhint %}

## What is a framework?

While the game natively supports mods, this would have had us limited to replacing already existing items, but we wanted flying cars. So a bunch of brilliant people drilled deep into the code of Cyberpunk 2077 and created a bunch of tools that let us do more.

The most prominent example of a framework mod is the **Skyrim Script Extender** — fortunately, Cyberpunk 2077 is rather more stable.

{% hint style="danger" %}
Since this kind of mod interacts with the game's code on such a fundamental level, they are prone to **breaking** whenever CDPR changes their API. This is the reason why game updates break mods — we recommend to [**turn off auto-update**](../../for-mod-users/users-modding-cyberpunk-2077/users-downgrading-preventing-auto-updates.md) and manually upgrading once the frameworks you need have been brought up-to-date.
{% endhint %}

## Existing Frameworks <a href="#popular-frameworks" id="popular-frameworks"></a>

### Cyber Engine Tweaks (CET) <a href="#cyber-engine-tweaks" id="cyber-engine-tweaks"></a>

Cyber Engine Tweaks ([Nexus ](https://www.nexusmods.com/cyberpunk2077/mods/107)| [GitHub](https://github.com/yamashi/CyberEngineTweaks/releases)) does not only give you the game console to cheat items and change the weather, but also introduces a whole framework with **LUA** scripting support, letting modders interact with .&#x20;

Lots of mods and scripts run on top of CET, tweaking the game in various ways from changing the weather to adding a wardrobe system before CDPR added a wardrobe system.&#x20;

The perhaps most prominent example is Appearance Menu Mod ([wiki](amm.md) | [Nexus](https://www.nexusmods.com/cyberpunk2077/mods/790)), which turns Cyberpunk 2077 into The Sims: Capitalist Dystopia.

{% content-ref url="http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-MP5jWcLZLbbbzO-_ua1-887967055/" %}
[CET (English)](http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-MP5jWcLZLbbbzO-\_ua1-887967055/)
{% endcontent-ref %}

### Redscript <a href="#redscript" id="redscript"></a>

Redscript ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/1511) | [GitHub](https://github.com/jac3km4/redscript)) is an open-source programming language and toolkit, natively working with Cyberpunk 2077's scripting runtime. With the help of .reds files under `r6/scripts`, it lets you modify and extend the user interface, change the combat balance, influence NPC behaviour, and much more.&#x20;

{% content-ref url="http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg_/" %}
[Redscript](http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg\_/)
{% endcontent-ref %}

### RED4ext <a href="#red4ext" id="red4ext"></a>

RED4ext ([Nexus ](https://www.nexusmods.com/cyberpunk2077/mods/2380)| [GitHub](https://github.com/WopsS/RED4ext/releases)) is Cyberpunk 2077's equivalent to Skyrim Script Extender. It adds further scripting capability on top of what CDPR has so kindly provided, loading scripts from `/red4ext/plugins`.

{% hint style="warning" %}
With Red4ext >= 1.13, you no longer need [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176). Make sure to **uninstall** it!
{% endhint %}

Aside from being required for many mods, it is a perquisite for other frameworks such as ArchiveXL, TweakXL, and Equipment-EX.

{% content-ref url="http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-MjhIjZ0BBsL6SCohtnf/" %}
[RED4ext](http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-MjhIjZ0BBsL6SCohtnf/)
{% endcontent-ref %}

### ArchiveXL

ArchiveXL ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/4198) | [GitHub](https://github.com/psiberx/cp2077-archive-xl/)) allows us to load custom resources into Cyberpunk 2077. Working under the hood, it is the essential tool to **add** rather than **replace**.

{% embed url="https://github.com/psiberx/cp2077-archive-xl" %}

### TweakXL  <a href="#tweakxl-+-archivexl" id="tweakxl-+-archivexl"></a>

TweakXL ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/4197) | [GitHub](https://github.com/psiberx/cp2077-tweak-xl)) is an extension of RED4ext to modify the **TweakDB** by writing script extensions in both YAML and RED format.&#x20;

By interacting with REDEngine 4's database, it lets you view and alter information about game entities and behaviour in real time.

{% embed url="https://github.com/psiberx/cp2077-tweak-xl" %}

### Equipment-EX

Equipment-EX ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/6945) | [GitHub](https://github.com/psiberx/cp2077-equipment-ex)) makes use of every single one of the frameworks mentioned above to overhaul CDPR's wardrobe system. Extending it from 6 slots to more than 30, it lets you save an unlimited number of outfits and supports modded items.

### Codeware

Codeware ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/7780) | [GitHub](https://github.com/psiberx/cp2077-codeware)) adds powerful script extensions, opening up possibilities that are otherwise locked inside Cyberpunk's file structure. For example, while you could always see [an NPC's appearances](../modding-guides/npcs/appearances-change-the-looks.md) in Wolvenkit, it was not possible to access that information at runtime.

## Log files for the frameworks

### Logs: Cyber Engine Tweaks

```
Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\cyber_engine_tweaks.log
```

This will tell you what mods and scripts CET is loading, and if there have been any errors in the process.

If all goes well, it will look like this:

```log
[2023-04-21 23:23:30 UTC+01:00] [info] [Options] [3004] Cyber Engine Tweaks is starting...
[2023-04-21 23:23:30 UTC+01:00] [info] [Options] [3004] CET version v1.24.1 [HEAD]
[2023-04-21 23:23:30 UTC+01:00] [info] [Options] [3004] Game version 1.6202
[2023-04-21 23:23:30 UTC+01:00] [info] [Options] [3004] Root path: "C:\Games\Cyberpunk 2077\bin\x64"
[2023-04-21 23:23:30 UTC+01:00] [info] [Options] [3004] Cyber Engine Tweaks path: "C:\Games\Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks"
[2023-04-21 23:23:30 UTC+01:00] [info] [Options] [3004] Lua scripts search path: "C:\Games\Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods"
[2023-04-21 23:23:30 UTC+01:00] [info] [StateTickOverride] [3004] Main thread function CBaseInitializationState::OnTick hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [StateTickOverride] [3004] Main thread function CInitializationState::OnTick hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [StateTickOverride] [3004] Main thread function CRunningState::OnTick hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [StateTickOverride] [3004] Main thread function CShutdownState::OnTick hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [HookGame] [3004] CRenderNode_Present_InternalPresent function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [HookGame] [3004] CRenderGlobal_Resize function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [HookGame] [3004] CRenderGlobal_Shutdown function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] RealRunScriptFunction function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] RealCreateFunction function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] CScript::Log function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] CScript::LogChannel function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] CScript::TDBIDConstructorDerive function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] CScript::ToStringDEBUG function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] CScript::TranslateBytecode function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] CScript::TweakDBLoad function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] PlayerSystem::OnPlayerSpawned function hook complete!
[2023-04-21 23:23:30 UTC+01:00] [info] [Hook] [3004] Hook mouse clip function!
[2023-04-21 23:23:30 UTC+01:00] [info] [OptionsInitHook] [3004] Hidden options hook: success
[2023-04-21 23:23:31 UTC+01:00] [info] [InitializeTweakDBMetadata] [15668] CDPRTweakDBMetadata::Initalize() - Primary TweakDB initialization successful!
```

### Logs: Redscript

```
Cyberpunk 2077\r6\logs\redscript_rCURRENT.log
```

It will tell you which `.reds` files it has been loading, and if any of them failed.&#x20;

{% hint style="info" %}
Please note the **warning** in the log:&#x20;

* If the mod is working, ignore it
* If the mod isn't working, this tells you what to check. You can't have mods installed twice!
{% endhint %}

If all goes well, it will look like this:

```log
[INFO - Sat, 22 Apr 2023 10:08:08 +0100] Using defaults for the script manifest (manifest not present)
[INFO - Sat, 22 Apr 2023 10:08:08 +0100] Compiling files: C:\Games\Cyberpunk 2077\r6\scripts\a-bunch-of-stores-atelier-store.reds, C:\Games\Cyberpunk 2077\r6\scripts\virtual-atelier\vendor-preview\GarmentItemPreview.reds
[WARN - Sat, 22 Apr 2023 10:08:08 +0100] At C:\Games\Cyberpunk 2077\r6\scripts\appearanceChangeUnlocker\mirrorUnlocker.reds:38:1:
@addField(inkScrollArea)
^^^
field with this name is already defined in the class, this will have no effect

(a bunch of these warnings)

[INFO - Sat, 22 Apr 2023 10:08:08 +0100] Compilation complete
[INFO - Sat, 22 Apr 2023 10:08:08 +0100] Output successfully saved in C:\Games\Cyberpunk 2077\r6\cache
```

### Logs: RED4ext

```
Cyberpunk 2077\red4ext\logs\red4ext.log
```

It will tell you which of the framework DLLs it has been loading.

If all goes well, it will look like this (version numbers are fake):&#x20;

```log
[2023-04-22 10:08:05.698] [RED4ext] [info] RED4ext (v4.7.11) is initializing...
[2023-04-22 10:08:05.698] [RED4ext] [info] Game patch: 4.511 Hotfix 999
[2023-04-22 10:08:05.698] [RED4ext] [info] Product version: 4.511
[2023-04-22 10:08:05.698] [RED4ext] [info] File version: 4.7.11.13361
[2023-04-22 10:08:05.717] [RED4ext] [info] RED4ext has been successfully initialized
[2023-04-22 10:08:05.816] [RED4ext] [info] RED4ext is starting up...
[2023-04-22 10:08:05.816] [RED4ext] [info] Loading plugins...
[2023-04-22 10:08:05.816] [RED4ext] [info] Loading plugin from 'C:\Games\Cyberpunk 2077\red4ext\plugins\ArchiveXL\ArchiveXL.dll'...
[2023-04-22 10:08:05.874] [RED4ext] [info] ArchiveXL (version: 4.7.11, author(s): psiberx) has been loaded
[2023-04-22 10:08:05.874] [RED4ext] [info] Loading plugin from 'C:\Games\Cyberpunk 2077\red4ext\plugins\Codeware\Codeware.dll'...
[2023-04-22 10:08:06.180] [RED4ext] [info] Codeware (version: 5.7.11, author(s): psiberx) has been loaded
[2023-04-22 10:08:06.180] [RED4ext] [info] Loading plugin from 'C:\Games\Cyberpunk 2077\red4ext\plugins\RedHotTools\RedHotTools.dll'...
[2023-04-22 10:08:06.262] [RED4ext] [info] RedHotTools (version: 1.6.11, author(s): psiberx) has been loaded
[2023-04-22 10:08:06.263] [RED4ext] [info] Loading plugin from 'C:\Games\Cyberpunk 2077\red4ext\plugins\TweakXL\TweakXL.dll'...
[2023-04-22 10:08:06.291] [RED4ext] [info] TweakXL (version: 4.8.12, author(s): psiberx) has been loaded
[2023-04-22 10:08:06.291] [RED4ext] [info] 4 plugin(s) loaded
[2023-04-22 10:08:06.291] [RED4ext] [info] RED4ext has been started
[2023-04-22 10:09:13.572] [RED4ext] [info] RED4ext is shutting down...
[2023-04-22 10:09:14.297] [RED4ext] [info] ArchiveXL has been unloaded
[2023-04-22 10:09:14.322] [RED4ext] [info] TweakXL has been unloaded
[2023-04-22 10:09:14.353] [RED4ext] [info] RedHotTools has been unloaded
[2023-04-22 10:09:14.468] [RED4ext] [info] Codeware has been unloaded
[2023-04-22 10:09:14.469] [RED4ext] [info] 4 plugin(s) unloaded
[2023-04-22 10:09:14.488] [RED4ext] [info] RED4ext has been shut down

```

### Logs: ArchiveXL

```
Cyberpunk 2077\red4ext\plugins\ArchiveXL\ArchiveXL.log
```

Tells you which .xl files have been found and processed and what it has been adding into the game files upon startup.&#x20;

If it loads correctly, you will see something like this:

{% hint style="info" %}
Note that the example contains a bunch of warnings. That indicates problems with the modded files (which I ignore, since they are working),&#x20;
{% endhint %}

```log
[2023-04-22 10:08:06.654] [info] Scanning for archive extensions...
[2023-04-22 10:08:06.654] [info] Reading "something.xl"...
[2023-04-22 10:08:06.667] [info] Configuration completed.

[2023-04-22 10:08:11.443] [info] |Localization| Initializing voiceover index...
[2023-04-22 10:08:11.444] [info] |Localization| No voiceover maps to merge.

[2023-04-22 10:08:11.469] [info] |Localization| Initializing translations for "en-us" language...
[2023-04-22 10:08:11.469] [info] |Localization| Processing "something.xl"...
[2023-04-22 10:08:11.469] [info] |Localization| Merging entries from "your\mod\name\translations.json"...
[2023-04-22 10:08:11.474] [warning] |Localization| Some translations merged with issues.

[2023-04-22 10:08:11.512] [info] |Localization| Initializing subtitles for "en-us" language...
[2023-04-22 10:08:11.512] [info] |Localization| No subtitles to merge.

[2023-04-22 10:08:17.489] [info] |Journal| Journal tree is initializing...
[2023-04-22 10:08:17.489] [info] |Journal| No entries to merge.

[2023-04-22 10:08:18.381] [info] |FactoryIndex| Initializing factory index...
[2023-04-22 10:08:18.382] [info] |FactoryIndex| Processing "something.xl"...
[2023-04-22 10:08:18.382] [info] |FactoryIndex| Adding factory "your\mod\name\factory.csv"...
[2023-04-22 10:08:29.926] [info] |FactoryIndex| All factories added to the index.

[2023-04-22 10:08:29.863] [info] |Streaming| World streaming is initializing...
[2023-04-22 10:08:29.863] [info] |Streaming| Processing "your_streaming_sector.xl"...
[2023-04-22 10:08:29.863] [warning] |Streaming| Streaming blocks merged with issues.

[2023-04-22 10:08:35.585] [info] |Localization| Initializing lipsync maps for "en-us" language...
[2023-04-22 10:08:35.585] [info] |Localization| No lipsync maps to merge.
```

### Logs: TweakXL

```
Cyberpunk 2077\red4ext\plugins\TweamXL\TweakXL.log
```

Tells you which tweaks have been read and processed, pointing out errors and warnings in the process. If your custom item additions don't work, you might find a hint here.

If it loads correctly, you will see something like this:

```log
[2023-04-22 10:08:16.150] [info] Scanning for tweaks...
[2023-04-22 10:08:16.150] [info] Reading "something.yaml"...
[2023-04-22 10:08:16.416] [error] Items.a_wip_mod.your_item.icon.atlasPartName: Invalid value, expected CName.
[2023-04-22 10:08:16.416] [warning] Items.a_wip_mod_appearance: Cannot clone Items.a_wip_mod_appearance, the record doesn't exists.
[2023-04-22 10:08:16.416] [info] Importing tweaks...
[2023-04-22 10:08:17.064] [info] Import completed.
[2023-04-22 10:08:17.066] [info] Executing scriptable tweaks...
[2023-04-22 10:08:17.066] [info] Executing "EquipmentEx.PatchOriginaltems"...
[2023-04-22 10:08:17.307] [info] Executing "EquipmentEx.PatchCustomItems"...
[2023-04-22 10:08:17.422] [info] Executing "EquipmentEx.RegisterOutfitSlots"...
[2023-04-22 10:08:17.450] [info] Executing "EquipmentEx.RegisterAppearanceSuffixes"...
[2023-04-22 10:08:17.451] [info] Execution completed.
[2023-04-22 10:08:17.451] [warning] Items.aModdedItem.aTweak refers to a non-existent record or flat.

```

###
