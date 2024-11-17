---
description: 'Step 2: How to create a custom NPC'
---

# NPV: Creating a custom NPC

## Summary

**Published**: May 13 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update**: Mar 18 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page is a part of the [NPV guide](./). It will show you how to use the [provided example project](./#preparation) to create a custom NPC for Cyberpunk 2077, whom you can then spawn with AppearanceMenuMod.

It will give you a brief overview over the control files and tell you how to pull in the right meshes (and appearances).&#x20;

{% hint style="info" %}
If you prefer video tutorials, use this link to watch [Sh00kspeared's video tutorial](https://www.youtube.com/watch?v=GP9Crg8tkIg\&t=1s) on the matter.
{% endhint %}

### Wait, this isn't what I want!

* How about [amm-custom-npcs](../amm-custom-npcs/ "mention")?
* Find a more detailed guide about adding components to NPC app files under [appearances-change-the-looks](../appearances-change-the-looks/ "mention"). This may help you if you get stuck!

### Prerequisites

This guide assumes that&#x20;

* you already have a head mesh (see [this section](npv-preparing-the-head-in-blender.md) otherwise)
* that you're using a set of default paths (if not, you will have to adjust)
  * the corresponding files are in either of these folders\
    `tutorial\npv\your_female_character\head` \
    `tutorial\npv\your_male_character\head`
  * the meshes are named like their in-game equivalents, e.g. `h0_000_pwa_c__basehead.mesh` (if not, you will have to adjust)

## Skipping and skimming

This guide contains as little fluff as possible, and since much of it has been covered in other guides, extra information will be contained in the **links**. These will be annotated as clearly as possible with what you need to read and what's optional.

<figure><img src="../../../.gitbook/assets/slow_down_kitten.jpg" alt=""><figcaption></figcaption></figure>

If you're skimming in this guide, you **will** end up making mistakes. **Read thoroughly**. If at the end of a section you aren't where the guide says you're supposed to be, fall back and double-check your process. If you still have trouble, you can hit us up on [discord](https://discord.com/invite/redmodding) in the `#mod-development` channel.

{% hint style="success" %}
Remember that at any time, you can check your progress by [spawning your custom character](./#check-if-it-works).
{% endhint %}

## How everything hangs together

{% hint style="info" %}
This section will explain what the template files do and how they hang together. If you like suffering, you can rely on the "fuck around and find out" approach, but I recommend at least reading through it.
{% endhint %}

In the end, an NPV is just a custom prop with a god complex. For that reason, the [file structure](../../everything-else/custom-props/#with-variants) is the same (it's just a lot more complex, because you have more than 4 components).

If diagrams help you, then [click on the link](../../everything-else/custom-props/#with-variants) to see one.

## The .lua file

We're registering our NPC with AppearanceMenuMod via a .lua file, which needs to end up in AMM's `Custom Entities` folder. The full path in the Cyberpunk directory will be this:

`bin\x64\plugins\cyber_engine_tweaks\mods\AppearanceMenuMod\Collabs\Custon Entities`

I have prepared two example files in the Wolvenkit's project's `resources`. Delete the one that you aren't using, then let's take a look at the other one:

`tutorial_custom_female_character.lua`

`tutorial_custom_male_character.lua`

### The file content

This is the file content for the female example:

```lua
return {
  -- Your beautiful name :)
  modder = "tutorial",

  -- This must be UNIQUE so be creative!
  -- NO SPACES OR SYMBOLS ALLOWED
  unique_identifier = "tutorial_female_character",

  -- This is the info about your new entity
  entity_info = {
  -- name: The name that will be shown in the Spawn tab
    name = "Tutorial Woman",
  -- path: The path to your entity file. Must use double slash bars \\
    path = "tutorial\\npv\\your_female_character\\ops\\your_female_character.ent",
  -- record: This is the TweakDB record that will be used to add your character. More information below.
    record = "Character.afterlife_merc_fast_melee_w_hard",
  -- type: Character or Vehicle
    type = "Character",
  -- customName: Set this to true if you want the name you set here to appear in AMM Scan tab.
    customName = true
  },

  appearances = {
    "tutorial_woman_casual", 
    "tutorial_woman_business", 
  },  

  -- Here you can pass a list of attributes from different records to be copied to your new character.
  -- More information below.
  attributes = {
  },
}
```

It loads our [root entity](npv-creating-a-custom-npc.md#the-root-entity) from  `tutorial\npv\your_female_character\ops\your_female_character.ent`. That's the file which tells the game what to load.

{% hint style="success" %}
You can and should change this file — see the inline documentation above for what to change. To do that, you can use a text editor such as [Notepad++](https://notepad-plus-plus.org/downloads/).
{% endhint %}

## The root entity

You find the root entity for your character here:

```
tutorial\npv\your_female_character\ops\your_female_character.ent
tutorial\npv\your_male_character\ops\your_male_character.ent
```

{% hint style="info" %}
[Would you like to know more?](../../../for-mod-creators-theory/files-and-what-they-do/entity-.ent-files/#root-entity) (You don't need any of this information to finish the guide.)
{% endhint %}

The root entity hooks up your .app file and the appearance names in the .lua file, and that's about everything there is to say about it. Here's how it looks:

<figure><img src="../../../.gitbook/assets/npv_root_entity.png" alt=""><figcaption><p>Adjust entries as needed. If you want to </p></figcaption></figure>

{% hint style="success" %}
If you want to add more appearances:

* duplicate an existing entry
* change the last key `name` to match the one in your .lua
* change the first key `appearanceName` to the one you want to put in your `.app`
{% endhint %}

Let's look at the .app file now.

## The app file

{% hint style="info" %}
You can find a more detailed guide about adding stuff to .app files under [appearances-change-the-looks](../appearances-change-the-looks/ "mention"). It's optional, unless you're really stuck.
{% endhint %}

This section will tell you how to edit your NPV's appearance – their skin colour, chrome, piercings, tattoos. We will do this in the .app file.

{% hint style="danger" %}
When changing component names, you want to leave the [#component-prefixes](../../../for-mod-creators-theory/3d-modelling/garment-support-how-does-it-work/#component-prefixes "mention") (t1\_) in place — the game needs them to calculate collisions!
{% endhint %}

This is where all of your NPC's appearances are defined (`appearanceDefinition`,  linked to the root entity via `name`). The appearanceDefinition's components **define** your NPV's properties, pulling in equipment, facial expressions, hair and skin.

{% hint style="info" %}
[Would you like to know more?](../../../for-mod-creators-theory/files-and-what-they-do/appearance-.app-files/) (You don't need any of this information to finish the guide.)
{% endhint %}

It looks like this:

<figure><img src="../../../.gitbook/assets/npv_app_structure..png" alt=""><figcaption><p>Before renaming </p></figcaption></figure>

Whenever you save the file, the Wolvenkit console will show you the results of the [file validation](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation). These will point you towards mistakes in your paths.

If you get a bunch of errors that complain about "mesh not found in project files" or "no depot path set, only hash given," that's no reason to panic – those errors come from files that you deleted, but which are still linked in the `.app`. If you deleted them by accident, restore them from the template project. Otherwise, you can (and should) delete the components.

{% hint style="success" %}
The next section, [#how-do-i-know-what-to-put](npv-creating-a-custom-npc.md#how-do-i-know-what-to-put "mention"), will help you find the right appearance names.

If you feel completely lost, you can read up on [how to change NPC appearances](../appearances-change-the-looks/) – the concept is exactly the same.&#x20;

Also, [File Validation](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation "mention") will help you by detecting broken links: keep an eye on Wolvenkit's log when you save a file.
{% endhint %}

{% hint style="success" %}
If you want to add another appearance

* duplicate an existing entry
* change the key `name` to match the one in your root entity
* change the components
{% endhint %}

### How do I know what to put?

To find out which variants and appearances to use, I suggest that you use NoraLee's excellent [NPV Part Picker](https://noraleedoes.neocities.org/npv/npv\_part\_picker). It will look like this:

<figure><img src="../../../.gitbook/assets/npv_guide_part_picker_preview.png" alt=""><figcaption><p>Find it at <a href="https://noraleedoes.neocities.org/npv/npv_part_picker">https://noraleedoes.neocities.org/npv/npv_part_picker</a></p></figcaption></figure>

{% hint style="success" %}
The NPV picker does this for you, but here's how to select your eyebrow appearance by hand:

* &#x20;open up the mesh file and expand the first list `appearances`
* see a bunch of entries with naming schemas like `colour_01`
* the numbers correspond with the type of eyebrow in the character editor (look them up [here](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/hair.md))
* Select the correct colour and appearance number
{% endhint %}

The values you found out will go into the **components** in your NPV's .app file.

#### The NPV picker gives me a chunkMask...?

This property is used for **hiding** parts of a mesh. If the part picker gives you this number, simply paste it into the corresponding box in your component:

<figure><img src="../../../.gitbook/assets/chunkmask.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
You can learn more about this under [submeshes-materials-and-chunks.md](../../../for-mod-creators-theory/files-and-what-they-do/3d-objects-.mesh-files/submeshes-materials-and-chunks.md "mention"), but this is not necessary for the tutorial.
{% endhint %}

### Customizing Cyberware

{% hint style="info" %}
If you skip this step, you will end up with invisible cyberware or the wrong colour/appearance.
{% endhint %}

When selecting a different cyberware than the preconfigured one, you **have** to set the appearance name, or the whole thing will show up in grey. The appearance names are usually identical to the cyberware (`cyberware_01`, `cyberware_02` etc.), but if you are uncertain, you can also open the mesh file and check the `appearances` list at the top.

{% hint style="info" %}
Wolvenkit's [file validation](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/file-validation) triggers when you save a file, and it will help you to spot mistakes.
{% endhint %}

### Customizing piercings and chrome: Chunkmasks

{% hint style="info" %}
If you skip this step, you will end up with the wrong or too many piercings and cyberware.\
To learn more about chunkmasks, check [this wiki page](../../../for-mod-creators-theory/files-and-what-they-do/3d-objects-.mesh-files/submeshes-materials-and-chunks.md) (if you can do it with the information below, you don't need to)
{% endhint %}

You have the full piercing or cyberware file, but you're only using parts of it — yet the game stubbornly shows you the whole mesh.&#x20;

Fortunately, you don't have to edit it in Blender, because you can hide the parts you aren't using via chunkmasks. \
Find the `piercing` or `cyberware` component in your `.app` file:

<figure><img src="../../../.gitbook/assets/npv_piercings_chunkmask_1.png" alt=""><figcaption><p>This is where you can turn off submeshes</p></figcaption></figure>

#### How do I know which numbers to put?

You can see that inside the .mesh file (which you can see in the component's `depotPath`). Open it in Wolvenkit, then switch to the [Mesh Preview](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/file-editor/preview#mesh-preview) tab and toggle the checkboxes on the right; those directly correspond to the boxes you need to uncheck in the `.app` file:

<figure><img src="../../../.gitbook/assets/npv_piercings_chunkmask_2.png" alt=""><figcaption><p>Here we see the indices of these three submeshes: this is what we need to uncheck in the .app file</p></figcaption></figure>

To hide those bits in the .app, we simply need to uncheck the corresponding boxes - check the previous screnshot!

## Adding modded items

For a step-by-step guide on how to add items from mods to your NPV, check [appearances-change-the-looks](../appearances-change-the-looks/ "mention") -> [#adding-items-from-mods](../appearances-change-the-looks/#adding-items-from-mods "mention")!

## Hair

This section will teach you how to add another hair mesh to your NPV. We will first remove the default hair, then replace it with the one you want.

{% hint style="info" %}
To use modded hair, find the correct files [inside the mod](../../analysing-other-mods/) and add them to your project.

If you want to look up in-game hairs, check [hair.md](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/hair.md "mention")

For more information on **hair files**, check the [basic-hairstyle-replacement-tutorial.md](../guides-all-about-hair/basic-hairstyle-replacement-tutorial.md "mention")
{% endhint %}

1. Delete the current hair from the .app — there should be 2-3 components, their names will start with either `hair_` or `hh_0`
2. Find the correct hair mesh. You have three options for this:
   1. Looking it up on [our nifty list](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/hair.md#name-in-files-by-index)
   2. Using [NoraLee's NPV Part Picker](https://noraleedoes.neocities.org/npv/npv\_part\_picker)&#x20;
   3. Filtering the files and clicking through their previews: \
      female: `base\characters\common\hair > wa_ > .mesh > !shadow`\
      male: `base\characters\common\hair > ma_ > .mesh > !shadow`
3. Enter the name of the hair mesh that you want to use into the Asset Browser's search bar (see next screenshot) and hit Return.
4. Once you have found the correct mesh file, right-click it and select "Find Files Using This":

<figure><img src="../../../.gitbook/assets/npv_finding_hair_files.png" alt=""><figcaption></figcaption></figure>

4. This will give you a list of files, which you can mostly ignore. \
   The only thing we care about is the hair's control file, which is usually an `.ent` file:

<figure><img src="../../../.gitbook/assets/npv_hair_filtering.png" alt=""><figcaption><p>This is how you find the hair's .ent file</p></figcaption></figure>

{% hint style="info" %}
Some hair mods don't use an .ent file. In this case, the components will be inside the .app file's appearances, similar to NPC apps. You can copy the entire `components` array of the appearance that you want to use.\
If there are multiple files, check which one uses the **most** components per appearance.
{% endhint %}

5. Open the `.ent` file and expand the `components` array. You will find three components in there, which you can now copy over to your `.app`!

<figure><img src="../../../.gitbook/assets/npv_hair_ent_file.png" alt=""><figcaption><p>Copy these and move them over to your .app</p></figcaption></figure>

## The body

As of version 2.2.0, the body mesh and arms are included for easier replacing.&#x20;

The process is the same as what you did with the hair: find the files in the mod, add them to your project, move them to your NPVs folder and customize them to your liking.

You can find more information at [cheat-sheet-body.md](../../../for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-body.md "mention") (which also contains the tattoo paths).

### And that's the gist of it!

Go forth and create custom apperances!&#x20;

You can [check this guide](../appearances-change-the-looks/), or look through the .app files for other NPCs for ideas. If you need further details, I highly recommend checking out NoraLee's [much more detailed tutorial](https://docs.google.com/document/d/1clFJhpi7H5jk73vUQPnjIwjkuQV6VnYkKMoXt1eYMb0/edit), which will also give you all the context you could possibly need.

For guides on how to export a whole animated character to Blender, you can check [here](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-to-blender/exporting-rigs-and-anims).&#x20;

{% hint style="danger" %}
Please remember that **before sharing your NPV**, you **have** to change the paths! You can find a full guide on the fastest way to do that [here](../../items-equipment/moving-and-renaming-in-existing-projects.md).
{% endhint %}

{% hint style="success" %}
Don't forget, you can **pack** the Wolvenkit project by pressing the green button in Wolvenkit's toolbar, spawning `Tutorial Man` and `Tutorial Woman` via AMM to check out your progress.
{% endhint %}
