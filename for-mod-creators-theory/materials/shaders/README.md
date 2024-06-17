---
description: RED4 shaders (mt)
---

# Shaders

## What are shaders?

Every visual asset in REDengine uses a specific **shader**, designated by REDengine as MT (.mt) files. Even meshes "without a shader" are in-fact using a debug shader such as debug\_coloring.mt. Shaders are the most basic expression of a surface, ranging from glass, skin, concrete, and steel. Each shader contains a combination of constant hidden-variables, and exposed variables for artists to tweak. For example, all skin exhibits some similar properties such as subsurface scattering so there is no reason to expose this; artists cannot use the skin shader without subsurface scattering. However skin color can vary dramatically, so these parameters are exposed to the artists using textures or color parameters. Artists are able to create "instances" of shaders called [**Material Instances**](../../files-and-what-they-do/materials/re-using-materials-.mi.md)**,** which contain localized variations of the textures and properties exposed by the base shader.

{% hint style="info" %}
For an overview of the most common shaders and their use cases, see [cheat-sheet-materials.md](../../references-lists-and-overviews/cheat-sheet-materials.md "mention")
{% endhint %}

## What are materials?

Materials are a _specific_ instance of a [shader](./), to be used on a mesh or subset of meshes. Materials are contained inside **mi** (material instance) files or within mesh files themselves as a **CMaterialInstance** chunk. While internal material instance chunks can be handy to have inside the mesh, external mi files can be used for multiple meshes.\
\
It's important to remember that materials are simply instances of shaders. The variables contained within the material only take effect when those same variables are present inside the base shader. For example, if **RoughnessTexture** is not present within the base shader adding this property to a material instance will have absolutely no effect.

### The Daisy Chain

Meshes rarely use shaders directly, but instead rely on any number of [.mi files](../../files-and-what-they-do/materials/re-using-materials-.mi.md) (check the player's [skin materials](../../../for-mod-creators/references-lists-and-overviews/cheat-sheet-head/#skin-tones-by-index) for an example, or check [re-using-materials-.mi.md](../../files-and-what-they-do/materials/re-using-materials-.mi.md "mention") ->[#why-do-i-need-this](../../files-and-what-they-do/materials/re-using-materials-.mi.md#why-do-i-need-this "mention")).&#x20;

{% hint style="success" %}
If the [**baseMaterial** path](../../files-and-what-they-do/3d-objects-.mesh-files/#materialinstance-the-local-material) ends in .mi, you're looking at a daisy chain.
{% endhint %}

This approach lets you bundle [shared properties](../configuring-materials/). If you have 30 materials with 4 properties and 3 of them never change, then it's the perfect time for a [.mi file](../../files-and-what-they-do/materials/re-using-materials-.mi.md).

Daisy-chaining those together lets you define and refine templates. For example, every human has skin, and all skin has veins and blood vessels — but the player, your average Maelstrom gangoon and bog-standard vanilla NPCs are not using the same textures. And that is before skin colours come in.

<figure><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Daisy_chain.JPG/1200px-Daisy_chain.JPG" alt=""><figcaption><p>Daisy chaining (Image: Wikimedia commons). <br><strong>Caution</strong>: Cyclic dependencies <em>will</em> crash your game!</p></figcaption></figure>

### How does the daisy chain work?

Think of them as photoshop layers, applied in reverse order: the first one that's loaded is the shader itself with its default properties, then each .mi in the chain gets applied on top of that.&#x20;

Properties in the mesh will be applied last, and will thus overwrite anything from the chain.

{% hint style="info" %}
The closer to the mesh, the more override!
{% endhint %}

## Further reading

{% content-ref url="shader-docs.md" %}
[shader-docs.md](shader-docs.md)
{% endcontent-ref %}

{% content-ref url="../multilayered/" %}
[multilayered](../multilayered/)
{% endcontent-ref %}

{% content-ref url="../configuring-materials/" %}
[configuring-materials](../configuring-materials/)
{% endcontent-ref %}
