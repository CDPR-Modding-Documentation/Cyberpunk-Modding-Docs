---
description: >-
  The proxy mesh can be created once the vehicle is complete or close to
  complete.
---

# Make the Proxymesh

There are many ways of converting a high-res model to a low-res model, but for this guide the “**Remesh**” modifier in **Blender** will be used.&#x20;

Set all the parts visible and positioned correctly relative to the body in **Blender**. In my case I also added the wheel shadow meshes, as the rim holes caused issues with remeshing details. Join all the objects into one and select the object. \
Example:

<figure><img src="../../../../.gitbook/assets/image162.png" alt=""><figcaption></figcaption></figure>

The **Remesh Modifier** is available in the properties menu, under modifier properties: It

<figure><img src="../../../../.gitbook/assets/image141.png" alt=""><figcaption></figcaption></figure>

It is recommended to save before adding or changing settings in the modifier, as unintended settings can crash **blender** fairly easily. Here are the settings to adjust in **Remesh**:

<figure><img src="../../../../.gitbook/assets/image140.png" alt=""><figcaption></figcaption></figure>

Try to create a final proxy mesh with a low amount of faces/triangles. The face current face count visible in **blender** can be seen in the top left of the viewer. \
Example:&#x20;

<figure><img src="../../../../.gitbook/assets/image45.png" alt=""><figcaption></figcaption></figure>

Most use less than 2 thousand faces for a proxy mesh. You’ll also need to update the **blender** model to be correctly position, as the `.rig` will modify it. Translate your model with the reverse values used to translate the initial proxy mesh.

Once the mesh is ready, a texture is needed. I recommend this guide for texture painting:

{% embed url="https://www.youtube.com/watch?v=WjS_zNQNVlw" %}

Once the texture is ready, you can export it from **Blender** under `Image > Save As.. >`

<figure><img src="../../../../.gitbook/assets/image43.png" alt=""><figcaption></figcaption></figure>

Save it as a `.png`, and then import it into the project as an `.xbm`&#x20;

In the `proxy.mesh`, update the texture path:&#x20;

* `.mesh > RDTDataViewModel > preloadLocalMaterialInstances > 0 values > baseColor`
