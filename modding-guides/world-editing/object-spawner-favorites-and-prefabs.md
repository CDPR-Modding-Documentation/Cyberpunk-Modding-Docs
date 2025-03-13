---
description: >-
  This page covers what favorites and prefabs are, how to create them, use them
  and organize them
---

# Object Spawner: Favorites and Prefabs

## Use Case

* Favorites and prefabs let you alias anything you want (Single objects to whole groups)
* Things marked as favorite can be assigned a name, category and tags
* The combination of categories and tags allow for both for browsing through your library, and also highly specifc and organized searching
* The favorites system offer multiple ways of browsing and searching:
  * Simple text based search
  * Tag based filters
  * Grouping a categories contents by tags
* Categories can be easily shared and merged

{% hint style="success" %}
Category files can be found in `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\entSpawner\data\favorite` (E.g. For sharing)
{% endhint %}

## Terminology

* Favorite: This is a single object
* Prefab: This is an entire group, made to be re-usable just like single objects

{% hint style="success" %}
In the following, "Favorite" and "Prefab" is used interchangeably, since they are treated exactly the same
{% endhint %}

## Creating Categories

* The main favorites view can be found on the "Spawn New" tab, specifically the `Favorites` subtab
* Underneath the `Add Category` header, you can find everything you need to make a new category

<figure><img src="../../.gitbook/assets/OSFavoritesCategory" alt="" width="375"><figcaption><p>Start by adding a category, give it a name and select an icon from the list of icons (Better search: <a href="https://pictogrammers.com/library/mdi/">MDI</a>)</p></figcaption></figure>

## Creating Favorites / Prefabs

* There are two ways of creating them:

1. Right-Click any item in the "Spawn New" list, and choose `Make Favorite`
2. Right-Click any item (Group or object) in the "Spawned UI" hierarchy, and select `Make Favorite / Prefab`
   1. Tip: You can also simply hit `CTRL-F`, and make the currently selected item a favorite / prefab

* A popup will appear, allowing you to assign a name, tags and category:

<figure><img src="../../.gitbook/assets/OSFavoriteSettings" alt="" width="355"><figcaption><p>Choose a name, select tags (And addionally add new ones), and finally select the category</p></figcaption></figure>

{% hint style="success" %}
You can always bring back this menu, by clicking the configuration button for the favorite you like to edit, in the main favorites view
{% endhint %}

## Spawning Favorites / Prefabs

* To spawn a favorite, simply click it in the main favorites view
  * You can also do any of the more advanced things, such as drag and dropping a favorite into the world
  * This works the same as spawning anything from the `All` tab

## Organizing and searching

*   Clicking the icon on the right of a category will group its contents by their tags

    * This can be done recursively for each created tag category

    <figure><img src="../../.gitbook/assets/OSFavoritesGroupedByTag" alt="" width="290"><figcaption><p>Example of a category, grouped by its tags.</p></figcaption></figure>


* If you already know what to look for, you can also use the search bar, and the `Search Tags` selection
  * Search tags can be set to be either in AND or OR mode

## Merging / Renaming Tags and Categories

### Merging / Renaming Tags

* Often you might end up with multiple tags that indicate the same thing:
  * E.g. "Large", "large", "L", "big"
* To combine these tags, you can use the `Rename Tags` header, where you can select which tags to   rename, and what the new name should be

### Merging Categories

* Categories can be merged in two ways:
  * Automatic: If you ever end up having two categories with the same name (E.g. You added someone else's categories), they will be merged
  * Explicitly
* To explicitly merge a category into another, simply use the category configuration menu (Wheel button)

<figure><img src="../../.gitbook/assets/OSCategoryConfig" alt="" width="375"><figcaption><p>The category config menu, where you can change the icon, name and manually merge into another category</p></figcaption></figure>

{% hint style="success" %}
When merging categories, any favorites which contain the same data (E.g. the same mesh) will be merged as well (Tags will be combined).

Additonally, a pre-merge copy of both categories will be placed in the `preMerge` subfolder of the favorites folder
{% endhint %}
