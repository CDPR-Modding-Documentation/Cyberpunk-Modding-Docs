# TweakDB Modding

To make a tweak mod in REDmod:

1. make a new mod and create a new folder here: `<Cyberpunk 2077>/mods/MODNAME/tweaks`
2. copy the `.tweak` file(s) you want to change from `<Cyberpunk 2077>/tools/redmod/tweaks` :exclamation: _preserving the folder structure_!
3. add a `info.json` file to `<Cyberpunk 2077>/mods/MODNAME/tweaks` with some mod info

```json
{
    "name": "MODNAME",
    "description": "Description for the tweak mod.",
    "version": "1.0.0",
    "customSounds":    [ ]
}
```

:white\_check\_mark: Done. To test, launch the game with REDmod.
