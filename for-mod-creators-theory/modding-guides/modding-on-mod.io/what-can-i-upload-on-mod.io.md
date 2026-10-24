---
description: Which mods are supported? Which mods are permitted?
---

# What can I upload on mod.io?

## Summary

Created: 20 Oct 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented update: 20 Oct 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

What mods you can upload on modio - in terms of content, and in terms of features

### Wait, this is not what I want!

* If you're on the fence about doing this at all, you can check [.](./ "mention")&#x20;
* For a guide on **how** to put your mods on mod.io, please check [how-to-upload-on-mod.io.md](how-to-upload-on-mod.io.md "mention")

## What kind of mods are allowed?

Check mod.io's [Creation Guidelines](https://mod.io/g/cyberpunk-2077/r/creation-guidelines-cross-platform-mod-support). TL;DR:

* Do not violate licenses or permissions, don't upload anything you aren't allowed to
* Before porting stuff from other games, make sure that this is permitted
* Do not upload anything that's not a mod (e.g. malware)

As per CDPR:

* mods have to be done with the fan content guidelines in mind - [https://www.cdprojektred.com/en/fan-content](https://www.cdprojektred.com/en/fan-content)
* if they want the mod to be available worldwide (including Japan) - no nipples :) if nips are 100% a must then we will have to turn it off for Japan
* don't call anything like idk "Keanu Reeves appearance" "Katy Perry hairstyle" "BMW M3 ride" etc. - we cannot use the actual official well known brands and names. so for example if someone would make hobbit apartment for C2077 we cannot call it anything lord of the rings related.
* no AI, duh
* nothing that could push the limits and be offensive.

## What features are supported?

{% hint style="info" %}
The information below is for 2.5 (October 2026). It will be updated as CDPR expand mod support. Since that is done by volunteers, you can speed up the process by becoming one yourself.
{% endhint %}

Currently, the status of console modding is "late 2021" (before ArchiveXL really took off). Since no [script extenders](../../core-mods-explained/#what-is-a-core-mod) are permitted there, the following lists will only cover if something works on console or not.

You can see CDPR's list on [mod.io](https://mod.iohttps/mod.io/g/cyberpunk-2077/r/mod-content-available-in-cross-platform-mod-support).

{% hint style="danger" %}
**Only one replacer** can be active at any given time.
{% endhint %}

### By feature

<table><thead><tr><th width="243.699951171875"></th><th></th></tr></thead><tbody><tr><td>Cosmetic mods</td><td>Replacers only: no CCXL possible</td></tr><tr><td>Clothing mods</td><td>Replacers only: no item additions possible</td></tr><tr><td>Scripting mods</td><td>If it's natively supported; see <a href="https://mod.io/g/cyberpunk-2077/r/how-to-create-mods-for-cross-platform-mod-support">this page</a> for more detail</td></tr><tr><td>Pose mods</td><td>Replacers only, no additions possible</td></tr><tr><td>Rig edits</td><td>Replacers only</td></tr><tr><td>Quest mods</td><td>No quest patching, </td></tr></tbody></table>

### By file type

<table><thead><tr><th width="248.6500244140625">Text</th><th>Kind of support</th></tr></thead><tbody><tr><td>.anim<br>.animgraph<br>.rig<br>.facialsetup</td><td>Supported (replacement only)</td></tr><tr><td>.xbm<br>.hp</td><td>Supported (replacement only)</td></tr><tr><td>.app<br>.ent</td><td>Supported (replacement only)<br><a href="../../files-and-what-they-do/file-formats/entity-.ent-files/#root-entity">root .ent</a>: you need to keep the original <code>name</code> property<br><a href="../../files-and-what-they-do/file-formats/appearance-.app-files/">.app file</a>: unless you've replaced the root ent, you need to keep the <code>appearanceAppearanceDefinition.name</code> as it is.</td></tr><tr><td>.mesh</td><td>Supported (replacement only)</td></tr><tr><td>.streamingsector<br>.streamingblock</td><td>Supported<br>ArchiveXL sector additions are working with 2.5<br>For removals, you need to overwrite existing files. </td></tr><tr><td>.quest<br>.questphase</td><td><p>Supported (replacement only)</p><p>You can overwrite existing files with your own additions, but you must keep the in-game logic intact.</p></td></tr><tr><td>.scene<br>.scenerid</td><td><p>Supported (replacement only)</p><p>You can overwrite existing files with your own additions, but you must keep the in-game logic intact.</p></td></tr><tr><td>.journal<br>.behavior</td><td><p>Supported (replacement only)</p><p>You can overwrite existing files with your own additions, but you must keep the in-game logic intact.</p></td></tr><tr><td>.effect</td><td><p>Supported (replacement only)</p><p>Please note that custom effects haven't taken off on PC yet.</p></td></tr><tr><td>.envparam<br>.env</td><td>Supported (replacement only)</td></tr><tr><td></td><td></td></tr><tr><td>.morphtarget</td><td>Not supported on console</td></tr><tr><td>.particle</td><td>Not supported on console</td></tr><tr><td>.phys<br>.physicalscene</td><td>Not supported on console</td></tr></tbody></table>

### ArchiveXL

<table><thead><tr><th width="229.39990234375"></th><th></th></tr></thead><tbody><tr><td>Streaming</td><td>ArchiveXL additions are possible; for removals, you need to overwrite the sectors. </td></tr><tr><td>Journal</td><td>ArchiveXL additions and merging are possible.</td></tr><tr><td>Localization</td><td>You can add localization files; this is of limited usefulness</td></tr><tr><td>Customizations</td><td>???</td></tr><tr><td>Factories</td><td>While .csv files are technically supported, we don't have item additions yet.</td></tr><tr><td>Resource Scope</td><td>Resource scopes work, but resource patching or path substitutions do not.</td></tr><tr><td>Resource Link</td><td>Resource links work, but dynamic path substitution does not.</td></tr><tr><td>Resource Patch</td><td>Not supported</td></tr><tr><td>Animation additions</td><td>Not supported</td></tr><tr><td>Character creator additions</td><td>Not supported</td></tr></tbody></table>

### TweakXL

<table><thead><tr><th width="229.39990234375"></th><th></th></tr></thead><tbody><tr><td>Adding records<br>Adding flats</td><td>Supported</td></tr><tr><td>Cloning records</td><td>Supported</td></tr><tr><td>Modifying flats</td><td>Supported</td></tr><tr><td>Appending</td><td>You can append flats to extra records</td></tr><tr><td>Enums</td><td>Not supported</td></tr><tr><td>Changing records</td><td>Yesn't supported: you can overwrite flats and presumably even properties, but inheritance will not be considered (e.g. if you change the damage modifier for Weapon.Melee, this will not have any effect).</td></tr></tbody></table>
