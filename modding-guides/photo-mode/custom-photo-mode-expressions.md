# Custom Photo Mode Expressions

(Thanks to glory-ride for showing me how to do this <3)   This tutorial will teach you how to create your own photo mode expression mod by making your selection from an NPC's.

### Contents

* [1 Step 1: Locate the right file](broken-reference)
* [2 Step 2: Replace the file with the one you want](broken-reference)
* [3 Step 3: Pick the expressions you want](broken-reference)
* [4 References](broken-reference)

### Step 1: Locate the right file

| female | <pre><code>base\animations\ui\photomode\photomode_female_facial.anims</code></pre> |
| ------ | ---------------------------------------------------------------------------------- |
| male   | <pre><code>base\animations\ui\photomode\photomode_male_facial.anims</code></pre>   |

### Step 2: Replace the file with the one you want

NPC animation files live under

```
base\animations\facial\
```

and end in **.anims**. You can pick **any of them**, regardless of gender.

Replace the player file with the one you've selected.

Example:

Copy base\animations\facial\main\_characters\rogue\rogue\_facial\_idle\_poses.anims to base\animations\ui\photomode\photomode\_female\_facial.anims

### Step 3: Pick the expressions you want

You can select a total of 12 expressions from the NPC's anim file. You do this by changing their names to the ones the photo mode will look for (in scroll order):

1. facial\_neutral
2. facial\_charming
3. facial\_furious
4. facial\_bored
5. facial\_pissed
6. facial\_pleased
7. facial\_disgusted
8. facial\_happy
9. facial\_scared
10. facial\_surprised
11. facial\_sadness
12. facial\_whistling

Do this by opening the file (photomode\_female\_facial.anims or photomode\_male\_facial.anims that you replaced with the NPC of your choice) in WolvenKit (or 010 if you know how to use it). Find the animation you want to use\* and change its name.

<figure><img src="https://i.imgur.com/KYevLPa.png" alt=""><figcaption></figcaption></figure>

Rinse and repeat until you're done.

Save the file, pack the project, and start the game - voila, you now have custom expressions.

_\* As for which expressions you want to use, you'll have to try them one by one. The reference section contains pictures that I made for myself, feel free to add to them!_

### References

[photomode\_johnny\_facial](https://i.imgur.com/nLWZQJH.jpg)

[johnny\_\_facial\_idle\_poses](https://i.imgur.com/JW2ZW2r.jpg)

[rogue\_facial\_idle\_poses](https://i.imgur.com/7apn9yx.jpg)

[evelyn\_facial\_idle\_poses](https://i.imgur.com/HPd71Bb.jpg)

[generic\_average\_female\_facial\_idle\_poses](https://i.imgur.com/ZxwSOxy.jpg)

[panam\_facial\_idle\_poses](https://i.imgur.com/DuKRBYe.jpg)
