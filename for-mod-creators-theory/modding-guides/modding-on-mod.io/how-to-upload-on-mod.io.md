---
description: How to pack your mods so that they work on consoles
---

# How to upload on mod.io

## Summary

Created: 20 Oct 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
Last documented update: 20 Oct 2026 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page tells you **how** to upload on mod.io, how to pack your mods for upload, and how to test them.

### Wait, this is not what I want!

* For a list of permitted content and supported features, check [what-can-i-upload-on-mod.io.md](what-can-i-upload-on-mod.io.md "mention")
* If you don't know why you should do this, check [#why-should-i-upload-to-mod.io](./#why-should-i-upload-to-mod.io "mention")

## Packing your mod

{% hint style="info" %}
This will eventually be supported by Wolvenkit. As of October 24, it is not.
{% endhint %}

{% hint style="warning" %}
If your mod contains **scripts**, you need to **compile them** before upload - expand the box!
{% endhint %}

<details>

<summary>Script mods</summary>

If your mod is a script mod, you need to **compile** the script with redmod.exe:

```
Verify mod scripts
        validate-mod-scripts -root <game root path> [-compile] -directory <mod directory>
        PARAMS
                -directory <mod directory>  Directory of target mod files.
                -root                       Game root path.
                -compile                    If this parameter is added, the command will compile mod scripts at the same time.
        EXAMPLE
                validate-mod-scripts -directory "C:/temp/my_mod_folder2"
                validate-mod-scripts -root "C:/temp/my_game_folder" -compile -directory "C:/temp/my_mod_folder2"
```

</details>

To upload a mod on mod.io, you should stick to the following file structure:

```
- your_subfolder_name
  - your_mod.archive
- scripts
  - your_mod.redscripts
  - your_mod.redscripts.h64
- tweaks
  - your_mod_tweak.json
```

## Testing your mod

You can test your mod locally by extracting the archive from [#packing-your-mod](how-to-upload-on-mod.io.md#packing-your-mod "mention") into the following directory:

```
Cyberpunk 2077\r6\c77
```

The result should look like&#x20;

```
Cyberpunk 2077
  - r6
    - c77
      - your_subfolder
        - your_mod.archive
      - scripts
        - your_mod.redscripts
        - your_mod.redscripts.h64
      - tweaks
        - your_mod_tweak.json
```

## Uploading your mod

You can find a detailed step-by-step guide of the upload process on [mod.io](./).

