---
description: Short guide how to open existing in world garage doors
---

# How to open garage doors

## Summary

**Published:** Nov 10 by [Sergey](https://app.gitbook.com/u/N691cVEMA0Nmecc6QHIAM73aI0z1 "mention")\
Last documented update: Nov 24 by [Sergey](https://app.gitbook.com/u/N691cVEMA0Nmecc6QHIAM73aI0z1 "mention")

This page will teach you how to create an auto-opening garage door via .questphase file with either [CET](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-MP5jWcLZLbbbzO-_ua1-887967055/) or [Redscript](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg_/).

### Wait, this is not what I want!

* If you want to learn about [world-editing](../world-editing/ "mention"), please check the corresponding section.
* [NodeRefs](../../for-mod-creators-theory/files-and-what-they-do/file-formats/the-whole-world-.streamingsector/noderefs.md) explained.

## Requirements

* [ArchiveXL](../../for-mod-creators-theory/core-mods-explained/archivexl/)
* [RedHotTools](../../for-mod-creators-theory/modding-tools/redhottools/)
* An existing door (if you don't have one, head to[adding-locations-and-structures-with-archivexl.md](../world-editing/archived-guides/adding-locations-and-structures-with-archivexl.md "mention"))

## Opening a door via .questphase

Since we are in the quest section I'll show how to open it within `.questphases` and using "native" nodes.

1. &#x20;Create a basic structure for our quest

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (11) (1).png" alt=""><figcaption></figcaption></figure>

2.  Find the door you want to open. Make sure it's not a texture (collisionNode). For example, i took a maelstrom gate.

    From there we need its [`NodeRef`](../../for-mod-creators-theory/files-and-what-they-do/file-formats/the-whole-world-.streamingsector/noderefs.md).Its global identifier. You can find it on its WorldSector.

    <figure><img src="../../.gitbook/assets/image (5) (1).png" alt=""><figcaption></figcaption></figure>

    <figure><img src="../../.gitbook/assets/image (9) (1).png" alt=""><figcaption></figcaption></figure>


3.  Create `pauseCondition` on distance and `interactiveObjectManager` in our `.questphase`&#x20;



    <figure><img src="../../.gitbook/assets/image (2) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>
4.  Showcase&#x20;

    <figure><img src="../../.gitbook/assets/output.gif" alt=""><figcaption></figcaption></figure>



## Worth mentioning.

To close the door you need to create another condition and use `ForceClose` and `ForceLock` respectively.

Door can be `Sealed` so pay attention to this too.

Some references:

{% embed url="https://nativedb.red4ext.com/c/5245974021298470" %}
ForceClose
{% endembed %}

{% embed url="https://nativedb.red4ext.com/c/6646620624108018" %}
ForceLock
{% endembed %}
