---
description: Exporting locations to Blender
---

# Editing locations in Blender

## Summary

**Created by @Simarilius** \
**Updated 19 March 2023 \~** [Simarilius](http://127.0.0.1:5000/u/G2MqNkfgTlQ1R3G4B5s6WefLjdy2 "mention")\
**Updated 7 May 2023 \~** [manavortex](http://127.0.0.1:5000/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Script updated 1 June 2023 \~** [Simarilius](http://127.0.0.1:5000/u/G2MqNkfgTlQ1R3G4B5s6WefLjdy2 "mention")

The original exporter was based on some posts by **@123321** in the Discord _#mapeditor_ channel back in May, so all credit to him for working it out in the first place.

Theres a video which outlines this process [Here](https://youtu.be/JVCbPr67mgw).

### Versions and requirements

This guide was initially written with game version 1.6 of Cyberpunk 2077.

* [**Wolvenkit**](https://github.com/WolvenKit/WolvenKit) **>= 8.8.1 or the latest** [**Nightly**](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases)
* [**Blender 3.3**](https://www.blender.org/) **or newer**
* [**Cyberpunk add-on for Blender 1.2.0**](https://github.com/WolvenKit/Cyberpunk-Blender-add-on/releases)

## Exporting Streaming Sectors to Blender

To export a location, you need to know its files — you can either pick them from [our list](../../references-lists-and-overviews/reference-world-sectors/) or [go and find them](../../references-lists-and-overviews/reference-world-sectors/places.md) (and add them to the list, please).

1. Add all sector files that you want to edit to your project by [finding them in the asset browser](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files) and double-clicking them.
2. Open the [script manager](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/tools/script-manager)&#x20;
3. Open `Export_Sector.wscript` by double-clicking on the file name
   * You may get a pop-up: "Trying to open a system file. Should a local copy be created?"\
     If so, click **Yes**.
4. Click "Run" (it's on the top left of the script editor)

This will export all your files to glb/json for the later export in Blender.

{% hint style="success" %}
Depending on your computer and the number of sectors, **this script takes time**. Wolvenkit will be mostly unresponsive while it's exporting. Don't worry, it's normal.
{% endhint %}

{% hint style="info" %}
You might see a bunch of error messages about files that couldn't be found in the Wolvenkit log. Those usually only affect materials, your mesh should still show up in Blender, it will just be blank,
{% endhint %}

<details>

<summary>What else the script can do for you:</summary>

If you add entries to the sectors block in line 14, the script will export **only those sectors**, rather than all the files in your project. You can use this to add files to your project, or to filter existing entries.

```javascript
// You can add sectors to the list, or add them to the project 
// list of sector files (paths need double slashes) you can leave empty if in project
// can use just filenames if their in the _compiled\default folder
const sectors=[
    "interior_-48-31_2_0",
    "interior_-24-16_1_1",
]
```

</details>

## Importing to Blender

1. Import your streamingsector with the Cyberpunk Blender IO Suite. For full instructions, check the [corresponding wiki page](../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#importing-into-blender-2) - the documentation below might be obsolete.
   1. Open Blender, then select `File` -> `Import` -> `Cyberpunk Streaming Sector`.
   2. Select the `.cdmodproj` file in the root of your Wolvenkit project directory.
   3. Optional: Check the "With Materials" box in the side panel. This will make the process take longer.
   4. Wait - import may take a few minutes. Blender will be unresponsive during that time.
2. As the meshes will be scaled and positioned according to the map coordinates, they're probably off-screen. Since they are selected, you can hit `.` on the numpad (`/` on German keyboard), moving the camera to selection.

{% hint style="info" %}
The script will find all streamingsector .json files under the `raw` directory and import them. If you are editing multiple streaming sectors but want to import only one at a time, remove or rename the json files under `raw`.
{% endhint %}

TODO: \
There are still some node types in the sector file not being processed currently, or not fully instanced. These include **decals** (which just get an empty with details of what the decal is) and lights which I haven't gotten round to.&#x20;



<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FDbvZbNVLxjmpYm0HgO0x%2FEl_Coyote_latest.png?alt=media&#x26;token=d9baec44-1f7b-4840-9341-4c0cecf68ea3" alt=""><figcaption><p>Export of <em>El Coyote Cojo</em></p></figcaption></figure>



<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FP2RDCtuBNlx6szwUkOKX%2FEl_Coyote_latest_shaded.png?alt=media&#x26;token=93972916-adeb-4817-95b1-e7a4c3e11d5e" alt=""><figcaption><p>Export of <em>El Coyote Cojo, generated materials!</em></p></figcaption></figure>

## Importing back into Cyberpunk

<figure><img src="../../../.gitbook/assets/warning_outdated_info.png" alt=""><figcaption></figcaption></figure>

{% hint style="danger" %}
With ArchiveXL >= 1.8.0, this process is **outdated**. Check the other guides in this section for how to generate .xl files to add, edit or [delete ](world-editing-deleting-objects.md)objects in sectors.
{% endhint %}

<details>

<summary>I get it, show me the docs</summary>

* Download this script ([raw link](https://raw.githubusercontent.com/Simarilius-uk/CP2077\_BlenderScripts/main/export\_to\_JSONs.py)) from [Sim's github](https://github.com/Simarilius-uk/CP2077\_BlenderScripts/blob/main/export\_to\_JSONs.py)&#x20;
* Switch to Blender's scripting perspective and paste the code there
* Adjust line 30 and change the path assigned to 'project' to the path of your cyberpunk project. Make sure to double the backslashes.\
  Example: \
  before:  `project = 'F:\\CPmod\\meshdecal_parralax'`\
  after:     `project = 'D:\\Cyberpunk_Modding\\world_editing\\myproject'`
* In your Wolvenkit project's root folder, create the folder `output`
* Run the script by clicking the ▷ button\
  _If the script throws errors and you can't resolve them on your own or with the help of ChatGPT, find us on_ [_Discord_](https://discord.gg/redmodding)_!_
* Via Windows Explorer, copy the json file from the `output` directory in your Wolvenkit project over the file with the same name in the `raw` directory.
* In Wolvenkit, right-click on the file you just copied and select "Import from json"
* You're done!

</details>
