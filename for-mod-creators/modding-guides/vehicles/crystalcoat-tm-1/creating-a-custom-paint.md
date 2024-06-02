---
cover: ../../../../.gitbook/assets/page7.jpg
coverY: 0
---

# 🍁 Creating a custom paint

Let's say we want to give the user some choices to customize his vehicle. It would be great to allow for multiple paint aspects just like in real life.

## Add a new mod setting to change paint

If we want to allow the user to choose between multiple paint aspects we need to create a choice mechanism. Mod Settings is made for this purpose. So let's create a new settings class into our script.

Let me explain what lies into the following code snippet. The `SettingsPackage` class contains the settings you will see in the Mod Settings menu of the game. Here you have two settings `paintAspectEnabled` and `paintAspect.`

The first one is a toggle that allows to turn on the custom paint feature. Indeed you still want to be able to use the default CrystalCoat we have already created which is what the base game is doing. The second setting will be enabled only if the first one is enabled too because I have set a `dependency` attribute (line 23).

The second setting uses a enumerated type `EPaintAspect` which is defined on top of the snippet. This enum will contain any paint aspect we want to define. To begin I have added a single one that corresponds to a metallic paint.

The second class is the `MyModSettings` class that we will call anywhere into the script to access our settings. This class contains the settings package instance into its `settings` field.

In order for this code to work into your mod you need to perform some case-sensitive replacements. First replace occurrences of `"MyModName"` (including quotes) by your mod name (with quotes) as you want it to appear in the ModSettings mods list. You should have replaced **2 occurrences**.

Now you need to replace `MyNickName-MyModName` by what you may have already used during [this paragraph](customizing-the-color-picker-widget.md#modify-the-vehicle-manufacturer-name) to define your secondary keys for translation. You should have replaced **7 occurrences**.

Finally replace `MyNickName.MyModName` by your module name which is at the very top of the script file. You should have replaced **1 occurrence**.

{% code lineNumbers="true" fullWidth="true" %}
```swift
enum EPaintAspect {
  Metallic = 0
}

public class SettingsPackage {

  /////////////////////////
  // GENERAL
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "MyModName")
  @runtimeProperty("ModSettings.category", "MyNickName-MyModName-general-cat")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-general-paint_aspect_enabled")
  @runtimeProperty("ModSettings.description", "MyNickName-MyModName-general-paint_aspect_enabled-desc")
  public let paintAspectEnabled: Bool = false;

  @runtimeProperty("ModSettings.mod", "MyModName")
  @runtimeProperty("ModSettings.category", "MyNickName-MyModName-general-cat")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-general-paint_aspect")
  @runtimeProperty("ModSettings.description", "MyNickName-MyModName-general-paint_aspect-desc")
  @runtimeProperty("ModSettings.dependency", "paintAspectEnabled")
  @runtimeProperty("ModSettings.displayValues.Metallic", "MyNickName-MyModName-enum-metallic")
  public let paintAspect: EPaintAspect = EPaintAspect.Metallic;
}

public class MyModSettings extends ScriptableSystem {
  
  public let settings: ref<SettingsPackage>;

  public static func Get(gi: GameInstance) -> ref<MyModSettings> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"MyNickName.MyModName.MyModSettings") as MyModSettings;
  }

  private func OnAttach() -> Void {
    this.settings = new SettingsPackage();

    ModSettings.RegisterListenerToClass(this.settings);
  }
  
  private func OnDetach() -> Void {
    ModSettings.UnregisterListenerToClass(this.settings);
  }
}
```
{% endcode %}

You also need to add a new `Painted` value into the `EMeshAppearanceCC` enumerated type so we can handle paint materials.

<pre class="language-swift"><code class="lang-swift">enum EMeshAppearanceCC {
  Standard = 0,
  Coated = 1,
<strong>  Painted = 2
</strong>}
</code></pre>

Finally we need to revise our `Utils.CustomizeMesh` method that actually swaps mesh appearances so it can accept a new one.

In the `switch` statement at line 7 we look for the vehicle model. You may need to update it if you are not using the Mahir Supron.

What this code block does is select the relevant mesh appearance depending on the CrystalCoat state. If it is turned off then it will use the `standard` mesh appearance. Otherwise if the custom paint toggle is enabled it will use the selected paint aspect (`metallic`) and if the toggle is disabled it will use the default `coated` mesh appearance you already know.

Then the `for` loop at line 24 looks for a corresponding WorldWidgetComponent associated with the current mesh component if one exists.

And finally the final `switch` statement at line 31 is actually affecting the new mesh appearance to the component.

{% code lineNumbers="true" fullWidth="true" %}
```swift
public func CustomizeMesh(vehicleModel: ESupportedVehicle, ccEnabled: Bool, meshComp: ref<MeshComponent>, components: array<ref<IComponent>>) -> ref<IComponent> {
  let gi: GameInstance = this.GetGameInstance();

  let meshAppearance: String;
  let paintAspect: String = StrLower(ToString(MyModSettings.Get(gi).settings.paintAspect));
  let widget: ref<IComponent>;

  switch vehicleModel {
    case ESupportedVehicle.Supron:
      if ccEnabled {
        meshAppearance = ToString(MyModSettings.Get(gi).settings.paintAspectEnabled ? EMeshAppearanceCC.Painted : EMeshAppearanceCC.Coated);
      }
      else {
        meshAppearance = ToString(EMeshAppearanceCC.Standard);
      }
      break;

    default:
      return null;
      break;
  }
  meshAppearance = StrLower(meshAppearance);
  
  // Retrieve the optional CC widget
  for comp in components {
    if Equals(s"\(comp.GetName())", s"visual_customization_\(meshComp.name)") {
      widget = comp;
      break;
    }
  }
  
  switch meshAppearance {        
    case "painted":
      meshComp.meshAppearance = StringToName(paintAspect);
      break;

    default:
      meshComp.meshAppearance = StringToName(meshAppearance);
      break;
  }

  if Equals(meshAppearance, "coated")
  || Equals(meshAppearance, "painted") {
    return widget;
  }

  return null;
}
```
{% endcode %}

## Add new localization keys for the menu

Now the code is ready, we need to add new localized strings to our existing JSON files. In the following content you need to replace the `MyNickName-MyModName` occurrences by what you have used previously. If you don't have created a translation file yet, then [refer to this paragraph](customizing-the-color-picker-widget.md#modify-the-vehicle-manufacturer-name).

You should have replaced **6 occurrences**.

```yaml
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Supron / General",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-general-cat"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Paint aspect",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-general-paint_aspect"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Choose what kind of paint you want to apply on the vehicle.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-general-paint_aspect-desc"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Custom paint",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-general-paint_aspect_enabled"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Use a custom paint for the vehicle.",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-general-paint_aspect_enabled-desc"
},
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Metallic",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-enum-metallic"
}
```

## Defining a new paint material

We have just created the mechanism that allows the user to choose a different paint. Now we need to create the new paint material and add it into our mesh files.

Duplicate your existing `coated.mlsetup` file and name it `metallic.mlsetup`. Then convert it into JSON and open it in MlsetupBuilder (MLSB). Then in MLSB import layers to the editor by clicking on the orange button.

We know that our paint layer is 0 so we just need to modify this layer. Into the material template field use this one.

```
base\surfaces\materials\paint\car_paint\car_paint_metallic_01.mltemplate
```

This is the default metallic car paint material of the game. Then set these values into the material settings. Apply edits on the left before doing anything else or your changes will be lost.

Finally export the file and erase the JSON file. Then convert the JSON file back into mlsetup in WolvenKit.

```
Tiles = 25.0
Opacity = 1.0
Offset U = 0.0
Offset V = 0.0
Roughness In = null
Roughness Out = null
Normals = null
Metalness Out = null
ColorCode = 3eaf77_null
µBlends texture = base\surfaces\microblends\default.xbm
µBlends tiles = 10,1000004
µBlends contrast = 1
µBlends normals = 0
µBlends offset U = 0
µBlends offset V = 0
```

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_kWuwUxYNH63lFvnuojX4_image.webp" alt="" width="375"><figcaption><p>MLSB metallic paint definition</p></figcaption></figure>

#### Create a new material into your mesh files

Add a new mesh appearance in the `appearances` array with name `metallic` containing a single chunk named `metallic` too.

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_XbkgVzznlr2uxXvLwc2K_image.webp" alt=""><figcaption><p>Add a new metallic appearance</p></figcaption></figure>

Now you need to update the mesh file for each of your `*_painted_custom` components and add a new `metallic` material into them.

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_cKZ7E3u2knEMjtgyVvpB_image.webp" alt=""><figcaption><p>Add a new metallic material</p></figcaption></figure>

To do this duplicate the last entry of the `materialEntries` array and name it `metallic` then right-click on the array and choose `Recalculate child index properties`.

Then in the `localMaterialBuffer > materials` array right-click on the `coated` material and select `Copy from Array/Buffer`. Then right-click on the array and select `Paste into Array/Buffer` so it will be added to the end.

Now we need to set the material parameters. Open the `metallic` material and modify its `MultilayerSetup` field with the relative path to the new `metallic.mlsetup` file you have created.

Next we need to add several parameters into this material. To do this click on the `values` array and on the right click on `Create Item In Array`. Then for each parameter you will need to use the relevant type.

* Simple numbers like `CoatFresnelBias` or `Opacity` are using the `Scalar` type.
* RGBA colors like `CoatTintFwd` are using the `Color` type.
* Fields that use a XBM file path like `GlobalNormal` are using the `Texture` type.

For each parameter you need to set its name and its value. Then you will be able to copy these parameters or even the entire `metallic` material into the other mesh files as they all use the same mlmask and mlsetup in the case of the Mahir Supron.

Otherwise you need to copy the parameters into the existing material you have previously duplicated.

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_XIjegWfH5oaFPIPYOjLu_image.webp" alt=""><figcaption><p>Metallic material parameters</p></figcaption></figure>

Now lets see the result.

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_LTRS3b2aElDhMgMFuGlB_image.png" alt=""><figcaption><p>CrystalCoat using a metallic paint</p></figcaption></figure>

> Nice ! But I can see some stairs in the paint on the back doors !

## Fix the paint on the back doors

As we have isolated all the painted parts it allows us to use a dedicated mlmask that will only allow the paint layer to be displayed. All of our painted components will use this new mlmask.

Copy any existing mlmask and rename it `painted.mlmask`. For example use the one from the Mahir Supron.

```
base\vehicles\standard\v_standard25_mahir_supron\entities\meshes\textures\mahir_supron__ext01_body_01_masksset.mlmask
```

Use the export tool `Tools > Export Tool` to generate PNG images for each layer in the `raw` folder. Then go into this folder and see that there are 20 layers as PNG files.

We know that the layer 0 is responsible for the painted areas. Then all we need to do is to use a full white image for layer 0 and a full black image for all the other layers so we are sure that they won't conflict with our paint.

{% hint style="warning" %}
In the case of the Mahir Supron the side stripes are created by the layer 2 so we need to keep the layer 2 image unchanged.
{% endhint %}

The layer 0 is already a full white image so there is no need to change it. Either find another layer that is already full black or create one with an image editor software using the same image size. Then duplicate this file for all the other layers except layer 2 and reuse their name.

<figure><img src="../../../../.gitbook/assets/image (342).png" alt=""><figcaption><p>Layers for the painted.mlmask</p></figcaption></figure>

Then import the layers back into the mlmask file using the `Tools > Import Tool`.

Then affect your new mlmask file to all the painted components in the `metallic` material in the field `MultilayerMask`.

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_YcPMicvH0w3s0k7llHOc_image.webp" alt=""><figcaption><p>Affect the new mlmask to all the painted components</p></figcaption></figure>

Then test the mod and see if the problem is solved.

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_cQwZd9pFL5lguO5RP80w_image.webp" alt=""><figcaption><p>All painted parts are now fixed</p></figcaption></figure>

Now all of our painted components are fixed. This metallic paint is beautiful !

{% hint style="info" %}
For the Mahir Supron we could have kept the original mlmask file and instead turn the opacity for all layers except layer #0 and layer #2 to 0 into the mlsetup file. This could have worked because the Supron is using the base layer 0 as the paint layer and this layer is always a full white image so there is no UV drawing problem.

But some other vehicles use a specific layer for the paint, thus they draw all the painted parts into that layer. In this case, if the drawing is messy and lacks precision the only way to fix it is to modify the mlmask layer. This is why I have chosen to modify the mlmask so you can use a solution that works in all cases.
{% endhint %}

> What if I want to add another paint aspect ? Like a glossy paint ?

## Creating a glossy paint

The work is essentially the same as the metallic paint we have just created. As we already have created the user choice mechanism before we can now simply add a new paint type into the script.

### Add a new paint aspect in the enum type

<pre class="language-swift"><code class="lang-swift">enum EPaintAspect {
  Metallic = 0,
<strong>  Glossy = 1
</strong>}
</code></pre>

### Add a new translation item for the menu

At line 8 in this code snippet we need to add a new `runtimeProperty` to translate the new enum value.

<pre class="language-swift" data-line-numbers data-full-width="true"><code class="lang-swift">@runtimeProperty("ModSettings.mod", "MyModName")
@runtimeProperty("ModSettings.category", "MyNickName-MyModName-general-cat")
@runtimeProperty("ModSettings.category.order", "1")
@runtimeProperty("ModSettings.displayName", "MyNickName-MyModName-general-paint_aspect")
@runtimeProperty("ModSettings.description", "MyNickName-MyModName-general-paint_aspect-desc")
@runtimeProperty("ModSettings.dependency", "paintAspectEnabled")
@runtimeProperty("ModSettings.displayValues.Metallic", "MyNickName-MyModName-enum-metallic")
<strong>@runtimeProperty("ModSettings.displayValues.Glossy", "MyNickName-MyModName-enum-glossy")
</strong>public let paintAspect: EPaintAspect = EPaintAspect.Metallic;
</code></pre>

In the `en-us.json` language file we need to add a new localized string entry. Do the same for any other language file you may have defined.

```yaml
{
  "$type": "localizationPersistenceOnScreenEntry",
  "femaleVariant": "Glossy",
  "maleVariant": "",
  "primaryKey": "0",
  "secondaryKey": "MyNickName-MyModName-enum-glossy"
}
```

### Create a new paint material

Duplicate the existing `metallic.mlsetup` file and name it `glossy.mlsetup`. Then open it in MLSB and replace layer 0's template file with this one.

```
base\surfaces\materials\plastic\plastic_hq\plastic_tech_hq_01_30.mltemplate
```

Then set these parameters for layer 0.

<pre><code><strong>Tiles = 10.0
</strong>Opacity = 1.0
Offset U = 0.0
Offset V = 0.0
Roughness In = null
Roughness Out = (0.196,0)
Normals = (0.15)
Metalness Out = (0,0.25)
ColorCode = 3eaf77_null
µBlends texture = base\surfaces\microblends\default.xbm
µBlends tiles = 10,1000004
µBlends contrast = 1
µBlends normals = 0
µBlends offset U = 0
µBlends offset V = 0
</code></pre>

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_jTVI3Y3qWzz3n4fRlE6y_image.webp" alt="" width="375"><figcaption><p>MLSB glossy paint definition</p></figcaption></figure>

Then save the file and import it back into WolvenKit.

### Create a new appearance/material in mesh files

For all painted components duplicate the `metallic` appearance and replace its name and chunk with `glossy`. Then duplicate the `materialEntries` `metallic` entry and name it `glossy` then duplicate the associated `localMaterialBuffer > materials` `metallic` entry.

Finally assign the new `glossy.mlsetup` file into this material. Keep all the parameters identical to the metallic paint.

All you have to do now is to install the mod and select the new paint aspect in the mod settings !

<figure><img src="../../../../.gitbook/assets/spaces_4gzcGtLrr90pVjAWVdTc_uploads_qD3n9sEVQyfDl83jcbeT_image.png" alt=""><figcaption><p>CrystalCoat using a glossy paint</p></figcaption></figure>

> Wonderful ! I can't believe it ! Well do you think that I could add other _premios_ stuff to this vehicle ?
