---
description: A list of modding frameworks and links to their documentation
---

# ⚒ Core Mods / Frameworks

{% hint style="info" %}
You're probably used to the term **Core Mod** from other games. However, the technical term for these kinds of mod is a`framework`, which is what they're usually referred to by Cyberpunk modders.
{% endhint %}

## What is a framework?

While the game natively supports mods, this would have had us limited to replacing already existing items, but we wanted flying cars. So a bunch of brilliant people drilled deep into the code of Cyberpunk 2077 and created a bunch of tools that let us do more.

The most prominent example of a framework mod is the **Skyrim Script Extender** — fortunately, Cyberpunk 2077 is rather more stable.

{% hint style="danger" %}
Since this kind of mod interacts with the game's code on such a fundamental level, they are prone to **breaking** whenever CDPR changes their API. This is the reason why game updates break mods — we recommend to [**turn off auto-update**](../../help/users-modding-cyberpunk-2077/users-preventing-auto-updates.md) and manually upgrading once the frameworks you need have been brought up-to-date.
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

Redscript ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/1511) | [GitHub](https://github.com/jac3km4/redscript)) is an open-source programming language and toolset, natively working with Cyberpunk 2077's scripting runtime. With the help of .reds files under `r6/scripts`, it lets you modify and extend the user interface, change the combat balance, influence NPC behaviour, and much more.&#x20;

{% content-ref url="http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg_/" %}
[Redscript](http://localhost:5000/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg\_/)
{% endcontent-ref %}

### RED4ext <a href="#red4ext" id="red4ext"></a>

RED4ext ([Nexus ](https://www.nexusmods.com/cyberpunk2077/mods/2380)| [GitHub](https://github.com/WopsS/RED4ext/releases)) is Cyberpunk 2077's equivalent to Skyrim Script Extender. It adds further scripting capability on top of what CDPR has so kindly provided, loading scripts from `/red4ext/plugins`.

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

Codeware ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/7780) | [GitHub](https://github.com/psiberx/cp2077-codeware)) adds powerful script extensions, opening up possibilities that are otherwise locked inside Cyberpunk's file structure. For example, while you could always see [an NPC's appearances](../../modding-guides/npcs/appearances-change-the-looks.md) in Wolvenkit, it was not possible to access that information at runtime.
