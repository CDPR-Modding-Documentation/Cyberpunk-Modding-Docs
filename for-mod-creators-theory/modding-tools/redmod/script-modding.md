# Script Modding

To make a script mod in REDmod:

1. make a new mod and create a new folder here: `<Cyberpunk 2077>/mods/MODNAME/scripts`
2. copy the `.script` file(s) you want to change from `<Cyberpunk 2077>/tools/redmod/scripts`:exclamation: _preserving the folder structure!_
3. add an `info.json` file to `<Cyberpunk 2077>/mods/MODNAME/scripts` with some mod info

```json
{
    "name": "MODNAME",
    "description": "Description for the script mod.",
    "version": "1.0.0",
    "customSounds":    [ ]
}
```

:white\_check\_mark: Done. To test, launch the game with REDmod.
