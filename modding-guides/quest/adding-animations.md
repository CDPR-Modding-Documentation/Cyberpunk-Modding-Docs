---
description: How to animate your actors in scenes
---

# Adding Animations

{% hint style="info" %}
Note: although the guide specifically mentions **`bodyCinematicAnimSets`** , the same principle applies for other animSets as well such as `lipsyncAnimSets`, `gameplayAnimSets`
{% endhint %}

This guide explains how to correctly link animation files (.anims) and specific animation names to an actor in your scene. The core principle is a three-part system:

1. **The Resource List (`resourceReferences`):** A central repository in your scene that lists all the external animation files and the specific animations from those files you intend to use.
2. **The Actor's "Permissions" (`playerActors` / `actors`):** A list on the actor itself that says, "I am allowed to use animation set 0, animation set 1, etc."
3. **The Event (sceneGraph):** An event in the scene's timeline that plays the a specified animation \[CName]

The link between these three parts is a simple **index number (ID)**.

Think of it like checking out books from a library:

* **`resourceReferences.cinematicAnimSets`** is the **Library Catalog**. Each entry (index 0, 1, 2...) tells you the location of a book (the .anims file path).
* **`resourceReferences.cinematicAnimNames`** is the **Table of Contents** for each book. The entry at index 0 lists the chapters (animation CNames) in the book found at catalog entry 0.
* **The Actor's `bodyCinematicAnimSets`** is your **Library Card**. It's stamped with the call numbers of the books you're allowed to use (e.g., id: 0, id: 1).
* A **`scnPlaySkAnimEvent`** in a Section node in the scene graph is you deciding to **read a specific chapter** from a book you have.

When the scene tells an actor to play an animation, the game checks the actor's "library card" for the right call number, finds the book in the "catalog," and opens it to the correct "chapter."



Let's walk through how to add a new animation for an actor.

### **Step 1: Add the Animation Resource File**&#x20;

First, you need to tell the scene that you're going to use a new animation file.

1. In Wolvenkit, open your .scene and scroll to find **`resouresReferences`**.
2. Inside resouresReferences, locate the **`cinematicAnimSets`**&#x61;rray.&#x20;
3. Add a new entry to this array. Ensure it is properly indexed (indexes go normally from 0, 1, 2, and so on)
4. In this new entry, you'll have a field for the animation file path (in the JSON, this is `asyncAnimSet.DepotPath`). Browse your game files and select the .anims file you want to use for e.g. `base\animations\npc\generic_characters\male_average\interactive_scene\generic_average_male_transitions.anims`



### **Step 2: List the Animation Names**

Now that the scene knows about the file, you must list the specific animations from that file that you plan to use.

1. Stay within the **resouresReferences** section.
2. Locate the **`cinematicAnimNames`** array.
3. Add a new entry to this array **at the exact same index** you noted in Step 1. **This is the most critical part.** The index of `cinematicAnimSets` and `cinematicAnimNames` must match for the same animation set.
4. Inside this new entry, find the `animationNames` array and add the CName of each animation you want to call from that .anims file

{% hint style="success" %}
Use this anim look up sheet to search for specific anim names, duration etc : [https://docs.google.com/spreadsheets/d/1YxZf90FzvDfJcny94kTSed46ItH\_0VyZr76rWtgEAxc/edit?gid=791420461#gid=791420461](https://docs.google.com/spreadsheets/d/1YxZf90FzvDfJcny94kTSed46ItH_0VyZr76rWtgEAxc/edit?gid=791420461#gid=791420461)
{% endhint %}



### **Step 3: Give the Actor "Permission" to Use the Animation Set**

Finally, you need to grant the actor access to this new animation set.

1. Navigate to the actor you want to animate in the scene editor (e.g., if it's the player then the `playerActors`\[0] or if it's a specific actor, then find the entry in the `actors` array).
2. Find the appropriate animation set array for that actor. Common ones are:
   * **`bodyCinematicAnimSets`** (for full-body cinematic animations)
   * `facialCinematicAnimSets` (for facial expressions)
   * `gameplayAnimSets`
3. Add a new entry to this array (e.g., bodyCinematicAnimSets).
4. This new entry will have a single, important field: **id**.
5. Set the value of **id** to the index you've been using all along

&#x20;You have now officially linked the Actor to the animation set you defined in steps 1 and 2.

### Tying It All Together: Playing the animation

Now, when you create a `scnPlaySkAnimEvent` in the scene graph for that actor, you simply select the animation by its CName (e.g., lie\_ground\_\_r\_elbow\_on\_ground\_\_01). The game will:

1. See the actor is playing the animation.
2. Check the actor's bodyCinematicAnimSets to see which animation set ids it has.
3. Use that id as an index to find the .anims file in resouresReferences.cinematicAnimSets.
4. Load that file and play the specified CName.

