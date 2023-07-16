---
description: This page explains the features added in the different game versions.
---

# Change logs

<figure><img src="../../../.gitbook/assets/Web.png" alt="Game version 1.63"><figcaption></figcaption></figure>

### **Added**:

1. Load mod load order from a text file. <mark style="color:red;">by</mark> <mark style="color:red;"></mark><mark style="color:red;">**Auska**</mark>
   *   RedMod deploys a list of mods in order - passed through the command line.

       This change now makes it you don’t have to pass the names in the command line but read it from file.

       We can specify load order of archives in another load order file.
2. Fix mesh Export paths and allow exporting to non-base resource paths. <mark style="color:red;">by</mark> <mark style="color:red;"></mark><mark style="color:red;">**Mana Vortex**</mark>&#x20;
   * The fbx importer would throw an error if in the resource path there wouldn't be `base`

**--- Example:**

&#x20; ❌/`environment/decoration/industrial/pipes/entropy_pipe_01/entropy_pipe_01_module_small_l020_a.mesh`&#x20;



✅`base/environment/decoration/industrial/pipes/entropy_pipe_01/entropy_pipe_01_module_small_l020_a.mesh`
