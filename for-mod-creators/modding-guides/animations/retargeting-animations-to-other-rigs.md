---
description: How to retarget an animation from one rig to another!
---

# Retargeting Animations to other rigs

Created by **PinkyDude 🦝 (**[Originally uploaded on a google doc](https://docs.google.com/document/d/1nHPQvkK6ijwb8iQ8y1X8CBG-wnNUCTYCjrdUCGMenW4/edit?usp=sharing))\
**Published April 20 2023**



For this tutorial, you will need:

* a recent version of [WolvenKit](https://wiki.redmodding.org/wolvenkit/readme)  (tutorial created using v. 8.8.1)
* a recent version of [Blender](https://www.blender.org/)  (tutorial created using v. 3.3.0)
* [xBaebsae’s Custom Poses M/F templates and Tutorial](https://xbaebsae.jimdofree.com/cyberpunk-2077-tutorials/cp2077-custom-poses-and-animations/)
* the [Rokoko Studio live](https://github.com/Rokoko/rokoko-studio-live-blender) plugin for Blender
* [ Wolvenkit Cyberpunk Blender import plugin](https://github.com/WolvenKit/Cyberpunk-Blender-add-on/)

If you’re looking into retargeting animations, I’m assuming that you already have some basic modding knowledge; swapping animation, browsing the files with wKit (WolvenKit), packing a mod… So this won’t be covered in this tutorial!

\
**1. Getting Started**

First, you’ll need to grab the Rokoko plugin, install and enable it in your Blender! Follow the instructions on Rokoko’s GitHub page for the installation.

Now we need an animation. For the sake of this tutorial, I will be retargeting a WA Rig Anim to a MA Rig but the process can apply to any rig! (MA > WA, MA > MB, etc)

I’ll be using Ruby’s Dance during the “Chippin’ In” quest.

Export your desired .anim file using wKit’s export tool and open one of xBaeBsae’s custom pose templates; in my case I’ll use the Male one.

Import the animation using the import plugin!

<figure><img src="../../../.gitbook/assets/image (3) (4).png" alt=""><figcaption></figcaption></figure>

Select your freshly imported anim’s armature and go into the Dope Sheet’s Action Editor to select the animation you want to retarget.

<figure><img src="../../../.gitbook/assets/image (6) (1).png" alt=""><figcaption></figcaption></figure>

Go back to the Nonlinear Animation tab so you can check how long the animation is.

xBaeBsae’s template is set to 5 frames, so you may want to change that depending on how long the animation you want to retarget is! Even if you end up wanting only one particular frame, I find it personally more comfortable to work with.



2. **Retargeting**

Now that your desired animation is ready, we can move on to the actual retargeting! Open up the Rokoko Studio plugin (press N and select the Rokoko tab)

Open the Retargeting menu and set the Source Armature to the animation you imported; in my case, Ruby’s dance! Set your Target Armature to the template’s model (should simply be “Armature” in the list!) and then click on the Build Bone List button

Since both rigs are from CP77, the structures are the same and should share the same bone names, simplifying the retargeting process a whole lot!

Make sure to have Auto Scale checked in and to use the Rest pose

<figure><img src="../../../.gitbook/assets/image (4) (2).png" alt=""><figcaption></figcaption></figure>

You can now hit Retarget Animation and the template’s model should now be correctly posed!

Since you edited the Frame Range, you should be able to press play and see how the entire animation looks

<figure><img src="../../../.gitbook/assets/image (5) (4).png" alt=""><figcaption></figcaption></figure>

and Voilà! You just retargeted an animation from WA to MA 🥳

You can now refer to xBaeBsae’s tutorial to export your retargeted animation or to isolate a single frame!

Hope this tutorial was helpful! 🦝 \
I’m only getting into custom poses myself, so this was exciting to learn and share&#x20;

Now go and make all the poses! 💛 Thank you for reading -Pkd
