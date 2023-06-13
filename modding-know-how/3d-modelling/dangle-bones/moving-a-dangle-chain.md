# Moving a Dangle Chain

## Summary <a href="#summary" id="summary"></a>

**Created by @eagul**\
**Published March 20 2023**

This guide will go deep into detail about moving dangle bones.\
\
Still unknown: changing bone parenting, rotating bones, editing the animgraph physics, adding new mirrored dangle chains for better coverage. If anyone has done tests on any of these topics, please contact me.\


Assumed skill level: \
\- You understand what you are doing, and know why you need to move dangle bones\
\- You are able to read and comprehend instructions.

## <mark style="color:yellow;">MATH WARNING</mark>

\
Okay.... Let's get started.\
If you are doing physics stuff, and need to move the dangle bones to fix the leverage effect, or for any other reason, you are in the right place. \
\
I will be using my long hair dangles project for examples here.\
Read 'Leverage effect' section in 'Dangle Bones' page for the reasoning behind why this process is necessary. (Using a normal hair dangle skeleton is not an option because it is parented to the 'head' bone, which causes horrible clipping and unnatural movements when the head turns. It might be possible to change the parenting to spine3 bone, but i have yet to test. Even if it is possible, the process described below would still be usefull to move the chains into the right positions)\
\
You will need to do a couple things:\
1\) Get everything into blender.\
2\) Isolate the bones you need to move. Hide other bones in armature edit mode.\
3\) Duplicate the bones and move them to the desired position.\
4\) Edit the bone positions in both the .mesh and .rig, sometimes editing the collision hitboxes in the .animgraph will also be required.\
\
I would also recommend having a rigged and weight painted mesh ready, for testing purposes.\
\
I will explain each step of the process more in-detail below.\


## MultiMesh Export

Usually, you can get the skeleton in it's real form into blender by using WithRig export on the mesh.\
However, if the .mesh contains bones that are not present in the .rig, you will need to use MultiMesh Export.\
You need to find a second (or even more) .rig file, so all the bones that are present in the mesh have a counterpart in the .rig. You then need to also add the meshes that correspond to the new .rigs and then export. \
Attached images show settings i used to export base\characters\garment\citizen\_formal\torso\t1\_072\_shirt\_\_netwatch\t1\_072\_ma\_shirt\_\_netwatch\_dangle.mesh with rig, which i used for long hair dangles.&#x20;

<figure><img src="../../../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (44) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (34).png" alt=""><figcaption><p>Isolated netwatch shirt dangle skeleton. The original dangle chain is selected. The spine column, and the duplicated and moved dangle chain are also visible.</p></figcaption></figure>

## Editing the .rig

Open the .rig file in Wolvenkit. Under boneNames you can find which index corresponds to which bone. Expand boneTransforms. Locate the bones you want to move. Moving a bone in a chain will also move every bone that's parented to it (located lower than it in the chain). In the case of the image above, moving the bone selected in yellow, also moved the entire chain. In this case i moved bone 8 (selected in yellow) by 0.283076668 on the Y axis.&#x20;

<figure><img src="../../../.gitbook/assets/image (37).png" alt=""><figcaption><p>Original </p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (31).png" alt=""><figcaption><p>Edited</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (30).png" alt=""><figcaption><p>Result</p></figcaption></figure>

## Animgraph edit

As you can see, the skeleton exploded. This is (to my understanding) caused by collision hitboxes on the spine bones. It will only happen if you have moved the dangle chain inside of those hitboxes. If this happens to your skeleton/mesh, follow these steps to fix it:\
1\) Open the .animgraph file in Wolvenkit. Expand the 'rootNode' array, and keep expanding untill you see collisionRoundedShape and then lower the roundedCornerRadius for each of the bones untill your skeleton no longer explodes. \
\
Here i set the value to 0, the animations work fine, but a correctly set value might reduce clipping in some poses.&#x20;

<figure><img src="../../../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>



<figure><img src="../../../.gitbook/assets/image (47).png" alt=""><figcaption><p>Result</p></figcaption></figure>

Notice how editing the bone positions in the .rig also deformed/moved the mesh in-game. At least it's dangling nicely now, and it no longer explodes :copium:

## Editing the .mesh

The .mesh also contains bone matrices. To my understanding, these are used to map the bones from the .rig to the vertices. You will need to move the bones in the .mesh to match the changes You did to the .rig skeleton, and this will fix the mesh deform.\
\
In this case, I'm editing bones 79-83. The goal is to move each of them by -0.283076668 on the Y axis.\
\
Open the .mesh in Wolvenkit and navigate to boneRigMatrices.&#x20;

<figure><img src="../../../.gitbook/assets/image (38).png" alt=""><figcaption><p>Not edited bone matrix of bone 79.</p></figcaption></figure>

Next, open [https://matrixcalc.org/](https://matrixcalc.org/) and copy paste each of the entries of the bone matrix into the calculator. Then press inverse.&#x20;

<figure><img src="../../../.gitbook/assets/image (14) (2).png" alt=""><figcaption></figcaption></figure>

Notice how the bottom row of the inverse matrix corresponds to the coordinates of the bone, which you can see in Blender.

<figure><img src="../../../.gitbook/assets/image (46).png" alt=""><figcaption></figcaption></figure>

Next, copy the new Y coordinate from the bone you duplicated and moved.&#x20;

<figure><img src="../../../.gitbook/assets/image (42) (1).png" alt=""><figcaption></figcaption></figure>

After that, return to the calculator, and press 'Insert in B', and then replace the matrix entry corresponding to the Y position of the bone with the new coordinate.

<figure><img src="../../../.gitbook/assets/image (41).png" alt=""><figcaption></figcaption></figure>

Then, press 'inverse'

<figure><img src="../../../.gitbook/assets/image (45).png" alt=""><figcaption></figcaption></figure>

Next, press the 3 small lines below the output, click on Show LaTeX, and copy the top row entries back into wolvenkit.

<figure><img src="../../../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (39).png" alt=""><figcaption><p>Finished bone matrix edit in Wolvenkit</p></figcaption></figure>

And now repeat all of those steps for each of your bones... enjoy...\
After that, you should be finished!

{% embed url="https://streamable.com/sdkxvc" %}
Final result&#x20;
{% endembed %}
