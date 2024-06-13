---
description: Using REDmod to export .mesh and .w2mesh files to .fbx format
---

# Exporting .mesh/.w2mesh

Optional Parameters for meshes

```
-lod=<uint>           - Defines mesh's lod to be exported
-mesh-skinning=<bool> - export skinning (armature data) default is false
```

Example Command:

{% code overflow="wrap" %}
```
redmod resource-export -depot="M:\" -input="base\test\example.mesh" -output="M:\base\test\example.fbx" -lod=1 -mesh-skinning=true
```
{% endcode %}

{% hint style="info" %}
You can also export to .fbx with REDmod through the Wolvenkit GUI!
{% endhint %}
