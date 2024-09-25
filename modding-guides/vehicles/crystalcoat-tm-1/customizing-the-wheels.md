---
cover: ../../../.gitbook/assets/page10.jpg
coverY: 0
---

# 🛞 Customizing the wheels

Concerning the wheels we want to make them colorable with CrystalCoat but we would like to select their paint aspect independently of the rest of the vehicle. So we can have a vehicle with metallic paint and wheels using the glossy paint.

For the Mahir Supron all the wheels use the same mesh file so it will be easier. The wheel components are these ones:

* `wheel_01_fl_a`
* `wheel_01_fr_a`
* `wheel_01_bl_a`
* `wheel_01_br_a`

Duplicate the `wheel_01_fl_a` component to create two new components named `wheel_01_fl_a_painted` and `wheel_01_fl_a_inserts`. Set their `meshAppearance` to `standard`.

Add the mesh file to your project and duplicate it twice. Add theses suffixes to your new mesh files `_painted` and `_inserts`. Assign all three files to your three components:

* `wheel_01_fl_a`
* `wheel_01_fl_a_painted`
* `wheel_01_fl_a_inserts`

Repeat this process for the other wheels using the same mesh files. If your front wheels and back wheels are using two different mesh files then repeat this process for both groups.

## Submesh the wheels

Export your three mesh files and import one of them into Blender. Hide all submeshes except the relevant one you want to work with.

Submesh these parts for the `_inserts` component.

<figure><img src="../../../.gitbook/assets/image (343) (1).png" alt=""><figcaption><p>Inserts submesh for wheels</p></figcaption></figure>

Select this new submesh alone and export it to the `_inserts` mesh file. Submesh these parts for the `_painted` component.

<figure><img src="../../../.gitbook/assets/image (344) (1).png" alt=""><figcaption><p>Painted submesh for wheels</p></figcaption></figure>

Select this new submesh alone and export it to the `_painted` mesh file. Then select all the other submeshes and export them to the base mesh file.

Import your three mesh files back into WolvenKit. Now duplicate one of your WorldWidgetComponents named `visual_customization_<some_component>` for the painted component and another one for the inserts component. Rename them and update their `meshTargetBinding > bindName` and `parentTransform > bindName` fields with their new component name.

{% hint style="success" %}
You must update the `AppearanceVisualController` list when you create a new component or if you modify its name, mesh appearance or mesh file path.

[Refer to this paragraph](creating-a-new-customizable-component.md#update-the-appearancevisualcontroller) to do so.
{% endhint %}

## Add new mod settings

We need to create four mod settings to handle wheels. Two for CrystalCoat OFF state and two more for CrystalCoat ON state.

As usual in the following code you need to replace the mod name and secondary keys for translation. See that CrystalCoat OFF settings are using `EMeshAppearanceStandard` type while CrystalCoat ON settings are using `EWheelAppearanceCC` type because we want to replace the `Painted` value with a list of paint aspects directly. So we also need to use the relevant translation entries above the field.

<pre class="language-swift" data-line-numbers data-full-width="true"><code class="lang-swift">/////////////////////////
// WHEELS
/////////////////////////

@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-wheels-cat")
@runtimeProperty("ModSettings.category.order", "3")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-wheels-on-painted")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-wheels-on-painted-desc")
<strong>@runtimeProperty("ModSettings.displayValues.Standard", "MyNickName-MyModName-enum-standard")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Coated", "MyNickName-MyModName-enum-coated")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Metallic", "MyNickName-MyModName-enum-metallic")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Glossy", "MyNickName-MyModName-enum-glossy")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Black", "MyNickName-MyModName-enum-black")
</strong>public let wheelPaintedAppearanceCC: EWheelAppearanceCC = EWheelAppearanceCC.Black;

@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-wheels-cat")
@runtimeProperty("ModSettings.category.order", "3")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-wheels-off-painted")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-wheels-off-painted-desc")
<strong>@runtimeProperty("ModSettings.displayValues.Standard", "MyNickName-MyModName-enum-standard")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Black", "MyNickName-MyModName-enum-black")
</strong>public let wheelPaintedAppearance: EMeshAppearanceStandard = EMeshAppearanceStandard.Standard;

@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-wheels-cat")
@runtimeProperty("ModSettings.category.order", "3")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-wheels-on-inserts")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-wheels-on-inserts-desc")
<strong>@runtimeProperty("ModSettings.displayValues.Standard", "MyNickName-MyModName-enum-standard")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Coated", "MyNickName-MyModName-enum-coated")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Metallic", "MyNickName-MyModName-enum-metallic")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Glossy", "MyNickName-MyModName-enum-glossy")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Black", "MyNickName-MyModName-enum-black")
</strong>public let wheelInsertsAppearanceCC: EWheelAppearanceCC = EWheelAppearanceCC.Glossy;

@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-wheels-cat")
@runtimeProperty("ModSettings.category.order", "3")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-wheels-off-inserts")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-wheels-off-inserts-desc")
<strong>@runtimeProperty("ModSettings.displayValues.Standard", "MyNickName-MyModName-enum-standard")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Black", "MyNickName-MyModName-enum-black")
</strong>public let wheelInsertsAppearance: EMeshAppearanceStandard = EMeshAppearanceStandard.Standard;
</code></pre>

Then create the new `EWheelAppearanceCC` enumerated type.

```swift
enum EWheelAppearanceCC {
  Standard = 0,
  Coated = 1,
  Metallic = 2,
  Glossy = 3,
  Black = 4
}
```

As we have 4 wheels to link with our new settings we need to add this code (lines 10-21) in the `Utils.CustomizeMesh` method.

<pre class="language-swift" data-line-numbers data-full-width="true"><code class="lang-swift">switch vehicleModel {
  case ESupportedVehicle.Supron:

    if Equals(meshComp.name, n"body_01_roof_custom") {
      meshAppearance = ccEnabled ? ToString(MyModSettings.Get(gi).settings.roofAppearanceCC) : ToString(MyModSettings.Get(gi).settings.roofAppearance);
    }
    else if Equals(meshComp.name, n"body_01_sunvisor_custom") {
      meshAppearance = ccEnabled ? ToString(MyModSettings.Get(gi).settings.sunvisorAppearanceCC) : ToString(MyModSettings.Get(gi).settings.sunvisorAppearance);
    }
<strong>    else if Equals(meshComp.name, n"wheel_01_fl_a_painted_custom")
</strong><strong>    || Equals(meshComp.name, n"wheel_01_fr_a_painted_custom")
</strong><strong>    || Equals(meshComp.name, n"wheel_01_bl_a_painted_custom")
</strong><strong>    || Equals(meshComp.name, n"wheel_01_br_a_painted_custom") {
</strong><strong>      meshAppearance = ccEnabled ? ToString(MyModSettings.Get(gi).settings.wheelPaintedAppearanceCC) : ToString(MyModSettings.Get(gi).settings.wheelPaintedAppearance);
</strong><strong>    }
</strong><strong>    else if Equals(meshComp.name, n"wheel_01_fl_a_inserts_custom")
</strong><strong>    || Equals(meshComp.name, n"wheel_01_fr_a_inserts_custom")
</strong><strong>    || Equals(meshComp.name, n"wheel_01_bl_a_inserts_custom")
</strong><strong>    || Equals(meshComp.name, n"wheel_01_br_a_inserts_custom") {
</strong><strong>      meshAppearance = ccEnabled ? ToString(MyModSettings.Get(gi).settings.wheelInsertsAppearanceCC) : ToString(MyModSettings.Get(gi).settings.wheelInsertsAppearance);
</strong><strong>    }
</strong>    else {
      if ccEnabled {
        meshAppearance = ToString(MyModSettings.Get(gi).settings.paintAspectEnabled ? EMeshAppearanceCC.Painted : EMeshAppearanceCC.Coated);
      }
      else {
        meshAppearance = ToString(EMeshAppearanceCC.Standard);
      }
    }
    break;

  default:
    return null;
    break;
}
</code></pre>

## Add new translation keys

We need to add new localized strings for our new settings. Export your `en-us.json` file then add these elements into it and update their secondary keys.

{% code fullWidth="true" %}
```yaml
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Supron / Wheels",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-cat"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Painted areas",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-on-painted"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what appearance you want to apply on the painted areas of the wheels when CrystalCoat™ is enabled.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-on-painted-desc"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Painted areas (CrystalCoat™ OFF)",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-off-painted"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what appearance you want to apply on the painted areas of the wheels when CrystalCoat™ is disabled.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-off-painted-desc"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Inserts",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-on-inserts"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what appearance you want to apply on the wheels inserts when CrystalCoat™ is enabled.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-on-inserts-desc"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Inserts (CrystalCoat™ OFF)",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-off-inserts"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what appearance you want to apply on the wheels inserts when CrystalCoat™ is disabled.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-wheels-off-inserts-desc"
}
```
{% endcode %}

Then import it back into CR2W by right-clicking on it and select `Convert from JSON`. Repeat this process with any other language you have set.

## Create materials

Open your `_inserts` mesh file so we can create the materials and appearances. Delete all appearances and create these ones with a single chunk (appearance name -> chunk name).

* `standard` -> `poor_01`
* `metallic` -> `metallic`
* `glossy` -> `glossy`
* `coated` -> `coated`
* `black` -> `black`

In the `materialEntries` and `localMaterialBuffer > materials` arrays remove all entries except `poor_01`. Then copy the existing materials from another of your mesh files concerning `metallic`, `glossy`, `coated` and `black` materials.

{% hint style="info" %}
You must rebuild the index of the `materialEntries` array after you have finished to reorganize it. Right-click on it and choose `Recalculate child index properties`.
{% endhint %}

### Define the coated material

For the `coated` material, reuse the original mlmask file from the `poor_01` material. Add its associated mlsetup file to your project and rename it to `wheel_coated.mlsetup`. Assign this new file to `localMaterialBuffer > materials > coated > MultilayerSetup`. Then right-click on the file and select `Convert to JSON`.

Open it in MLSB and disable the layers that make the wheel dirty: 15, 17, 18. To do so turn their opacity to 0. Then export the file to JSON and import it back into WolvenKit.

<figure><img src="../../../.gitbook/assets/image (379).png" alt=""><figcaption><p>Coated material definition</p></figcaption></figure>

### Define the metallic material

Concerning this one as this is a textured material we need to define its `Tiles` value into the mlsetup file because depending on the mesh UV, the texture resolution will be different.

Duplicate the existing `metallic.mlsetup` and name it `wheel_metallic.mlsetup`. Then assign it to `localMaterialBuffer > materials > metallic > MultilayerSetup`.

Edit the file into MLSB and set its `Tiles` value to 8 on the layer 0. Save the file and import it back into WolvenKit. Now we also need to define a new mlmask file for the wheels.

We cannot reuse the existing `painted.mlmask` file because it uses layer 0 and layer 2. Indeed the Mahir Supron has side stripes thanks to layer 2.

Duplicate the `painted.mlmask` file and name it `wheel_painted.mlmask`. Export it and replace the layer 2 image by a black image using the same size and name. Then import the mlmask back into WolvenKit.

Assign it to your `metallic` material into `localMaterialBuffer > materials > metallic > MultilayerMask`.

<figure><img src="../../../.gitbook/assets/image (380).png" alt="" width="447"><figcaption><p>Metallic material definition</p></figcaption></figure>

### Define the glossy material

For this one we don't need to duplicate the mlsetup. Simply assign your `wheel_painted.mlmask` file into `localMaterialBuffer > materials > glossy > MultilayerMask`.

<figure><img src="../../../.gitbook/assets/image (381).png" alt="" width="458"><figcaption><p>Glossy material definition</p></figcaption></figure>

Finally concerning the `black` material this is exactly the same process as the `glossy` one.

Now you can test your mod and see the result !

{% hint style="success" %}
If your wheels stay black when you activate CrystalCoat, switch between the third-person perspective (TPP) and the first-person perspective (FPP) so widgets will be updated.
{% endhint %}

<figure><img src="../../../.gitbook/assets/Cyberpunk 2077 Screenshot 2024.05.25 - 02.45.57.55.png" alt=""><figcaption><p>Customized wheels</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Cyberpunk 2077 Screenshot 2024.05.25 - 02.48.02.55.png" alt=""><figcaption><p>Mod settings for wheels customization</p></figcaption></figure>

> This is fantastic ! My vehicle now looks _premios_ ! But wait ! It is all dirty on the tires and around the vehicle !
