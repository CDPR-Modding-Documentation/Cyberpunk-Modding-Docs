---
cover: ../../../.gitbook/assets/page9.jpg
coverY: 0
---

# Customizing the sun visor

All we need to do is to perform the same steps as we did for the roof. Except that we won't make this component colorable with CrystalCoat. Instead it will only be able to use predefined appearances.

Duplicate the `body_01_roof_custom` component and rename it to `body_01_sunvisor_custom`, then duplicate its mesh file and replace its suffix by `_sunvisor`. Affect this new mesh file to the new component.

## Submesh the sun visor

Export the new mesh file and the `body_01` mesh file. Open the `body_01` mesh file into Blender and submesh the component. Export the new submesh alone into the sun visor mesh file. Finally export all the other submeshes into the base mesh file. Finally import both files back into WolvenKit.

<figure><img src="../../../.gitbook/assets/image (428).png" alt=""><figcaption><p>Submesh the sun visor</p></figcaption></figure>

Open the new mesh file and remove all appearances except `standard` and `black`. Remove the corresponding materials from `localMaterialBuffer > materials` and `materialEntries` arrays. When you are done, right-click on the `materialEntries` array and refresh the index by choosing `Recalculate child index properties`.

{% hint style="success" %}
You must update the `AppearanceVisualController` list when you create a new component or if you modify its name, mesh appearance or mesh file path.

[Refer to this paragraph](creating-a-new-customizable-component.md#update-the-appearancevisualcontroller) to do so.
{% endhint %}

## Add new mod settings

Now we need to add two settings into our `SettingsPackage` class to handle both CrystalCoat ON and OFF states.

<pre class="language-swift" data-full-width="true"><code class="lang-swift">@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-body-cat")
@runtimeProperty("ModSettings.category.order", "2")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-body-on-sunvisor")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-body-on-sunvisor-desc")
<strong>@runtimeProperty("ModSettings.displayValues.Standard", "MyNickName-MyModName-enum-standard")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Black", "MyNickName-MyModName-enum-black")
</strong>public let sunvisorAppearanceCC: EMeshAppearanceStandard = EMeshAppearanceStandard.Standard;

@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-body-cat")
@runtimeProperty("ModSettings.category.order", "2")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-body-off-sunvisor")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-body-off-sunvisor-desc")
<strong>@runtimeProperty("ModSettings.displayValues.Standard", "MyNickName-MyModName-enum-standard")
</strong><strong>@runtimeProperty("ModSettings.displayValues.Black", "MyNickName-MyModName-enum-black")
</strong>public let sunvisorAppearance: EMeshAppearanceStandard = EMeshAppearanceStandard.Standard;
</code></pre>

Notice that we are using the `EMeshAppearanceStandard` enumerated type for both fields. This is because we don't want the user to be able to choose `Coated` or `Painted` values in any case.

## Add new translations keys

We need to add new localized strings for our new settings. Export your `en-us.json` file then add these elements into it and update their secondary keys.

{% code fullWidth="true" %}
```yaml
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Sun visor",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-body-on-sunvisor"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what appearance you want to apply on the sun visor when CrystalCoat™ is enabled.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-body-on-sunvisor-desc"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Sun visor (CrystalCoat™ OFF)",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-body-off-sunvisor"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what appearance you want to apply on the sun visor when CrystalCoat™ is disabled.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-body-off-sunvisor-desc"
}
```
{% endcode %}

Then import it back into CR2W by right-clicking on it and select `Convert from JSON`. Repeat this process with any other language you have set.

## Add the sun visor to deformable parts

As the sun visor component comes from the `body_01` component it must be added to the list of deformable parts of the vehicle. [Follow this paragraph](creating-a-new-customizable-component.md#update-deformable-parts) to do so. Except that you will add a `_3` suffix to your new elements in the YAML file.

The `_1` suffix is already being used for `body_01_painted_custom` component. And the `_2` suffix is already being used for `body_01_roof_custom` component.

## Edit the script to process our component

As our component is individually customizable by the user we need to connect the mod settings with the components processing just like we did for the roof.

To do this modify the `Utils.CustomizeMesh` method. In the first `switch` block of the method, add a new `else if` block under the existing `if` block. The new content is on the lines 7 to 9.

<pre class="language-swift" data-line-numbers data-full-width="true"><code class="lang-swift">switch vehicleModel {
  case ESupportedVehicle.Supron:

    if Equals(meshComp.name, n"body_01_roof_custom") {
      meshAppearance = ccEnabled ? ToString(MyModSettings.Get(gi).settings.roofAppearanceCC) : ToString(MyModSettings.Get(gi).settings.roofAppearance);
    }
<strong>    else if Equals(meshComp.name, n"body_01_sunvisor_custom") {
</strong><strong>      meshAppearance = ToString(ccEnabled ? MyModSettings.Get(gi).settings.sunvisorAppearanceCC : MyModSettings.Get(gi).settings.sunvisorAppearance);
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

Now you can test your mod and see that the sun visor can be customized for both CrystalCoat states.

<figure><img src="../../../.gitbook/assets/photomode_23052024_152644.png" alt=""><figcaption><p>Customizable sun visor using the black appearance</p></figcaption></figure>

> My vehicle is so fancy now ! But wait ! Those wheels feel very cheap !
