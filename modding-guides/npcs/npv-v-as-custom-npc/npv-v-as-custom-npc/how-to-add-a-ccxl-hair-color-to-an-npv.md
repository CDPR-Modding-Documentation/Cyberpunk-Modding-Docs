---
description: >-
  This will show you how to add a CCXL hair color to an NPV using my hair colors
  as a guide. (Feel free to crack open my mods!)
---

# How to add a CCXL hair color to an NPV

You’ll just path the .hp and cap files. Some of this is going to be a little funky but don’t worry about it lol. Okay, we’re going to use hh\_043\_wa\_\_modern\_bob.mesh as our example for this one. I want to make sure my NPV is using flecktarn.

### Mesh prep

Since we’re essentially replacing the .hp and cap .xbm, you can pick whichever color you want here.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfRSzp_U-LxITRh0kfyCmUrM14S-sXqmUDrMcIR6yITSsthPP6IyLTXKHoXRHEnBUuFwWBByVJM-L_9bmHn9Sb9k7CQAjIy0rz3nw5v3SMDdFCpHSAPiJR-RwVpydSzBk4fT9XB?key=861_VgN82g7h-lIzl-y5SA)

I’m going to do blonde\_platinum in this instance.

### Pathing the textures

#### .mesh textures

Add the .mi files from the hair mesh as indicated in localMaterialBuffer and/or externalMaterials.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdR9z7Cw0wY2KpaNmePegwLbuzbkZ6YdilL7WW8_Bcxdp_9sabufDxrHSwj2NVW2u0tw7tl68wcXvZZtpdRBwYZ-SD4z2eSyrvENGFsGExIWTEO21NqBGq8f7CxgzvCsGnisf2PVg?key=861_VgN82g7h-lIzl-y5SA)

#### .mi textures

We have the vanilla blonde\_platinum hair profile in here. We can just replace it with the hair profile you want to use from one of my mods.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcO0QHcQyjECdsOLAiqzN1VUXcSGhSuVNxhxUgbJtCTfMa1DCDVSfLRwybv5HiaSNJKnyds7qx57eNTOFMrb6487C9A_CqUUSEnp6lIbNJKyrwzTKD6a4fpo2G0edeuempOHoKxqA?key=861_VgN82g7h-lIzl-y5SA)

And that’s it!

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc_wNg8ZJhgftrIyJs_bJ7b_gldEz3b4poyuOg8JeLoBWhA7OgXaGAyL9o2l8gIzWFkPf5V2apZiOciuJpPbAJNekO937nGcdvTksi3s586zJ-LgjyOXPT3aQSsUUxVtOeCWBi_og?key=861_VgN82g7h-lIzl-y5SA)

#### Cap files

The hair above doesn’t need a cap. Let’s look at one that does have a cap to show you how to replace it with my cap.

I’m using the rattail. Here are the initial materials custom pathed:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfIIdnhzWtOKWe-uEiIdUm4jftzuhUkHlC3o8CtGnNdaNR4PsknHZ7Hs-RVe2Gs6T-fHERzoMXjtrwwJVndcOYn0MAU_-OLFhMQpEYtafQAcyLksefm-EtRpedobiWkicPL3ksfaA?key=861_VgN82g7h-lIzl-y5SA)

Just like in the prior section, we’re updating the .hp in the first .mi

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfUDH3CNZcyd_jX2nSc_MyrTEcr4niJBnOR95SFKbsy8SOWeP-NNKvyjXLQnrlCxoVIAEuJFkqtWjAxnza40okOee9QVxUlo3YCaC6HJFoxgHSEH3JmJcjuO-32hkDA5yXCGaP31Q?key=861_VgN82g7h-lIzl-y5SA)

The two values in hh\_026\_black\_carbon\_\_cap.mi are the non-color textures, the ones that dictate the pattern and whether or not you have to use the special cap for cyberware 01. Path these as you normally would either with vanilla or any texture mods you use.&#x20;

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcNL6OqRPiyyjR6Fsyhz5Zi5CEWW2SEPPNeSyOn8pyK6oLr5yKylsfca7OKJoVpUHJzPsGvmdXakwLSTC9kxBm4TvuFMXlTpgH4LwhSdpp_LTG51RzO20ZUlX_JGmEN-tQGHSsopA?key=861_VgN82g7h-lIzl-y5SA)

The file we’re going to edit for the cap color will be in the black\_carbon\_\_cap.mi

Add the hh\_cap\_grad\_\_ file from my mod. In this case, it’s hh\_cap\_grad\_\_flecktarn.xbm

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf3nLXWeOw-HBEvtpj6OdY-tjlvLfnFIDf-5EeHtQG5YVIWUXfLxKsj7i61KYd4RM1LgV9av0iCK956HeOQnkZ7Kr6Gf_zXN7qZEtWPUxDaAHKze_388hprMk7J0oj9wisWdqF42w?key=861_VgN82g7h-lIzl-y5SA)

Path it in the cap.mi file.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfnbJkqW70sarWk7NYrtZNu4wklVplTWrALY9IKTZ2OBby3J5Is_NX4nv0iNIZTFElTusxboO7gF-XLV4ToXR6cfxAAAthNFk-hao7DwP5j0acRnm69ql3SHofzwaBzjzY_rLF6dw?key=861_VgN82g7h-lIzl-y5SA)

Save the file and you’re all set!

### A little theory (if you’re interested)

You can ignore all the other files in my CCXL mod for NPV/NPC+ because CCXL standardized the hair textures, allowing the ability to use dynamic materials.

Dynamic materials means being able to use wildcards so you can have multiple textures but only need to path one with wildcards. For example, in my CCXL hair colors, we have these generic .mi files. The paths to the .hp files looks like this: \*ratstick\kermie\_ccxl\hair\_profiles\\{material}.hp

The .mesh and .mi files are just part of the way CCXL works and loads the materials. But the cap .xbm and .hp files are the only ones I’m actually changing. So, we only need to update the files that change the color in the NPV/NPC+
