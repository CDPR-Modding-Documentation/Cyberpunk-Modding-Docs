# Shader Docs

## Understanding and leveraging RED4 shaders

We do not have official documentation from CDPR about how shaders are used by artists. Thus any 2d/3d artist is looking at hundreds of black-box shaders with unknown usage. This is extremely demotivating for anyone looking to bring new assets to life with REDengine. The following list of tables is an attempt to make life easier for artists by using the community to document commonly used shaders.

## About the documentation

* The name and path of each shader will be documented by the header.
* Next we are using a table for each texture parameter with the _exact name_ listed by CDPR in the w2mg file, how REDengine uses each specific RGBA channel, and the usable range of the channel if not 0-1/0-255.
* When applicable, vertex color properties will be listed underneath the texture table with a similar format.
* Scalar, vector, color, and other properties will follow with their own unique description table.
* An asterisk (\*) is used to notate some degree of uncertainty, or need for more independent testing.

## Shaders

### `skin`

```
base/materials/skin.mt
```

| Texture            |       Red       |      Green      |            Blue            | Alpha |
| ------------------ | :-------------: | :-------------: | :------------------------: | :---: |
| Albedo             |      Color      |      Color      |            Color           |   ?   |
| SecondaryAlbedo    |        ?        |        ?        |              ?             |   ?   |
| Normal             |      Normal     |      Normal     |            None            |   ?   |
| DetailNormal       | Additive Normal | Additive Normal |            None            |   ?   |
| Roughness          |    Roughness    |       None      | MicroDetail mask (0.5-1)\* |   ?   |
| MicroDetail        | Additive Normal | Additive Normal |            None            |   ?   |
| TintColorMask      |        ?        |        ?        |              ?             |   ?   |
| Detailmap\_Stretch | Additive Normal | Additive Normal |            None            |   ?   |
| Detailmap\_Squash  | Additive Normal | Additive Normal |            None            |   ?   |
| EmmisiveMask       |        ?        |        ?        |              ?             |   ?   |
| Bloodflow          |        ?        |        ?        |              ?             |   ?   |

| Vertex Colors |          Description          |
| ------------- | :---------------------------: |
| Red           |      Ambient Occlusion\*      |
| Green         |   Subsurface Scattering Mask  |
| Blue          | Improved Facial Lighting Mask |

| Properties                        |               Description              |
| --------------------------------- | :------------------------------------: |
| SecondaryAlbedoInfluence          |                    ?                   |
| SecondaryAlbedoTintColorInfluence |                    ?                   |
| DetailRoughnessBiasMin/Max        |                    ?                   |
| MicroDetailUVScale01/02           |                    ?                   |
| MicroDetailInfluence              |  Controls MicroDetail normal intensity |
| TintColor                         |                    ?                   |
| TintScale                         |                    ?                   |
| SkinProfile                       |                    ?                   |
| EmissiveEV                        |                    ?                   |
| CavityIntensity                   |                    ?                   |
| BloodColor                        |                    ?                   |
| DetailNormalInfluence             | Controls DetailNormal normal intensity |

#### Notes

* The DetailNormal texture contains generic normal details that are shared between most faces. This is _not_ a tiling/procedural texture. The DetailNormalInfluence scalar parameter can be used to lower the intensity to simulate makeup or synthetic skin.\

* The MicroDetail texture contains a microblend tiling texture used to add procedural detail to the normal map. We believe the Roughness texture blue channel is used to mask parts of the face from exhibiting this detail, such as the lips, eyelids, and ears.

### `mesh_decal`

```
base/materials/mesh_decal.mt
```

| Texture                  |     Red     |    Green    |     Blue    |     Alpha    |
| ------------------------ | :---------: | :---------: | :---------: | :----------: |
| DiffuseTexture           |    Color    |    Color    |    Color    | Opacity Mask |
| SecondaryMask            |      ?      |      ?      |      ?      |       ?      |
| NormalTexture            |    Normal   |    Normal   |     None    |       ?      |
| NormalAlphaTex           |      ?      |      ?      |      ?      |       ?      |
| NormalsBlendingModeAlpha |      ?      |      ?      |      ?      |       ?      |
| RoughnessTexture         | Roughness\* | Roughness\* | Roughness\* |       ?      |
| MetalnessTexture         | Metalness\* | Metalness\* | Metalness\* |       ?      |

| Properties               |    Description   |
| ------------------------ | :--------------: |
| VertexOffsetFactor       |         ?        |
| DiffuseColor             | Procedural Color |
| DiffuseAlpha             |       Alpha      |
| UVOffsetX/Y              |         ?        |
| UVRotation               |         ?        |
| UVScaleX/Y               |         ?        |
| SecondaryMaskUVScale     |         ?        |
| SecondaryMaskUVInfluence |         ?        |
| NormalAlpha              |         ?        |
| UseNormalAlphaTex        |         ?        |
| NormalsBlendingMode      |         ?        |
| RoughnessScale           |         ?        |
| RoughnessBias            |         ?        |
| MetalnessScale           |         ?        |
| MetalnessBias            |         ?        |
| AlphaMaskContrast        |         ?        |
| RoughnessMetalnessAlpha  |         ?        |
| AnimationSpeed           |         ?        |
| AnimationFramesWidth     |         ?        |
| AnimationFramesHeight    |         ?        |
| DepthThreshold           |         ?        |

#### Notes

* DiffuseColor multiplies against the texture color to add procedural color

