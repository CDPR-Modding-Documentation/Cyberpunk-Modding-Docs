---
description: RED4 shaders (mt)
---

# Shaders

## What are shaders?

Every visual asset in REDengine uses a specific shader, designated by REDengine as MT (.mt) files. Even meshes "without a shader" are in-fact using a debug shader such as debug\_coloring.mt. Shaders are the most basic expression of a surface, ranging from glass, skin, concrete, and steel. Each shader contains a combination of constant hidden-variables, and exposed variables for artists to tweak. For example, all skin exhibits some similar properties such as subsurface scattering so there is no reason to expose this; artists cannot use the skin shader without subsurface scattering. However skin color can vary dramatically, so these parameters are exposed to the artists using textures or color parameters. Artists are able to create "instances" of shaders called [**Material Instances**](broken-reference) which contain localized variations of the textures and properties exposed by the base shader.



## What are materials?

Materials are a _specific_ instance of a [shader](./) file, to be used on a mesh or subset of meshes. Materials are contained inside **mi** (material instance) files or within mesh files themselves as a **CMaterialInstance** chunk. While internal material instance chunks can be handy to have inside the mesh, external mi files can be used for multiple meshes.\
\
It's important to remember that materials are simply instances of shaders. The variables contained within the material only take effect when those same variables are present inside the base shader. For example, if **RoughnessTexture** is not present within the base shader adding this property to a material instance will have absolutely no effect.

### The Daisy Chain

The mechanism behind the link between shaders and meshes can be thought of as a daisy chain. Meshes do not directly link shaders, but instead rely on a variable number of daisy chained materials. Some meshes may use a single internal material instance, which specifies a base shader.

The other approach which is just as, or perhaps more common is chaining several mi files together. The benefit of doing so, is the ability to globally adjust materials for hundreds or thousands of meshes. When chaining multiple materials together, the properties of each material overwrite those that are below.

{% content-ref url="shader-docs.md" %}
[shader-docs.md](shader-docs.md)
{% endcontent-ref %}

{% content-ref url="../../materials/multilayered.md" %}
[multilayered.md](../../materials/multilayered.md)
{% endcontent-ref %}
