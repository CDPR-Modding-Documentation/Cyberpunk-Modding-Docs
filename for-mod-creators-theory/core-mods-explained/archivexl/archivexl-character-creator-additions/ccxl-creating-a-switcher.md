# CCXL: Creating a Switcher

## Summary

**Published:** ???\
**Last documented edit:** September 3rd 2025 by [icxrus](https://app.gitbook.com/u/R7jBoGTs0NQ60YSE39s5jrdLiei2 "mention")

This page is a guide to create additional switchers in the Character Creator with ArchiveXL.

### Wait, this is not what I want!

To understand theory about switchers, check [ccxl-theory-switchers.md](ccxl-theory-switchers.md "mention") .

### Why would I want to do that?

Creating new switchers allows us to add new options to the character creator without occupying existing switchers.

**Examples include:**

* Create switchable tattoo additions that can be toggled _alongside_ the game's vanilla _facial tattoos_ and _body tattoos (Beginner)_
* Control left and right _eye color_ independently using overlay meshes _(Intermediate)_
* Give V switchable hairstyles for feet _(Expert)_

## Requirements

* A WolvenKit project
* A .xl file referencing at least one .inkcharcustomization file
* All necessary meshes, materials, textures, and .app files for your addition
* A .json file for your translation entries, if applicable



## Putting it all together

Knowing how a switcher works is important when it comes to creating new switchers with CCXL. Now that we are familiar with the inner workings of a switcher, we can get started.

Be sure you have a WolvenKit project with a file structure following this format:

<figure><img src="../../../../.gitbook/assets/switcher demo archive structure.png" alt=""><figcaption></figcaption></figure>

### Create a .xl file

In order to build a switcher, we need a _.xl_ file so ArchiveXL knows where to find it.

You can create one in WolvenKit. See these steps to do so:

<figure><img src="../../../../.gitbook/assets/wkit create new file.png" alt=""><figcaption><p>Click File > New File</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/createFile xl.png" alt="" width="563"><figcaption><p>In the ArchiveXL category, select 'ArchiveXL file', give it a name, and create</p></figcaption></figure>

This will create an empty .xl file that ArchiveXL uses to locate our custom switcher. It can be modified in a text editor like Notepad++. We'll do that once we add our other files but for now, be sure to stick the .xl in the _resources_ folder of your project:

<figure><img src="../../../../.gitbook/assets/xl in resource folder.png" alt=""><figcaption></figcaption></figure>

### Create the .inkcharcustomization files

Follow the same steps as last time for the .inkcharcustomization file, but—

* Create one for each gender if applicable (add _\_pwa_ and _\_pma_ respectively when naming)
* Put them in the mod folder of your project

<figure><img src="../../../../.gitbook/assets/createFile inkcc.png" alt=""><figcaption><p>Find gameuiCharacterCustomizationInfoResource, give it a name and click 'create'</p></figcaption></figure>

Your project structure should look something like this:

<figure><img src="../../../../.gitbook/assets/inkcc in mod folder.png" alt=""><figcaption></figcaption></figure>

Now that we have the base files for a switcher, let's go ahead and edit our .xl file.

### Modifying the .xl

Open the .xl file in your preferred text editor, and you should have a blank document. Add the following:

```
customizations:
  male: your_modder_name\ccxl\your_mod_name\your_mod_pma.inkcharcustomization
  female: your_modder_name\ccxl\your_mod_name\your_mod_pwa.inkcharcustomization
```

Ensure these paths match the relative paths to your .inkcharcustomization files, and save.

> If you want to use translation entries, be sure to add these in the .xl also. [_See the wiki about it_](../../../../modding-guides/items-equipment/adding-new-items/archive-xl-item-structure-explained.md#the-.xl-file) _for more info._

### Modifying the .inkcharcustomization files

Now we can start building our switcher. The easiest way to do this is to start with one .inkcharcustomization file, then copy everything over once we know it works.

Open a .inkcharcustomization file to get started:

<figure><img src="../../../../.gitbook/assets/blank inkcc.png" alt=""><figcaption></figcaption></figure>

First we must determine which group our switcher belongs to. A good way to figure this out is knowing where the camera should focus in the character creator when using our switcher (arms, head, or body).



### Create a cyclic switcher

Click on _headCustomizationOptions_ (or whichever category you want to use) and then "Add New Element":

<figure><img src="../../../../.gitbook/assets/create gameuiSwitcherInfo.png" alt=""><figcaption></figcaption></figure>

Then, click "gameuiSwitcherInfo" and Create:

<figure><img src="../../../../.gitbook/assets/create gameuiSwitcherInfo 2.png" alt=""><figcaption></figcaption></figure>

You should now have an empty switcher:

<figure><img src="../../../../.gitbook/assets/empty switcherInfo.png" alt=""><figcaption></figcaption></figure>

#### Minimum Attributes:

At minimum, we should change the following attributes to have a working switcher:

* editTags (we have to be able to use this switcher somewhere!)
* localizedName (not required, but helps to identify our switcher in-game)
* name (will be used to identify our switcher in _headGroups_ later on)
* options (must have at least 2 options; 'OFF' can be one)
* uiSlot (must occupy a slot)
* uiSlots (give our options slots to occupy)

You should reference [the table](ccxl-creating-a-switcher.md#switcher-attributes) above to learn more about each attribute.



With the minimum requirements met, your switcher should look something like this:

<figure><img src="../../../../.gitbook/assets/bareMinimum switcher.png" alt=""><figcaption></figcaption></figure>

Now, let's define our switcher _options:_

<figure><img src="../../../../.gitbook/assets/switcherOptions.png" alt=""><figcaption></figcaption></figure>

For our options, they should be indexed to determine their order in the switcher. The _names_ will reference those of our gameuiAppearanceInfo's, while the _localizedNam&#x65;_&#x73; will display as our option names in-game.

Now we need a gameuiAppearanceInfo for each option in our switcher. Follow the same steps you used to create your gameuiSwitcherInfo, but select "gameuiAppearanceInfo" and create, then duplicate it:

<figure><img src="../../../../.gitbook/assets/create gameuiAppearanceInfo.png" alt=""><figcaption></figcaption></figure>

Based on the _options_ in our gameuiSwitcherInfo, our first gameuiAppearanceInfo should look like this:

<figure><img src="../../../../.gitbook/assets/switcher off.png" alt=""><figcaption></figcaption></figure>

Our second should look like this:

<figure><img src="../../../../.gitbook/assets/switcher on.png" alt=""><figcaption></figcaption></figure>

The only thing changing right now is our _name_, to match the ones referenced in our gameuiSwitcherInfo _options_.

We can add our _resource_ (path to a .app file) and _definitions_ (appearance definitions in said .app file) now, or come back to it later.



Right now, we still need to add our switcher and appearances to our _groups_.

### Groups

For most appearance additions, the following groups will suffice:

#### headGroups

If your switcher is in _headCustomizationOptions,_ you'll want to use these four _headGroups:_

* FPP
* TPP
* TPP\_photomode
* character\_customization

Adding your switcher and appearances to _headGroups_ should look like this:

<figure><img src="../../../../.gitbook/assets/headGroups tree.png" alt=""><figcaption></figcaption></figure>

Once this is done, you can save your .inkcharcustomization file (Ctrl + S) and install this mod to test your switcher. If done correctly, you should have a new switcher at the top of the character creator, with two options:

<div><figure><img src="../../../../.gitbook/assets/inGame switcherOff.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/inGame switcherOn.png" alt=""><figcaption></figcaption></figure></div>

Of course, if you didn't add any path to _resource_ or include any _definitions_ in your gameuiAppearanceInfo, then this switcher won't do much.

### Attaching an appearance

I've borrowed some files to use in this demonstration, in order to give our switcher a purpose:

<figure><img src="../../../../.gitbook/assets/borrowed files.png" alt=""><figcaption></figcaption></figure>

For a detailed explanation on how these will work together, see [CCXL: Body Tattoos](ccxl-body-tattoos.md).



Going back to our gameuiAppearanceInfo, let's add our .app file to the _resource_ path:

<figure><img src="../../../../.gitbook/assets/appearanceInfo resource path.png" alt=""><figcaption></figcaption></figure>

We'll need to add an appearance definition to the _definitions_ slot, but we need to know what they are. Those will be found in our .app file:

<figure><img src="../../../../.gitbook/assets/app appearanceDefinitions.png" alt=""><figcaption></figcaption></figure>

You'll want to add the one for whichever gender you are working on to the _definitions_ of your gameuiAppearanceInfo:

<figure><img src="../../../../.gitbook/assets/add definition.png" alt=""><figcaption></figcaption></figure>

Once this is done, we can save with Ctrl + S, install our mod again, and launch. If your resource and definitions were done correctly, you should now have a fully-functional switcher:

<figure><img src="../../../../.gitbook/assets/working switcher.png" alt=""><figcaption></figcaption></figure>

Referencing the [table ](ccxl-creating-a-switcher.md#switcher-attributes)above, now is a good time to make any additional customizations to your switcher (_index_, _localizedName_, add additional _options_, etc.)

Once that's done, you can copy everything over to the other .inkcharcustomization file. Be sure to change the _definitions_ of the gameuiAppearanceInfo to correspond with the correct gender when doing so.

