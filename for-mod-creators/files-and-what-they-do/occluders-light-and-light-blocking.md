---
description: How occlusion controls what you see (and what you can't see)
---

# Occluders and light blocking

**Published:** Jan 19 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 19 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

## How do Occluders work?

Occluders hide stuff from you. I haven't understood this well enough to document it, but I've been begging people for months and nobody writes anything, so I'm dumping the corresponding Discord posts here in case anyone wants to clean them up.

[Original post by Deceptious on Discord:](https://discord.com/channels/717692382849663036/814064062815141909/1190434951074680842)

Assuming that the PVS system (a whole other element) is loading whatever is on the other side of that door way, just removing the door isnt enough, if there's an occluder over the whole thing, everything behind it is being ignored (like on the right)

<figure><img src="../../.gitbook/assets/image (216).png" alt=""><figcaption></figcaption></figure>

Everything in the game is already inside something, those somethings are the sectors The game only loads sectors relevant to where the player currently is: The Potential Visible Set, PVS

And it then only tries to render what it needs to, so even if its loaded, if it's hidden behind the player, or behind an occluder it wont bother

Once it's ignored all the stuff it doesnt care about because it's determined you cant see it, it can start to question if you're even close enough to see it, and if so, what LOD?

Some objects/entities might have their own occluder meshes for visibility testing (testing if _**something else**_ behind it is hidden or not), because testing behind an actual model is more complicated then a basic shape, similar to having lower poly shadow casting meshes

<figure><img src="../../.gitbook/assets/image (217).png" alt=""><figcaption></figcaption></figure>

Objects that are being tested, to see if the camera can see it behind an object/occluder probably dont use their actual mesh for the test either, way too complicated So it will probably just use a bounding box This is why sometimes, in games, moving characters can pop-in when moving from out of cover, if the bounding box wasnt big enough, and a limb (or maybe they dive/slide) comes out of the bounding box, the box might still be occluded, but the whole character isnt, so they effectively enter frame and are kept invisible until the BB enters the frame too and thats when you'd get the pop



## How to add an occluder

You have to add a node to the world sector:&#x20;

<figure><img src="../../.gitbook/assets/image (218).png" alt=""><figcaption><p>Image credit: <a href="https://discord.com/channels/717692382849663036/814064062815141909/1197983307292491876">kratoes on Discord</a></p></figcaption></figure>
