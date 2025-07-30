---
description: >-
  Explanations on loading and searching for saved things, as well as importing
  AMM presets
---

# Tab: Saved

## Searching and Loading

* Any root group you save in the "[Spawned](tab-spawned.md)" tab will appear here
* You can search, load and delete them from here
  * Additionally this is also where you can add groups to the [export](../exporting-from-object-spawner.md)

<figure><img src="../../../../.gitbook/assets/OSSaved" alt="" width="375"><figcaption><p>Search, load, rename, delete and export any saved group</p></figcaption></figure>

## AMM Preset Import

* In order to convert an AMM decor preset and turn it into a group, do:
  * Place the AMM decor preset `.json` inside `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\AMMImport`
  * Make sure you have all requirements for that decor preset installed (Custom archives)
  * Press the `Import AMM Presets` button
  * The import can take a while, and will lag
  * You can track the progress via the loading bar
* During the conversion, "props" (Entities) will get converted to meshes, when possible
* Make sure to `Load` and save the build at least once after importing, before exporting it to WKit
