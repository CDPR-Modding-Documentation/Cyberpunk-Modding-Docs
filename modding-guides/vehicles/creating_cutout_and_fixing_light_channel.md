# Fix Improper Interior Bounds

Author: spirit

## The problem this guide is solving

Since making a custom car involves changing the size, shape and location of the interior you will need to adjust these parts to fit your new vehicle to avoid issues like these:

![](https://github.com/user-attachments/assets/266dd527-4fe8-4fc5-90f5-6edea1a5f9cf)

The interior and exterior bounds are controlled in two places:

1. Cutout mesh in the `.app` file
2. Lightchannel component in the `.ent` file

{% hint style="info" %}
An alternative approoach can be found in [Interior Lights](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/vehicles/interior-lights).
{% endhint %}

## Tools you will need

* [Blender 4.2](https://www.blender.org/download/releases/4-2/)
* [Cyberpunk Blender Addon 1.6.0](https://github.com/WolvenKit/Cyberpunk-Blender-add-on)
* [Wolvenkit 8.15.1 nightly](https://github.com/WolvenKit/WolvenKit)
* Text Editor (preferrably with json highlighting)

Note that the version stated isn't necessarily the lowest required but the one that it's tested on.

## Making the Cutout Mesh

First you want to duplicate all your exterior meshes, making sure that they are correctly positioned with the adjusted body position of your car. Now you need to join them into one mesh, and scale that to be slightly smaller e.g. `0.99` making sure that you cannot see the scaled mesh clipping through the interior or exterior pieces. It's also important that your mesh has an underbody.

{% hint style="info" %}
Joining meshes in blender is done via \`Ctrl J\` while having multiple meshes selected and the cursor in the viewport.
{% endhint %}

At this point your project should look something like this, with everything being one mesh, without the interior:

<figure><img src="https://github.com/user-attachments/assets/ce96ee9c-dad9-4bd9-866b-8216cf365629" alt=""><figcaption></figcaption></figure>

Now you need to remove the parts that don't have an interior e.g. in this case the engine bay and mirrors. For this you will need to select the lasso selection tool (they can be cycled through using `W` by default). Enter edit mode by pressing `Tab`, turn on Xray mode (in the top right corner)

![](https://github.com/user-attachments/assets/04527ed6-46dc-4f44-ab22-b355f99b35cd)

Then select and delete the area by pressing `X > Verticies`

Your selection could look similar to this.&#x20;

<figure><img src="https://github.com/user-attachments/assets/e69a2307-6a40-4068-800c-38fea35b26e9" alt=""><figcaption></figcaption></figure>

With all the unnecessary pieces removed it will look similar to this:&#x20;

<figure><img src="https://github.com/user-attachments/assets/2367f498-4556-4308-aa22-cf9e39d2c458" alt=""><figcaption></figcaption></figure>

Now it's time to apply the remesh modifier to simplify the mesh.&#x20;

<figure><img src="https://github.com/user-attachments/assets/730dfc1d-1f26-44bb-8087-865c72228aa5" alt=""><figcaption></figcaption></figure>

You need to select smooth and play around with the `Octree Depth` while making sure there is only minimal clipping with the interior and exterior.

The result should be similar to this:&#x20;

<figure><img src="https://github.com/user-attachments/assets/ead2d072-212e-44d8-b3e8-e9005591b005" alt=""><figcaption></figcaption></figure>

Apply the modifier

![](https://github.com/user-attachments/assets/bbd2d081-dc96-4343-9012-89bd3f0c7935)

and add the decimate modifier under `Add Modifier > Generate > Decimate`

There you move the `Ratio` modifier way down until you are in the low hundreds of vertices instead of thousands, also make sure that you enable `Trianglulate`. Now apply the modifier and adjust the vertices so there is no clipping apart from on the interior of the windows.

{% hint style="info" %}
To enable statistics and face orientation see the image below
{% endhint %}

![](https://github.com/user-attachments/assets/f78d069d-e773-421f-b711-7f86a72fa3da)

Your mesh should be blue on the exterior and red on the interior when the face orientation is being displayed. If some triagnles are not, you can select and flip them with `Alt F > Flip`

At this point your mesh will look like this:&#x20;

<figure><img src="https://github.com/user-attachments/assets/0e7b9201-e082-48a5-a6cc-d68a7a8fce18" alt=""><figcaption></figcaption></figure>

## Exporting the Mesh

You can export this mesh like you would any other car part (as a static prop).

Before switching to Wolvenkit you need to generate a json file with the verticies and indices (triangles) of the mesh as the lightchannel component doesn't link to a mesh file. For that you need to switch to the `Scripting` layout at the top and run [this script](https://gist.github.com/misterchedda/aa730fab5bc0aa0f1bd905f617c84e6d) (the same script the other guide uses).

## Importing the Mesh

After importing the mesh into Wolvenkit you need to convert both the `.app` and the `.ent` file into json format. This is done by right clicking and selecting `Convert to Json`. They will now be in the `raw` folder of the project. Open the `.app.json` with a text editor that supports search and replace and search for the base cutout mesh by typing in e.g. `cutout`.

{% hint style="info" %}
In most applications \`Ctrl F\` is the shortcut for searching.
{% endhint %}

Once you have found an instance of the entire path you need to replace all of them with the path to the newly created cutout mesh while making sure to escape `\` properly by doubling them.

For example: Replace `base\\vehicles\\standard\\v_standard2_villefort_cortes\\entities\\meshes\\cortes_fx_cutout.mesh` with `spirit\\bentley_cont_gts\\meshes\\interior\\cutout.mesh`

Save the json and convert it back into the `.app` file format.

In the `.ent.json` you want to search for `lightchannel` and find the one that lists vertices and indices. These you will need to copy from the json file we generated earlier while making sure to keep the syntax of the original file (e.g. keeping the commas in the same places etc.)

{% hint style="info" %}
If you are using a text editor that doesn't support json highlighting you can run the json file through an online validator to ensure that it is correctly formatted.
{% endhint %}

Save and convert this file back to the `.ent` file format.

Now you can install and test the changes.
