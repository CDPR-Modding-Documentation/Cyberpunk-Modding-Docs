---
description: All the dirty detes on entity files
---

# Entity: .ent files

## Mesh/Component entity (simple entity)

Used to define game entities and the most straightforward way of adding a [custom prop](../modding-guides/everything-else/custom-props.md) or [player clothing](../modding-guides/items-equipment/adding-new-items/) to the game.

<figure><img src="../../.gitbook/assets/mesh_entity.png" alt=""><figcaption></figcaption></figure>

For **player equipment**, you can use entity files such as this one to **encapsulate** parts of your item. You load such .ent files via [partsValues](../modding-guides/items-equipment/adding-new-items/#mesh\_entity.ent), and they will be added to the corresponding appearance as if the components had been in the .app file itself.

As of April 2023, this does **not** work for NPC appearances or custom props.

## Root entity

The **entry point** for the game to display an [NPC](../modding-guides/npcs/appearances-change-the-looks.md#the-.ent-file) or [prop](../modding-guides/everything-else/custom-props.md). This kind of entity usually doesn't have [components](components/) by itself, but only points towards the [.app file](entity-.ent-files.md#.app-appearance-definition) where they are defined.&#x20;

From ArchiveXL item additions, this kind of file is usually called a **root entity**.

<figure><img src="../../.gitbook/assets/root_entity.png" alt=""><figcaption></figcaption></figure>

* An entity file can define multiple appearances, which can point to different .app files.&#x20;
* For [creating props](../modding-guides/everything-else/custom-props.md), **root entities** are used as the defining key (one entity => one item, which can have multiple appearances)
* Names support [suffixes](../modding-guides/items-equipment/adding-new-items/#suffixes-and-whether-you-need-them), allowing you to load different appearances based on body gender or camera mode. These are only used for player clothing. They look like `&FPP`
* How you split your .app files is largely a matter of taste. At CDPR, they usually shove everything into one file.



## What are suffixes?

In a [root\_entity file](entity-.ent-files.md#root-entity), you can give the game a list of appearances and have them mapped to an [.app file](../references-lists-and-overviews/vehicles/archive/.app-file-appearanceresource.md) by entry name. While that's pretty good already, have you ever wanted to be more specific — for example, "for a male character, use this appearance, but for a female use this other one?"

This is where suffixes come in. You append them to an appearance's name in the [root\_entity](entity-.ent-files.md#root-entity), and the game will pick the correct appearance (and the correct [app file](../references-lists-and-overviews/vehicles/archive/.app-file-appearanceresource.md), and the correct [mesh](broken-reference)!) based on the best match.



If you are registering an item via ArchiveXL, you can define suffixes via  `appearanceSuffixes: [ … ]` in the .yaml file.

{% hint style="info" %}
Your item will inherit the suffix setup from the `$base` component. In the example of `Items.GenericHeadClothing`, that will be

```
appearanceSuffixes: [ 
  itemsFactoryAppearanceSuffix.Gender, 
  itemsFactoryAppearanceSuffix.Camera ]  
```
{% endhint %}

### What can possibly go wrong?

{% hint style="warning" %}
**These bad beans can be the reason why your item is invisible!**! You can and should disable the suffixes if you don't need them.

To do so, add an empty array to the yaml entry:

```
appearanceSuffixes: []
```
{% endhint %}

## Which suffixes exist?

{% hint style="info" %}
For a full list, see For a more in-depth list, check (TODO: Psi's github?)
{% endhint %}

For clothing items, the following suffixes are relevant:

<table><thead><tr><th width="421">Suffix</th><th>Explanation</th></tr></thead><tbody><tr><td><code>itemsFactoryAppearanceSuffix.Gender</code></td><td>This item is gendered<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>appearanceName&#x26;Female</code> and <code>appearanceName&#x26;Male</code>.</td></tr><tr><td><code>itemsFactoryAppearanceSuffix.Camera</code></td><td>This item has special rules for first and third person camera<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>appearanceName&#x26;FPP</code> and <code>appearanceName&#x26;TPP</code>.</td></tr><tr><td><code>itemsFactoryAppearanceSuffix.Partial</code></td><td>If the current item has <code>hide_T1part</code> part and slot <code>OuterChest</code> is not hidden, will search <code>rootentity.ent</code> for<code>&#x26;Full</code> or <code>&#x26;Part</code></td></tr><tr><td><code>itemsFactoryAppearanceSuffix.HairType</code></td><td>Defines how your item will look if a certain hair type is loaded (e.g., hide the back half of a bandana for long hair).<br>When resolving the appearance name via <code>rootentity.ent</code>, the game will look for <code>&#x26;Short</code>, <code>&#x26;Long</code>, <code>&#x26;Dreads</code>, <code>&#x26;Buzz</code>, <code>&#x26;Bald</code></td></tr></tbody></table>



### Suffix load order

1. the base appearance (with no suffix)
2. the most specific suffix collection it can find

#### Example:&#x20;

V has a female body gender and you're in photo mode (third person camera). Your base appearance is called `appearance_`.

| full appearance name                                                                                                                    |                                                                      |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `appearance_`                                                                                                                           | Found first, then ignored because a more specific appearance exists. |
| <p><code>appearance_&#x26;Male</code><br><code>appearance_&#x26;Male&#x26;FPP</code><br><code>appearance_&#x26;Male&#x26;TPP</code></p> | Ignored: V's body gender isn't male                                  |
| `appearance_&Female`                                                                                                                    | ignored: a better match exists                                       |
| `appearance_&Female&FPP`                                                                                                                | ignored: you are not in first person camera                          |
| `appearance_&Female&TPP`                                                                                                                | best match! The game will use this one!                              |

