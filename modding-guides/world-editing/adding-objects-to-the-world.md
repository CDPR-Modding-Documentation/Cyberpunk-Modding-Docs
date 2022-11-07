---
description: will share info on how to add objects like door, loot, walls etc
---

# Adding Objects to the world

## Summary

**Created by @Krat0es**\
**Published October 24 2022**

This guide aims to teach you adding objects to the world.

### Requirements

* ****[**WolvenKit 8.7.1**](https://github.com/WolvenKit/WolvenKit-nightly-releases/releases/tag/8.7.1-nightly.2022-10-24)****
* [**Object Spawner**](https://www.nexusmods.com/cyberpunk2077/mods/2833)****

## Adding objects to the world

* now that you have installed object spawner use it to place a door or a loot token.
*   after placing the objects add them to a group then export them.

    *

        <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2Fga7y40DoKxYWn9gUTCAd%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(2014).png?alt=media&#x26;token=e193b23c-a4f7-45f8-9e72-31b31055f3ce" alt=""><figcaption></figcaption></figure>
    *   you will find a JSON file in the export folder where object spawner is located.

        <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FfmfITY3iJ5eNbaDhqb9l%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(2015).png?alt=media&#x26;token=ab634b6b-c86a-47ab-ac17-0b058a828715" alt=""><figcaption></figcaption></figure>
    * right click on a node and click on the **import from json (no cords update)**
    * a window will pop up select the json file from there.

    <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FhzncEj1tELGgx9lOeWk4%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(2012).png?alt=media&#x26;token=70b08e46-b645-410e-9d06-b5525c6c9f27" alt=""><figcaption><p>nise</p></figcaption></figure>

    For doors or loot tokens you have to type in a questprefabhash in order for them to work.

    <figure><img src="https://files.gitbook.com/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MP_ozZVx2gRZUPXkd4r%2Fuploads%2FnfW9zKmc6YkUZKhBFakc%2F%E2%80%8F%E2%80%8F%D9%84%D9%82%D8%B7%D8%A9%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B4%D8%A9%20(2013).png?alt=media&#x26;token=4788c488-f657-42a4-b1ac-3fd5688fa5cb" alt=""><figcaption><p>you also need this for any interactable object</p></figcaption></figure>

    **Note: depending on the object it can have collisions or not please keep this in mind while adding object to the world.**

    **Note: Do not copy prefab hashes from other nodes.**
