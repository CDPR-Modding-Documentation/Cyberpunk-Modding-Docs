---
description: Instanced shaders (mi/mesh material chunks)
---

# Materials

## What is a material?

Materials are a _specific_ instance of a [shader](./) file, to be used on a mesh or subset of meshes. Materials are contained inside **mi** (material instance) files or within mesh files themselves as a **CMaterialInstance** chunk. While internal material instance chunks can be handy to have inside the mesh, external mi files can be used for multiple meshes.\
\
It's important to remember that materials are simply instances of shaders. The variables contained within the material only take effect when those same variables are present inside the base shader. For example, if **RoughnessTexture** is not present within the base shader adding this property to a material instance will have absolutely no effect.

### The Daisy Chain

The mechanism behind the link between shaders and meshes can be thought of as a daisy chain. Meshes do not directly link shaders, but instead rely on a variable number of daisy chained materials. Some meshes may use a single internal material instance, which specifies a base shader.

The other approach which is just as, or perhaps more common is chaining several mi files together. The benefit of doing so, is the ability to globally adjust materials for hundreds or thousands of meshes. When chaining multiple materials together, the properties of each material overwrite those that are below.
