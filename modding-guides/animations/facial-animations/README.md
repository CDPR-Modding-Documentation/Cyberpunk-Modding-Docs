---
description: Initial research on facial anim files and how to find them
---

# Facial Animations

Summary

**Created by @Simarilius  3/10/24**

**Based on info from Loomy and JohnCO**

John CO worked out how to export facial animations to blender while creating his[ like a Supreme bootleg video](https://www.youtube.com/watch?v=aSQvmkor0TE) (check it out if you havent seen it, its impressive) with help from Loomy, and the resulting script is available in the plugin resources folder.

The original could only process scenerid files but its now able to process .anim files too.&#x20;

Thats all well and good but you need to be able to find them, so again with the help of Loomy I've been digging into the file structures to work out how things are related. A pictures worth a 1000 words so here you go:

<figure><img src="../../../.gitbook/assets/image (539).png" alt=""><figcaption><p>The Relationships (as far as I can tell from FAFO so far) between scene node, dialog event to sound/anim files</p></figcaption></figure>

Basically you want to find the audio on [https://sounddb.redmodding.org/subtitles](https://sounddb.redmodding.org/subtitles) get the locStringId, then the tricky bit is finding the scene its referenced by, from that you can  find the dialogLine, which lets you find the actor id, and locate the anims file. Anim for it should be in there with the locstring as its name. Am going to try scrape all the scene files to a db to make the tricky bit easier.
