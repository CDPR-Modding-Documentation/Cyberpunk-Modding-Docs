---
description: How to make sure your vertex count stays below the threshold
---

# Reducing vertex counts

## Summary

Published: Dec 20, 2024 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented edit: Aug 8, 2025 by lLorion

This page will show you how to reduce vertex counts in Blender, so that you can import your mesh into Cyberpunk.&#x20;

### Wait, this is not what I want!

* Check [troubleshooting-your-mesh-edits.md](../troubleshooting-your-mesh-edits.md "mention") for more generic help
* Check [wkit-blender-plugin-troubleshooting.md](../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-troubleshooting.md "mention") for plugin-specific errors

### Prerequisites

You should be using the [wolvenkit-blender-io-suite](../../modding-tools/wolvenkit-blender-io-suite/ "mention") for import/export from Blender.

***

One way you can reduce the vertex count on your mesh is by using the **Decimate** modifier in Blender.

## **Applying the Decimate modifier to your mesh**

First, you'll want to select the mesh/submesh you want to lower the vertex count on. You will know it is your active selection if it is highlighted in yellow, and not orange.

Next, at the bottom right, click on the blue wrench icon to go to where you add modifiers.

<figure><img src="../../../.gitbook/assets/Screenshot 2025-08-08 145825 (1).png" alt=""><figcaption></figcaption></figure>

Click 'Add Modifier'&#x20;

You can find the Decimate modifier here:&#x20;

<figure><img src="../../../.gitbook/assets/Screenshot 2025-08-08 150732.png" alt=""><figcaption></figcaption></figure>

Once it is added, you can lower your vertex count by dragging down the ratio slider. Check 'Triangulate' as well. Some meshes use what are called "quads", which aren't compatible with most games.

<figure><img src="../../../.gitbook/assets/Screenshot 2025-08-08 151011.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
However, before you do this, it's a good idea to actually see what you're doing, so I recommend enabling the statistics overlay to see the live vertex count on your selected mesh.



<img src="../../../.gitbook/assets/Screenshot 2025-08-08 151230.png" alt="" data-size="original">

\
It will appear to the left, beside your toolbar

<img src="../../../.gitbook/assets/Screenshot 2025-08-08 151544.png" alt="" data-size="original">
{% endhint %}

Now, drag down the ratio slider till you are happy with the result.

{% hint style="warning" %}
Each mesh and/or submesh must be under 65,000 vertices to be exported to Wolvenkit
{% endhint %}

Once you are done, apply the modifier:&#x20;

<figure><img src="../../../.gitbook/assets/Screenshot 2025-08-08 152626.png" alt=""><figcaption></figcaption></figure>

All done :)

*
