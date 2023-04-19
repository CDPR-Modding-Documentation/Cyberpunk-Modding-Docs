# Import

`import` - Import/reimport animset animation

## Synopsis

```md
Usage:
  redmod import -gameRoot=<depot> -inputPath=<file> -animset=<resource-path>  [options]

Arguments:
  -gameRoot=<depot>
  -inputPath=<file>
  -animset=<resource-path>

Options:
  -outputPath=<resource-path>
  -animationRename=<name>
  -h, --help 
```

## Description

The `import` command imports an `.re` animation file into an existing `.anims` animation set file.

Optional parameters include specifying an existing animation name to rename inside the animset file (otherwise the filename of the `.re` animation file is used) or specifying a different output path (default is overwrite).

> INFO - It is best to name `.re` animation correctly even if you replace an existing animation, because the imported animation will always have the filename of the `.re` file.

## Arguments

*   **`-gameRoot=<path>`**

    directory-path to the depot for animset and output (e.g. `C:\modding\depot`)

> INFO - this is the base depot from which relative \<resource-paths> are loaded

> INFO - You need to have the `.rig` file used by the `.anims` animationset present in your depot path.

*   **`-inputPath=<file>`**

    absolute path to the animation `.re` file
*   **`-animset=<resource-path>`**

    resource .animset file to use

> INFO - resource path must start with `base\` (e.g. `base\animations\npc\generic_characters\male_average\open_world\generic_male_average__stand__rh_cane_lh_cigar__01.anims`)

## Options

*   **`-outputPath=<resource-path>`**

    resource `.anims` file name to write, default is to overwrite the input animset (resource path must start with `base\`)
*   **`-animationRename=<name>`**

    parameter representing the old name of animation to be replaced by the new animation (default is the filename of the `.re` animation file)

> INFO - the imported animation will always have the filename of the `.re` file even if you specify the animationRename parameter.

*   **`-?|-h|--help`**

    Prints out a description of how to use the command.

## Examples

*   **`redmod import -gameRoot="E:\modding\depot" -input="E:\raw files\animtest1\macarena_long (1).re" -animset=base\animations\npc\generic_characters\male_average\open_world\generic_male_average__stand__rh_cane_lh_cigar__01.anims -output=base\out\new_test.anims -animationRename=stand__rh_cane_lh_cigar__01__smoke__02"`**

    Imports the animation file `E:\raw files\animtest1\macarena_long (1).re` into the animset file `E:\modding\depot\base\animations\npc\generic_characters\male_average\open_world\generic_male_average__stand__rh_cane_lh_cigar__01.anims` and replaces the animation with the name **stand\_\_rh\_cane\_lh\_cigar\_\_01\_\_smoke\_\_02** with the name **macarena\_long (1)**. The result is saved to to `E:\modding\depot\base\out\new_test.anims`.
