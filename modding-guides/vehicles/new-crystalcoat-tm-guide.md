# "New" CrystalCoat™ Guide

## **Summary**

**Published: Aug 24 by** [Barfunkle999](https://app.gitbook.com/u/gLywW7hLvaQYmzrcQzHIuYxr73a2 "mention")\
**Last documented update: Aug 24 by** [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") (formatting)

## **What is CrystalCoat?**

CrystalCoat™ is a unique mechanic built into Cyberpunk that allows players to dynamically change the material color that a mesh uses. This has been exclusively used for vehicles.

A vehicle is allowed to have a Primary and a Secondary color. This means you can assign two separate customizable colors on your vehicle. I usually use Primary for my vehicle’s main body color, and Secondary for my vehicle’s rims/accents.

**Required Files**

I have provided a template entity file which contains three necessary components in order for CrystalCoat to function.

These three components are:

* `customization`
* `EffectSpawner3546`
* `vehicleVisualCustomization`

Download the template .ent here: [crystalcoat\_new\_base.ent](https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F4gzcGtLrr90pVjAWVdTc%2Fuploads%2FPcKQeG7F7pZmdozsYuoH%2Fcrystalcoat_new_base.ent?alt=media\&token=83efd39a-3e78-4ca4-84f9-85ff5444b207)



## _**The Simple Outline**_

The general process for implementing CrystalCoat is as follows:

1. Add all three components to your vehicle’s existing entity file
2. Open your mesh in WolvenKit
3. Assign the submesh that you want to use CrystalCoat this baseMaterial: **multilayer\_vehicle\_destruction.mi**
4. Add a new Texture CKeyValuePair entry named, “CustomColorMask”. For Primary meshes, use, “engine\textures\editor\grey.xbm” as its value. For Secondary meshes, use, “engine\textures\editor\white.xbm” as its value.
5. In your vehicle’s entity file, navigate to components -> vehicleVisualCustomization -> effectDesc
6. For all three entEffectDescs named, “vvc\_color”, “vvc\_color\_insant”, and “vvc\_damage\_glitch”, add all component names from your vehicle’s appearance file under compiledEffectInfo -> componentNames
7. In your vehicle’s yaml file, add these entries under your vehicle’s record id:

* hasVisualCustomization: True
* customizeCarRims: True
* customizationMenuType: Partner
* genericCustomizationMask: engine\textures\editor\black.xbm
* excludedComponentsGeneric:

8. Under “excludedComponentsGeneric:” List the same components that you listed under all three entEffectDescs from your vehicle’s entity file



## **The Detailed Guide**

### WolvenKit <a href="#l8co6lcx7pik" id="l8co6lcx7pik"></a>

Open the downloaded “crystalcoat\_new\_base.ent” in WolvenKit.

You will see three components listed under “components”.

All three of these components are needed for CrystalCoat to function.

![](<../../.gitbook/assets/0 (3).png>)

Open your vehicle’s entity file, and delete any of the existing components with the same names as these (there could be a total of three, one of each).

So, you should be deleting any component named “customization”, “EffectSpawner3546”, and “vehicleVisualCustomization”, if they already exist in your vehicle’s entity file.

Copy all three components from “crystalcoat\_new\_base.ent” and paste them into your vehicle’s entity file.

### Mesh File <a href="#htcgrs2bus6r" id="htcgrs2bus6r"></a>

Now in your WolvenKit project, find a mesh that you want to have CrystalCoat and open it.

CrystalCoat works on a per submesh level. Meaning you can assign CrystalCoat to either one submesh, or multiple. You MUST have the submesh that you wish to use CrystalCoat on separated in Blender. You already have submeshes separated based on material, so just separate the submesh for CrystalCoat in the same way.

For each submesh that you want to use CrystalCoat, navigate to localMaterialBuffer -> materials.

You will see a list of each submesh. Expand the submesh you wish to use CrystalCoat on.

Set its “baseMaterial” to: “base\vehicles\common\materials\multilayer\_vehicle\_destruction.mi”.

Expand the “values” entry. Create a new “Texture” entry. Set its “Key” value to: “CustomColorMask”. For the “Value” entry, it depends on whether you want to use CrystalCoat’s Primary color or Secondary color.

For Primary color:

Set its value to “engine\textures\editor\grey.xbm”

For Secondary color:

Set its value to “engine\textures\editor\white.xbm”

![](<../../.gitbook/assets/1 (6).png>)

In the reference picture you can see four extra entries under the “values” array: “CoatTintFwd”, “CoatTintSide”, “CoatSpecularColor”, and “Opacity”. These mainly affect the paint of the car when CrystalCoat is not in use (the base paint). They’re optional, but highly recommended. Create these entries and assign them the exact same values if you wish to include them.

### Entity File <a href="#bgofyk9egwqn" id="bgofyk9egwqn"></a>

Now go back to your vehicle’s entity file.

Remember those three components you copied to your entity file? We will now be dealing with just “vehicleVisualCustomization”. The other two can remain untouched.

![](<../../.gitbook/assets/2 (5).png>)

Expand “vehicleVisualCustomization”.

Expand “effectDescs”.

Here you will see a list of entEffectDescs. Think of these as groups. For now, ignore “vvc\_color\_rims” and “vvc\_color\_rims\_instant”. We will only deal with the other three: “vvc\_color”, “vvc\_color\_instant”, and “vvc\_damage\_glitch”.

![](<../../.gitbook/assets/3 (6).png>)

This next process will be identical for all three of these entries, so I will guide you through one of them; being “vvc\_color”.

Expand “vvc\_color”.

Expand “compiledEffectInfo”.

Expand “componentNames” and “eventsSortedByRUID”.

Under “componentNames”, you will see an entry named “xxx”. Here you will add each component that uses CrystalCoat from your vehicle’s appearance file. For example, I have three entPhysicalMeshComponents named “body, “hood”, and “trunk.” in my vehicle’s appearance file. I will duplicate the “xxx” entry two times. Now there are three entries under “componentNames” named “xxx”. Rename each of these using the names from your entPhysicalMeshComponents in your vehicle’s appearance file. So, I will name all three accordingly:

* 0 = body
* 1 = hood
* 2 = trunk

![](<../../.gitbook/assets/4 (7).png>)

You may add up to 16 entries under “componentNames”. If you create more than 16 entries under “componentNames”, your game will crash on load.

Now under “eventsSortedByRUID”, you will see a short list of entries, all named “WorldCompiledEffectInfo”. You ONLY need to do the following to the FIRST entry, and leave the others untouched.

Click on the first “WorldCompiledEffectInfo”.

On the top right window of WolvenKit, you will see an entry named “componentIndexMask”.

Expand the dropdown box. You will see a list of empty checkboxes. We added three components named “body”, “hood”, and “trunk” under “componentNames”. Since we added three entries, we will check the top three boxes, starting from “0”.

![](<../../.gitbook/assets/5 (5).png>)

If you added more entries, check the same amount of checkboxes as the number of components you added.

Do this exact same process for the other two two “vvc\_color\_xxx” entEffectDescs, “vvc\_color\_instant” and “vvc\_damage\_glitch”.

What if I have more than 16 components that I want to use CrystalCoat? It’s okay! Remember earlier when I told you to ignore those first two entEffectDescs, “vvc\_color\_rims” and “vvc\_color\_rims\_instant”? Well contrary to the names, these are not components that need to be exclusively used from CrystalCoat rim/wheel components. If you have more than 16 components that you wish to use CrystalCoat on, just repeat the process of adding component entries and checking the componentIndexMask boxes here.

For better context: You added 16 components under the three entEffectDescs. However you have 24 components (or more) in total that you wish to have CrystalCoat. Just add the remaining components under “vvc\_color\_rims” and ““vvc\_color\_rims\_instant”, and check those “componentMaskIndex” boxes!

### Yaml FIle <a href="#id-2eik0jlk3ohg" id="id-2eik0jlk3ohg"></a>

Finally, onto your vehicle’s yaml.

Open your vehicle’s yaml file.

Under the your vehicle’s record id entry, add these five entries:

* hasVisualCustomization: True
* customizeCarRims: True
* customizationMenuType: Partner
* genericCustomizationMask: engine\textures\editor\black.xbm
* excludedComponentsGeneric:

Under “excludedComponentsGeneric:”, add a list of every component that you created in your vehicle entity file under “vvc\_color\_xxx” -> compiledEffectInfo -> componentNames.

![](<../../.gitbook/assets/6 (7).png>)

### Profit <a href="#wx28anr763wa" id="wx28anr763wa"></a>

That’s it! You’re done! Boot up Cyberpunk and test your vehicle’s CrystalCoat!
