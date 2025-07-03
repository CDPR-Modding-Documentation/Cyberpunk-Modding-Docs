# How to convert a CCXL hair color into a replacer

#### Considerations <a href="#docs-internal-guid-8b6cf978-7fff-696b-e1a9-939d427d40be" id="docs-internal-guid-8b6cf978-7fff-696b-e1a9-939d427d40be"></a>

The great thing about CCXL hair colors is that you can create your own cap colors. If you want to convert them to a replacer, then you’ll want to consider the cap color of the vanilla hair color. Replacers will impact anything using that hair profile, I’d recommend staying away from brown\_liquorice and black\_carbon since they're most commonly used for eyebrows and eyelashes.

You also can only have one replacer installed at a time per vanilla hair color.

#### Reference - Color Names

To make it easy to set up the folder structure for a replacer, you can search for the vanilla hair profile, add it to your project, and then just rename and overwrite the mod file. Here’s a list of all the vanilla .hp profiles for easy reference. (“liliac” is not a typo). You can use the screenshot from the wiki [Cheat Sheet: Hair ](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/cheat-sheet-head/hair#colour-in-files-by-index)article for reference. These are the colors you can replace.

If you want to set up the path yourself, here it is:

base\characters\common\hair\textures\hair\_profiles\\

| brown\_liquorice       | blonde\_platinum | red\_merlot         | ginger\_copper    |
| ---------------------- | ---------------- | ------------------- | ----------------- |
| teal\_ombre            | black\_carbon    | blonde\_golden      | blonde\_dishwater |
| blue\_sapphire         | brown\_ombre     | red\_apple          | gray\_gunmetal    |
| ginger\_strawberry     | teal\_ash        | pink\_magenta       | pink\_rose        |
| blue\_steel            | blue\_red\_ombre | cold\_white         | cyberpunk\_yellow |
| goblin\_green          | liliac           | mermaid\_aquamarine | purple\_ombre     |
| black\_salt\_n\_pepper | green\_toxic     | brown\_medium       | blue\_sky         |
| citrus\_yellow         | dark\_purple     | green\_orange       | liliac\_ombre     |
| phoenix\_fire          | purple\_blonde   | silver\_rose        | <p><br></p>       |

\


### Creating the mod

[Step 0: Create a WolvenKit project](https://wiki.redmodding.org/wolvenkit/getting-started/creating-a-mod#getting-started-with-wolvenkit)

#### Step 1: Folder structure

Because we are replacing a vanilla hair profile, we need to mirror the vanilla folder structure in our project. In the asset browser, search for the hair profile you want to replace.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeCMiMcLh_GtDBd9cVHJAB4hRa6VEO-ahz4t_IVtdKWeVUDBMkYA9H2Vy97GW4eMZSwDoYgFING7RgGQEBKTQSBxqpUbfMx5Gm3v6oIV8zUqbmpPidnos4GIKg21oUvItsB_AnLWw?key=861_VgN82g7h-lIzl-y5SA)

Right click, and select “add selected items to project.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe5wTiuLwmsTN86tDQDc_Nd7YYXOL_xgRBAl-Mqe0uPPxq41JVbY4-uBy02_qI33Pjn_jITxg4aoJGn7zxtuM4PPsHp2zL4kXqkTzhhe1NIAH2TjHGfOkDYCP3455K_fZ9KxBVq6w?key=861_VgN82g7h-lIzl-y5SA)

You should now see this in the Project Explorer on the left.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHj6aKLTwfH8Pxyt7GA-8MBGGTjwNWGeK6nrBChU9vEd6JnItaE2jL0f3jbMYGPd2Eka_utM0pDk1oYD3yhI4jglz59JbioAdlIUyIeV1izED_ZSWIkCBV6LVLsnoyn7kscsb1?key=861_VgN82g7h-lIzl-y5SA)

#### Step 2: Finding one of my hair profiles

CCXL hair colors all use the same folder structure. You’ll find all of mine here:

ratstick\modname\_ccxl\hair\_profiles

Use the reference pics on the mod page to find the color name. For this example, I want to replace brown\_medium.hp with the color “flecktarn” from my [It Ain’t Easy Bein’ Green](https://www.nexusmods.com/cyberpunk2077/mods/22271) pack.

Toggle the asset browser to the mod browser and search for “ratstick”

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd3nTe1AOmVj5A2meux-GUjEeXSjUecKHankqPGYx4pDyHFQDAtP7j5in6nhXrqpXiGL4iybP0fWhqIULbb98pztP5W5_FaAgbH11h73aqLhF1Ra6mObcanWi3BpUQtlYEEhtbP?key=861_VgN82g7h-lIzl-y5SA)

I’m going to uncheck “select all” and then check “ratstickkermie\_ccxl.archive”, just to make it easier to navigate. You can also try searching for the .hp name without filtering. Most of my colors are named the same as in the hair profile and in the reference photos.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc-YFxCEJrNg2dnsMuhptWEh2-klDRfF4Ixn93XfMxY308gTgO-HJM9xO_GlLQkVHx5dgqYDUQKozyC6_UkmG0ZtvhcxMaCOp6sme9Xn2l4rNjncOOVazCT_-VltULBLNPOAgRXcA?key=861_VgN82g7h-lIzl-y5SA)

Right click on the .hp you want to add, in this case flecktarn.hp, and click “Add selected item to project.”

This is what you should see on the left in your Project Explorer.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf9vjW21sSI-3XhpmMFrpQsWkWpp8mtewN86tj6fjTEi83cUpHA0a-dGtRJLK77-ZarwUzTHiWCm6ObVeLs9AqO9sBRbCIhVKK5DbFO9D0ZjTgdOsgmzdt8A_ojozfWVRiK-G19?key=861_VgN82g7h-lIzl-y5SA)

#### Step 3: Rename and move the file

Now, rename the hair color from my mod to the color you’re replacing.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdPGZsAI5HZqsxjlvwYzj2e72gfo2FVctw24MGQs9gd7XtwgMrdnJwiP6kbu4yRkWIuyL-Cnhq07PNjm-P4fPHJz2ahlYFwpFAFW8nj_tatE2T0kklQGx-1gbvwix9m3WpQ3AAxOQ?key=861_VgN82g7h-lIzl-y5SA)

Your project explorer should now look like this:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfgQioYoo19HKH3d0uIYAVF6KJMpN2PhL6ao7hamsYBkoBa6YJZfpTOMpoi3xxoihJ9LNpGcPwlVkUI6ipQVVrTPkAmfWPMKBCDAh41kyKWqplFI8g0DnOCbPcfdFxeg04mhKwGJg?key=861_VgN82g7h-lIzl-y5SA)

All that’s left is to drag and drop into our vanilla folder and let it replace the vanilla file.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeTnU-PkXurUr4MNjlAZcdGoxzEsAXGY0wLi5cCbCFCJbUuIIZc-UM7qYMkJt60rewC8u2s47Jm4xifHNM6JEQtVH-4Exrjfd0fL8-rel_-kU0MaiM3cFCV7vnhRkQzt08JeER8rw?key=861_VgN82g7h-lIzl-y5SA)

Project Explorer should look like this now:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf3g24Ehb8gussVOEa-84a4pJGl8qXijvlBBoasWb_hQFc2OeQuughaffq7HOo55v1VqZPxcc10sKdbNo9RkXgJUkIREKfhCJM_uZjPAqI-mYDPVhp7kr2xwm1-ZI-ENr0pKsdr3w?key=861_VgN82g7h-lIzl-y5SA)

Feel free to delete the folders leftover from my mod. Then, just pack, install, and go!
