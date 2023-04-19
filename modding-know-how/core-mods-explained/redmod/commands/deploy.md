# Deploy

`deploy` - Deploys mods to the game by compiling them together

## Synopsis

```md
Usage:
  redmod deploy -root=<path> [options]

Arguments:
  -root=<path>

Options:
  -mod=<name>
  -h, --help 
```

## Description

The `deploy` command stages installed mods to work when the game starts with the `modded` flag.

* archives from `<Cyberpunk 2077>/mods/<name>` are staged to load
* scripts in `<Cyberpunk 2077>/mods/<name>/scripts` are compiled into a modded script blob
* tweak files in `<Cyberpunk 2077>/mods/<name>/tweaks` are compiled into a modded tweakDB blob
* sound files in `<Cyberpunk 2077>/mods/<name>/customSounds` are staged to load

You can specify a specific load order with the **-mod** parameter

## Arguments

*   **`-root=<path>`**

    the game root folder for which the deploy command is run.

> INFO - this needs to be `<Cyberpunk 2077>`

## Options

*   **`-mod=<modA dirname> [<modB dirname> ...]`**

    stage only the mods in the given **directory** names (without the leading `mods\),` in left to right load order precedence. You must escape any spaces by enclosing the argument in double quotes (for example `Mod With Space` should be given as `-mod="Mod With Space"`.)
*   **`-?|-h|--help`**

    Prints out a description of how to use the command.

## Examples

*   **`redmod deploy -root="C:\Gog\Cyberpunk 2077"`**

    Stages all installed mods under `C:\Gog\Cyberpunk 2077\mods` for loading
*   **`redmod deploy -root="C:\Gog\Cyberpunk 2077" -mod=modB modA modC`**

    Stages only the three mods `C:\Gog\Cyberpunk 2077\mods\modA\`, `C:\Gog\Cyberpunk 2077\mods\modB\` and `C:\Gog\Cyberpunk 2077\mods\modC\` for loading. In this case, `modB` will override both `modA` and `mod`C, and `modA` will override `modC` (in case any of them modify the same asset paths.)
