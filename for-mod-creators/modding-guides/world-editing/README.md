---
description: >-
  Step by step guide on how to move or delete a object from the world of
  cyberpunk 2077.
---

# World Editing

## Summary

**Created by @Krat0es**\
**Published October 10 2022**

This guide aims to teach you moving and deleting objects from the world.

### Requirements

* [**WolvenKit 8.7**](https://github.com/WolvenKit/WolvenKit) **or higher**

{% hint style="info" %}
For more documentation on streaming sector files, see [here](../../files-and-what-they-do/the-whole-world-.streamingsector.md).

For a list of interesting locations to modify, see [here](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-streaming-sectors-to-blender/interesting-sectors).&#x20;

For a guide how to export streaming sectors to Blender, see [here](https://wiki.redmodding.org/wolvenkit/guides/modding-community/exporting-streaming-sectors-to-blender).&#x20;
{% endhint %}

## Finding the required sector

* first of all you will need your in-game player coordinates you can use `print(GetPlayer():GetWorldPosition())` in the CET console to get them.
* after that search for `streaming block` in the asset browser and open the block then click on `sector preview`
* use the player cords to find the area you are looking for

<figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FqvAo30zoTmS8DzTwyZMv%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1970).png?alt=media&#x26;token=8f89bea1-7406-4152-ac1f-4f763f0f86f9" alt=""><figcaption><p>veri nise</p></figcaption></figure>

*   After finding the sector you need add it to your project then open it then click on `sector preview` again, from the menu on the right find the object you want to move or delete, click on the small red box to confirm if its the right object or not **(you will see it disappear when you do that)**&#x20;

    <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FTyswVnWzwLaPMkbSXGot%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1974).png?alt=media&#x26;token=d5433dd4-cee3-4180-88a5-0ef59e01ca1a" alt=""><figcaption><p>amazing</p></figcaption></figure>
* After finding the object you want to move or delete go back to the **WorldStreamingSector** tab then click on **nodeData** then find the object in the list `(You can memorize where the node is from the sector preview menu)` (edited)
*   after finding the object node in the list click on it to expand the node there you will find **Postion, Orientation and scale**

    <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FHdaUpLML1iVtiGFmgntx%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1972).png?alt=media&#x26;token=f7a18fcd-f3ad-4631-a052-b9b178e95509" alt=""><figcaption><p>nise</p></figcaption></figure>
* from there you may change the object coordinates `(remember to save after making any changes)`
*   you may right click the node then delete it like you see in this image `(this will delete the object from the world)`\


    <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FKFW2Z1x9SYGtZ2z4FVVo%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(1973).png?alt=media&#x26;token=37bd0f6b-367e-4320-9502-04ad71e92a63" alt=""><figcaption><p><code>deletus</code></p></figcaption></figure>

**`Note:`** when you delete a object and you see a low res mesh in its place in the game that means the object has a proxy assigned you will have to find the sector the proxy is in and delete the proxy mesh. `(you may do that following the same steps)`

\




