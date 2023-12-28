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

It does! All you need to do is to define an anchor for your $instances, like this:

```yaml
Items.my_custom_shirt_$(color):
  $instances: &my_custom_shirt_instances
    - { color: white_red, icon: icon_01 }
    - { color: black_red, icon: icon_02 }
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_$(color)
```

Then, you can define your preview images:

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
