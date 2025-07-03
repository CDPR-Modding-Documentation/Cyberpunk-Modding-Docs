---
description: >-
  This will show you how to add a new appearance to an NPV if you maybe didn't
  make it yourself.
---

# How to add a new appearance to an NPV

## Summary

Created: Jul 3 2025 by [ratstick](https://app.gitbook.com/u/OX4mIc9xYzR97rBe1QUOsmixekJ2 "mention")\
Last documented update Jul 3 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page will show you how to add an appearance to an already-existing NPV.



Commissioned an NPV or had someone make one for you and want to add new appearances yourself? It’s easy! Well, sort of. All the hard work has been done, but there are still some things you’ll want to consider. Here’s a guide walking you through it, step by step.

Don’t hesitate to DM me on Discord or Nexus (`ratsstick` on both)  if you need help, or if the guide is unclear! You can find me in the [modding community discord](https://discord.gg/redmodding), the AMM server, the KS server, and Veegee’s server. <3

### Disclaimer

I love subfolders and organizing my NPVs. The screenshots I’ll be sharing are from a mostly vanilla fem V NPV that I was commissioned to make. You’ll see my stupidly detailed folder organization for clothing meshes and textures. If you want to use this in your own projects, you can [download it here](https://drive.google.com/file/d/1McSM228BlsY-4HRoe-lGqPQUGybtkBpT/view?usp=sharing)!

These steps will be the same for adding new hairstyles, tattoos, cyberware, that is only on a new appearance and not the base appearance.

### The Mr. Potato Head and Barbie Dress-Up Metaphor

The .app file tells the game what to load when spawning the character entity.

The .ent file tells the game what file to reference for a given entity to load its appearances.

The .app file is where most of the work takes place. It’s where we’ll start. You can think of it like a Mr. Potato Head doll. The components are the eyes, nose, ears, mouth, hats, bowtie of the Mr. Potato Head doll. When we add items to the .app file, we’re playing dress up with our Mr. Potato Head or Barbie.

It’s not the player, so certain scripts and mechanics don’t apply to it. That means we don’t need a lot of frameworks like More Head Meshes or More Body Meshes. You want to add additional cyberware? You can just add the mesh!

You may still need files from certain texture frameworks, but you’ll find that out when you’re beginning to custom path textures.

### What does “custom pathing” mean, and why do we do it?

Custom pathing is changing the folder structure or the name of a file so that vanilla or other modded files don’t overwrite what you’re putting together. This means that if I have Arkhe’s Universal Skin Tone mod installed, but your NPV uses a different skin file, then your file wouldn’t be overwritten by me having that mod installed.

I take a broad approach to custom pathing and path nearly everything that isn’t an engine file or file type not commonly edited. I still recommend doing this for vanilla clothing items, as replacers are still used for some clothing items. In general, I recommend custom pathing the following file types:

* .mesh
* .mi
* .xbm
* .mlsetup
* .mlmask

## Adding new appearances

#### Step 1: The project

If you haven’t done it already, and if the mod maker didn’t send you the project, go ahead and make your own project now.

Open WolvenKit and select “create a new project”. Fill out the stuff. Make sure you use underscores instead of spaces. WolvenKit will freak out, and your shit may not work if you use spaces in folders and such.

[(full size image)](https://drive.google.com/file/d/1QJ0QRXlIhAszugR6qcsRjUTFO6uxc-I-/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd6GxJ4Vr1k3iqCCnhvKq-lnTKNhDrauJqfEKtAKjD3nnTbOwdVSFvKu6oniwAW2vD0sNXA_8hFYtHVmY0NaqGNIqbVO5d1BIvnimBl4v68tZByY4nnFob69VanGx5_FVfdEcoSqQ?key=v-1XJeip1aB1Hl1kfJwyYA)

#### Step 2: Duplicating an existing appearance

Since all the hard work has been done for you with the base appearance, you can duplicate an existing appearance. Personally, I usually duplicate one with the same t0 submeshes hidden because I frequently forget to unhide them. (We’ll get to this in a later step).

Find your .app file and click the blue button to open it (you’ll see it when you hover the file).

[(full size image)](https://drive.google.com/file/d/1rqZfhSiJiAUUnHJWlNMj5eh-CptHlXvd/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeEEhBO_k6tOnJOeTg2-GwBPqw_Qg1BitnM9w-XiYYSVgv3An9o6EYgbuccGyqcaxIRLJXxJLpdONHzVYozlqjseRkevzESyjtlT8ADOEeTKnD58MlUlHbHzqju2aZyNySjMVhpAA?key=v-1XJeip1aB1Hl1kfJwyYA)

Right-click on the appearance you want to duplicate and select “Duplicate in Array/Buffer”.

[(full size image)](https://drive.google.com/file/d/1n2rOAqXSH9FhHud5sWOVsiSImaf7e4IH/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeqRF1uh77TRPp5Xnc4zGfD8OS4Oq0kTib2K7yiipPu17wcV7Td_uLx77s43fwgqpEGoTLm-zvohrvdCFbdv_VMcGVC6Il6vBXOTDzY4FvXyJaPWOyH7-ZBKJ4-PTkTA4o5-TUHrA?key=v-1XJeip1aB1Hl1kfJwyYA)

It is IMPERATIVE that you change the name of the appearance. No appearance can have the same name. After duplicating, make sure the new appearance is selected. In the right pane, you’ll see a field that says “name”, that’s where you can change the appearance name. Remember!! You must use underscores, no spaces!

[(full size image)](https://drive.google.com/file/d/1ENCKZdPk0UKU567KG5mz8NSFSdUDQDx1/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfgGVfkPVTfW4dDCnkyM1ECPpOr7de3nHvBr-UX11wijfo3dCSYqpVaI6Vcl9YdFUKQaD_UJYWWDxoOb6Yn9hErKemQCEW1reaLBM5THxaQ8LKgLWXVjr2X4faecFYwYj6ruUFhDA?key=v-1XJeip1aB1Hl1kfJwyYA)

#### Step 3: Playing Barbie Dress-Up (Adding items)

Once the name has been changed, click the carat next to the appearance to expand it, then click the carat next to “components”.  Scroll down to find the clothing components. Your .app file may look different. Modded items will usually have their own mesh names. For vanilla items, you can find the items that start with the following:

* t1 (inner torso)
* t2 (outer torso)
* s1 (shoes)
* h1 and h2 (headwear)
* l1 (legs)
* g1 (gloves)
* i1 (items, e.g., pouches and bags)

In some template .app files, clothing has its own section.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc5_TUPS7LzaoxwGLNlp-OlDCg7uzRqh3W6eeiMIiPzothCHXGyq5-WPDmKAlaxOlyjHxwbU0NyWi-3ZoyKEvEknMb0-znM2rAsTkqkUTZAXJWmAcC5hRuBxDv8SJfCjoDF82yZ?key=v-1XJeip1aB1Hl1kfJwyYA)

I don’t want the sunglasses in this appearance, so I’m going to delete it. Right-click on the item and select “Delete Item in Array/Buffer”.

[(full size image)](https://drive.google.com/file/d/1lcSfzW_4zA62j9LB5JMZT_qvl0ffAkPV/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfARME7kJWIUaCQKW6fq0DPmaqBYG7ktoBbFoRhNtnLD1fxaxiAIG1OCsnd5DFEx5o7tpIpK5CIAaLEpdSXEhqkTP-OpC_C1k1b5FybMS77jGNuG2s-j39wmG123_2nvEY3LWULUA?key=v-1XJeip1aB1Hl1kfJwyYA)

Now we can get to playing Barbie dress-up! I want to change the shoes. You can either search for the name of the item if you know what it is, or go through the asset browser. You can toggle on the mod browser to find modded items.

[(full size image)](https://drive.google.com/file/d/1JNgZXHyUt2-_zoylhi0jsBw_CYwPd8a-/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeTn9sW22hJB2sfJl0FM0le3HOzBPMNyRoq03s2CHyJ513q_FHNZTW0bR3-bzavtAS_Pmj7YOFaKNLlqKg4kCicwt9Lcn02SnVL4a0uD-b1Xbk7EualA7LATM1Xz2vUa6yX5IrHfQ?key=v-1XJeip1aB1Hl1kfJwyYA)

I want to use the converse. Right-click on the .mesh (pma = player male average / ma = male average; pwa = player woman average / wa = woman average) and click “Add selected items to the project”. This will duplicate the folder structure in your project as well.

Remember, we generally want to custom path most items.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdO-_3ZzmuLcduIkRPu4fOQIehQ1X6zVRCTeSEmK17hsxcWxRrG9pUsYnmKp_hngRLpcCoSKO6XUcC4wlxjcO2S4vEfgf6Z6T7oOJigS5vU7eQLy3FI-9E2RI__wSQsHmNnKJKBiw?key=v-1XJeip1aB1Hl1kfJwyYA)

I’m going to add a new subfolder (right click on one of the folders) to “feet” for the converse and add another subfolder inside that for the textures. You can also rename the mesh, however I prefer a more organized file structure as I find it easier to navigate, especially if I ever need to change textures!

Drag and drop the .mesh into the new subfolder.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcpBVwp6O8ebHY9h6KP3dtHrbPAUQ2vcjtp_qooz_5RLecIXRMj0O7SEY-Wgfb2ce44uJ8Dv_1CtNg8SYqz0n208cqkFWo4lYwr2lF-GI88WDszd6HcYit23oRZt2ULKDQ0sHg09A?key=v-1XJeip1aB1Hl1kfJwyYA)

I’m going to swap the existing boot component in the .app file for the converse. You’ll want to change the name, the path to the .mesh, and enter the mesh appearance you want to use.

Right-click on the mesh and select “copy relative path to game file”.&#x20;

[(full size image)](https://drive.google.com/file/d/16NwdbaoQJUftO6jbk1C1SkhDn3DDLH8i/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXefEt3rgrSUv5QyA3vEIkvTTF_VlN5Xp1fM8dfzJfyz7W04cUcUeSOw2HYcGQ_NGq8VUGgUaXljY-y_y_U8EfIug6PRQQUd2oKb9ahcy-ZzS6qBqiaXXwy_tGNPDuqccGGgBQpvzA?key=v-1XJeip1aB1Hl1kfJwyYA)

Then paste it into the “DepotPath” section on the right pane. The component can be renamed to whatever you want. I’m going to put “converse”.

[(full size image)](https://drive.google.com/file/d/18uPaPyhm0N0wewQTJLAbIcJZUGzPxNvC/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdgEPVSTlY_YXy2WT2prtAkUM9jMp1mIbOBxEwFQU7R6XyhRDriHWZR0a9CGaMxbhqq_bIukkXGUpVVDgT13GjKMkT7PeB-37UG3RdLnv4HabQ5L7GRCh6Lwvt86h7xv9hAj_JXHA?key=v-1XJeip1aB1Hl1kfJwyYA)

Now we need to find the mesh appearance and clean up any unused mesh appearances. This just keeps it nice and tidy and easy to find the materials you actually need to change. Just like we did when opening the .app file, hover over the mesh and click the blue button to open it.

The first section you see contains the mesh appearance names, and these are what we’ll put in the meshAppearance field. I like the look of the black converse, so I’m going to choose the “black” meshAppearance.

[(full size image)](https://drive.google.com/file/d/1BcTmoPgo3o8ccKqUxhXMKOciOTZ_RHR5/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdrbhnAuiPb4wo7ihUrnM_3Hg19SdvpsOXh6lfngQrA2hXEC-m7gedK2IVdq-vuyTlmCCLJ5lcEcQ9P1Ma9JMlunsmuxS6s_57I9Y7SXCPaTP6rAXRK-S0R4RO1NHFG8iPVvwtJ?key=v-1XJeip1aB1Hl1kfJwyYA)

The component in the .app should now have the mesh appearance, component name, and path to the mesh changed.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeBZ7KQv5DWKAMiaM_jD1U2nKNHYAXGMOIHSJMhwQoz4N7OqsyTJGHpfVsMcjCPT9dvHBJD1S9ypU0tHFvhKAqXdaxQa7o1qbbRVf0fzz3-85bNTpXnsneAraYn0qO5dbDgBFeWAw?key=v-1XJeip1aB1Hl1kfJwyYA)

Now, it’s time to clean up the mesh appearances! If you use more than one appearance in the mesh, it’s fine to keep those entries in the mesh file. I only want to use the black appearance, so I’m going to delete the rest of the material entries. WolvenKit has a very handy tool that will do this part for you. First, select the appearance entries you don’t want, then right click and hit “Delete Item in Array/Buffer”.

[(full size image)](https://drive.google.com/file/d/1f3eKiKU2BueJR-D1VmgdoegDOkJox5Bl/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd9METsmMPR7kd_70sFLf1LOCLBxTw0CFFoIDTIB1ShXD9rKT4DkYaQmb3hmvk5k12aLbrYhzPZQQDnBj21ZmaLeQUYLG_m3BS5mViH-1TSFy8dzRh02bwfJFzfIV0VdH6KA4mH?key=v-1XJeip1aB1Hl1kfJwyYA)

Now, we can use a function in WolvenKit to clean up the entries we don’t need in the localMaterialBuffer and materialEntries. Click on “Clean up” and then “Delete unused materials”.\
[(full size image)](https://drive.google.com/file/d/1rg2x4flQF2Pvve0fqzeT8x3YV-JLufua/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf5DzHvKRa6L0iJ0M7McZdKdvZC8-DaCw6wleEjJtHQhnEfIAOaxx9-PyWIwVJit6JkLHA4kdlhyNQXxUoGfTvhnXCLFxTXVmFbzhTyqhfqtrXu3V5joU3yQUobOf4HO8LBRMJF7A?key=v-1XJeip1aB1Hl1kfJwyYA)

Everyone say “thank you WolvenKit devs.”

Now to edit the path of the textures. Find the localMaterialBuffer and click the carat on the left to expand it. Do the same thing for materials, CMaterialInstance and the values. These contain the paths to the textures we’re going to change.

[(full size image)](https://drive.google.com/file/d/1QOG1HXxYe9bX0rRnPKufplSMVfrNBTuY/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXetjm7BQ7djJCk7Nh0g_rIJ_ZN37BmgCdh9Ls25loIqTENpThzyP1RCCujRxyx3BBi6_6rluXL46At_q5QeIul6Wel6Uhuue8jeSgBZNpjB2t-L3czikgm4fJrTLmKDiPySuAARHw?key=v-1XJeip1aB1Hl1kfJwyYA)

Click the yellow arrow to add the texture to your project. We can ignore the baseMaterial because that’s an engine\materials file and I don’t think those are ever changed in any mod.

Just like when we added the mesh to our project, the textures will replicate the folder structure.&#x20;

[(full size image)](https://drive.google.com/file/d/1i-3PEtRQAovcbwcYQ5E--jq0UQZcqJc2/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd3C83_o2klgtugywibR__aHbpBHmI4kJfJ8Z0j_4Z_zPr8BYZ4dZcbwXRXIx0uICkBgHghYSBy2plRThL4kOyfpbj1qQ6YbzcNHbNkFPLjJxNqKDM0q6MSXOIwsPlIy8r0lW-L?key=v-1XJeip1aB1Hl1kfJwyYA)

And just like we did with the mesh, we want to drag and drop those into the “textures” subfolder.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdAjuq0YTpam0pJnKbEChRliuW5qz6PmpmZ464HiDjhPYL1T-ZCH6oum5yhzIUBEXcWXIyN96EnpmeWAJKN-SkRsLbd6S5WZnRx9shRQlmlpP1jRCzqa24H3UuSgvRMU2_RbpAi?key=v-1XJeip1aB1Hl1kfJwyYA)

Just like we did the mesh path, right-click on the texture, select “copy relative path” and paste it into the corresponding field in the .mesh. Then save it. Do this for all the textures that need to be pathed.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdHJ_rv__aw6rL7a-et-G2c1E9Gf5W1bq-dAtt7acmz_kLfOD1XaO780ohiQ0UhHxl5gnSNvuNUHFsKS3_5DZnbWNdrtz-lHrFIjOa2Rbv67ZtbgNnpEh0rdJrII_omBVO3Sb9uOw?key=v-1XJeip1aB1Hl1kfJwyYA)

This guide is getting hella long already, so I won’t bore you with adding more clothes. The process will be the same no matter what you add.

One thing you may want to do is hide some of the body submeshes to prevent clipping through clothes. Find the t0 mesh component in your appearance and toggle off or on the chunkmasks. You can also open the mesh and switch to the preview tab to see which submeshes you may want to hide.

[(full size image)](https://drive.google.com/file/d/15o88bbzFG2Vu_uZR6v28WZ9n5jnFm3NH/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcKy_Vs1MeU4Hl44MT-TusOJxIkAHpZa-9OvQn_OZ75Ii2FpoJ9A6eUDPWhEvEkWYfnJpUWRQCE_IjaSai_RiOWaM3c3DSc46X8WG2hsOvP5dmOyLfc1igliWTFdMrxGUx832iA2w?key=v-1XJeip1aB1Hl1kfJwyYA)

[(full size image)](https://drive.google.com/file/d/1K4ZR8u8VPMCVmoXFn7LJuo-eDQhZaej6/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe_9awVQvhdRk8iC38sDRol8hXLClVeh3eEGUTgDTtwaFxJdR4DUNPsyxvsNgAdQ1VpVxgUBr9t826x4mAJVw36oip3k-BlO_Vz6KMtvyaJDUXQL6BqyiUGZTLVm38T8Q5KTPRbwg?key=v-1XJeip1aB1Hl1kfJwyYA)

#### Step 4: The Paperwork

Save the .app file after you’re done updating and adding your clothing. This can take a while sometimes depending on a few different factors. But just wait until it’s done.

Now, we need to tell the game that there’s a new appearance that can be used for the entity. That means we have to update the .ent file. Find that file in your project and click the blue icon to open it.

Right click on any one of the .ent entries and select “Duplicate in array/buffer.” Just like we did when we duplicated the .app appearance, we’ll need to rename it. Rename it to the same name you used for the appearance. Pay close attention to the formatting of the “name” field. You only need to append the new name to the end of the NPV name.=

This is what it should look like.

[(full size image)](https://drive.google.com/file/d/1AaPjFtAJAFjZbIpgLnpJ3I7l_vKhZM2g/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfoS0B6jVDrdzGBrwDzVIej44sOTSP5KSKyjnKfzF8oEV4SnJtWqCJL4n_RrNWC5-1J6mKU3SAydIfMzGHtXYB_Uv0vEwSwDqilnzjdAme-n9N3I8XHPiN9Zhm81xYEQ4wL1S8dGw?key=v-1XJeip1aB1Hl1kfJwyYA)

[(full size image)](https://drive.google.com/file/d/11cr79JQPMKRO8teAsaZkuAo_yFCtwsT6/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeYSWIMxemOM-Y0Se_2mmHOsRZ-hQhciycsoweIWy4VX1cEY-PrvR0FpqvBLziM_rJlgCALH1ja1IgsaDRcVmTNq9ERGm1VBS7MhxvAEckfIfj8oC99pkRlp8Zh6udhTZMeOoeW?key=v-1XJeip1aB1Hl1kfJwyYA)

Save the .ent file.

If you also want it to spawn in AMM, we’ll need to add the appearance to the .lua too. You can do this in any text editor, I use notepad++

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd66sJpksFjctlUiqSvQqOAwg5fAGoBSu5zGVyokhTK_cCZe4gPPLhGo7gd0lDJvG9yEz8lxsLk1wfSe43C58r6aoVtr2ifn2EbNG36ZtjPl5iWeb30QZWQRqogFb6if57a5yR4gw?key=v-1XJeip1aB1Hl1kfJwyYA)

Pay close attention to the formatting of these names!

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfE-yjWZTfrJ4voYhNVXgQHSYP1igCahROMcMrJH8EWaLZFgA9mT9n4OjwJ0Eu-xI3BqCL7JbdGhwbFxiaL_JL5Wo7NcgUIUMv23Smh4ej07t3z1mJyfIXWn2D2wlqa3_jYktF-1g?key=v-1XJeip1aB1Hl1kfJwyYA)

And don’t forget the comma!

[(full size image)](https://drive.google.com/file/d/1DVDePE80gfUXCbmcLvV6DKufGJetoBi1/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeZIeFq8JHd5D_JH-ghL95No366_liwugHLOOczIEMj4Pg2b9qFCVfCp8qLgo2MvuEByBpDWlaQH0O11p63DU7S5Mvbp1VpB8QbHb97OSEg6XYqNfZ_4CSrrMgDHmK2EsUx2SjoAQ?key=v-1XJeip1aB1Hl1kfJwyYA)

If you also want the NPV to show up in photomode, you’ll need to regenerate the photomode files. Thankfully, WolvenKit has a way to do this automatically too! [You can find the guide to do that on the wiki.](https://wiki.redmodding.org/cyberpunk-2077-modding/modding-guides/npcs/npv-v-as-custom-npc/npv-amm-nibbles-replacer#step-1-create-photo-mode-files)

#### Step 5: The Finish Line

This guide assumes you’ve never opened WolvenKit in your life so I’m going to show you how to pack the project.

In the top bar, click “Build” then “Pack Project”.

[(full size image)](https://drive.google.com/file/d/1EFnvv33u8Oqwm3LOoNVDG4Q4IwwTCZhr/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXewhTAwx33VjcL0G6C0wC5oQb043zxoc1dZyr3ZG1ESR05xYM2Pz01GQ21JM2fqZOje6GDi4hD00xmj48NnyzwyXu3P62XavUo4vLTBqJhyrKVkKlS8qu0ByIkLENU4bBjWWIKdFA?key=v-1XJeip1aB1Hl1kfJwyYA)

The log will show you when the packing is complete.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdSXWTgz6R-ncAiBd8BD9q9IGiXy_ol79MuBzZWKMtPflmkQCEFagPxa4ahmK7zsYKqLexRnfZI5TdsFkfARNey3t_soz2tT452u9pmlA24lgA5c53-2lkuXAB8AVsmauL_Lg-jFw?key=v-1XJeip1aB1Hl1kfJwyYA)

You can click Build and Install or you can click the yellow folder in the Project Explorer to open the project folder.&#x20;

[(full size image)](https://drive.google.com/file/d/1OSW3rYfG1gyjo1nWMAQEhL1Dih6EBeqs/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcIDS_CMbRfVjUQvUHPKGXgfFWCtQywjYwJsgCEQioxAUryTwO096OMVQFwwDP1nf8v0hdh7jIM3Kqz802PtvxOY2cwVeNOEFGnOlnob6WcV2g0q5ZQOMMhEMJEpVcX5tLUEx0C?key=v-1XJeip1aB1Hl1kfJwyYA)

Go up a level and you’ll find a .zip file with the packed mod, ready to install.

[(full size image)](https://drive.google.com/file/d/18KJ7yX_OoyX9lwFalXQsRWgsboFrbYgC/view?usp=drive_link)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc6aFzCy_Fp-LXMrJMHhJi4yAhyz7C8OS20g7pvKuky8fTJg1KTGav91u0Jxq2r_Zwq5xtNIafc-SjNDXl_bMqEZq8eEJB9gyTUiGr97ZEBTghduLzdDRTdRelT8V-ElCoByRDcdw?key=v-1XJeip1aB1Hl1kfJwyYA)

If you made a new project and aren’t using the one the modder did, make sure you uninstall the old NPV file.

And that’s it! Install and go, test it out!

### Final Notes

Garment support doesn’t work on NPVs. You can hide submeshes in ACM or in WolvenKit. You can also edit the mesh(es) in Blender to cut out or resize the parts that clip with other items. I’m too lazy for that and just edit out the clipping in Photoshop lol.

This process should work for NPC+ too. And again, please don’t hesitate to reach out to me if you need help!
