# ArchiveXL: body mods and refits

## Summary

**Published:** ?? by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** February 27 2025 by AllKnowingLion \
**Minimum required ArchiveXL version:** 1.5

This page explains how to enable **body mod support** in ArchiveXL:

[#body-modders-adding-support](./#body-modders-adding-support "mention")

[#clothing-mods-making-use-of-the-tags](./#clothing-mods-making-use-of-the-tags "mention")

To learn more about body mods, check the [Texture Frameworks for Player V](../../../../modding-guides/npcs/custom-tattoos-and-scars/converting-between-tattoo-frameworks/) page.

{% hint style="info" %}
**NOTE**

The past method of adding the components to each individual appearance [does still work](archived-registering-the-body-tag.md). However, you'll want to use the new method (for version >= 1.14), since it is both more robust and less tedious.
{% endhint %}

## Checking the current body

Run the following code snippet in CET to see which body is currently installed:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetBodyTypeSuffix(ItemID.new(), GetPlayer(), nil))
```

## Body modders: Adding support

{% hint style="success" %}
Starting with version **1.14**, you can use [archivexl-resource-patching.md](../archivexl-resource-patching.md "mention") to inject your tags into the existing files!

You can download the [template from Nexus](https://www.nexusmods.com/cyberpunk2077/mods/14793), or create one yourself.
{% endhint %}

### 1. Registering the body mod

1. Create an .xl file in your Wolvenkit Project's resources folder (File -> New file -> ArchiveXL)
2. **Optional**: Name it the same as your current project (e.g. boobs\_for\_back\_problems.archive.xl)
3. Put the following file content:

<pre class="language-yaml"><code class="lang-yaml"><strong>player:
</strong>  bodyTypes: [ NewBody ]  # for substitutions, this will be converted 
                          # to snake case: new_body
</code></pre>

### 2. Patch the player entity files

We'll make use of [archivexl-resource-patching.md](../archivexl-resource-patching.md "mention") for this.

#### Set up the patch .ent

If you downloaded the template project, a patch .ent will already be included.

<details>

<summary>Create your own patch .ent</summary>

1. In Wolvenkit, select File -> New File
2. Scroll down the menu until you find the one with the extension `.ent` (should be EntEntityTemplate)
3. Add a new, blank EntEntityTemplate to your project
4. Give it a good name and move it somewhere
5. Open the file and select the `components` array
6. Add a new `entMeshComponent` and name it `Body:YourBodyTag`
7. Now, proceed with the rest of the guide

</details>

1. Inside the patch .ent, find the `entMeshComponent` under the `components` array.
2. Change its `name` to match your body mod, e.g. `Body:BoobsForBackProblems` -> `Body:NewBody`

#### Register the patch .ent

Make sure that your patch .ent is added to the game by telling ArchiveXL about it. Add the following block to your `.xl` file:

```yaml
resource:
    patch:
        path\to\your\patch_file.ent:
          - !include player_wa.ent 
          - !include player_ma.ent 
```

Include only the relevant body gender!

### 3. Test

That's it, everything should work now! Let's test.

1. [Install your project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-and-launch)
2. Launch the game and load into a save
3. [check if the body tag registers](./#checking-the-current-body-mod) by running the CET command.

If yes: Congratulations, you've made it much easier for people to add refits for your body!

### Troubleshooting

#### General errors

The process is so simple that there aren't many things to go wrong:

1. Update [ArchiveXL](https://www.nexusmods.com/cyberpunk2077/mods/4198?tab=files)
2. Double-check your `.yaml` via [yamllint](https://www.yamllint.com/) and make sure you don't have syntax errors (indent matters)
3. Check [ArchiveXL's log file](../../../../for-mod-users/user-guide-troubleshooting/finding-and-reading-log-files.md#a-list-of-framework-logfiles)

If that doesn't work, check if the component gets added correctly. There are two ways to do this:

#### CET:

```
print(GetPlayer():FindComponentByName("Body:NewBody"))
```

#### [RedHotTools](../../../modding-tools/redhottools/):

<figure><img src="../../../../.gitbook/assets/AXL_body_checking_component.png" alt=""><figcaption></figcaption></figure>

If that still doesn't work, consider using the [template from Nexus](https://www.nexusmods.com/cyberpunk2077/mods/14793), which has been tried and tested on May 18 2024 with ArchiveXL

#### Invisible mesh for body xyz

Make sure that your mesh has appearances and materials. If you are using [archivexl-resource-patching.md](../archivexl-resource-patching.md "mention"), it's easy to forget a new body's mesh in the list like a gonk. This has never happened to the author, by the way.

## Clothing mods: Making use of the tags

### The problem

Even with the [AKL AutoRefitter](../../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-akl-autofitter.md), the process of supporting body mods is tedious. And even worse: you then have to pack everything separately for Nexus:

<figure><img src="../../../../.gitbook/assets/realistic_refitting_experience.png" alt=""><figcaption><p>Realistic refitting experience</p></figcaption></figure>

### The Solution

If a mod supports **body tags**, ArchiveXL can detect the current body mod, and conditionally load the correct mesh. Now, everything can be put into a single .archive!

### Dynamic Appearances

If you're using [dynamic appearances](../#dynamic-appearances), you don't need to register a suffix and can simply match or substitute for the body tag:

```
appearance name:
t0_recoloured_netrunner_suit&body=new_body

substitution:
*my\mod\meshes\p{gender}a_netrunning_suit_{body}.mesh
```

{% hint style="warning" %}
If no body mod is installed, the value will be `base_body`, so make sure to name your files and folders accordingly!

**NOTE**: `base_body`is also meant for body mods that are vanilla based shaped - for instance [EVB](https://www.nexusmods.com/cyberpunk2077/mods/11489) and [VTK Vanilla HD FemV](https://www.nexusmods.com/cyberpunk2077/mods/7054)
{% endhint %}

### Suffixes

If you're sticking to the classical approach, you need to add the following lines to your `.yaml`:

```yaml
  appearanceSuffixes:
    - !append itemsFactoryAppearanceSuffix.BodyType
```

Now, you can use the suffixes in your [root entity](../../../../for-mod-creators/files-and-what-they-do/entity-.ent-files#root-entity) just like camera states or body genders:

```
appearanceName: my_custom_shirt&FPP&NewBody
```

{% hint style="info" %}
If you know something that should be on the list, please edit [the-wiki](../../../../the-wiki/ "mention")!
{% endhint %}

## Supporting mods

The following body mods support dynamic body switching.

<table><thead><tr><th width="293">Body Mod - Male V</th><th width="229">Tag Name</th><th>Substitution Value</th></tr></thead><tbody><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/4968">-KS- Adonis</a></td><td>Adonis</td><td><code>&#x26;body=adonis</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/8766">-KS- Atlas</a></td><td>Atlas</td><td><code>&#x26;body=atlas</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/6423?tab=description">VTK - Gymfiend </a></td><td>Gymfiend</td><td><code>&#x26;body=gymfiend</code></td></tr></tbody></table>

<table><thead><tr><th width="293">Body Mod - Female V</th><th>Tag Name</th><th>Substitution Value</th></tr></thead><tbody><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/4901">-KS- Lion's Lush Body</a></td><td>Lush</td><td><code>&#x26;body=lush</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/8392">-KS- Lion's SoLush Body</a></td><td>Lush</td><td><code>&#x26;body=lush</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/6944">-KS- Solo Ultimate</a></td><td>Ult</td><td><code>&#x26;body=ult</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/15869">-KS- Solo 2.0</a></td><td>Solo_OG</td><td><code>&#x26;body=solo_og</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/7148">-KS- Solo Arms (v1.8.1)</a></td><td>SoloArms</td><td><code>&#x26;body=soloarms</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/12898">-KS- Songbird 2.0</a></td><td>Song2</td><td><code>&#x26;body=song2</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/6883">Na's Flat Chest</a></td><td>Flat</td><td><code>&#x26;body=flat</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/19821?tab=description">ELEGY</a></td><td>ELEGY</td><td><code>&#x26;body=elegy</code></td></tr><tr><td></td><td></td><td></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/4420">VTK - Hyst - Realistic Butt</a></td><td>RB</td><td><code>&#x26;body=rb</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/4654">VTK - Hyst - Enhanced Big Breasts</a></td><td>EBB</td><td><code>&#x26;body=ebb</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/9083">VTK - Hyst - Enhanced Big Breasts Push Up</a></td><td>EBBP</td><td><code>&#x26;body=ebbp</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/4654?tab=description">VTK - Hyst - Enhanced Big Breasts + Realistic Butt</a></td><td>EBBRB</td><td><code>&#x26;body=ebbrb</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/9083">VTK - Hyst - Enhanced Big Breasts Push Up + Realistic Butt</a></td><td>EBBPRB</td><td><code>&#x26;body=ebbprb</code></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/14896">VTK - Hyst - Angel</a></td><td>Angel</td><td><code>&#x26;body=angel</code></td></tr><tr><td></td><td></td><td></td></tr><tr><td><a href="https://www.nexusmods.com/cyberpunk2077/mods/19286">General use:<br>-FemV Small or Big Body</a></td><td>Small<br>Big</td><td><code>&#x26;body=small</code><br><code>&#x26;body=big</code></td></tr><tr><td><p><a href="https://www.nexusmods.com/cyberpunk2077/mods/7054">VTK - Vanilla HD Body - 3.0 </a></p><p><em><strong>*NOTE*</strong>: you don't need this unless your mod specially modifies body meshes for this body, otherwise the value is  <code>base_body</code>(see official mod page for further info.)</em></p></td><td>VHD</td><td><code>&#x26;body=vhd</code></td></tr></tbody></table>

