# ArchiveXL: Resource copies

## Summary

**Published:** October 22 2026 by [brutal.buzzler](https://app.gitbook.com/u/hOuZa48d8AaGXte3BJLAUgRWKaw2 "mention")\
**Last documented update:**

Besides creating symlinks of a resource, ArchiveXL can also create in-memory copies of resources. This seems similar at first glance, but it serves very different purposes.

## Why do I need this?

In general copy is useful if you want to create an independant clone of a resource, either to preserve the state of one of the resources or because you want to perform any other runtime changes to one of the resources, but not the other.

The specific use case copy was made for is for patching the blob of mesh/morphtarget resources. While other parts of mesh/morphtarget resources can be patched at any time, the blob - the part that contains the actual 3D model - can only be used as patch source or target before it is used for the first time. When the game renders a blob, it moves its data to a different location in memory. Afterwards the mesh/morphtarget resources won't have a accessible blob anymore.

To be even more specific the use case is the ability to create CCXL eye shadows that are compatible with custom head morphs, but the concept applies to more than that.

{% hint style="danger" %}
If none of the above seems to apply to your current needs, then it probably doesn't. If you want to create unchanged copies of resources, you should always prefer resource linking. Unless you have a specific reason to use it, copy is just a waste of system resources.
{% endhint %}

## How do I use this?

In your `.xl` file you declare a resource copy node. You can specify one or multiple source files and each source can be copied to one or multiple targets.&#x20;

```yaml
resource:
  copy:
    <source_file_path_1>:
      - <target_file_path_1>
      - <target_file_path_2>
    <source_file_path_2>:
      - <target_file_path_3>
```

{% hint style="danger" %}
As noted before this section alone is not useful on its own! Only creating a copy without further steps serves no purpose that link does not serve better.
{% endhint %}

### Example: Eye Shadow

```yaml
customizations:
  female: manavortex\ccxl\eye_make_up\e3\inkcc\ccxl_e3_pwa.inkcharcustomization
resource:
  copy:
    base\characters\head\player_base_heads\player_female_average\hx_000_pwa__morphs_makeup_eyes_01.morphtarget:
      - manavortex\ccxl\eye_make_up\e3\hx_000_pwa__morphs_makeup_eyes_01_e3__copy.morphtarget
    base\characters\head\player_base_heads\player_female_average\h0_000_pwa_c__basehead\hx_000_pwa_c__basehead_makeup_eyes_01.mesh:
      - manavortex\ccxl\eye_make_up\e3\hx_000_pwa_c__basehead_makeup_eyes_01_e3__copy.mesh
  patch:
    manavortex\ccxl\eye_make_up\e3\hx_000_pwa__morphs_makeup_eyes_01_e3__copy.morphtarget:
      props: [ blob, boundingBox, targets ]
      targets:
        - manavortex\ccxl\eye_make_up\e3\hx_000_pwa__morphs_makeup_eyes_01_e3.morphtarget
    manavortex\ccxl\eye_make_up\e3\hx_000_pwa_c__basehead_makeup_eyes_01_e3__copy.mesh:
      props: renderResourceBlob
      targets:
        - manavortex\ccxl\eye_make_up\e3\hx_000_pwa_c__basehead_makeup_eyes_01_e3.mesh
```

Note how the `copy` node specifies copies of one of the game's mesh/morphtarget resources for makeup. If a user has installed modded head morphs and the mesh/morphtarget of the new makeup would use the vanilla shape, they would not match up.\
\
The solution is to keep the blobs of the new makeup resources empty and patch the blob data of one the installed makeup resources into them.

In the `patch` node, the copies are being used as sources for the mod's own mesh/morphtarget files. This applies the - potentially modded - head morphs to the mod's files and ensures the new eye shadow has the same shape as the actual head morphs used by game, no matter if they're vanilla or modded.

To make sure this point is entirely driven home: the trick to patch the game's eyeshadow morphs into the mod's morphs only works if they're patched from a copy of the game's morphs, because the originals will only be available until the game uses them for rendering the first time.

## Further modding

* To learn how complete CCXL mods work, especially the character customization part, refer to the [archivexl-character-creator-additions](archivexl-character-creator-additions/ "mention") section.
* The example is an excerpt from [CCXL - E3 - eyeshadow](https://www.nexusmods.com/cyberpunk2077/mods/11315) by manavortex. If you're making an eye shadow you can use it as a template.
