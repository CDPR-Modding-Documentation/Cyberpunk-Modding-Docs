---
description: THIS GUIDE IS ARCHIVED! DO NOT USE IT
---

# Archived: World editing via file edit

{% hint style="danger" %}
This guide is archived and will lead to wide-ranging compatibility issues. Do not use it for your world edits - please look up the ArchiveXL guides instead!
{% endhint %}

## Summary

**Created by @Krat0es**\
**Published October 10 2022**

This guide aims to teach you moving and deleting objects from the world.&#x20;

### Requirements

* the most recent Wolvenkit (stable | Nightly), at least [8.7](https://github.com/WolvenKit/WolvenKit)

1. Add your sector file to the Wolvenkit project
2. Open it by double-clicking
3. Click on `Sector Preview` again
4. Click into the preview to highlight an object. \
   _This will print the object's node name and -index to the log._
5. In the list on the right, find the object that you want to delete.\
   _You can toggle the red checkmark(s) to show/hide objects in the preview_

<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FTyswVnWzwLaPMkbSXGot%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1974).png?alt=media&#x26;token=d5433dd4-cee3-4180-88a5-0ef59e01ca1a" alt=""><figcaption><p>amazing</p></figcaption></figure>

6. Go back to the **WorldStreamingSector** tab&#x20;
7. Click on expand nodeData to find the object in the list. It is easiest to go by index, which should have been printed to the log when you selected the object in step 4.
8. Expand the node and find `Position`, `Orientation` and `Scale`:



<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FHdaUpLML1iVtiGFmgntx%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1972).png?alt=media&#x26;token=f7a18fcd-f3ad-4631-a052-b9b178e95509" alt=""><figcaption><p>nise</p></figcaption></figure>

You can now

* change the object's coordinates or scale
* delete the object from the world by right-clicking the node and deleting it (see screenshot `deletus`)

{% hint style="info" %}
Remember to save the file after making changes!
{% endhint %}



<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FKFW2Z1x9SYGtZ2z4FVVo%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1973).png?alt=media&#x26;token=37bd0f6b-367e-4320-9502-04ad71e92a63" alt=""><figcaption><p><code>deletus</code></p></figcaption></figure>

## Troubleshooting

### My deleted object is low-resolution now!

That means that it has a proxy mesh, which you **also** need to delete.&#x20;

1. Search the game for your sector file's name without the last digit\
   Example: \
   You're editing `interior_-23_15_0_1`\
   You're searching `interior_-23_15_0_`

**`Note:`** when you delete a object and you see a low res mesh in its place in the game that means the object has a proxy assigned you will have to find the sector the proxy is in and delete the proxy mesh. `(you may do that following the same steps)`
