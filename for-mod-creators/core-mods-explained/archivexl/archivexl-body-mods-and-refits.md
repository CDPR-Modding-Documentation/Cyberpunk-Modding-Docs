# ArchiveXL: body mods and refits

Starting with version 1.5, Archive XL supports **tags for body mods** ! That means, no more compatibility archives, since AXL can simply load different meshes for you…

Body type detection works with simple body replacements and with the character creator extensions (customization system).

## Checking the current body mod

Run the following code snippet in CET to see which body type you have installed:

```
print(Game.GetScriptableSystemsContainer():Get("PuppetStateSystem"):GetBodyTypeSuffix(ItemID.new(), GetPlayer(), nil))
```

## Body modders: Adding support

1. Create an .xl configuration file:&#x20;
   1. Create an .xl file in your Wolvenkit Project's resources folder
   2. Optional, but recommended: Give it the same name as your Wolvenkit project
2. Put the following file content:

```yaml
player:
  bodyTypes: [ NewBody ]  # this will be converted to snake case: new_body
```

3. In any of the files you modded, check your `components`.&#x20;
   1. Does any of them have a type that's called something with `morphtargetComponent`? \
      If yes, add a **tag** with the exact name of your body in this component's tag array (for our example, `NewBody`)
   2. If not, then add a new component (of any type) and give it the following name: \
      `Body:NewBody`
4. After packing your project, [check if the body tag registers](archivexl-body-mods-and-refits.md#checking-the-current-body-mod) by running the CET command. If yes, you're good to go!

## Clothing mods: Making use of the tags

### Dynamic Appearances

If you're using [dynamic appearances](./#dynamic-appearances), you don't need to register a suffix and can simply match or substitute for the body tag:

```
appearance name:
t0_recoloured_netrunner_suit&body=new_body

substitution:
*my\mod\meshes\p{gender}a_netrunning_suit_{body}.mesh
```

{% hint style="warning" %}
If no body mod is installed, the value will be `base_body`, so make sure to name your files and folders accordingly!
{% endhint %}

### Suffixes

If you're sticking to the classical approach, you need to add the following lines to your `.yaml`:

```yaml
  appearanceSuffixes:
    - !append itemsFactoryAppearanceSuffix.BodyType
```

Now, you can use the suffixes in your [root entity](../../files-and-what-they-do/entity-.ent-files/#root-entity) just like camera states or body genders:

```
appearanceName: my_custom_shirt&FPP&NewBody
```

