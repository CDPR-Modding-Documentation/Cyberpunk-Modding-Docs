---
description: How to make interior lights work for your custom car
---

# 💡 Interior lights

To make interior lights work, you first need to create the light boundary/shape which will contain the interior light. This is defined in an `entLightChannelComponent` in your vehicle's ent

For eg in the porsche 911 .ent:

<figure><img src="../../../.gitbook/assets/image (324).png" alt=""><figcaption></figcaption></figure>

To create this shape, first we need to create a "cutout" of the interior mesh. Load your car's interior in a Blender project and join them all into a single mesh

Then you can create a cutout mesh by overlaying an Icosphere over your car's interior mesh and then using a Shrinkwrap modifier as shown:

![Image](https://media.discordapp.net/attachments/786891742829215745/1219642099314458776/image.png?ex=663b8138\&is=663a2fb8\&hm=1d910d0fa8b5072964494a417e4f0caa9a95e74d46f606960c00c58767c3426f&=\&format=webp\&quality=lossless\&width=1178\&height=636)



Once you have your cutout mesh, use this script to generate the indices and vertices for wolvenkit: [https://gist.github.com/misterchedda/aa730fab5bc0aa0f1bd905f617c84e6d](https://gist.github.com/misterchedda/aa730fab5bc0aa0f1bd905f617c84e6d)

You'll need to convert the .ent to JSON in wolvenkit, replace the indices and vertices array with the output of that script

Then you can convert the JSON back to .ent in wolvenkit&#x20;

That's it! Like other light stuff (such as brake lights or headlights covered in other pages) - ensure you have an entLightChannelComponent in your .app parented to the interior.mesh (or whichever mesh has the interior light mesh + `vehicle_lights`material + vertex colors assigned )&#x20;
