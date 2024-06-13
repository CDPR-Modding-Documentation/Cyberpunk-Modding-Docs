---
cover: ../../../../.gitbook/assets/page11.jpg
coverY: 0
---

# 🌇 Cleaning the vehicle from rust and dust

In order to clean a vehicle part we need to add its mesh file to our project, then assign this new file to the component in the APP file.

Next, identify the material being used by this component by looking into the APP file at the `meshAppearance` field of the component. Then in the mesh file find the relevant chunk.

Here are the vehicle parts to clean for the Mahir Supron:

* `tire_01_fl_a`
* `tire_01_fr_a`
* `tire_01_bl_a`
* `tire_01_br_a`
* `wheel_01_fl_a` and `*_custom`
* `wheel_01_fr_a` and `*_custom`
* `wheel_01_bl_a` and `*_custom`
* `wheel_01_br_a` and `*_custom`
* `bumper_f_01`
* `bumper_b_01`
* `engine`
* `junk_fuelcell_01`
* `body_01` and `*_custom`
* `door_fl_a` and `*_custom`
* `door_fr_a` and `*_custom`
* `door_bl_a` and `*_custom`
* `door_br_a` and `*_custom`
* `mirror_fl_01` and `*_custom`
* `mirror_fr` and `*_custom`

By chance the tires mesh file already contains a `clean` appearance for the Mahir Supron so simply use it in the APP components `meshAppearance` field.

For the other ones we need to edit their material setup.

## Fix the mlsetup

Add the mlsetup being used by the material to your project and add a suffix to it so we know what it is all about: `_clean`. Using its original name and appending a suffix tells us that this file is meant to be accurate to the original except that we remove the rust and dust from it.

Assign this new mlsetup file to the material definition. Then open the mlsetup file into MLSB. Load the 3D model of the corresponding mesh and identify dirt / rust / dust layers. Turn their opacity to 0 and export the file to JSON. Then import it back into WolvenKit.

Mlsetup files are shared between multiple components so once you have edited the mlsetup you will just have to assign it to the other components that use the same mlsetup.

<figure><img src="../../../../.gitbook/assets/clean_vehicle (2).png" alt=""><figcaption><p>Vehicle cleaned from rust and dust</p></figcaption></figure>

> Wait ! I can see yellow on the doors plastic parts ! Also the aluminium on wheels is messy !

## Fix the mlmask

### How to fix mask issues

We know that the Mahir Supron is using layer 0 as the paint layer which covers the entire vehicle. This implies that if additional layers are not precisely drew then the underlying layers will be visible. Depending on how the game developers have created layers it may be more or less accurate.

From what I have seen on multiple vehicles they seem to have used brush painting to create masks which I find it to be a messy way to create layers except for rust and dust which are messy by design.

Instead we must use Blender to select the mesh parts that shall be impacted by a layer and then export the UV layout associated with this selection.

Finally create a mlmask layer using this UV layout. The result will be perfect to the pixel. It also depends on the layer resolution because if the layer image is too small (like 256x256 on some vehicles) then it will lack precision. I prefer to use 1024x1024 layers which is the case for most vehicles anyway.

### Fixing the plastic layer mask

Open one of your doors mesh file and look in the `poor_06` material. Add the mlmask file to your project and add the `_clean` suffix to it.&#x20;

Export the mlmask, the 6 doors mesh files and the body mesh file using the `Tools > Export Tool`. Plastic parts are defined in the original component for each component, so you don't need to export `_custom` components files.

Import all the mesh files into Blender, hide unused chunks and select all the chunks that include plastic parts (one per component). Then go into `Edit mode` using the `Tab` key and select all the areas affected by plastic. You can move the different mesh objects to make things easier.

<figure><img src="../../../../.gitbook/assets/image (363).png" alt=""><figcaption><p>Select plastic parts</p></figcaption></figure>

Then use the `UV Editing` view in the menu bar to display the UV layout that corresponds to your selection. Use this menu to export the layout to a PNG image `UV > Export UV Layout`.

<figure><img src="../../../../.gitbook/assets/image (364).png" alt=""><figcaption><p>Export the UV layout associated with plastic parts</p></figcaption></figure>

Then be sure to set a size of 1024x1024 and to set a `Fill Opacity` of 1.00. Also name your PNG file `layer11.png` so we know which layer is associated with this layout.

<figure><img src="../../../../.gitbook/assets/image (360).png" alt=""><figcaption><p>Export parameters for the UV layout</p></figcaption></figure>

Now into a image editor like Adobe Photoshop open the mask layer 11 from your mlmask PNG files set. Then import the UV layout you have just created into that project and create a layer style on it to fill it with white.

<figure><img src="../../../../.gitbook/assets/image (362).png" alt=""><figcaption><p>Create a layer style for the UV layout layer</p></figcaption></figure>

Then merge layers and save the PNG file in-place. Import the mlmask layers set back into WolvenKit using the `Tools > Import Tool`. Finally affect this new mlmask file to impacted components into their `poor_06` material at `localMaterialBuffer > materials > poor_06 > MultilayerMask`.

* `body_01`
* `door_fl_a`
* `door_fr_a`
* `door_bl_a`
* `door_br_a`

### Fixing the aluminium layer mask for wheels

As you can see the aluminium parts of wheels have some black artifacts. This is due to a messy layer mask. So you just need to repeat the same operation as above for the `_insert` mesh file of the wheels.

You need to fix the layer 7 of the mlmask. Then assign the new mlmask to the `coated` and `poor_01` materials of the `_inserts` mesh file.

{% hint style="info" %}
We only need to update these 2 materials for wheels because these are the only materials that are using the original mlmask of the game.
{% endhint %}

{% hint style="success" %}
You must update the `AppearanceVisualController` list when you create a new component or if you modify its name, mesh appearance or mesh file path.

[Refer to this paragraph](creating-a-new-customizable-component.md#update-the-appearancevisualcontroller) to do so.
{% endhint %}

Now test your mod and see that all plastic parts and wheels aluminium parts are clean !

<figure><img src="../../../../.gitbook/assets/photomode_25052024_145020 copie.png" alt=""><figcaption><p>Fixed plastic and aluminium parts</p></figcaption></figure>

> Awesome ! Now I want to create a secondary color !
