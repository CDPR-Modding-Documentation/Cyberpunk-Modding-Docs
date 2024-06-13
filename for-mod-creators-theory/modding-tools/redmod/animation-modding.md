# Animation Modding

### Animation Modding - WolvenKit Integration

The REDmod animation import tool can be used as a Plugin in [WolvenKit](https://github.com/WolvenKit/Wolvenkit).

* Add the `.re` animation file you wish to import to your **/Raw** folder in your mod project
* Add the `.anims` animation set file from the game with the _Asset Browser_
* Click View > Import/Export tool
* In the Import/Export tool, navigate to _Import_: a list of all `.re` animation file in your **/Raw** folder will appear
* Double click the entry to change the import options:
  * Select the `.anims` animation set file to import from the dropdown
  * Select the _animation name_ you wish to override from the dropdown
* Click _process_

> INFO - It is best to name `.re` animation correctly even if you replace an existing animation, because the imported animation will always have the filename of the `.re` file.

> INFO - You need to have the `.rig` file used by the `.anims` animationset present in your WolvenKit project.

<figure><img src="../../../.gitbook/assets/WolvenKit_animationmodding.jpg" alt=""><figcaption></figcaption></figure>

### Animation Modding - Manually

> See also: **Import Command**

The `import` command imports an `.re` animation file into an existing `.anims` animation set file.

Optional parameters include specifying an existing animation name to rename inside the animset file (otherwise the filename of the `.re` animation file is used) or specifying a different output path (default is overwrite).

> INFO - It is best to name `.re` animation correctly even if you replace an existing animation, because the imported animation will always have the filename of the `.re` file.

> INFO - You need to have the `.rig` file used by the `.anims` animationset present in your depot path.
