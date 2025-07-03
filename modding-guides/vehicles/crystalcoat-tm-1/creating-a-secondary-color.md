---
cover: ../../../.gitbook/assets/page12.jpg
coverY: 0
---

# Creating a secondary color

## How it works

The CrystalCoat feature allows to define a primary color that shall cover the painted areas of the vehicle and then a secondary color that goes on top of the primary color.

The idea of the secondary color is to create shapes, patterns or to cover only some parts of the vehicle. There are two approaches that you can combine as you wish in order to create a secondary color.

### Approach #1: color whole parts

The most simple way is to apply the secondary color on a complete mesh so the combination of multiple components will give a nice result. This can work especially with vehicles that use a [organic design](https://www.pinterest.com/pin/sketches-and-renderings--6755468183177791/) such as Rayfield vehicles.

If a component subset could make sense to use the secondary color then you can submesh it and apply this approach with it.

<figure><img src="../../../.gitbook/assets/image (466).png" alt="" width="375"><figcaption><p>Rayfield Caliburn</p></figcaption></figure>

On this picture, the silver front wings of the vehicle have been submeshed to they can be colored entirely without affecting the rest of the body part.

With conventional vehicles that consist in a box with 4 square doors, this approach won't give a nice result most of the time. Except for wheels.

### Approach #2: use a mask&#x20;

The approach that allows the most possibilities is to work with a UV layout.

<figure><img src="../../../.gitbook/assets/painted (1).png" alt="" width="375"><figcaption><p>UV layout for the painted areas of the Mahir Supron</p></figcaption></figure>

### What is a UV layout

When you want to apply a 2D resource onto a 3D model you need to project your mesh onto a plane. Think of it as a spotlight that projects the shadow of an object on the ground. Although this is not exactly what is happening.

The mesh is made of vertices so you simply decide where you want to place these vertices on the plane. The classic way to use this technic looks a bit like a spotlight projection as you can see on the picture above. It also makes it easier for a human to understand what is going on.

This type of projection is particularly useful if you want to apply 2D resources across multiple parts at once. In the case of CrystalCoat you may want to create oblique stripes across the body, roof and doors of the vehicle. You can do it easily with the Mahir Supron.

<figure><img src="../../../.gitbook/assets/painted1 (1).png" alt="" width="375"><figcaption><p>Example of secondary color pattern</p></figcaption></figure>

The red stripes on this picture would not necessarily be red but they represent shapes that you can create to define a secondary color pattern.

The easiest way to create such mask is to use a image editor like Adobe Photoshop to create shapes and to transform them (rotate, shear, scale, translate) onto the UV layout of the component.

Most of the time the components of a vehicle are sharing the same UV layout that is to say they are all sharing the UV space without overlapping each other. In this case they use the same mlmask file in their material definition.

You will notice that wheels are always using a dedicated UV layout so you won't be able to use the same InkWidget to apply a secondary color for both the painted areas of the vehicle and for its wheels.&#x20;

### What if the UV layout is different between parts

In the case your vehicle uses a different UV layout for each component it becomes more difficult to define shapes that will apply across multiple parts.

And moreover when the UV layout is different you always need to use a new InkWidget because your patterns are bound to a specific UV layout. The red stripes on the picture above make sense only for this unique UV layout. Any other one wouldn't suit.

### Another way to use the UV layout

There is a third way to create a secondary color pattern. It is the same idea as to create a mask but instead of editing a picture into a image editor you can create shapes directly into the InkWidget file. This is what is being done for the Rayfield vehicles in the base game.

The InkWidget file for the Rayfield Caliburn contains 16 shapes for the secondary color pattern.

This way of creating shapes is the most difficult because you can't even work with a UV layout to know what you are doing. You must try and test multiple times until the shapes are applying correctly on the vehicle. Also there is no benefit to use this approach.

I recommend you to work on a mask using a image editor.

## Create a clean UV layout

You could use the mlmask file from the game and extract the mask layer corresponding to the vehicle paint. But you will notice that masks from the base game are quite messy and even contain imperfections. Also if the paint layer is the layer 0 then you won't be able to use this technic.

In order to create a clean UV layout for your secondary color pattern, you should create your own mask using the mesh files. Export all the mesh files involved in the vehicle paint using the menu `Tools > Export Tool`.

In the case of the Mahir Supron I will export all the `_painted` files except the wheel one. Then I will also export the roof mesh file. Import them all into Blender and uncheck the `With Materials` option so the import will be faster.

{% hint style="warning" %}
You can only import mesh components that are sharing the same UV layout together. That is to say they use the same mlmask file. Otherwise they may overlap on one another.
{% endhint %}

Select all the meshes using the `A` key then press `TAB` to go into `Edit mode`. Finally select the `UV Editing` view in the menu bar.

<figure><img src="../../../.gitbook/assets/image (454).png" alt=""><figcaption><p>Generate the UV layout for the painted areas</p></figcaption></figure>

You can see on the left that your UV layout has been generated. Export it to PNG using the menu `UV > Export UV Layout`. Define the size to 1024x1024 and set the `Fill Opacity` to 1.00.

Open Adobe Photoshop or another image editor and create a new project with a image size of 1024x1024. Then fill it with black color by using the menu `Edit > Fill`. Import the PNG file you have just created with Blender. It should be imported into a new layer.

<figure><img src="../../../.gitbook/assets/image (455).png" alt=""><figcaption><p>Fill the UV layout with white</p></figcaption></figure>

Create a new style on the UV layout to fill it with white. Now you have created your mask for the painted areas of the vehicle.

## Define your secondary color pattern

The next part is to define your secondary color pattern by adding shapes on top of your mask using dynamic objects (like the Rectangle tool) or any other technic as long as they belong to a dedicated layer. I recommend that you use red shapes so you can see them better.

Before exporting the mask we will fill them with white.

<figure><img src="../../../.gitbook/assets/image (456).png" alt=""><figcaption><p>Adding shapes to your mask</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (464).png" alt=""><figcaption><p>Secondary color pattern</p></figcaption></figure>

You can also use any other tool to create shapes such as the **magic wand** to select color areas or other selection tools. You can even use external images, logos and even text. Once your pattern is ready create a style on it to fill it with white just like you did previously. Then hide all the other layers except the pattern so you have something like this.

{% hint style="info" %}
Although you can use any kind of shape to define a secondary color pattern like logos and text you should keep in mind that the InkWidget resolution on the vehicle is low so you won't have a lot of details.
{% endhint %}

<figure><img src="../../../.gitbook/assets/image (465).png" alt=""><figcaption><p>Export the secondary color pattern to PNG</p></figcaption></figure>

Finally export the image as PNG. Now it is time to export your `secondary_color.xbm` texture to PNG using the `Tools > Export Tool`. Erase the PNG export with your PNG mask using the same file name.

Then use the `Tools > Import Tool` with the following settings to import your mask back into the texture file.

<figure><img src="../../../.gitbook/assets/image (463).png" alt=""><figcaption><p>Texture import settings</p></figcaption></figure>

## Update the WorldWidgetComponents

From the beginning of this tutorial you are using the `vvc_full_primary_only.inkwidget` into all of your WorldWidgetComponents so you can only display a primary color on your components.

Now you have defined a secondary color pattern, you must use the `vvc_car_appearance_widget.inkwidget` for all components except for wheels. You need to update the `widgetResource` field of your WorldWidgetComponents using the relative path to this InkWidget.

### Apply the secondary color on wheels inserts

The `_painted` WorldWidgetComponents for wheels will still be using the `vvc_full_primary_only.inkwidget`.

We want to apply the secondary color on wheels inserts too. But as the wheels are using a dedicated mlmask (UV layout) we would need to duplicate the InkWidget file, and also the `secondary_color.xbm` and the `secondary_color.inkatlas` files.

Then update their relative path into the new dedicated InkWidget and finally create a mask for the wheels using a image editor.

We can obtain the same result by simply using the `vvc_full_primary_and_secondary.inkwidget` on the `_inserts` WorldWidgetComponents of the wheels.

* `visual_customization_wheel_01_fl_a_inserts_custom`
* `visual_customization_wheel_01_fr_a_inserts_custom`
* `visual_customization_wheel_01_bl_a_inserts_custom`
* `visual_customization_wheel_01_br_a_inserts_custom`

## Configure the color picker widget

At the beginning of this tutorial we have removed the ability for the user to select a secondary color. Now we are going to restore this feature.

### Update the script

Remove the code you have added [in this paragraph](customizing-the-color-picker-widget.md#prevent-gamepads-from-triggering-the-inner-circle) of the tutorial.

### Update the color picker widget

Right-click on the `vehicle_visual_customization.inkwidget` and export it into JSON. Then [perform these replacements](customizing-the-color-picker-widget.md#hide-the-inner-circle-for-secondary-color) in the opposite way to restore the inner circle of the widget. Finally import the JSON file back into InkWidget.

Now let's test the mod again.

{% hint style="success" %}
For a component to use the secondary color you must set its appearance to either `Coated`or `Painted`in the mod settings. Concerning wheels parts you need to set their appearances to either`Metallic`or `Glossy`in the mod settings.
{% endhint %}

<figure><img src="../../../.gitbook/assets/Cyberpunk 2077 Screenshot 2024.05.28 - 02.13.35.37.png" alt=""><figcaption><p>CrystalCoat using a secondary color</p></figcaption></figure>

> Wait ! I don't see the secondary color pattern on the color picker !

## Adding a mask to the color picker widget

Remember that the texture `vehicle_visual_customization_car_preview.xbm` that contains the vehicle model into the color picker widget has a part dedicated to the secondary color.

All you have to do is to [follow this paragraph](customizing-the-color-picker-widget.md#changing-the-vehicle-model-part) to modify the secondary color mask instead of the vehicle model. The secondary color mask should be a selection of the original model. The following picture is the mask I have created. Visible parts of the model will use the secondary color if it is defined.

<figure><img src="../../../.gitbook/assets/color_mask (1).png" alt="" width="375"><figcaption><p>Secondary color mask</p></figcaption></figure>

The most accurate way to create the mask is to duplicate the section that contains the vehicle model. Then keep only the areas that should be affected by the secondary color.

{% hint style="warning" %}
Your image should not be larger than 1200 pixels or the InkWidget won't display the texture parts correctly.
{% endhint %}

Concerning the secondary color pattern I have choosen for the Mahir Supron, it cannot be easily seen on the color picker. This will depend on your choices.

<figure><img src="../../../.gitbook/assets/Cyberpunk 2077 Screenshot 2024.05.28 - 16.05.50.72.png" alt=""><figcaption><p>Color picker widget using a secondary color</p></figcaption></figure>

> I have added a lot of customizable parts in the mod settings how can I make it more user-friendly ?
