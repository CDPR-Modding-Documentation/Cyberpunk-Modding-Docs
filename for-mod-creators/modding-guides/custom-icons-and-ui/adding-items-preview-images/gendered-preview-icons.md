# Gendered preview icons

This is a sub-page of "[your own preview icons](./)" and only contains information on how to hook up gendered variants once you already have the files. If you aren't quite there yet, refer to the other guide first.

For the technical documentation, check TweakXL's [**readme**](https://github.com/psiberx/cp2077-tweak-xl/wiki/YAML-Tweaks#item-icons).

## Requirements:

This will not work unless your item is using the corresponding **suffix**.\
Without it, the game has no way to tell male and female items apart.

```yaml
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
```

{% hint style="info" %}
If you want to know more about this, you can read up here: [#what-are-suffixes](../../../files-and-what-they-do/entity-.ent-files/#what-are-suffixes "mention")

If you don't have a gendered item yet, see the original ArchiveXL guide, section "[adding a male instance](../../items-equipment/adding-new-items/#adding-a-male-instance)".
{% endhint %}

## The shortcut

Type the following command into your CET browser:

{% code overflow="wrap" %}
```
print(gameuiIconsNameResolver.GetIconsNameResolver():TranslateItemToIconName("Items.your_item_name_with_variant", false).value) 
```
{% endcode %}

That won't help you if you want to path items in bulk, but it'll help you to spot mistakes. For the rest, please keep reading.

## How to do it

By adding an `icon` property to your item's yaml, you're setting the `UIIcon` property of your record. The generated records will be the same for all genders, variants and tags.

If you want to use a gendered preview picture, you can create a more specific record yourself. In this case, you can **delete** the icon entry from your item.

Its name will follow this schema:

```
UIIcon.clothing_ENTITYNAME_APPEARANCENAME_SUFFIXES_VISUALTAGS
```

### Wait, what?

`ENTITYNAME,` `APPEARANCENAME`, `SUFFIXES` and `VISUALTAGS`above are placeholders for the corresponeding fields in your YAML.&#x20;

For example, if you have the following item:

```yaml
Items.my_custom_shirt_redwhite:
  $base: Items.GenericInnerChestClothing
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_white_red
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
```

… then you'd define a preview image like this:

<pre class="language-yaml"><code class="lang-yaml"><strong># UIIcon.clothing_      &#x3C;entityName>        _     &#x3C;appearanceName>           _&#x3C;suffix>_
</strong><strong>UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_white_red_Female_:
</strong>    $type: UIIcon
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pwa.inkatlas
    atlasPartName: slot_01
    
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_white_red_Male_:
    $type: UIIcon
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pma.inkatlas
    atlasPartName: slot_01
</code></pre>

The trailing underscore separates the empty visual tags from the suffixes entry.

{% hint style="info" %}
Your items won't need an icon record anymore, the assignment now happens by magic!
{% endhint %}

## Does this work with dynamic variants?

It does! All you need to do is to add the appearanceSuffix `Gender` and define an anchor for your `$instances`, like this:

```yaml
Items.my_custom_shirt_$(color):
  $instances: &my_custom_shirt_instances
    - { color: white_red, icon: icon_01 }
    - { color: black_red, icon: icon_02 }
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_!$(color)
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
```

ArchiveXL will ignore suffixes for dynamic variants, but they need to be present in the yaml file for the icons to work.

Then, you can define your preview images (remember to strip away the ! and + from the variants):

<pre class="language-yaml"><code class="lang-yaml"><strong># UIIcon.clothing_      &#x3C;entityName>        _     &#x3C;appearanceName>           _&#x3C;suffix>_
</strong><strong>UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_$(color)_Female_:
</strong>    $type: UIIcon
    $instances: *my_custom_shirt_instances
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pwa.inkatlas
    atlasPartName: $(icon)
    
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_$(color)_Male_:
    $type: UIIcon
    $instances: *my_custom_shirt_instances
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pma.inkatlas
    atlasPartName: $(icon)
</code></pre>

The rest just works (tm)

## More Complex Examples

### Multiple Variants

Given an item with multiple variants:

<pre class="language-yaml"><code class="lang-yaml"><strong>Items.my_custom_shirt_$(color):
</strong>  $instances: &#x26;my_custom_shirt_instances
    - { color: white, highlight: red, icon: icon_01 }
    - { color: black, highlight: red, icon: icon_02 }
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_!$(color)+$(highlight)
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
</code></pre>

The icon definition would then look like:

```yaml
# UIIcon.clothing_      <entityName>        _     <appearanceName>           _<suffix>_
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_$(color)$(highlight)_Female_:
    $type: UIIcon
    $instances: *my_custom_shirt_instances
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pwa.inkatlas
    atlasPartName: $(icon)
    
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_$(color)$(highlight)_Male_:
    $type: UIIcon
    $instances: *my_custom_shirt_instances
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pma.inkatlas
    atlasPartName: $(icon)
```

### Mixing Static and Dynamic Variants

You can also use static variants - the same rules apply, even if the result looks strange.

Given an item with a mixture of static and dynamic variants:

```yaml
Items.my_custom_shirt_$(color):
  $instances: &my_custom_shirt_instances
    - { color: white, icon: icon_01 }
    - { color: black, icon: icon_02 }
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_!$(color)+red
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
```

The icon definition would then look like:

```yaml
# UIIcon.clothing_      <entityName>        _     <appearanceName>           _<suffix>_
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_$(color)red_Female_:
    $type: UIIcon
    $instances: *my_custom_shirt_instances
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pwa.inkatlas
    atlasPartName: $(icon)
    
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_$(color)red_Male_:
    $type: UIIcon
    $instances: *my_custom_shirt_instances
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pma.inkatlas
    atlasPartName: $(icon)
```
